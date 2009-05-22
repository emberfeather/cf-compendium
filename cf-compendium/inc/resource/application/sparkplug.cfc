<cfcomponent extends="cf-compendium.inc.resource.base.object" output="false">
	<cffunction name="startApplication" access="public" returntype="struct" output="false">
		<cfargument name="appConfigFile" type="string" required="true" />
		
		<cfset var newApplication = '' />
		
		<!--- TODO Read in application configuration --->
		
		<!--- TODO Read in all plugins --->
		
		<!--- TODO Determine plugin precedence --->
		
		<!--- TODO Check for missing plugin prerequisites --->
		
		<!--- TODO Install/Upgrade plugins --->
		
		<!--- TODO Create all singletons --->
		
		<!--- TODO Apply Navigation Masks --->
		
		<cfreturn newApplication />
	</cffunction>
</cfcomponent>