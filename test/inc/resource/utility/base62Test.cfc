<cfcomponent extends="mxunit.framework.TestCase" output="false">
	<cffunction name="setup" access="public" returntype="void" output="false">
		<cfset variables.base62 = createObject('component', 'cf-compendium.inc.resource.utility.base62').init() />
	</cffunction>
	
	<cffunction name="testBase62ToValueWith2bI" access="public" returntype="void" output="false">
		<cfset var base = '2bI' />
		
		<cfset assertEquals(10000, variables.base62.base62ToValue(base), 'Incorrectly converted #base# to value') />
	</cffunction>
	
	<cffunction name="testBase62ToValueWith8M0kX" access="public" returntype="void" output="false">
		<cfset var base = '8M0kX' />
		
		<cfset assertEquals(123456789, variables.base62.base62ToValue(base), 'Incorrectly converted #base# to value') />
	</cffunction>
	
	<cffunction name="testBase62ToValueWithG8" access="public" returntype="void" output="false">
		<cfset var base = 'G8' />
		
		<cfset assertEquals(1000, variables.base62.base62ToValue(base), 'Incorrectly converted #base# to value') />
	</cffunction>
	
	<cffunction name="testValueToBase62With1000" access="public" returntype="void" output="false">
		<cfset var value = 1000 />
		
		<cfset assertEquals('G8', variables.base62.valueToBase62(1000), 'Incorrectly converted #value# to base62') />
	</cffunction>
	
	<cffunction name="testValueToBase62With10000" access="public" returntype="void" output="false">
		<cfset var value = 10000 />
		
		<cfset assertEquals('2bI', variables.base62.valueToBase62(value), 'Incorrectly converted #value# to base62') />
	</cffunction>
	
	<cffunction name="testValueToBase62With123456789" access="public" returntype="void" output="false">
		<cfset var value = 123456789 />
		
		<cfset assertEquals('8M0kX', variables.base62.valueToBase62(value), 'Incorrectly converted #value# to base62') />
	</cffunction>
</cfcomponent>