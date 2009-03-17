<!--- 
	Used to create options for passing between objects.
--->
<cfcomponent displayname="Options" extends="cf-compendium.inc.resource.base.object" output="false">
	<cffunction name="init" access="public" returntype="any" output="false">
		<!--- Call the parent constructor --->
		<cfset super.init() />
		
		<cfset variables.options = structNew() />
		
		<cfreturn this />
	</cffunction>
	
	<!--- 
		Accepts one struct for extending the current options with default values.
	--->
	<cffunction name="extend" access="public" returntype="void" output="false">
		<cfargument name="defaults" type="struct" required="true" />
		
		<cfset variables.options = super.extend(arguments.defaults, variables.options) />
	</cffunction>
	
	<!--- 
		Returns a duplicate struct of options
	--->
	<cffunction name="getOptions" access="public" returntype="struct" output="false">
		<cfreturn duplicate(variables.options) />
	</cffunction>
	
	<!--- 
		Adds/Sets the option to the variables
	--->
	<cffunction name="setOption" access="public" returntype="void" output="false">
		<cfargument name="name" type="string" required="true" />
		<cfargument name="value" type="any" required="true" />
		
		<cfset variables[arguments.name] = arguments.value />
	</cffunction>
</cfcomponent>