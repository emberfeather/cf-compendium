<cfcomponent extends="cf-compendium.inc.resource.base.navigationFile" implements="cf-compendium.inc.resource.structure.iNavigation" output="false">
	<cffunction name="init" access="public" returntype="component" output="false">
		<cfargument name="navigationFile" type="string" required="true" />
		
		<cfset var fileContents = '' />
		<cfset var parsedNav = '' />
		
		<cfset super.init() />
		
		<!--- Read in the navigation file --->
		<cfset fileContents = readFile(arguments.navigationFile) />
		
		<!--- Parse the file contents --->
		<cfset parsedNav = deserializeJSON(fileContents) />
		
		<cfset variables.navigation = expandNavigation(parsedNav) />
		
		<cfreturn this />
	</cffunction>
	
	<cffunction name="applyMask" access="public" returntype="void" output="false">
		<cfargument name="maskFile" type="string" required="true" />
		
		<cfset var fileContents = '' />
		<cfset var parsedMask = '' />
		
		<!--- Read in the mask file --->
		<cfset fileContents = readFile(arguments.maskFile) />
		
		<!--- Parse the file contents --->
		<cfset parsedMask = deserializeJSON(fileContents) />
		
		<cfset variables.navigation = maskNavigation(variables.navigation, parsedMask) />
	</cffunction>
	
	<cffunction name="getNavigation" access="public" returntype="struct" output="false">
		<cfreturn variables.navigation />
	</cffunction>
	
	<!---
		Finds the current page information from the url in the form of a template.
	--->
	<cffunction name="getTemplate" access="public" returntype="component" output="false">
		<cfargument name="url" type="component" required="true" />
		<cfargument name="locale" type="string" default="en_US" />
		
		<cfset var template = createObject('component', 'cf-compendium.inc.resource.structure.template').init(variables.i18n, arguments.locale) />
		
		
		
		<cfreturn template />
	</cffunction>
</cfcomponent>