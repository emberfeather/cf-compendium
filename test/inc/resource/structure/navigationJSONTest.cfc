<cfcomponent extends="mxunit.framework.TestCase" output="false">
	<cffunction name="testInit" access="public" returntype="void" output="false">
		<cfset var navigation = createObject('component', 'cf-compendium.inc.resource.structure.navigationJSON').init('/implementation/config/navigation001.json.cfm') />
		<cfset var parsedNav = '' />
		
		<cfset parsedNav = navigation.getNavigation() />
		
		<cfset assertEquals('Admin', parsedNav.section.admin.title) />
		<cfset assertEquals('Error tracking and details.', parsedNav.section.admin.subsection.errors.desc) />
	</cffunction>
	
	<!---
		Tests masks that expand to ensure the extra information was added.
	--->
	<cffunction name="testMaskExpansion" access="public" returntype="void" output="false">
		<cfset var navigation = createObject('component', 'cf-compendium.inc.resource.structure.navigationJSON').init('/implementation/config/navigation001.json.cfm') />
		<cfset var parsedNav = '' />
		
		<cfset navigation.applyMask('/implementation/config/mask002.json.cfm') />
		
		<cfset parsedNav = navigation.getNavigation() />
		
		<!--- Test it adds the support --->
		<cfset assertEquals('Support', parsedNav.section.support.title) />
		
		<!--- Test that it add the trends --->
		<cfset assertEquals('Trends', parsedNav.section.admin.subsection.trends.title) />
	</cffunction>
	
	<!---
		Tests masks that expand to ensure they do not remove anything pre-existing
	--->
	<cffunction name="testMaskExpansionNoOverwrite" access="public" returntype="void" output="false">
		<cfset var navigation = createObject('component', 'cf-compendium.inc.resource.structure.navigationJSON').init('/implementation/config/navigation001.json.cfm') />
		<cfset var parsedNav = '' />
		
		<cfset navigation.applyMask('/implementation/config/mask002.json.cfm') />
		
		<cfset parsedNav = navigation.getNavigation() />
		
		<!--- Test that it keeps the admin intact --->
		<cfset assertEquals('Admin', parsedNav.section.admin.title) />
	</cffunction>
	
	<!---
		Tests masks that replace values to make sure they overwrite correctly
	--->
	<cffunction name="testMaskOverwrite" access="public" returntype="void" output="false">
		<cfset var navigation = createObject('component', 'cf-compendium.inc.resource.structure.navigationJSON').init('/implementation/config/navigation001.json.cfm') />
		<cfset var parsedNav = '' />
		
		<cfset navigation.applyMask('/implementation/config/mask001.json.cfm') />
		
		<cfset parsedNav = navigation.getNavigation() />
		
		<!--- Test that it replaces the deny --->
		<cfset assertEquals('Service', parsedNav.section.admin.subsection.errors.deny) />
	</cffunction>
	
	<!---
		Tests masks that replace to make sure they don't replace something they are not supposed to
	--->
	<cffunction name="testMaskOverwriteNoOverwrite" access="public" returntype="void" output="false">
		<cfset var navigation = createObject('component', 'cf-compendium.inc.resource.structure.navigationJSON').init('/implementation/config/navigation001.json.cfm') />
		<cfset var parsedNav = '' />
		
		<cfset navigation.applyMask('/implementation/config/mask001.json.cfm') />
		
		<cfset parsedNav = navigation.getNavigation() />
		
		<!--- Test that it keeps the title --->
		<cfset assertEquals('Errors', parsedNav.section.admin.subsection.errors.title) />
	</cffunction>
</cfcomponent>