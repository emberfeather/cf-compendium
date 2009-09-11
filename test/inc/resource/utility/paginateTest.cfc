<cfcomponent extends="mxunit.framework.TestCase" output="false">
	<!---
		Tests the init function with a negative number per page to ensure it fails
	--->
	<cffunction name="testInitFailWithNegativeNumPerPage" access="public" returntype="void" output="false">
		<cfset var paginator = createObject('component', 'cf-compendium.inc.resource.utility.paginate') />
		
		<cftry>
			<cfset paginator.init(100, -1, 1) />
			
			<cfset fail('Should not be a valid number per page argument') />
			
			<cfcatch type="mxunit.exception.AssertionFailedError">
				<cfrethrow />
			</cfcatch>
			
			<cfcatch type="any">
				<!--- Expect to get here --->
			</cfcatch>
		</cftry>
	</cffunction>
	
	<!---
		Tests the init function with a negative number per page to ensure it fails
	--->
	<cffunction name="testInitFailWithExtremeNumPerPage" access="public" returntype="void" output="false">
		<cfset var paginator = createObject('component', 'cf-compendium.inc.resource.utility.paginate') />
		
		<cftry>
			<cfset paginator.init(100, 101, 1) />
			
			<cfset fail('Should not be a valid number per page argument') />
			
			<cfcatch type="mxunit.exception.AssertionFailedError">
				<cfrethrow />
			</cfcatch>
			
			<cfcatch type="any">
				<!--- Expect to get here --->
			</cfcatch>
		</cftry>
	</cffunction>
	
	<!---
		Tests the init function with a negative number per page to ensure it suceeds
		<p>
		If an invalid page is given it should automatically be brought into the closest bound.
	--->
	<cffunction name="testInitWithZeroPage" access="public" returntype="void" output="false">
		<cfset var paginator = createObject('component', 'cf-compendium.inc.resource.utility.paginate').init(100, 25, 0) />
		
		<cfset assertEquals(1, paginator.getPage()) />
	</cffunction>
	
	<!---
		Tests the init function with a extreme page to ensure it succeeds.
		<p>
		If an invalid page is given it should automatically be brought into the closest bound.
	--->
	<cffunction name="testInitWithExtremePage" access="public" returntype="void" output="false">
		<cfset var paginator = createObject('component', 'cf-compendium.inc.resource.utility.paginate').init(100, 25, 10) />
		
		<cfset assertEquals(4, paginator.getPage()) />
	</cffunction>
	
	<!---
		Tests the init function with a negative total to ensure it fails
	--->
	<cffunction name="testInitFailWithNegativeTotal" access="public" returntype="void" output="false">
		<cfset var paginator = createObject('component', 'cf-compendium.inc.resource.utility.paginate') />
		
		<cftry>
			<cfset paginator.init(-1, 25, 1) />
			
			<cfset fail('Should not be a valid total argument') />
			
			<cfcatch type="mxunit.exception.AssertionFailedError">
				<cfrethrow />
			</cfcatch>
			
			<cfcatch type="any">
				<!--- Expect to get here --->
			</cfcatch>
		</cftry>
	</cffunction>
	
	<!---
		Tests the getEndRow function
	--->
	<cffunction name="testGetEndRowSansTotal" access="public" returntype="void" output="false">
		<cfset var paginator = createObject('component', 'cf-compendium.inc.resource.utility.paginate').init(0, 25, 1) />
		
		<cfset assertEquals(0, paginator.getEndRow()) />
	</cffunction>
	
	<!---
		Tests the getEndRow function
	--->
	<cffunction name="testGetEndRowOnLast" access="public" returntype="void" output="false">
		<cfset var paginator = createObject('component', 'cf-compendium.inc.resource.utility.paginate').init(90, 25, 4) />
		
		<cfset assertEquals(90, paginator.getEndRow()) />
	</cffunction>
	
	<!---
		Tests the getEndRow function
	--->
	<cffunction name="testGetEndRowOnNonLast" access="public" returntype="void" output="false">
		<cfset var paginator = createObject('component', 'cf-compendium.inc.resource.utility.paginate').init(100, 25, 2) />
		
		<cfset assertEquals(50, paginator.getEndRow()) />
	</cffunction>
	
	<!---
		Tests the getFirst function
	--->
	<cffunction name="testGetFirst" access="public" returntype="void" output="false">
		<cfset var paginator = createObject('component', 'cf-compendium.inc.resource.utility.paginate').init(100, 25, 1) />
		
		<cfset assertEquals(1, paginator.getFirst()) />
	</cffunction>
	
	<!---
		Tests the getFirst function
	--->
	<cffunction name="testGetLast" access="public" returntype="void" output="false">
		<cfset var paginator = createObject('component', 'cf-compendium.inc.resource.utility.paginate').init(100, 25, 1) />
		
		<cfset assertEquals(4, paginator.getLast()) />
	</cffunction>
	
	<!---
		Tests the getNumPerPage function
	--->
	<cffunction name="testGetNumPerPage" access="public" returntype="void" output="false">
		<cfset var paginator = createObject('component', 'cf-compendium.inc.resource.utility.paginate').init(100, 25, 1) />
		
		<cfset assertEquals(25, paginator.getNumPerPage()) />
	</cffunction>
	
	<!---
		Tests the getNext function
	--->
	<cffunction name="testGetNextOnLast" access="public" returntype="void" output="false">
		<cfset var paginator = createObject('component', 'cf-compendium.inc.resource.utility.paginate').init(100, 25, 4) />
		
		<cfset assertEquals(4, paginator.getNext()) />
	</cffunction>
	
	<!---
		Tests the getNext function
	--->
	<cffunction name="testGetNextOnNonLast" access="public" returntype="void" output="false">
		<cfset var paginator = createObject('component', 'cf-compendium.inc.resource.utility.paginate').init(100, 25, 2) />
		
		<cfset assertEquals(3, paginator.getNext()) />
	</cffunction>
	
	<!---
		Tests the getPage function
	--->
	<cffunction name="testGetPage" access="public" returntype="void" output="false">
		<cfset var paginator = createObject('component', 'cf-compendium.inc.resource.utility.paginate').init(100, 25, 2) />
		
		<cfset assertEquals(2, paginator.getPage()) />
	</cffunction>
	
	<!---
		Tests the getPrevious function
	--->
	<cffunction name="testGetPreviousOnFirst" access="public" returntype="void" output="false">
		<cfset var paginator = createObject('component', 'cf-compendium.inc.resource.utility.paginate').init(100, 25, 1) />
		
		<cfset assertEquals(1, paginator.getPrevious()) />
	</cffunction>
	
	<!---
		Tests the getPrevious function
	--->
	<cffunction name="testGetPreviousOnNonFirst" access="public" returntype="void" output="false">
		<cfset var paginator = createObject('component', 'cf-compendium.inc.resource.utility.paginate').init(100, 25, 3) />
		
		<cfset assertEquals(2, paginator.getPrevious()) />
	</cffunction>
	
	<!---
		Tests the getStartRow function
	--->
	<cffunction name="testGetStartRowSansTotal" access="public" returntype="void" output="false">
		<cfset var paginator = createObject('component', 'cf-compendium.inc.resource.utility.paginate').init(0, 25, 1) />
		
		<cfset assertEquals(1, paginator.getStartRow()) />
	</cffunction>
	
	<!---
		Tests the getStartRow function
	--->
	<cffunction name="testGetStartRowOnFirst" access="public" returntype="void" output="false">
		<cfset var paginator = createObject('component', 'cf-compendium.inc.resource.utility.paginate').init(100, 25, 1) />
		
		<cfset assertEquals(1, paginator.getStartRow()) />
	</cffunction>
	
	<!---
		Tests the getStartRow function
	--->
	<cffunction name="testGetStartRowOnNonFirst" access="public" returntype="void" output="false">
		<cfset var paginator = createObject('component', 'cf-compendium.inc.resource.utility.paginate').init(100, 25, 2) />
		
		<cfset assertEquals(26, paginator.getStartRow()) />
	</cffunction>
	
	<!---
		Tests the hasPrevious function
	--->
	<cffunction name="testHasPreviousOnFirst" access="public" returntype="void" output="false">
		<cfset var paginator = createObject('component', 'cf-compendium.inc.resource.utility.paginate').init(100, 25, 1) />
		
		<cfset assertEquals(false, paginator.hasPrevious()) />
	</cffunction>
	
	<!---
		Tests the hasPrevious function
	--->
	<cffunction name="testHasPreviousOnNonFirst" access="public" returntype="void" output="false">
		<cfset var paginator = createObject('component', 'cf-compendium.inc.resource.utility.paginate').init(100, 25, 2) />
		
		<cfset assertEquals(true, paginator.hasPrevious()) />
	</cffunction>
	
	<!---
		Tests the hasNext function
	--->
	<cffunction name="testHasNextOnLast" access="public" returntype="void" output="false">
		<cfset var paginator = createObject('component', 'cf-compendium.inc.resource.utility.paginate').init(100, 25, 4) />
		
		<cfset assertEquals(false, paginator.hasNext()) />
	</cffunction>
	
	<!---
		Tests the hasNext function
	--->
	<cffunction name="testHasNextOnNonLast" access="public" returntype="void" output="false">
		<cfset var paginator = createObject('component', 'cf-compendium.inc.resource.utility.paginate').init(100, 25, 2) />
		
		<cfset assertEquals(true, paginator.hasNext()) />
	</cffunction>
</cfcomponent>