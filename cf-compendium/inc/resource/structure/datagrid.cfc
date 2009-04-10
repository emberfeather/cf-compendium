<cfcomponent extends="cf-compendium.inc.resource.base.object" output="false">
	<cffunction name="init" access="public" returnType="component" output="false">
		<cfargument name="i18n" type="component" required="true" />
		<cfargument name="locale" type="string" default="en_US" />
		<cfargument name="options" type="struct" default="#structNew()#" />
		
		<cfset var defaults = {
				attributes = {}
			} />
		
		<cfset super.init(arguments.i18n, arguments.locale) />
		
		<cfset properties(defaults, arguments.options) />
		
		<cfreturn this />
	</cffunction>
	
	<cffunction name="toHTML" access="public" returntype="string" output="false">
		<cfreturn 'Cood data grid goes here...' />
	</cffunction>
</cfcomponent>