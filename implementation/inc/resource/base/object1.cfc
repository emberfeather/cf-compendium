<cfcomponent extends="cf-compendium.inc.resource.base.object" output="false">
	<cffunction name="init" access="public" returntype="component" output="false">
		<cfset var defaults = {
				test = 'value',
				foo = 'bar',
				bubble = [ 'gum' ],
				foobar = {
					barfoo = 'raboof'
				}
			} />
		
		<cfset super.init() />
		
		<cfset set__properties(defaults) />
		
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