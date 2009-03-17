<cfcomponent extends="cf-compendium.inc.resource.base.object" displayname="Base Message" output="false">
	<cffunction name="init" access="public" returntype="any" output="false">
		<cfargument name="i18n" type="component" required="true" />
		<cfargument name="locale" type="string" default="en_US" />
		
		<cfset var defaults = {
				messages = []
			} />
		
		<cfset super.init(arguments.i18n, arguments.locale) />
		
		<cfset properties(defaults) />
		
		<cfreturn this />
	</cffunction>
	
	<!---
		Resets the messages then adds the new messages.
	--->
	<cffunction name="setMessages" access="public" returntype="void" output="false">
		<cfset this.resetMessages() />
		
		<cfset this.addMessages(argumentCollection = arguments) />
	</cffunction>
</cfcomponent>