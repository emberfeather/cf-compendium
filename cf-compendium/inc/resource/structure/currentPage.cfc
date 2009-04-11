<cfcomponent extends="cf-compendium.inc.resource.base.object" output="false">
	<cffunction name="init" access="public" returnType="component" output="false">
		<cfargument name="options" type="struct" default="#structNew()#" />
		
		<cfset var defaults = {
				levels = []
			} />
		
		<cfset super.init() />
		
		<cfset properties(defaults, arguments.options) />
		
		<cfreturn this />
	</cffunction>
	
	<cffunction name="addLevel" access="public" returntype="void" output="false">
		<cfargument name="key" type="string" required="true" />
		<cfargument name="name" type="string" required="true" />
		<cfargument name="title" type="string" required="true" />
		<cfargument name="link" type="string" required="true" />
		
		<cfset var level = {} />
		
		<cfset level.key = arguments.key />
		<cfset level.name = arguments.name />
		<cfset level.title = arguments.title />
		<cfset level.link = arguments.link />
		
		<cfset this.addLevels(level) />
	</cffunction>
	
	<cffunction name="getPath" access="public" returntype="string" output="false">
		<cfargument name="basePath" type="string" required="true" />
		<cfargument name="prefix" type="string" required="true" />
		
		<cfset var filename = '' />
		<cfset var i = '' />
		<cfset var path = '' />
		
		<!--- Normalize the base path --->
		<cfif right(arguments.basePath, 1) NEQ '/'>
			<cfset arguments.basePath &= '/' />
		</cfif>
		
		<!--- Check if we are on the past the index --->
		<cfif arrayLen(variables.instance.levels) GT 1>
			<cfset path = 'index/' />
			
			<!--- Expand the path --->
			<cfloop from="1" to="#arrayLen(variables.instance.levels) - 2#" index="i">
				<cfset path &= variables.instance.levels[i].name & '/' />
			</cfloop>
			
			<!--- Set the filename --->
			<cfset filename = variables.instance.levels[arrayLen(variables.instance.levels) - 1].name />
			<cfset filename = arguments.prefix & ucase(left(filename, 1)) & lcase(right(filename, len(filename) - 1)) & '.cfm' />
		<cfelse>
			<cfset filename = arguments.prefix & 'Index.cfm' />
		</cfif>
		
		<cfreturn arguments.basePath & path & filename />
	</cffunction>
</cfcomponent>