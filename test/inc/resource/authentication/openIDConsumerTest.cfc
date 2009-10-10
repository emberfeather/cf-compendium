<cfcomponent extends="mxunit.framework.TestCase" output="false">
	<!---
		Tests whether the identity url can be found if the content attribute is first
	--->
	<cffunction name="testFindIdentifierRelFirst" access="public" returntype="void" output="false">
		<cfset var openIDConsumer = createObject('component', 'cf-compendium.inc.resource.authentication.openIDConsumer').init() />
		<cfset var tag = '' />
		
		<cfset makePublic(openIDConsumer, 'findIdentifier') />
		
		<cfset tag = '<link rel="openID" href="http://example.com/">' />
		
		<cfset assertEquals('http://example.com/', openIDConsumer.findIdentifier(tag, 'openID')) />
	</cffunction>
	
	<!---
		Tests whether the identity url can be found if the http-equiv attribute is first
	--->
	<cffunction name="testFindIdentifierHrefFirst" access="public" returntype="void" output="false">
		<cfset var openIDConsumer = createObject('component', 'cf-compendium.inc.resource.authentication.openIDConsumer').init() />
		<cfset var tag = '' />
		
		<cfset makePublic(openIDConsumer, 'findIdentifier') />
		
		<cfset tag = '<link href="http://example.com/" rel="openID">' />
		
		<cfset assertEquals('http://example.com/', openIDConsumer.findIdentifier(tag, 'openID')) />
	</cffunction>
	
	<!---
		Test that the identifier normalization is done correctly.
		
		http://openid.net/specs/openid-authentication-2_0.html#normalization_example
	--->
	<cffunction name="testNormalizeIdentifier" access="public" returntype="void" output="false">
		<cfset var openIDConsumer = createObject('component', 'cf-compendium.inc.resource.authentication.openIDConsumer').init() />
		
		<cfset makePublic(openIDConsumer, 'normalizeIdentifier') />
		
		<cfset assertEquals('http://example.com/', openIDConsumer.normalizeIdentifier('example.com')) />
		<cfset assertEquals('http://example.com/', openIDConsumer.normalizeIdentifier('http://example.com')) />
		<cfset assertEquals('https://example.com/', openIDConsumer.normalizeIdentifier('https://example.com/')) />
		<cfset assertEquals('http://example.com/user', openIDConsumer.normalizeIdentifier('http://example.com/user')) />
		<cfset assertEquals('http://example.com/user/', openIDConsumer.normalizeIdentifier('http://example.com/user/')) />
		<cfset assertEquals('http://example.com/', openIDConsumer.normalizeIdentifier('http://example.com/')) />
		<cfset assertEquals('=example', openIDConsumer.normalizeIdentifier('=example')) />
		<cfset assertEquals('=example', openIDConsumer.normalizeIdentifier('xri://=example')) />
	</cffunction>
</cfcomponent>