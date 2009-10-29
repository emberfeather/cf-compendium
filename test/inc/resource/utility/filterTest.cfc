<cfcomponent extends="mxunit.framework.TestCase" output="false">
	<cffunction name="setup" access="public" returntype="void" output="false">
		<cfset variables.i18n = createObject('component', 'cf-compendium.inc.resource.i18n.i18n').init(expandPath('/i18n/')) />
	</cffunction>
	
	<!---
		Test the addBreak with valid arguments
	--->
	<cffunction name="testAddBreak" access="public" returntype="void" output="false">
		<cfset var filter = createObject('component', 'cf-compendium.inc.resource.utility.filter').init(variables.i18n) />
		
		<cfset filter.addBreak() />
	</cffunction>
	
	<!---
		Test the addFilter with complete arguments
	--->
	<cffunction name="testAddFilter" access="public" returntype="void" output="false">
		<cfset var filter = createObject('component', 'cf-compendium.inc.resource.utility.filter').init(variables.i18n) />
		<cfset var options = createObject('component', 'cf-compendium.inc.resource.utility.options').init() />
		
		<cfset filter.addFilter('test1', options) />
	</cffunction>
	
	<!---
		Test the addFilter with a blank key
	--->
	<cffunction name="testAddFilterSansKey" access="public" returntype="void" output="false">
		<cfset var filter = createObject('component', 'cf-compendium.inc.resource.utility.filter').init(variables.i18n) />
		
		<cftry>
			<cfset filter.addFilter('') />
			
			<cfset fail('Should not be able to add a filter without a key.') />
			
			<cfcatch type="mxunit.exception.AssertionFailedError">
				<cfrethrow />
			</cfcatch>
			
			<cfcatch type="any">
				<!--- expect to get here --->
			</cfcatch>
		</cftry>
	</cffunction>
	
	<!---
		Test the addFilter without options
	--->
	<cffunction name="testAddFilterSansOptions" access="public" returntype="void" output="false">
		<cfset var filter = createObject('component', 'cf-compendium.inc.resource.utility.filter').init(variables.i18n) />
		
		<cfset filter.addFilter('test1') />
	</cffunction>
	
	<!---
		Test the length
	--->
	<cffunction name="testLength" access="public" returntype="void" output="false">
		<cfset var filter = createObject('component', 'cf-compendium.inc.resource.utility.filter').init(variables.i18n) />
		
		<cfset filter.addFilter('test1') />
		<cfset filter.addFilter('test2') />
		<cfset filter.addFilter('test3') />
		
		<cfset assertEquals(3, filter.length()) />
	</cffunction>
	
	<!---
		Test calling the to HTML with valid filters. Just to make sure it runs.
	--->
	<cffunction name="testToHTML" access="public" returntype="void" output="false">
		<cfset var filter = createObject('component', 'cf-compendium.inc.resource.utility.filter').init(variables.i18n) />
		<cfset var theURL = createObject('component', 'cf-compendium.inc.resource.utility.url').init('') />
		
		<cfset filter.addFilter('test1') />
		
		<!--- Should be able to generate HTML --->
		<cfset filter.toHTML(theURL) />
	</cffunction>
	
	<!---
		Test calling the to HTML without adding any filters
	--->
	<cffunction name="testToHTMLSansItems" access="public" returntype="void" output="false">
		<cfset var filter = createObject('component', 'cf-compendium.inc.resource.utility.filter').init(variables.i18n) />
		<cfset var theURL = createObject('component', 'cf-compendium.inc.resource.utility.url').init('') />
		
		<cftry>
			<cfset filter.toHTML(theURL) />
			
			<cfset fail('Should not be able to generate HTML if the filter has no items.') />
			
			<cfcatch type="mxunit.exception.AssertionFailedError">
				<cfrethrow />
			</cfcatch>
			
			<cfcatch type="any">
				<!--- expect to get here --->
			</cfcatch>
		</cftry>
	</cffunction>
</cfcomponent>