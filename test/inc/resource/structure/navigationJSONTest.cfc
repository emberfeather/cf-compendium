<cfcomponent extends="mxunit.framework.TestCase" output="false">
	<cffunction name="testInit" access="public" returntype="void" output="false">
		<cfset var navigation = createObject('component', 'cf-compendium.inc.resource.structure.navigationJSON').init('/implementation/config/navigation001.json.cfm') />
		<cfset var parsedNav = '' />
		
		<cfset parsedNav = navigation.getNavigation() />
		
		<cfset assertEquals('Admin', parsedNav.section.admin.title) />
		<cfset assertEquals('Error tracking and details.', parsedNav.section.admin.subsection.errors.desc) />
	</cffunction>
	
	<cffunction name="testMaskExpansion" access="public" returntype="void" output="false">
		<cfset var navigation = createObject('component', 'cf-compendium.inc.resource.structure.navigationJSON').init('/implementation/config/navigation001.json.cfm') />
		<cfset var parsedNav = '' />
		
		<cfset navigation.applyMask('/implementation/config/mask002.json.cfm') />
		
		<cfset parsedNav = navigation.getNavigation() />
		
		<cfset assertEquals('Support', parsedNav.section.support.title) />
	</cffunction>
	
	<cffunction name="testMaskOverwrite" access="public" returntype="void" output="false">
		<cfset var navigation = createObject('component', 'cf-compendium.inc.resource.structure.navigationJSON').init('/implementation/config/navigation001.json.cfm') />
		<cfset var parsedNav = '' />
		
		<cfset navigation.applyMask('/implementation/config/mask001.json.cfm') />
		
		<cfset parsedNav = navigation.getNavigation() />
		
		<cfset assertEquals('Service', parsedNav.section.admin.subsection.errors.deny) />
	</cffunction>
</cfcomponent>