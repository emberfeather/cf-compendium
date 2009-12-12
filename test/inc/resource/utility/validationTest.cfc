<cfcomponent extends="mxunit.framework.TestCase" output="false">
	<cffunction name="setup" access="public" returntype="void" output="false">
		<cfset variables.i18n = createObject('component', 'cf-compendium.inc.resource.i18n.i18n').init(expandPath('/')) />
	</cffunction>
	
	<cffunction name="testIn_Invalid" access="public" returntype="void" output="false">
		<cfset var validator = variables.i18n.getValidation('en_US') />
		
		<cftry>
			<cfset validator.in('testing', 'val', 'is,it,in,here') />
			
			<cfset fail("Set should have thrown an error. ['val' is not in 'is,it,in,here']")>
			
			<cfcatch type="mxunit.exception.AssertionFailedError">
				<cfrethrow />
			</cfcatch>
			
			<cfcatch type="any">
				<!--- expect to get here --->
			</cfcatch>
		</cftry>
	</cffunction>
	
	<cffunction name="testIn_Valid" access="public" returntype="void" output="false">
		<cfset var validator = variables.i18n.getValidation('en_US') />
		
		<cftry>
			<cfset validator.in('testing', 'is', 'is,it,in,here') />
			
			<cfcatch type="any">
				<cfset fail("Set should not have thrown an error. ['val' is in 'val,is,in,here']")>
			</cfcatch>
		</cftry>
	</cffunction>
	
	<cffunction name="testNotIn_Invalid" access="public" returntype="void" output="false">
		<cfset var validator = variables.i18n.getValidation('en_US') />
		
		<cftry>
			<cfset validator.notIn('testing', 'val', 'val,is,in,here') />
			
			<cfset fail("Set should have thrown an error. ['val' is in 'val,is,in,here']")>
			
			<cfcatch type="mxunit.exception.AssertionFailedError">
				<cfrethrow />
			</cfcatch>
			
			<cfcatch type="any">
				<!--- expect to get here --->
			</cfcatch>
		</cftry>
	</cffunction>
	
	<cffunction name="testNotIn_Valid" access="public" returntype="void" output="false">
		<cfset var validator = variables.i18n.getValidation('en_US') />
		
		<cftry>
			<cfset validator.notIn('testing', 'waldo', 'val,is,in,here') />
			
			<cfcatch type="any">
				<cfset fail("Set should not have thrown an error. ['waldo' is not in 'val,is,in,here']")>
			</cfcatch>
		</cftry>
	</cffunction>
</cfcomponent>