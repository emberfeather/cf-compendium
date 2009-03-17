<cfcomponent extends="cf-compendium.inc.resource.base.object" output="false">
	<cffunction name="init" access="public" returnType="component" output="false">
		<cfset var defaults = {
				datasource = '',
				type = '',
				prefix = ''
			} />
		
		<cfset super.init() />
		
		<cfset properties(defaults) />
		
		<cfreturn this />
	</cffunction>
</cfcomponent>