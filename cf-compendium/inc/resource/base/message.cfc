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
		Resets the messages.
	--->
	<cffunction name="reset" access="public" returntype="void" output="false">
		<cfset variables.instance.messages = arrayNew(1) />
	</cffunction>
</cfcomponent>