<cfcomponent extends="cf-compendium.inc.resource.base.object" output="false">
	<cffunction name="init" access="public" returntype="component" output="false">
		<cfargument name="i18n" type="component" required="true" />
		<cfargument name="locale" type="string" default="en_US" />
		
		<cfset var defaults = {
				test = 'value',
				foo = 'bar',
				bubble = [ 'gum' ]
			} />
		
		<cfset super.init(arguments.i18n, arguments.locale) />
		
		<cfset properties(defaults) />
		
		<cfreturn this />
	</cffunction>
	
	<cffunction name="setName" access="public" returntype="void" output="false">
		<cfargument name="name" type="string" required="true" />
		
		<cfset variables.instance['name'] = arguments.name />
	</cffunction>
	
	<cffunction name="getName" access="public" returntype="string" output="false">
		<cfreturn variables.instance['name'] />
	</cffunction>
</cfcomponent>