<cfcomponent extends="mxunit.framework.TestCase" output="false">
	<!---
		Test the get attribute list functionality.
	--->
	<cffunction name="testGetAttributeList" access="public" returntype="void" output="false">
		<cfset var i18n = createObject('component', 'cf-compendium.inc.resource.i18n.i18n').init(expandPath('/')) />
		<cfset var theObject = createObject('component', 'cf-compendium.inc.resource.base.model').init(i18n) />
		
		<cfset theObject.setTest('value') />
		
		<cfset theObject.addAttribute('testing') />
		<cfset theObject.addAttribute('again') />
		<cfset theObject.addAttribute('for') />
		<cfset theObject.addAttribute('bugs') />
		
		<cfset theObject.setTester('value') />
		
		<cfset assertEquals('testing,again,for,bugs', theObject.getAttributeList()) />
	</cffunction>
</cfcomponent>