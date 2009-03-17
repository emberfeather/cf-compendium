<!---
	Acts as the base for all objects to be based upon.
--->
<cfcomponent output="false">
	<!---
		The basic init function 
	--->
	<cffunction name="init" access="public" returntype="component" output="false">
		<cfreturn this />
	</cffunction>
	
	<!---
		If the extend object has not been created creates it and uses it.
	--->
	<cffunction name="extend" access="public" returntype="struct" output="false">
		<cfargument name="defaults" type="struct" required="true" />
		<cfargument name="original" type="struct" default="#structNew()#" />
		
		<cfif NOT structKeyExists(variables, 'extender')>
			<cfset variables.extender = createObject('component', 'cf-compendium.inc.resource.utility.extend').init() />
		</cfif>
		
		<cfreturn variables.extender.extend( argumentCollection = arguments ) />
	</cffunction>
</cfcomponent>