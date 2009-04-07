<cfcomponent extends="mxunit.framework.TestCase" output="false">
	<!---
		Test the Empty functions
	--->
	<cffunction name="testEmpty" access="public" returntype="void" output="false">
		<cfset var theQueue = createObject('component', 'cf-compendium.inc.resource.utility.queue').init() />
		
		<cfset theQueue.push('test1') />
		<cfset theQueue.push('test2') />
		<cfset theQueue.push('test3') />
		
		<cfset theQueue.empty() />
		
		<cfset assertEquals(0, theQueue.length()) />
	</cffunction>
	
	<!---
		Test the isEmpty function for true
	--->
	<cffunction name="testIsEmptyTrue" access="public" returntype="void" output="false">
		<cfset var theQueue = createObject('component', 'cf-compendium.inc.resource.utility.queue').init() />
		
		<cfset assertTrue(theQueue.isEmpty()) />
	</cffunction>
	
	<!---
		Test the isEmpty function for false
	--->
	<cffunction name="testIsEmptyFalse" access="public" returntype="void" output="false">
		<cfset var theQueue = createObject('component', 'cf-compendium.inc.resource.utility.queue').init() />
		
		<cfset theQueue.push('test') />
		
		<cfset assertFalse(theQueue.isEmpty()) />
	</cffunction>
	
	<!---
		Tests the length function with no values
	--->
	<cffunction name="testLengthEmpty" access="public" returntype="void" output="false">
		<cfset var theQueue = createObject('component', 'cf-compendium.inc.resource.utility.queue').init() />
		
		<cfset assertEquals(0, theQueue.length()) />
	</cffunction>
	
	<!---
		Tests the length function with multiple values
	--->
	<cffunction name="testLengthMultiple" access="public" returntype="void" output="false">
		<cfset var theQueue = createObject('component', 'cf-compendium.inc.resource.utility.queue').init() />
		
		<cfset theQueue.push('test1') />
		<cfset theQueue.push('test2') />
		<cfset theQueue.push('test3') />
		<cfset theQueue.push('test4') />
		
		<cfset assertEquals(4, theQueue.length()) />
	</cffunction>
	
	<!---
		Tests the pop function
	--->
	<cffunction name="testPop" access="public" returntype="void" output="false">
		<cfset var theQueue = createObject('component', 'cf-compendium.inc.resource.utility.queue').init() />
		
		<cfset theQueue.push('test') />
		
		<cfset assertEquals('test', theQueue.pop()) />
	</cffunction>
	
	<!---
		Tests the pop function with an empty queue
	--->
	<cffunction name="testPopFailOnEmpty" access="public" returntype="void" output="false">
		<cfset var theQueue = createObject('component', 'cf-compendium.inc.resource.utility.queue').init() />
		
		<cftry>
			<cfset theQueue.pop() />
			<cfset fail('should not be able to pop off an empty queue') />
			
			<cfcatch type="mxunit.exception.AssertionFailedError"><cfrethrow /></cfcatch>
			<cfcatch type="any"><!--- Expect to get here ---></cfcatch>
		</cftry>
	</cffunction>
	
	<!---
		Tests the pop function with multiple values
	--->
	<cffunction name="testPopMultiple" access="public" returntype="void" output="false">
		<cfset var theQueue = createObject('component', 'cf-compendium.inc.resource.utility.queue').init() />
		
		<cfset theQueue.push('test1') />
		<cfset theQueue.push('test2') />
		<cfset theQueue.push('test3') />
		<cfset theQueue.push('test4') />
		
		<cfset assertEquals('test1', theQueue.pop()) />
		<cfset assertEquals('test2', theQueue.pop()) />
		<cfset assertEquals('test3', theQueue.pop()) />
		<cfset assertEquals('test4', theQueue.pop()) />
	</cffunction>
	
	<!---
		Tests the push function
	--->
	<cffunction name="testPush" access="public" returntype="void" output="false">
		<cfset var theQueue = createObject('component', 'cf-compendium.inc.resource.utility.queue').init() />
		
		<cfset theQueue.push('test') />
		
		<cfset assertFalse(theQueue.isEmpty()) />
	</cffunction>
</cfcomponent>