<!---
	OpenID Consumer Library Component
	
	Original Author:
		Richard Davies
		http://www.richarddavies.us
		richard@richarddavies.us
	
	Specification:
		http://openid.net/specs/openid-authentication-1_1.htm	(version 1.1)
		http://openid.net/specs/openid-authentication-2_0.html	(version 2.0)
--->
<cfcomponent output="false">
	<cffunction name="init" access="public" returntype="component" output="false">
		<!--- Create an instance of the yadis object --->
		<cfset variables.yadis = createObject('component', 'cf-compendium.inc.resource.communication.yadis').init() />
		
		<!---
			Diffie-Hellman values are stored in Java BigInteger objects
			http://java.sun.com/j2se/1.4.2/docs/api/java/math/BigInteger.html
		--->
		<cfset variables.bigInteger = createObject('java', 'java.math.BigInteger') />
		
		<!--- Namespaces --->
		<cfset variables.ns = {} />
		<cfset variables.ns['openID1'] = 'http://openid.net/signon/1.1' />
		<cfset variables.ns['openID2'] = 'http://specs.openid.net/auth/2.0' />
		<cfset variables.ns['sreg1'] = 'http://openid.net/extensions/sreg/1.1' />
		
		<cfreturn this />
	</cffunction>
	
	<!---
		Requesting Authentication
			http://openid.net/specs/openid-authentication-2_0.html#requesting_authentication
	--->
	<cffunction name="authenticate" access="public" returntype="struct" output="false">
		<cfargument name="identifier" type="string" required="true" />
		<cfargument name="returnURL" type="string" required="true" />
		<cfargument name="realm" type="string" default="#(CGI.HTTPS EQ 'ON' ? 'https' : 'http')#://#CGI.HTTP_HOST#/" />
		<cfargument name="options" type="struct" default="#{}#" />
		
		<cfset var openID = {} />
		<cfset var results = '' />
		
		<!--- Options --->
		<cfparam name="arguments.options.sregRequired" default="" />
		<cfparam name="arguments.options.sregOptional" default="" />
		
		<!--- Nonce for replay attack detection --->
		<cfset openID['nonce'] = createUUID() />
		
		<!--- Add the nonce to the returnURL --->
		<cfset arguments.returnURL = urlAppend(arguments.returnURL, 'nonce', openID['nonce']) />
		
		<!--- OpenID request information --->
		<cfset openID.request = {} />
		
		<!--- Mandatory OpenID request parameters --->
		<cfset openID.request['openid.identity'] = normalizeURL(arguments.identifier) />
		<cfset openID.request['openid.return_to'] = arguments.returnURL />
		
		<!--- Optional sreg --->
		<cfset openID.request['openid.ns.sreg'] = variables.ns['sreg1'] />
		<cfset openID.request['openid.sreg.required'] = arguments.options.sregRequired />
		<cfset openID.request['openid.sreg.optional'] = arguments.options.sregOptional />
		
		<!--- Discover the OpenID server --->
		<cfset results = discoverOpenIDServer( openID.request['openid.identity'] ) />
		
		<!--- If we can't find the OpenID --->
		<cfif NOT results.status>
			<cfthrow type="validation" message="Unable to locate OpenID server" detail="The OpenID server was not able to be located for #openID.request['openid.identity']#" />
		</cfif>
		
		<!--- Actual OP Server --->
		<cfset openID['server'] = results['server'] />
		
		<!--- Delegate --->
		<cfif structKeyExists( results, 'delegate' )>
			<cfset openID.request['openid.identity'] = results['delegate'] />
		<cfelse>
			<cfset openID.request['openid.identity'] = results['identity'] />
		</cfif>
		
		<!--- OpenID v2 specific items --->
		<cfif results.version GT 1>
			<!--- Namespace/protocol version --->
			<cfset openID.request['openid.namespace'] = variables.ns['openID' & results.version] />
			
			<!--- Claimed identifier --->
			<cfset openID.request['openid.claimed_id'] = openID['identity'] />
			
			<!--- Authentication Realm --->
			<cfset openID.request['openid.realm'] = arguments.realm />
		<cfelse>
			<!--- Authentication Realm --->
			<cfset openID.request['openid.trust_root'] = arguments.realm />
		</cfif>
		
		<!--- Establish a shared secret between Consumer and Provider --->
		<cfset results = getAssociate( openID ) />
		
		<cfif results['status']>
			<cfset openID['mode'] = 'smart' />
			
			<!--- Save all returned keys --->
			<cfloop collection="#results#" item="token">
				<cfif token NEQ 'status'>
					<cfset openID.request[token] = results.token />
				</cfif>
			</cfloop>
		<cfelse>
			<cfset openID['mode'] = 'dumb' />
			<cfset openID.request['assoc_handle'] = '' />
		</cfif>
		
		<cfreturn openID />
	</cffunction>
	
	<cffunction name="doRedirect" access="public" returntype="void" output="false">
		<cfargument name="openID" type="struct" required="true" />
		
		<cfset var redirectURL = '' />
		<cfset var token = '' />
		
		<!--- Base the redirect url from the server --->
		<cfset redirectURL = openID['server'] />
		
		<cfset arguments.openID.request['openid.mode'] = "checkid_setup" />
		
		<!--- Create the redirect url from the OpenID Information --->
		<cfloop collection="#arguments.openID.request#" item="token">
			<cfset redirectURL = urlAppend(redirectURL, token, arguments.openID.request[token]) />
		</cfloop>
		
		<cflocation url="#redirectURL#" addtoken="false" />
	</cffunction>
	
	<!---
		To decrypt the MAC key, we need to XOR the hashed DH secret with the encrypted MAC key
			http://openid.net/specs/openid-authentication-2_0.html#rfc.section.8.2.3
	--->
	<cffunction name="extractSecret" access="private" returntype="binary" output="false">
		<cfargument name="encMacKey" type="binary" required="true" />
		<cfargument name="public" type="string" required="true" />
		<cfargument name="private" type="string" required="true" />
		<cfargument name="prime" type="string" required="true" />
		
		<cfset var encMacKeyBigInt = '' />
		<cfset var shared = '' />
		<cfset var sharedBigInt = '' />
		<cfset var sharedBin = '' />
		<cfset var sharedHash = '' />
		<cfset var sharedHashBin = '' />
		<cfset var secret = '' />
		
		<!--- Get the shared Diffie-Hellmen secret --->
		<cfset shared = getSharedSecret( arguments.public, arguments.private, arguments.prime ) />
		
		<!--- Convert secret to binary -- toByteArray() = btwoc() --->
		<cfset sharedBin = shared.toByteArray() />
		
		<!--- Hash secret and convert back to binary value --->
		<cfset sharedHash = hash( charsetEncode( sharedBin, 'iso-8859-1' ), 'sha', 'iso-8859-1' ) />
		<cfset sharedHashBin = binaryDecode( sharedHash, 'hex' ) />
		
		<!--- Convert hashed secret and encrypted MAC key to BigIntegers because it's easy to XOR BigIntegers --->
		<cfset sharedBigInt = variables.bigInteger.init( sharedHashBin ) />
		<cfset encMackKeyBigInt = variables.bigInteger.init( arguments.encMacKey ) />
		
		<!--- XOR values --->
		<cfset secret = sharedBigInt.xor( encMacKeyBigInt ) />
		
		<!--- Convert back into binary --->
		<cfreturn secret.toByteArray() />
	</cffunction>
	
	<!---
		Parse html content for provider URL.
	--->
	<cffunction name="findIdentifier" access="private" returntype="string" output="false">
		<cfargument name="content" type="string" required="true" />
		<cfargument name="relation" type="string" required="true" />
		
		<cfset var identifier = '' />
		<cfset var match = '' />
		
		<!--- Search for the link tag --->
		<cfset match = reFindNoCase('<link[^>]*(rel=["'']' & arguments.relation & '["''][^>]*href=["'']([^"'']+)["'']|href=["'']([^"'']+)["''][^>]*rel=["'']' & arguments.relation & '["''])[^>]*\/?>', arguments.content, 1, true) />
		
		<cfif match.pos[1] NEQ 0>
			<!--- Check which grouping caught the descriptor --->
			<cfif match.pos[3]>
				<cfset identifier = mid(arguments.content, match.pos[3], match.len[3]) />
			<cfelse>
				<cfset identifier = mid(arguments.content, match.pos[4], match.len[4]) />
			</cfif>
		</cfif>
		
		<!--- Replace HTML entities with their respective characters --->
		<cfset identifier = ReplaceNoCase(identifier, '&amp;', '&', 'all') />
		<cfset identifier = ReplaceNoCase(identifier, '&lt;', '<', 'all') />
		<cfset identifier = ReplaceNoCase(identifier, '&gt;', '>', 'all') />
		<cfset identifier = ReplaceNoCase(identifier, '&quot;', '"', 'all') />
		
		<cfreturn identifier />
	</cffunction>
	
	<!---
		Establish a Diffie-Hellman shared secret between consumer and provider
			http://openid.net/specs/openid-authentication-2_0.html#associations
	--->
	<cffunction name="getAssociate" access="private" returntype="struct" output="false">
		<cfargument name="server" type="string" required="true" />
		<cfargument name="namespace" type="string" default="" />
		
		<cfset var generator = '' />
		<cfset var i = '' />
		<cfset var key = '' />
		<cfset var prime = '' />
		<cfset var primeHex = '' />
		<cfset var prnd = '' />
		<cfset var privateNum = '' />
		<cfset var publicKey = '' />
		<cfset var results = '' />
		<cfset var response = {} />
		
		<!--- Default to not working --->
		<cfset response['status'] = false />
		
		<!--- Default OpenID prime number --->
		<cfset primeHex = 'DCF93A0B883972EC0E19989AC5A2CE310E1D37717E8D9571BB7623731866E61EF75A2E27898B057F9891C2E27A639C3F29B60814581CD3B2CA3986D2683705577D45C2E7E52DC81C7A171876E5CEA74B1448BFDFAF18828EFD2519F14E45E3826634AF1949E5B535CC829A483B8A76223E5D490A257F05BDFF16F2FB22C583AB' />
		<cfset prime = variables.bigInteger.init( primeHex, 16 ) />
		
		<!--- Default OpenID generator --->
		<cfset generator = variables.bigInteger.valueOf(2) />
		
		<!--- Random number generator --->
		<cfset prnd = createObject('java', 'java.security.SecureRandom') />
		
		<!--- Seed the random number generator? --->
		<!--- Dont think we need this...? It's not being stored or used...
		<cfset prnd.getProvider() />
		--->
		
		<!--- Random private secret number in range [1 .. p-1] --->
		<cfset privateNum = variables.bigInteger.init( javaCast('int', prime.bitLength()-1), prnd ) />
		
		<!--- Public Diffie-Hellman key to pass to OP server --->
		<cfset key = generator.modPow( privateNum, prime ) />
		<cfset publicKey = binaryEncode( key.toByteArray(), 'base64' ) />
		
		<!--- Store the Diffie-Hellman values --->
		<cfset response['prime'] = prime.toString( 16 ) />
		<cfset response['generator'] = generator.toString( 16 ) />
		<cfset response['private'] = private.toString( 16 ) />
		
		<!--- Request association from OP server --->
		<!---
			Use encoded="false" attribute to prevent '.' in the parameter names from being
				URL encoded because some OP's (eg. 1id.com) don't like that.
		--->
		<cfhttp method="post" url="#arguments.server#" result="results">
			<cfif arguments.namespace NEQ ''>
				<cfhttpparam type="formfield" name="openid.ns" value="#urlEncodedFormat(arguments.namespace)#" encoded="false" />
			</cfif>
			<cfhttpparam type="formfield" name="openid.mode" value="associate" encoded="false" />
			<cfhttpparam type="formfield" name="openid.assoc_type" value="HMAC-SHA1" encoded="false" />
			<cfhttpparam type="formfield" name="openid.session_type" value="DH-SHA1" encoded="false" />
			<cfhttpparam type="formfield" name="openid.dh_consumer_public" value="#urlEncodedFormat(publicKey)#" encoded="false" />
		</cfhttp>
		
		<!--- Check for successful association --->
		<cfif val( results.statusCode ) EQ 200 AND results.fileContent CONTAINS 'assoc_type:' AND results.fileContent DOES NOT CONTAIN 'error_code:'>
			<cfset response['status'] = true />
		</cfif>
		
		<!--- Store the values from the results --->
		<cfloop list="#results.fileContent#" index="i" delimiters="#chr(10)#">
			<cfset response[listFirst(i, ':')] = listRest(i, ':') />
		</cfloop>
		
		<cfreturn response />
	</cffunction>
	
	<!---
		Calculates Diffie-Hellman shared secret from OP's response.
		
		Returns a BigInteger.
		
		http://openid.net/specs/openid-authentication-2_0.html#rfc.section.8.4.2
	--->
	<cffunction name="getSharedSecret" access="private" returntype="string" output="false">
		<cfargument name="public" type="string" required="true" />
		<cfargument name="private" type="string" required="true" />
		<cfargument name="prime" type="string" required="true" />
		
		<cfreturn arguments.public.modPow( variables.bigInteger.init(arguments.secret, 16), variables.bigInteger.init(arguments.prime, 16) ) />
	</cffunction>
	
	<!---
		Calculates hash message authentication code using SHA1 algorithm.
	--->
	<cffunction name="HMAC_SHA1" access="private" returntype="string" output="false">
		<cfargument name="data" type="string" required="true" />
		<cfargument name="key" type="string" required="true" />
		<cfargument name="bits" type="numeric" required="true" />
		
		<cfset var hexData = '' />
		<cfset var hexKey = '' />
		<cfset var i = '' />
		<cfset var keyI = '' />
		<cfset var keyO = '' />
		<cfset var keyLen = '' />
		
		<cfset hexData = binaryEncode( charsetDecode( arguments.data, 'iso-8859-1' ), 'hex' ) />
		<cfset hexKey = binaryEncode( charsetDecode( arguments.key, 'iso-8859-1' ), 'hex' ) />
		
		<cfset keyLen = len(hexKex) / 2 />
		
		<cfif keyLen GT 64>
			<cfset hexKey = hash( charsetEncode( binaryDecode( hexKey, 'hex' ), 'iso-8859-1' ), 'sha', 'iso-8859-1' ) />
			
			<cfset keyLen = len(hexKex) / 2 />
		</cfif>
		
		<cfloop from="1" to="#keyLen#" index="i">
			<cfset keyI &= right( "0" & formatBaseN( bitXor( inputBaseN( mid( hexKey, 2 * i - 1, 2 ), 16 ), inputBaseN( "36", 16 ) ), 16 ), 2 ) />
			<cfset keyO &= right( "0" & formatBaseN( bitXor( inputBaseN( mid( hexKey, 2 * i - 1, 2 ), 16 ), inputBaseN( "5c", 16 ) ), 16 ), 2 ) />
		</cfloop>
		
		<cfset keyI &= repeatString("36", 64 - keyLen) />
		<cfset keyO &= repeatString("5c", 64 - keyLen) />
		
		<cfset hexKey = hash( charsetEncode( binaryDecode( keyI & hexData, 'hex' ), 'iso-8859-1'), 'sha', 'iso-8859-1') />
		<cfset hexKey = hash( charsetEncode( binaryDecode( keyO & hexData, 'hex' ), 'iso-8859-1'), 'sha', 'iso-8859-1') />
		
		<cfreturn left( hexKey, arguments.bits / 4 ) />
	</cffunction>
	
	<!---
		Verifying Signatures
			http://openid.net/specs/openid-authentication-2_0.html#verifying_signatures
	--->
	<cffunction name="isValidSignature" access="private" returntype="boolean" output="false">
		<cfargument name="server" type="string" required="true" />
		<cfargument name="private" type="string" required="true" />
		<cfargument name="prime" type="string" required="true" />
		<cfargument name="theURL" type="component" required="true" />
		<cfargument name="encMacKey" type="string" default="" />
		<cfargument name="macKey" type="string" default="" />
		
		<cfset var encMacKey64 = '' />
		<cfset var macKey64 = '' />
		<cfset var public = '' />
		<cfset var secret = '' />
		<cfset var server64 = '' />
		<cfset var signature = '' />
		<cfset var signature64 = '' />
		<cfset var token = '' />
		<cfset var tokenContents = '' />
		
		<cfif arguments.encMacKey NEQ ''>
			<!---
				Encrypted (Diffie-Hellman) association
					http://openid.net/specs/openid-authentication-2_0.html#rfc.section.8.4.2
			--->
			<cfset encMacKey64 = binaryDecode( arguments.encMacKey, 'base64' ) />
			<cfset server64 = binaryDecode( arguments.server, 'base64' ) />
			<cfset public = variables.bigInteger.init( server64 ) />
			<cfset macKey64 = extractSecret( encMacKey64, public, arguments.private, arguments.prime ) />
		<cfelseif arguments.macKey NEQ ''>
			<cfset macKey64 = binaryDecode( arguments.macKey, 'base64' ) />
		<cfelse>
			<cfreturn false />
		</cfif>
		
		<!--- Convert binary secret into a string --->
		<cfset secret = charsetEncode( macKey64, 'iso-8859-1' ) />
		
		<!---
			Convert list of signed parameters into key-value encoded list
				http://openid.net/specs/openid-authentication-2_0.html#kvform
		--->
		<cfloop list="#arguments.theURL.search('openid.signed')#" index="token">
			<cfset tokenContents &= lCase( token ) & ':' & arguments.theURL.search('openid.' & token) & chr(10) />
		</cfloop>
		
		<!---
			Calculate message signature
				http://openid.net/specs/openid-authentication-2_0.html#generating_signatures
		--->
		<cfset signature = binaryDecode( HMAC_SHA1( tokenContents, secret, 160 ), 'hex' ) />
		<cfset signature64 = binaryEncode( signature, 'base64' ) />
		
		<!--- Verify calculated signature with signature returned by OP --->
		<cfreturn signature64 EQ arguments.theURL.search('openid.sig') />
	</cffunction>
	
	<!---
		Verifying Directly with the OpenID Provider
			http://openid.net/specs/openid-authentication-2_0.html#rfc.section.11.4.2
	--->
	<cffunction name="isValidHandle" access="private" returntype="void" output="false">
		<cfargument name="server" type="string" required="true" />
		<cfargument name="assocHandle" type="string" required="true" />
		<cfargument name="theURL" type="component" required="true" />
		<cfargument name="namespace" type="string" default="" />
		
		<cfset var results = '' />
		<cfset var token = '' />
		
		<!---
			Use encoded="false" attribute to prevent '.' in the parameter names from being
				URL encoded because some OP's (eg. 1id.com) don't like that.
		--->
		
		<cfhttp method="post" url="#arguments.server#" result="results">
			<cfif arguments.namespace NEQ ''>
				<cfhttpparam type="formfield" name="openid.ns" value="#UrlEncodedFormat( arguments.namespace )#" encoded="false" />
			</cfif>
			
			<cfhttpparam type="formfield" name="openid.mode" value="check_authentication" encoded="false" />
			<cfhttpparam type="formfield" name="openid.assoc_handle" value="#UrlEncodedFormat( arguments.assocHandle )#" encoded="false" />
			<cfhttpparam type="formfield" name="openid.sig" value="#UrlEncodedFormat(arguments.theURL.search('openid.sig'))#" encoded="false" />
			<cfhttpparam type="formfield" name="openid.signed" value="#UrlEncodedFormat(arguments.theURL.search('openid.signed'))#" encoded="false" />
			
			<cfloop list="#arguments.theURL.search('openid.signed')#" index="token">
				<cfif token NEQ 'mode'>
					<cfhttpparam type="formfield" name="openid.#LCase(token)#" value="#UrlEncodedFormat(arguments.theURL.search('openid.' & token))#" encoded="false" />
				</cfif>
			</cfloop>
		</cfhttp>
		
		<cfreturn results.statusCode CONTAINS '200' AND results.fileContent CONTAINS 'is_valid:true' />
	</cffunction>
	
	<!---
		Normalize OpenID identifier
			http://openid.net/specs/openid-authentication-2_0.html#normalization
	--->
	<cffunction name="normalizeIdentifier" access="private" returntype="string" output="false">
		<cfargument name="identifier" type="string" required="true" />
		
		<cfset arguments.identifier = trim(arguments.identifier) />
		
		<!--- Remove XRI prefix --->
		<cfif left(arguments.identifier, 6) EQ "xri://">
			<cfset arguments.identifier = removeChars(arguments.identifier, 1, 6) />
		</cfif>
		
		<!--- Normal URLs --->
		<cfif NOT listFind("=,@,+,$,!,(", Left(arguments.identifier, 1))>
			<!--- Add protocol, if missing, to the URL --->
			<cfif NOT reFindNoCase('^http(s)?://', arguments.identifier)>
				<cfset arguments.identifier = 'http://' & arguments.identifier />
			</cfif>
			
			<!--- Remove fragment identifier --->
			<cfset arguments.identifier = ListFirst(arguments.identifier, "##") />
			
			<!--- Lower case domain name (necessary for Blogger OpenIDs) --->
			<cfset arguments.identifier = reReplace(arguments.identifier, "//.*?(/|$)", "//" & lCase(ListGetAt(arguments.identifier, 2, "/")) & "/") />
		</cfif>
		
		<cfreturn arguments.identifier />
	</cffunction>
	
	<!---
		Verifying Assertions
			http://openid.net/specs/openid-authentication-2_0.html#verification
	--->
	<cffunction name="validateAuthentication" access="public" returntype="void" output="false">
		
	</cffunction>
	<!--- 
		TODO: convert function

		<cfset var Local = StructNew() />
		<cfset Local.result = StructNew() />

		<!--- If session still alive --->
		<cfif Variables.OpenIDSession.exists()>

			<!--- Restore working variables --->
			<cfset Local.OpenID = Variables.OpenIDSession.load() />

			<cfif not verifyReturnURL(Local.OpenID['openid.return_to'])>
				<cfset Local.result.result = "returnToError" />
				<cfset Local.result.resultMsg = "Current request URL does not match openid.return_to URL" />

			<!--- Positive answer from OP --->
			<cfelseif Url['openid.mode'] eq "id_res">

				<!--- Check nonce to avoid copy+paste fraud aka replay attack --->
				<cfif StructKeyExists(Local.OpenID, "nonce") and StructKeyExists(Url, "nonce") and Local.OpenID['nonce'] eq URLDecode(Url['nonce'])>

					<!--- Verify discovered information if necessary
							http://openid.net/specs/openid-authentication-2_0.html#verify_disco
					 --->
					<cfif StructKeyExists(Url, "openid.claimed_id") and Url['openid.claimed_id'] is not Local.OpenID['openid.identity']>
						<!--- Verify OP endpoint is authorized to make assertions for the claimed identifier --->
						<cfset Local.discoResponse = discoverOpenIDServer(Url['openid.claimed_id']) />

						<cfif not StructKeyExists(Local.discoResponse, "status") or Local.discoResponse['server'] is not Url['openid.op_endpoint']>
							<cfset Local.result.result = "unauthorized" />
							<cfset Local.result.resultMsg = "Unauthorized assertion made by OpenID provider" />
						</cfif>
					</cfif>

					<!--- Set assoc_handle for 'dumb' mode --->
					<cfif Local.OpenID['mode'] eq "dumb" or Local.OpenID['assoc_handle'] eq "">
						<cfset Local.OpenID['assoc_handle'] = Url['openid.assoc_handle'] />
					</cfif>

					<!--- Verify return variables signature (smart) or transaction using handle (dumb) --->
					<cfif (Local.OpenID['mode'] eq "smart" and isValidSignature(Local.OpenID)) or isValidHandle(Local.OpenID)>
						<!--- Copy simple registration field values into result structure --->
						<cfloop index="Local.sKey" list="#ListAppend(Local.OpenID['OpenID.sreg.required'], Local.OpenID["OpenID.sreg.optional"])#">
							<cfif StructKeyExists(Url, "OpenID.sreg." & Local.sKey)>
								<cfset Local.result.sreg[Local.skey] = Url["OpenID.sreg." & Local.skey] />
							</cfif>
						</cfloop>

						<cfset Local.result.result = "success" />
						<cfset Local.result.resultMsg = "Identity has been successfully authenticated" />
					<cfelse>
						<cfset Local.result.result = "invalid" />
						<cfset Local.result.resultMsg = "Invalid authentication" />
					</cfif>

				<cfelse>
					<cfset Local.result.result = "replay" />
					<cfset Local.result.resultMsg = "Replay attack has been detected" />
				</cfif>

			<!--- Negative answers from OP --->
			<cfelseif Url['openid.mode'] eq "cancel">
				<cfset Local.result.result = "cancelled" />
				<cfset Local.result.resultMsg = "Request was cancelled by the user or OpenID provider" />
			<cfelseif Url['openid.mode'] eq "error">
				<cfset Local.result.result = "error" />
				<cfset Local.result.resultMsg = "OpenID provider error: #Url['openid.error']#" />
			</cfif>

		<cfelse>
				<cfset Local.result.result = "expired" />
				<cfset Local.result.resultMsg = "The session has expired" />
		</cfif>

		<!--- Populate result structure with some useful OpenID values --->
		<cfset Local.result.identity = Local.OpenID["openID.identity"] />
 		<cfset Local.result.user_identity = Local.OpenID["user_identity"] />
		<cfset Local.result.openid_server = Local.OpenID["openID_server"] />

		<!--- OP may assist end user in selecting the claimed and local identifiers, so use those when present --->
		<cfif StructKeyExists(Url, "openid.claimed_id")>
			<cfset Local.result.user_identity = Url["openID.claimed_id"] />
			<cfset Local.result.identity = Url["openID.identity"] />
		</cfif>

		<cfreturn Local.result />
	 --->
	
	<!---
		Verify the Return URL
			http://openid.net/specs/openid-authentication-2_0.html#verify_return_to
	--->
	<cffunction name="verifyReturnURL" access="private" returntype="boolean" output="false">
		<cfargument name="returnURL" type="string" required="true" />
		<cfargument name="theURL" type="component" required="true" />
		
		<cfset var baseURL = '' />
		<cfset var i = '' />
		<cfset var param = '' />
		<cfset var queryString = '' />
		<cfset var theReturnURL = '' />
		<cfset var value = '' />
		
		<!--- Start off with the scheme --->
		<cfset baseURL = (CGI.HTTPS EQ 'ON' ? 'https' : 'http') & '://' />
		
		<!--- Add the server information --->
		<cfset baseURL &= CGI.SERVER_NAME & CGI.SCRIPT_NAME & CGI.PATH_INFO />
		
		<!--- Verify the bases match --->
		<cfif baseURL NEQ listFirst(arguments.returnURL, '?')>
			<cfreturn false />
		</cfif>
		
		<!--- Verify that any query parameters in the return to URL are also in the current URL (with identical values) --->
		<cfset theReturnURL = createObject( 'component', 'cf-compendium.inc.resource.utility.url' ).init( listLast(arguments.returnURL, "?") ) />
		
		<!--- Check the values --->
		<cfloop list="#theReturnURL.querystringKeyList()#" index="i">
			<cfif theReturnURL.search( i ) NEQ arguments.theURL.search( i )>
				<cfreturn false />
			</cfif>
		</cfloop>
	</cffunction>
	
	<cffunction name="urlAppend" access="private" returntype="void" output="false">
		<cfargument name="url" type="string" required="true" />
		<cfargument name="key" type="string" required="true" />
		<cfargument name="value" type="string" required="true" />
		
		<cfreturn arguments.url & ( find('?', arguments.url) ? '&' : '?' ) & arguments.key & '=' & arguments.value />
	</cffunction>
</cfcomponent>

<!---
	<!--- Yadis/HTML discovery methods --->
	<cffunction name="discoverOpenIDServer" returntype="struct" access="private" output="false" hint="Perform discovery of OP server URL.">
		<cfargument name="identifier" type="string" required="true" hint="OpenID identifier to perform discovery on" />

		<!--- Discovery
				http://openid.net/specs/openid-authentication-2_0.html#discovery
		 --->

		<cfset var Local = StructNew() />

		<!--- XRI idendifiers --->
		<cfif not Left(Arguments.identifier, 4) is "http">
			<!--- Use XRI.net proxy resolver URL as identity --->
			<cfset Arguments.identifier = "http://xri.net/#Arguments.identifier#?_xrd_r=application/xrds+xml" />
		</cfif>

		<!--- First attempt Yadis discovery --->
		<cfset Local.response = yadisDiscovery(Arguments.identifier) />

		<!--- Fallback to HTML-based discovery if Yadis discovery failed --->
		<cfif not Local.response.status>
			<cfset Local.response = htmlServerDiscovery(Arguments.identifier) />
		</cfif>

		<cfreturn Local.response />
	</cffunction>


	<cffunction name="yadisDiscovery" returntype="struct" access="private" output="false" hint="Use Yadis protocol for discovery of OpenID servers.">
		<cfargument name="identifier" type="string" required="true" hint="OpenID identifier to perform discovery on" />

		<!--- Yadis discovery
				http://openid.net/specs/openid-authentication-2_0.html#rfc.section.7.3.1
		 --->

		<cfset var Local = StructNew() />
		<cfset Local.response = StructNew() />
		<cfset Local.response['status'] = false />
		<cfset Local.servers['server'] = "" />
		<cfset Local.servers['delegate'] = "" />

		<cfset Local.xrds = Variables.yadis.discover(Arguments.identifier) />

		<!--- Extract service info from XRDS document --->
		<cfif Local.xrds is not "">
			<!--- Search xrds for OP identifier element (OpenID v2) --->
			<cfset Local.service = Variables.yadis.services(Local.xrds, "opIdentifierFilter") />
			<cfif not ArrayIsEmpty(Local.service)>
				<cfset Local.response['server'] = Local.service[1].URI.XmlText />
				<cfset Local.response['identity'] = "http://specs.openid.net/auth/2.0/identifier_select" />
				<cfset Local.response['delegate'] = "http://specs.openid.net/auth/2.0/identifier_select" />
				<cfset Local.response['version'] = 2 />
				<cfset Local.response['status'] = true />
			</cfif>

			<cfif not Local.response.status>
				<!--- Search xrds for claimed identifier element (OpenID v2) --->
				<cfset Local.service = Variables.yadis.services(Local.xrds, "claimedIdentifierFilter") />

				<cfif not ArrayIsEmpty(Local.service)>
					<cfset Local.response['server'] = Local.service[1].URI.XmlText />
					<cfset Local.response['identity'] = Arguments.identifier />
					<cfif StructKeyExists(Local.service[1], "LocalID")>
						<cfset Local.response['delegate'] = Local.service[1].LocalID.XmlText />
					</cfif>
					<cfset Local.response['version'] = 2 />
					<cfset Local.response['status'] = true />
				</cfif>
			</cfif>

			<cfif not Local.response.status>
				<!--- Search xrds for OpenID v1.x info --->
				<cfset Local.service = Variables.yadis.services(Local.xrds, "openID1Filter") />

				<cfif not ArrayIsEmpty(Local.service)>
					<cfset Local.response['server'] = Local.service[1].URI.XmlText />
					<cfset Local.response['identity'] = Arguments.identifier />
					<cfif StructKeyExists(Local.service[1], "openid:Delegate")>
						<cfset Local.response['delegate'] = Local.service[1]['openid:Delegate'].XmlText />
					</cfif>
					<cfset Local.response['version'] = 1 />
					<cfset Local.response['status'] = true />
				</cfif>
			</cfif>

			<cfif Left(Arguments.identifier, 15) is "http://xri.net/">
				<cfset Local.response['identity'] = Local.xrds.xrds.xrd.CanonicalID.XmlText />
			</cfif>
		</cfif>

		<cfreturn Local.response />
	</cffunction>


	<cffunction name="htmlServerDiscovery" returntype="struct" access="private" output="false" hint="HTML-based discovery of OpenID servers.">
		<cfargument name="identifier" type="string" required="true" hint="OpenID identifier to perform discovery on" />

		<!--- HTML-based discovery
				http://openid.net/specs/openid-authentication-2_0.html#rfc.section.7.3.3
		 --->

		<cfset var Local = StructNew() />
		<cfset Local.response = StructNew() />
		<cfset Local.response['status'] = false />
		<cfset Local.servers['server'] = "" />
		<cfset Local.servers['delegate'] = "" />

		<cfhttp method="get" url="#Arguments.identifier#" result="Local.cfhttp" />

		<cfif Find("200", Local.cfhttp.StatusCode)>
			<!--- First check for v2 link elements --->
			<cfset Local.servers['server'] = findLinkIdentifier(Local.cfhttp.FileContent, "openid2.provider") />
			<cfset Local.servers['delegate'] = findLinkIdentifier(Local.cfhttp.FileContent, "openid2.local_id") />
			<cfset Local.response['version'] = 2 />

			<!--- Fallback to v1 link elements if necessary --->
			<cfif Local.servers['server'] is "">
				<cfset Local.servers['server'] = findLinkIdentifier(Local.cfhttp.FileContent, "openid.server") />
				<cfset Local.servers['delegate'] = findLinkIdentifier(Local.cfhttp.FileContent, "openid.delegate") />
				<cfset Local.response['version'] = 1 />
			</cfif>
		</cfif>

		<cfif Local.servers['server'] neq "">
			<cfif Local.servers['delegate'] neq "">
				<cfset Local.response['delegate'] = Local.servers['delegate'] />
			</cfif>
			<cfset Local.response['server'] = Local.servers['server'] />
			<cfset Local.response['identity'] = Arguments.identifier />
			<cfset Local.response['status'] = true />
		</cfif>

		<cfreturn Local.response />
	</cffunction>
 --->