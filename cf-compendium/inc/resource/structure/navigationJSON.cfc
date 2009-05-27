<cfcomponent extends="cf-compendium.inc.resource.base.navigationFile" output="false">
	<cffunction name="init" access="public" returntype="component" output="false">
		<cfargument name="navigationFile" type="string" default="" />
		
		<cfset var baseNav = {} />
		
		<cfset super.init() />
		
		<cfset variables.navigation = expandNavigation(baseNav) />
		
		<!--- Add the navigation as a mask if provided --->
		<cfif arguments.navigationFile NEQ ''>
			<cfset applyMask(arguments.navigationFile) />
		</cfif>
		
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