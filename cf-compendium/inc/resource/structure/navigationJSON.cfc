<cfcomponent extends="cf-compendium.inc.resource.base.navigationFile" output="false">
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
</cfcomponent>