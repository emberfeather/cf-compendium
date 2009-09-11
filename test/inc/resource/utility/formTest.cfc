<cfcomponent extends="mxunit.framework.TestCase" output="false">
	<!---
		Tests to ensure that the form throws an error if requested without an action.
	--->
	<cffunction name="testShowFormSansAction" access="public" returntype="void" output="false">
		<cfset var theForm = createObject('component', 'cf-compendium.inc.resource.utility.formStandard').init('test') />
		
		<!--- Hidden --->
		<cfset theForm.addElement('hidden', {
				name = "testHidden",
				label = "Hidden",
				value = "true"
			}) />
		
		<cftry>
			<cfset theForm.toHTML() />
			
			<cfset fail("toHTML should have thrown an error. [no action given]")>
			
			<cfcatch type="mxunit.exception.AssertionFailedError">
				<cfrethrow />
			</cfcatch>
			
			<cfcatch type="any">
				<!--- expect to get here --->
			</cfcatch>
		</cftry>
	</cffunction>
	
	<!---
		Tests to ensure that the form throws an error if requested without any elements added.
	--->
	<cffunction name="testShowFormSansElement" access="public" returntype="void" output="false">
		<cfset var theForm = createObject('component', 'cf-compendium.inc.resource.utility.formStandard').init('test') />
		
		<cftry>
			<cfset theForm.toHTML('/') />
			
			<cfset fail("toHTML should have thrown an error. [no elements to show]")>
			
			<cfcatch type="mxunit.exception.AssertionFailedError">
				<cfrethrow />
			</cfcatch>
			
			<cfcatch type="any">
				<!--- expect to get here --->
			</cfcatch>
		</cftry>
	</cffunction>
</cfcomponent>