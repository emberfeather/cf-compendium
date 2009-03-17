<cfcomponent extends="cf-compendium.inc.resource.base.object" output="false">
	<cffunction name="init" access="public" returntype="component" output="false">
		<cfargument name="i18n" type="component" required="true" />
		<cfargument name="locale" type="string" default="en_US" />
		
		<cfset var attr = '' />
		
		<cfset super.init(arguments.i18n, arguments.locale) />
		
		<!--- First Name --->
		<cfset attr = {
				attribute = 'firstName',
				title = 'First Name',
				validation = {
					minLength = 1
				}
			} />
		
		<cfset addAttribute(argumentCollection = attr) />
		
		<cfreturn this />
	</cffunction>
</cfcomponent>