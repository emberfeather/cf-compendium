<cfcomponent extends="mxunit.framework.TestCase" output="false">
	<cffunction name="testGet" access="public" returntype="void" output="false">
		<cfset var theBookmark = createObject('component', 'cf-compendium.inc.resource.utility.bookmark').init() />
		
		<cfset theBookmark.set('testAction', 1) />
		
		<cfset assertEquals(theBookmark.get('testAction'), 1, 'Get Function returned incorrect value.') />
	</cffunction>
	
	<cffunction name="testGetInitialize" access="public" returntype="void" output="false">
		<cfset var theBookmark = createObject('component', 'cf-compendium.inc.resource.utility.bookmark').init() />
		
		<cfset assertEquals(theBookmark.get('testAction'), 1, 'Get Function returned incorrect value.') />
	</cffunction>
	
	<cffunction name="testSet" access="public" returntype="void" output="false">
		<cfset var theBookmark = createObject('component', 'cf-compendium.inc.resource.utility.bookmark').init() />
		
		<cfset theBookmark.set('testAction', 4) />
		
		<cfset assertEquals(theBookmark.get('testAction'), 4, 'Set Function set an incorrect value.') />
	</cffunction>
	
	<cffunction name="testSetNegative" access="public" returntype="void" output="false">
		<cfset var theBookmark = createObject('component', 'cf-compendium.inc.resource.utility.bookmark').init() />
		
		<cftry>
			<cfset theBookmark.set('testAction', -1) />
			
			<cfset fail("Set should have thrown an error. [negative value]")>
			
			<cfcatch type="mxunit.exception.AssertionFailedError">
				<cfrethrow />
			</cfcatch>
			
			<cfcatch type="any">
				<!--- expect to get here --->
			</cfcatch>
		</cftry>
	</cffunction>
	
	<cffunction name="testSetLarge" access="public" returntype="void" output="false">
		<cfset var theBookmark = createObject('component', 'cf-compendium.inc.resource.utility.bookmark').init() />
		
		<cftry>
			<cfset theBookmark.set('testAction', 100) />
			
			<cfset fail("Set should have thrown an error. [value is too big]")>
			
			<cfcatch type="mxunit.exception.AssertionFailedError">
				<cfrethrow />
			</cfcatch>
			
			<cfcatch type="any">
				<!--- expect to get here --->
			</cfcatch>
		</cftry>
	</cffunction>
	
	<cffunction name="testNext" access="public" returntype="void" output="false">
		<cfset var theBookmark = createObject('component', 'cf-compendium.inc.resource.utility.bookmark').init() />
		
		<cfset theBookmark.set('testAction', 3) />
		<cfset theBookmark.next('testAction') />
		
		<cfset assertEquals(theBookmark.get('testAction'), 4, 'Next Function returned an incorrect value.') />
	</cffunction>
	
	<cffunction name="testPrev" access="public" returntype="void" output="false">
		<cfset var theBookmark = createObject('component', 'cf-compendium.inc.resource.utility.bookmark').init() />
		
		<cfset theBookmark.set('testAction', 3) />
		<cfset theBookmark.prev('testAction') />
		
		<cfset assertEquals(theBookmark.get('testAction'), 2, 'Prev Function returned an incorrect value.') />
	</cffunction>
	
	<cffunction name="testReset" access="public" returntype="void" output="false">
		<cfset var theBookmark = createObject('component', 'cf-compendium.inc.resource.utility.bookmark').init() />
		
		<cfset theBookmark.set('testAction', 4) />
		<cfset theBookmark.reset('testAction') />
		
		<cfset assertEquals(theBookmark.get('testAction'), 1, 'Prev Function returned an incorrect value.') />
	</cffunction>
</cfcomponent>