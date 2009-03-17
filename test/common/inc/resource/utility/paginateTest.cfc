<cfcomponent extends="mxunit.framework.TestCase" output="false">
	<!---
		Tests the init function with a negative number per page to ensure it fails
	--->
	<cffunction name="testInitFailWithNegativeNumPerPage" access="public" returntype="void" output="false">
		<cfset var thePaginator = '' />
		
		<cftry>
			<cfset thePaginator = createObject('component', 'cf-compendium.inc.resource.utility.paginate').init(100, -1, 1) />
			<cfset fail('Should not be a valid number per page argument') />
			
			<cfcatch type="mxunit.exception.AssertionFailedError"><cfrethrow /></cfcatch>
			<cfcatch type="any"><!--- Expect to get here ---></cfcatch>
		</cftry>
	</cffunction>
	
	<!---
		Tests the init function with a negative number per page to ensure it fails
	--->
	<cffunction name="testInitFailWithExtremeNumPerPage" access="public" returntype="void" output="false">
		<cfset var thePaginator = '' />
		
		<cftry>
			<cfset thePaginator = createObject('component', 'cf-compendium.inc.resource.utility.paginate').init(100, 101, 1) />
			<cfset fail('Should not be a valid number per page argument') />
			
			<cfcatch type="mxunit.exception.AssertionFailedError"><cfrethrow /></cfcatch>
			<cfcatch type="any"><!--- Expect to get here ---></cfcatch>
		</cftry>
	</cffunction>
	
	<!---
		Tests the init function with a negative number per page to ensure it suceeds
		<p>
		If an invalid page is given it should automatically be brought into the closest bound.
	--->
	<cffunction name="testInitWithZeroPage" access="public" returntype="void" output="false">
		<cfset var thePaginator = '' />
		
		<cftry>
			<cfset thePaginator = createObject('component', 'cf-compendium.inc.resource.utility.paginate').init(100, 25, 0) />
			
			<cfset assertEquals(1, thePaginator.getPage()) />
			
			<cfcatch type="any">
				<cfset fail('Should be a valid page argument') />
			</cfcatch>
		</cftry>
	</cffunction>
	
	<!---
		Tests the init function with a extreme page to ensure it succeeds.
		<p>
		If an invalid page is given it should automatically be brought into the closest bound.
	--->
	<cffunction name="testInitWithExtremePage" access="public" returntype="void" output="false">
		<cfset var thePaginator = '' />
		
		<cftry>
			<cfset thePaginator = createObject('component', 'cf-compendium.inc.resource.utility.paginate').init(100, 25, 10) />
			
			<cfset assertEquals(4, thePaginator.getPage()) />
			
			<cfcatch type="any">
				<cfset fail('Should be a valid page argument') />
			</cfcatch>
		</cftry>
	</cffunction>
	
	<!---
		Tests the init function with a negative total to ensure it fails
	--->
	<cffunction name="testInitFailWithNegativeTotal" access="public" returntype="void" output="false">
		<cfset var thePaginator = '' />
		
		<cftry>
			<cfset thePaginator = createObject('component', 'cf-compendium.inc.resource.utility.paginate').init(-1, 25, 1) />
			<cfset fail('Should not be a valid total argument') />
			
			<cfcatch type="mxunit.exception.AssertionFailedError"><cfrethrow /></cfcatch>
			<cfcatch type="any"><!--- Expect to get here ---></cfcatch>
		</cftry>
	</cffunction>
	
	<!---
		Tests the getEndRow function
	--->
	<cffunction name="testGetEndRowSansTotal" access="public" returntype="void" output="false">
		<cfset var thePaginator = createObject('component', 'cf-compendium.inc.resource.utility.paginate').init(0, 25, 1) />
		
		<cfset assertEquals(0, thePaginator.getEndRow()) />
	</cffunction>
	
	<!---
		Tests the getEndRow function
	--->
	<cffunction name="testGetEndRowOnLast" access="public" returntype="void" output="false">
		<cfset var thePaginator = createObject('component', 'cf-compendium.inc.resource.utility.paginate').init(90, 25, 4) />
		
		<cfset assertEquals(90, thePaginator.getEndRow()) />
	</cffunction>
	
	<!---
		Tests the getEndRow function
	--->
	<cffunction name="testGetEndRowOnNonLast" access="public" returntype="void" output="false">
		<cfset var thePaginator = createObject('component', 'cf-compendium.inc.resource.utility.paginate').init(100, 25, 2) />
		
		<cfset assertEquals(50, thePaginator.getEndRow()) />
	</cffunction>
	
	<!---
		Tests the getFirst function
	--->
	<cffunction name="testGetFirst" access="public" returntype="void" output="false">
		<cfset var thePaginator = createObject('component', 'cf-compendium.inc.resource.utility.paginate').init(100, 25, 1) />
		
		<cfset assertEquals(1, thePaginator.getFirst()) />
	</cffunction>
	
	<!---
		Tests the getFirst function
	--->
	<cffunction name="testGetLast" access="public" returntype="void" output="false">
		<cfset var thePaginator = createObject('component', 'cf-compendium.inc.resource.utility.paginate').init(100, 25, 1) />
		
		<cfset assertEquals(4, thePaginator.getLast()) />
	</cffunction>
	
	<!---
		Tests the getNumPerPage function
	--->
	<cffunction name="testGetNumPerPage" access="public" returntype="void" output="false">
		<cfset var thePaginator = createObject('component', 'cf-compendium.inc.resource.utility.paginate').init(100, 25, 1) />
		
		<cfset assertEquals(25, thePaginator.getNumPerPage()) />
	</cffunction>
	
	<!---
		Tests the getNext function
	--->
	<cffunction name="testGetNextOnLast" access="public" returntype="void" output="false">
		<cfset var thePaginator = createObject('component', 'cf-compendium.inc.resource.utility.paginate').init(100, 25, 4) />
		
		<cfset assertEquals(4, thePaginator.getNext()) />
	</cffunction>
	
	<!---
		Tests the getNext function
	--->
	<cffunction name="testGetNextOnNonLast" access="public" returntype="void" output="false">
		<cfset var thePaginator = createObject('component', 'cf-compendium.inc.resource.utility.paginate').init(100, 25, 2) />
		
		<cfset assertEquals(3, thePaginator.getNext()) />
	</cffunction>
	
	<!---
		Tests the getPage function
	--->
	<cffunction name="testGetPage" access="public" returntype="void" output="false">
		<cfset var thePaginator = createObject('component', 'cf-compendium.inc.resource.utility.paginate').init(100, 25, 2) />
		
		<cfset assertEquals(2, thePaginator.getPage()) />
	</cffunction>
	
	<!---
		Tests the getPrevious function
	--->
	<cffunction name="testGetPreviousOnFirst" access="public" returntype="void" output="false">
		<cfset var thePaginator = createObject('component', 'cf-compendium.inc.resource.utility.paginate').init(100, 25, 1) />
		
		<cfset assertEquals(1, thePaginator.getPrevious()) />
	</cffunction>
	
	<!---
		Tests the getPrevious function
	--->
	<cffunction name="testGetPreviousOnNonFirst" access="public" returntype="void" output="false">
		<cfset var thePaginator = createObject('component', 'cf-compendium.inc.resource.utility.paginate').init(100, 25, 3) />
		
		<cfset assertEquals(2, thePaginator.getPrevious()) />
	</cffunction>
	
	<!---
		Tests the getStartRow function
	--->
	<cffunction name="testGetStartRowSansTotal" access="public" returntype="void" output="false">
		<cfset var thePaginator = createObject('component', 'cf-compendium.inc.resource.utility.paginate').init(0, 25, 1) />
		
		<cfset assertEquals(0, thePaginator.getStartRow()) />
	</cffunction>
	
	<!---
		Tests the getStartRow function
	--->
	<cffunction name="testGetStartRowOnFirst" access="public" returntype="void" output="false">
		<cfset var thePaginator = createObject('component', 'cf-compendium.inc.resource.utility.paginate').init(100, 25, 1) />
		
		<cfset assertEquals(1, thePaginator.getStartRow()) />
	</cffunction>
	
	<!---
		Tests the getStartRow function
	--->
	<cffunction name="testGetStartRowOnNonFirst" access="public" returntype="void" output="false">
		<cfset var thePaginator = createObject('component', 'cf-compendium.inc.resource.utility.paginate').init(100, 25, 2) />
		
		<cfset assertEquals(26, thePaginator.getStartRow()) />
	</cffunction>
	
	<!---
		Tests the hasPrevious function
	--->
	<cffunction name="testHasPreviousOnFirst" access="public" returntype="void" output="false">
		<cfset var thePaginator = createObject('component', 'cf-compendium.inc.resource.utility.paginate').init(100, 25, 1) />
		
		<cfset assertEquals(false, thePaginator.hasPrevious()) />
	</cffunction>
	
	<!---
		Tests the hasPrevious function
	--->
	<cffunction name="testHasPreviousOnNonFirst" access="public" returntype="void" output="false">
		<cfset var thePaginator = createObject('component', 'cf-compendium.inc.resource.utility.paginate').init(100, 25, 2) />
		
		<cfset assertEquals(true, thePaginator.hasPrevious()) />
	</cffunction>
	
	<!---
		Tests the hasNext function
	--->
	<cffunction name="testHasNextOnLast" access="public" returntype="void" output="false">
		<cfset var thePaginator = createObject('component', 'cf-compendium.inc.resource.utility.paginate').init(100, 25, 4) />
		
		<cfset assertEquals(false, thePaginator.hasNext()) />
	</cffunction>
	
	<!---
		Tests the hasNext function
	--->
	<cffunction name="testHasNextOnNonLast" access="public" returntype="void" output="false">
		<cfset var thePaginator = createObject('component', 'cf-compendium.inc.resource.utility.paginate').init(100, 25, 2) />
		
		<cfset assertEquals(true, thePaginator.hasNext()) />
	</cffunction>
</cfcomponent>