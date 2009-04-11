<cfcomponent extends="cf-compendium.inc.resource.base.object" displayname="Base Message" output="false">
	<cffunction name="init" access="public" returntype="any" output="false">
		<cfset var defaults = {
				messages = []
			} />
		
		<cfset super.init() />
		
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