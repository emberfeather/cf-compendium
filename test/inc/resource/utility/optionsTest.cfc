<cfcomponent extends="mxunit.framework.TestCase" output="false">
	<cffunction name="testLength" access="public" returntype="void" output="false">
		<cfset var options = createObject('component', 'cf-compendium.inc.resource.utility.options').init() />
		
		<cfset options.addOption('Test 1', 'Test1') />
		<cfset options.addOption('Test 2', 'Test2') />
		<cfset options.addOption('Test 3', 'Test3') />
		
		<cfset assertEquals(3, options.length()) />
	</cffunction>
	
	<cffunction name="testLengthWithGroup" access="public" returntype="void" output="false">
		<cfset var options = createObject('component', 'cf-compendium.inc.resource.utility.options').init() />
		
		<cfset options.addOption('Test 1', 'Test1') />
		<cfset options.addOption('Test 2', 'Test2') />
		<cfset options.addOption('Test 3', 'Test3') />
		
		<cfset options.addGroup('Group 1') />
		
		<cfset options.addOption('Test 4', 'Test4') />
		<cfset options.addOption('Test 5', 'Test5') />
		<cfset options.addOption('Test 6', 'Test6') />
		
		<cfset assertEquals(6, options.length()) />
	</cffunction>
</cfcomponent>