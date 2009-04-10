<cfcomponent extends="mxunit.framework.TestCase" output="false">
	<!---
		Test
	--->
	<cffunction name="test" access="public" returntype="void" output="false">
		<cfset var i18n = createObject('component', 'cf-compendium.inc.resource.i18n.i18n').init(expandPath('/')) />
		<cfset var datagrid = createObject('component', 'cf-compendium.inc.resource.structure.datagrid').init(i18n) />
		
		<!--- Yeah! --->
	</cffunction>
</cfcomponent>