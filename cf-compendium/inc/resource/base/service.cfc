<cfcomponent output="false">
	<cffunction name="init" access="public" returnType="component" output="false">
		<cfargument name="theDatasource" type="component" required="true" />
		
		<cfset variables.theDatasource = arguments.theDatasource />
		
		<cfreturn this />
	</cffunction>
</cfcomponent>