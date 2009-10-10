<cfcomponent extends="mxunit.framework.TestCase" output="false">
	<cffunction name="setup" access="public" returntype="void" output="false">
		<cfsavecontent variable="variables.xrds">
			<?xml version="1.0" encoding="UTF-8"?>
			<xrds:XRDS xmlns:xrds="xri://$xrds" xmlns="xri://$xrd*($v*2.0)"
				xmlns:openid="http://openid.net/xmlns/1.0">
				<xrd>
					<Service priority="50">
						<Type>http://openid.net/signon/1.0</Type>
						<URI>http://www.myopenid.com/server</URI>
						<openid:Delegate>http://smoker.myopenid.com/</openid:Delegate>
					</Service>
					<Service priority="10">
						<Type>http://openid.net/signon/1.0</Type>
						<URI priority="15">http://resolve2.example.com</URI>
						<URI priority="10">http://resolve.example.com</URI>
						<URI>https://resolve.example.com</URI>
						<openid:Delegate>http://www.livejournal.com/users/frank/</openid:Delegate>
					</Service>
					<Service priority="20">
						<Type>http://lid.netmesh.org/sso/2.0</Type>
						<URI>http://mylid.net/liddemouser</URI>
					</Service>
					<Service>
						<Type>http://lid.netmesh.org/sso/1.0</Type>
					</Service>
				</xrd>
			</xrds:XRDS>
		</cfsavecontent>
		
		<cfset variables.xrds = xmlParse(variables.xrds) />
	</cffunction>
	
	<!---
		Tests whether the descriptor url can be found if the content attribute is first
	--->
	<cffunction name="testFindMetaDescriptorContentFirst" access="public" returntype="void" output="false">
		<cfset var metaTag = '' />
		<cfset var yadis = createObject('component', 'cf-compendium.inc.resource.communication.yadis').init() />
		
		<cfset makePublic(yadis, 'findMetaDescriptor') />
		
		<cfset metaTag = '<meta content="http://example.com/yadis.xml" http-equiv="X-XRDS-Location">' />
		
		<cfset assertEquals('http://example.com/yadis.xml', yadis.findMetaDescriptor(metaTag)) />
	</cffunction>
	
	<!---
		Tests whether the descriptor url can be found if the http-equiv attribute is first
	--->
	<cffunction name="testFindMetaDescriptorHttpEquivFirst" access="public" returntype="void" output="false">
		<cfset var metaTag = '' />
		<cfset var yadis = createObject('component', 'cf-compendium.inc.resource.communication.yadis').init() />
		
		<cfset makePublic(yadis, 'findMetaDescriptor') />
		
		<cfset metaTag = '<meta http-equiv="X-XRDS-Location" content="http://example.com/yadis.xml">' />
		
		<cfset assertEquals('http://example.com/yadis.xml', yadis.findMetaDescriptor(metaTag)) />
	</cffunction>
	
	<!---
		Tests if the get services and sorting of uri elements based upon priority works
	--->
	<cffunction name="testGetServices" access="public" returntype="void" output="false">
		<cfset var services = '' />
		<cfset var yadis = createObject('component', 'cf-compendium.inc.resource.communication.yadis').init() />
		
		<cfset services = yadis.getServices( variables.xrds ) />
		
		<!--- TODO this ordering is incorrect, needs to have the correct URI ordering --->
		<cfset assertEquals('http://openid.net/signon/1.0', services[1].xmlChildren[1].xmlText) />
		<cfset assertEquals('http://resolve.example.com', services[1].URI[2].xmlText) />
		<cfset assertEquals('http://resolve2.example.com', services[1].URI[1].xmlText) />
		<cfset assertEquals('https://resolve.example.com', services[1].URI[3].xmlText) />
	</cffunction>
	
	<!---
		Tests if the sorting of xml elements based upon priority works
	--->
	<cffunction name="testSort" access="public" returntype="void" output="false">
		<cfset var sorted = '' />
		<cfset var yadis = createObject('component', 'cf-compendium.inc.resource.communication.yadis').init() />
		
		<cfset makePublic(yadis, 'xmlPrioritySort') />
		
		<cfset sorted = yadis.xmlPrioritySort( variables.xrds, 'Service' ) />
		
		<cfset assertEquals('http://openid.net/signon/1.0', sorted[1].xmlChildren[1].xmlText) />
		<cfset assertEquals('http://lid.netmesh.org/sso/2.0', sorted[2].xmlChildren[1].xmlText) />
		<cfset assertEquals('http://openid.net/signon/1.0', sorted[3].xmlChildren[1].xmlText) />
		<cfset assertEquals('http://lid.netmesh.org/sso/1.0', sorted[4].xmlChildren[1].xmlText) />
	</cffunction>
</cfcomponent>