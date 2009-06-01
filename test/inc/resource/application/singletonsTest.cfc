<cfcomponent extends="mxunit.framework.TestCase" output="false">
	<!---
		When using the singleton manager and the singleton exists
		and is not a stub it should return true for the has
		functionality.
	--->
	<cffunction name="testHasSingleton" access="public" returntype="void" output="false">
		<cfset var singletons = createObject('component', 'cf-compendium.inc.resource.application.singletons').init() />
		
		<cfset singletons.setSingleton(createObject('component', 'cf-compendium.inc.resource.base.base').init()) />
		
		<cfset assertTrue(singletons.hasSingleton()) />
	</cffunction>
	
	<!---
		When using the singleton manager and the singleton does not
		exist and is not a stub it should return false for the has
		functionality.
	--->
	<cffunction name="testHasSingletonSansSingleton" access="public" returntype="void" output="false">
		<cfset var singletons = createObject('component', 'cf-compendium.inc.resource.application.singletons').init() />
		
		<cfset assertFalse(singletons.hasSingleton()) />
	</cffunction>
	
	<!---
		When using the singleton manager and the singleton exists
		and is NOT a stub it should return true for the has
		functionality.
	--->
	<cffunction name="testHasSingletonStub" access="public" returntype="void" output="false">
		<cfset var singletons = createObject('component', 'cf-compendium.inc.resource.application.singletons').init() />
		
		<cfset singletons.getSingleton() />
		
		<cfset assertFalse(singletons.hasSingleton()) />
	</cffunction>
</cfcomponent>