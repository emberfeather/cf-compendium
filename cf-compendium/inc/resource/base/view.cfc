<cfcomponent output="false">
	<cffunction name="init" access="public" returnType="component" output="false">
		<cfargument name="theUrl" type="component" required="true" />
		
		<cfset variables.theUrl = arguments.theUrl />
		
		<cfreturn this />
	</cffunction>
</cfcomponent>