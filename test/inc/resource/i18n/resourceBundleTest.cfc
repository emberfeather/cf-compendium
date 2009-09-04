<cfcomponent extends="mxunit.framework.TestCase" output="false">
	<cffunction name="testGetKeys" access="public" returntype="void" output="false">
		<cfset var resourceBundle = createObject('component', 'cf-compendium.inc.resource.i18n.resourceBundle').init('/i18n/inc/resource/i18n/', 'resourceBundle', 'en_US') />
		<cfset var keyList = '' />
		
		<cfset keyList = arrayToList(resourceBundle.getKeys()) />
		
		<cfset assertEquals('Cancel,Go', listSort(keyList, 'text')) />
	</cffunction>
</cfcomponent>