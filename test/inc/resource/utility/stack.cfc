<cfcomponent extends="mxunit.framework.TestCase" output="false">
	<!---
		Test the Empty functions
	--->
	<cffunction name="testEmpty" access="public" returntype="void" output="false">
		<cfset var theStack = createObject('component', 'cf-compendium.inc.resource.utility.stack').init() />
		
		<cfset theStack.push('test1') />
		<cfset theStack.push('test2') />
		<cfset theStack.push('test3') />
		
		<cfset theStack.empty() />
		
		<cfset assertEquals(0, theStack.length()) />
	</cffunction>
	
	<!---
		Test the isEmpty function for true
	--->
	<cffunction name="testIsEmptyTrue" access="public" returntype="void" output="false">
		<cfset var theStack = createObject('component', 'cf-compendium.inc.resource.utility.stack').init() />
		
		<cfset assertTrue(theStack.isEmpty()) />
	</cffunction>
	
	<!---
		Test the isEmpty function for false
	--->
	<cffunction name="testIsEmptyFalse" access="public" returntype="void" output="false">
		<cfset var theStack = createObject('component', 'cf-compendium.inc.resource.utility.stack').init() />
		
		<cfset theStack.push('test') />
		
		<cfset assertFalse(theStack.isEmpty()) />
	</cffunction>
	
	<!---
		Tests the length function with no values
	--->
	<cffunction name="testLengthEmpty" access="public" returntype="void" output="false">
		<cfset var theStack = createObject('component', 'cf-compendium.inc.resource.utility.stack').init() />
		
		<cfset assertEquals(0, theStack.length()) />
	</cffunction>
	
	<!---
		Tests the length function with multiple values
	--->
	<cffunction name="testLengthMultiple" access="public" returntype="void" output="false">
		<cfset var theStack = createObject('component', 'cf-compendium.inc.resource.utility.stack').init() />
		
		<cfset theStack.push('test1') />
		<cfset theStack.push('test2') />
		<cfset theStack.push('test3') />
		<cfset theStack.push('test4') />
		
		<cfset assertEquals(4, theStack.length()) />
	</cffunction>
	
	<!---
		Tests the pop function
	--->
	<cffunction name="testPop" access="public" returntype="void" output="false">
		<cfset var theStack = createObject('component', 'cf-compendium.inc.resource.utility.stack').init() />
		
		<cfset theStack.push('test') />
		
		<cfset assertEquals('test', theStack.pop()) />
	</cffunction>
	
	<!---
		Tests the pop function with an empty stack
	--->
	<cffunction name="testPopFailOnEmpty" access="public" returntype="void" output="false">
		<cfset var theStack = createObject('component', 'cf-compendium.inc.resource.utility.stack').init() />
		
		<cftry>
			<cfset theStack.pop() />
			<cfset fail('should not be able to pop off an empty stack') />
			
			<cfcatch type="mxunit.exception.AssertionFailedError"><cfrethrow /></cfcatch>
			<cfcatch type="any"><!--- Expect to get here ---></cfcatch>
		</cftry>
	</cffunction>
	
	<!---
		Tests the pop function with multiple values
	--->
	<cffunction name="testPopMultiple" access="public" returntype="void" output="false">
		<cfset var theStack = createObject('component', 'cf-compendium.inc.resource.utility.stack').init() />
		
		<cfset theStack.push('test1') />
		<cfset theStack.push('test2') />
		<cfset theStack.push('test3') />
		<cfset theStack.push('test4') />
		
		<cfset assertEquals('test4', theStack.pop()) />
		<cfset assertEquals('test3', theStack.pop()) />
		<cfset assertEquals('test2', theStack.pop()) />
		<cfset assertEquals('test1', theStack.pop()) />
	</cffunction>
	
	<!---
		Tests the push function
	--->
	<cffunction name="testPush" access="public" returntype="void" output="false">
		<cfset var theStack = createObject('component', 'cf-compendium.inc.resource.utility.stack').init() />
		
		<cfset theStack.push('test') />
		
		<cfset assertFalse(theStack.isEmpty()) />
	</cffunction>
</cfcomponent>