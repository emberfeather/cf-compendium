<cfcomponent output="false">
	<cffunction name="init" access="public" returnType="component" output="false">
		<cfargument name="i18n" type="component" required="true" />
		<cfargument name="theUrl" type="component" required="true" />
		
		<cfset variables.i18n = arguments.i18n />
		<cfset variables.theUrl = arguments.theUrl />
		
		<cfreturn this />
	</cffunction>
</cfcomponent>