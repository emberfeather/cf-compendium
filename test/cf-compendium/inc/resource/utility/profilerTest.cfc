<!---
	Test for the functionality associated with the profiler.
	<p>
	These tests help to keep the accuracy of our code profiling.
--->
<cfcomponent extends="mxunit.framework.TestCase" output="false">
	<!---
		Tests what happens when you get a ticker that has not been started.
	--->
	<cffunction name="testGetSansStart" access="public" returntype="void" output="false">
		<cfset var theProfiler = createObject('component', 'cf-compendium.inc.resource.utility.profiler').init(true) />
		
		<cftry>
			<cfset theProfiler.getTicker('someTicker') />
			
			<cfset fail('Should not be able to get a ticker that has not stopped.') />
			
			<cfcatch type="mxunit.exception.AssertionFailedError">
				<cfrethrow />
			</cfcatch>
			<cfcatch type="any">
				<!--- Expect to get here --->
			</cfcatch>
		</cftry>
	</cffunction>
	
	<!---
		Tests what happens when you stop a ticker that was never started
	--->
	<cffunction name="testStopSansStart" access="public" returntype="void" output="false">
		<cfset var theProfiler = createObject('component', 'cf-compendium.inc.resource.utility.profiler').init(true) />
		
		<cftry>
			<cfset theProfiler.stop('someTicker') />
			
			<cfset fail('Should not be able to stop a ticker you never started.') />
			
			<cfcatch type="mxunit.exception.AssertionFailedError">
				<cfrethrow />
			</cfcatch>
			<cfcatch type="any">
				<!--- Expect to get here --->
			</cfcatch>
		</cftry>
	</cffunction>
	
	<!---
		Tests what happens when you stop a ticker that has already stopped
	--->
	<cffunction name="testStopExisting" access="public" returntype="void" output="false">
		<cfset var theProfiler = createObject('component', 'cf-compendium.inc.resource.utility.profiler').init(true) />
		
		<cftry>
			<cfset theProfiler.start('someTicker') />
			<cfset theProfiler.stop('someTicker') />
			<cfset theProfiler.stop('someTicker') />
			
			<cfset fail('Should not be able to stop a ticker you already stopped.') />
			
			<cfcatch type="mxunit.exception.AssertionFailedError">
				<cfrethrow />
			</cfcatch>
			<cfcatch type="any">
				<!--- Expect to get here --->
			</cfcatch>
		</cftry>
	</cffunction>
</cfcomponent>