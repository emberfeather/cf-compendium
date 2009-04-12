<cfcomponent extends="cf-compendium.inc.resource.base.object" output="false">
	<cffunction name="init" access="public" returnType="component" output="false">
		<cfargument name="options" type="struct" default="#structNew()#" />
		
		<cfset var defaults = {
				attributes = {}
			} />
		
		<cfset super.init() />
		
		<cfset properties(defaults, arguments.options) />
		
		<cfreturn this />
	</cffunction>
	
	<cffunction name="toHTML" access="public" returntype="string" output="false">
		<cfargument name="data" type="any" required="true" />
		
		<cfreturn 'Cood data grid goes here...' />
	</cffunction>
</cfcomponent>