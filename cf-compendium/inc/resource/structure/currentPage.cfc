<cfcomponent extends="cf-compendium.inc.resource.base.object" output="false">
	<cffunction name="init" access="public" returnType="component" output="false">
		<cfargument name="options" type="struct" default="#structNew()#" />
		
		<cfset var defaults = {
				levels = [],
				path = {}
			} />
		
		<cfset super.init() />
		
		<cfset properties(defaults, arguments.options) />
		
		<cfreturn this />
	</cffunction>
	
	<cffunction name="addLevel" access="public" returntype="void" output="false">
		<cfargument name="title" type="string" required="true" />
		<cfargument name="link" type="string" required="true" />
		
		<cfset var level = {} />
		
		<cfset level.title = arguments.title />
		<cfset level.link = arguments.link />
		
		<cfset this.addLevels(level) />
	</cffunction>
</cfcomponent>