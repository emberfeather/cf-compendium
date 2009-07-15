<cfcomponent extends="mxunit.framework.TestCase" output="false">
	<!---
		When using the factory manager and the definition exists
		it should return true for the has functionality.
	--->
	<cffunction name="testHasDefinition" access="public" returntype="void" output="false">
		<cfset var factory = createObject('component', 'cf-compendium.inc.resource.application.factoryManager').init() />
		
		<cfset factory.setFactory( 'testing' ) />
		
		<cfset assertTrue(factory.hasFactory()) />
	</cffunction>
	
	<!---
		When using the factory manager and the definition does not
		exist it should return false for the has functionality.
	--->
	<cffunction name="testHasDefinitionSansDefinition" access="public" returntype="void" output="false">
		<cfset var factory = createObject('component', 'cf-compendium.inc.resource.application.factoryManager').init() />
		
		<cfset assertFalse(factory.hasFactory()) />
	</cffunction>
	
	<!---
		When setting a definition on the factory manager it needs
		to have an string passed as an argument.
	--->
	<cffunction name="testSetSansArguments" access="public" returntype="void" output="false">
		<cfset var factory = createObject('component', 'cf-compendium.inc.resource.application.factoryManager').init() />
		
		<cftry>
			<cfset factory.setFactory() />
			
			<cfset fail("Should not be able to call the set without an argument.") />
			
			<cfcatch type="mxunit.exception.AssertionFailedError">
				<cfrethrow />
			</cfcatch>
			
			<cfcatch type="any">
				<!--- expect to get here --->
			</cfcatch>
		</cftry>
	</cffunction>
	
	<!---
		When setting a definition on the factory manager it needs
		to be a simple value.
	--->
	<cffunction name="testSetSansObject" access="public" returntype="void" output="false">
		<cfset var factory = createObject('component', 'cf-compendium.inc.resource.application.factoryManager').init() />
		<cfset var test = createObject('component', 'cf-compendium.inc.resource.base.base').init() />
		
		<cftry>
			<cfset factory.setFactory(test) />
			
			<cfset fail("Should not be able to call with a non-simple value argument.") />
			
			<cfcatch type="mxunit.exception.AssertionFailedError">
				<cfrethrow />
			</cfcatch>
			
			<cfcatch type="any">
				<!--- expect to get here --->
			</cfcatch>
		</cftry>
	</cffunction>
</cfcomponent>