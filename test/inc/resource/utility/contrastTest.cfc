<cfcomponent extends="mxunit.framework.TestCase" output="false">
	<cffunction name="setup" access="public" returntype="void" output="false">
		<cfset variables.contrastor = createObject('component', 'cf-compendium.inc.resource.utility.contrast').init() />
	</cffunction>
	
	<!---
		Tests to see if two elements DO NOT contain the same values pairs regardless of order of elements
	--->
	<cffunction name="testAreEqualFalse" access="public" returntype="void" output="false">
		<cfset var set1 = '' />
		<cfset var set2 = '' />
				
		<!--- Lists --->
		<cfset set1 = 'four,five,six' />
		<cfset set2 = 'three,one,two' />
		
		<cfset assertFalse(variables.contrastor.areEqual(set1, set2)) />
		
		
		<!--- Arrays --->
		<cfset set1 = [4,5,6,7] />
		<cfset set2 = [3,1,2] />
		
		<cfset assertFalse(variables.contrastor.areEqual(set1, set2)) />
		
		<!--- Structs --->
		<cfset set1 = { test8 = 0, test3 = 0, test1 = 0 } />
		<cfset set2 = { test1 = 0, test2 = 0, test3 = 0 } />
		
		<cfset assertFalse(variables.contrastor.areEqual(set1, set2)) />
	</cffunction>
	
	<!---
		Tests to see if two elements contain the same values pairs regardless of order of elements
	--->
	<cffunction name="testAreEqualTrue" access="public" returntype="void" output="false">
		<cfset var set1 = '' />
		<cfset var set2 = '' />
				
		<!--- Lists --->
		<cfset set1 = 'one,two,three' />
		<cfset set2 = 'three,one,two' />
		
		<cfset assertTrue(variables.contrastor.areEqual(set1, set2)) />
		
		
		<!--- Arrays --->
		<cfset set1 = [1,2,3] />
		<cfset set2 = [3,1,2] />
		
		<cfset assertTrue(variables.contrastor.areEqual(set1, set2)) />
		
		<!--- Structs --->
		<cfset set1 = { test2 = 0, test3 = 0, test1 = 0 } />
		<cfset set2 = { test1 = 0, test2 = 0, test3 = 0 } />
		
		<cfset assertTrue(variables.contrastor.areEqual(set1, set2)) />
	</cffunction>
	
	<!---
		Tests to see if two elements DO NOT contain the same values pairs regardless of order of elements
		for a set
	--->
	<cffunction name="testAreEqualSetFalse" access="public" returntype="void" output="false">
		<cfset var set1 = '' />
		<cfset var set2 = '' />
		<cfset var set3 = '' />
				
		<!--- Lists --->
		<cfset set1 = 'four,five,six' />
		<cfset set2 = 'three,one,two' />
		<cfset set3 = 'seven, eight, nine' />
		
		<cfset assertFalse(variables.contrastor.areEqualSet(set1, set2, set3)) />
		
		
		<!--- Arrays --->
		<cfset set1 = [4,5,6,7] />
		<cfset set2 = [3,1,2] />
		<cfset set3 = [9]>
		
		<cfset assertFalse(variables.contrastor.areEqualSet(set1, set2, set3)) />
		
		<!--- Structs --->
		<cfset set1 = { test8 = 0, test3 = 0, test1 = 0 } />
		<cfset set2 = { test1 = 0, test2 = 0, test3 = 0 } />
		<cfset set3 = { test9 = 0, test11 = 0, test10 = 0 } />
		
		<cfset assertFalse(variables.contrastor.areEqualSet(set1, set2, set3)) />
	</cffunction>
	
	<!---
		Tests to see if two elements contain the same values pairs regardless of order of elements
		for a set
	--->
	<cffunction name="testAreEqualSetTrue" access="public" returntype="void" output="false">
		<cfset var set1 = '' />
		<cfset var set2 = '' />
		<cfset var set3 = '' />
				
		<!--- Lists --->
		<cfset set1 = 'one,two,three' />
		<cfset set2 = 'three,one,two' />
		<cfset set3 = 'two,three,one' />
		
		<cfset assertTrue(variables.contrastor.areEqualSet(set1, set2, set3)) />
		
		<!--- Arrays --->
		<cfset set1 = [1,2,3] />
		<cfset set2 = [3,1,2] />
		<cfset set3 = [2,3,1] />
		
		<cfset assertTrue(variables.contrastor.areEqualSet(set1, set2, set3)) />
		
		<!--- Structs --->
		<cfset set1 = { test2 = 0, test3 = 0, test1 = 0 } />
		<cfset set2 = { test1 = 0, test2 = 0, test3 = 0 } />
		<cfset set3 = { test3 = 0, test1 = 0, test2 = 0 } />
		
		<cfset assertTrue(variables.contrastor.areEqualSet(set1, set2, set3)) />
	</cffunction>
	
	<!---
		Tests to see if the contrast will fail if given two different types
		that it will fail. With the exception of array and list collusion.
	--->
	<cffunction name="testContrastFailWithTypeMismatch" access="public" returntype="void" output="false">
		<cfset var set1 = '' />
		<cfset var set2 = '' />
		
		<cftry>
			<cfset set1 = queryNew('something,also,here') />
			<cfset set2 = 'cannot,be,done' />
			
			<cfset variables.contrastor.contrast(set1, set2) />
			<cfset fail('Should not be able to contrast the two given types') />
			
			<cfcatch type="mxunit.exception.AssertionFailedError"><cfrethrow /></cfcatch>
			<cfcatch type="any"><!--- Expect to get here ---></cfcatch>
		</cftry>
	</cffunction>
	
	<!---
		Tests the contrast with same types
	--->
	<cffunction name="testContrast" access="public" returntype="void" output="false">
		<cfset var set1 = '' />
		<cfset var set2 = '' />
		
		<cftry>
			<!--- Lists --->
			<cfset set1 = 'testing,this,here' />
			<cfset set2 = 'can,be,done' />
			
			<cfset variables.contrastor.contrast(set1, set2) />
			
			<!--- Arrays --->
			<cfset set1 = [1,2,3] />
			<cfset set2 = [4,2,5] />
			
			<cfset variables.contrastor.contrast(set1, set2) />
			
			<!--- Structs --->
			<cfset set1 = { test4 = 0, test2 = 0, test0 = 0 } />
			<cfset set2 = { test1 = 0, test2 = 0, test3 = 0 } />
			
			<cfset variables.contrastor.contrast(set1, set2) />
			
			<cfcatch type="any">
				<cfset fail('Should be able to contrast the two given types') />
			</cfcatch>
		</cftry>
	</cffunction>
	
	<!---
		Tests the contrast with different types
	--->
	<cffunction name="testContrastWithTypeMismatch" access="public" returntype="void" output="false">
		<cfset var set1 = '' />
		<cfset var set2 = '' />
		
		<cftry>
			<!--- Array and List --->
			<cfset set1 = [1,2,3] />
			<cfset set2 = 'can,be,done' />
			
			<cfset variables.contrastor.contrast(set1, set2) />
			
			<!--- List and Array --->
			<cfset set1 = 'can,be,done' />
			<cfset set2 = [1,2,3] />
			
			<cfset variables.contrastor.contrast(set1, set2) />
			
			<!--- Struct and List --->
			<cfset set1 = { test1 = 0, test2 = 0, test3 = 0 } />
			<cfset set2 = 'can,be,done' />
			
			<cfset variables.contrastor.contrast(set1, set2) />
			
			<!--- List and Struct --->
			<cfset set1 = 'can,be,done' />
			<cfset set2 = { test1 = 0, test2 = 0, test3 = 0 } />
			
			<cfset variables.contrastor.contrast(set1, set2) />
			
			<!--- Struct and Array --->
			<cfset set1 = { test1 = 0, test2 = 0, test3 = 0 } />
			<cfset set2 = [4,3,5] />
			
			<cfset variables.contrastor.contrast(set1, set2) />
			
			<!--- Array and Struct --->
			<cfset set1 = [4,3,5] />
			<cfset set2 = { test1 = 0, test2 = 0, test3 = 0 } />
			
			<cfset variables.contrastor.contrast(set1, set2) />
			
			<cfcatch type="any">
				<cfset fail('Should be able to contrast the two given types') />
			</cfcatch>
		</cftry>
	</cffunction>
	
	<!---
		Tests the contrast with same types and a custom delimiter
	--->
	<cffunction name="testContrastWithDelimiter" access="public" returntype="void" output="false">
		<cfset var set1 = '' />
		<cfset var set2 = '' />
		
		<cftry>
			<!--- Lists --->
			<cfset set1 = 'testing|this|here' />
			<cfset set2 = 'can|be|done' />
			
			<cfset variables.contrastor.contrast(set1, set2, '|') />
			
			<!--- Arrays --->
			<cfset set1 = [1,2,3] />
			<cfset set2 = [4,2,5] />
			
			<cfset variables.contrastor.contrast(set1, set2, '|') />
			
			<!--- Structs --->
			<cfset set1 = { test4 = 0, test2 = 0, test0 = 0 } />
			<cfset set2 = { test1 = 0, test2 = 0, test3 = 0 } />
			
			<cfset variables.contrastor.contrast(set1, set2, '|') />
			
			<cfcatch type="any">
				<cfset fail('Should be able to contrast the two given types') />
			</cfcatch>
		</cftry>
	</cffunction>
</cfcomponent>