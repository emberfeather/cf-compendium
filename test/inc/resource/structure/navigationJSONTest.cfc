<cfcomponent extends="mxunit.framework.TestCase" output="false">
	<cffunction name="test" access="public" returntype="void" output="false">
		<cfset var navigation = createObject('component', 'cf-compendium.inc.resource.structure.navigationJSON').init() />
	</cffunction>
</cfcomponent>