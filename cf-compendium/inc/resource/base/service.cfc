<cfcomponent output="false">
	<cffunction name="init" access="public" returnType="component" output="false">
		<cfargument name="datasource" type="component" required="true" />
		
		<cfset variables.datasource = arguments.datasource />
		
		<cfreturn this />
	</cffunction>
</cfcomponent>