<!---
	Acts as the base for all objects to be based upon.
--->
<cfcomponent output="false">
	<!---
		The basic init function 
	--->
	<cffunction name="init" access="public" returntype="component" output="false">
		<cfreturn this />
	</cffunction>
	
	<!---
		If the extend object has not been created creates it and uses it.
	--->
	<cffunction name="extend" access="private" returntype="struct" output="false">
		<cfargument name="defaults" type="struct" required="true" />
		<cfargument name="original" type="struct" default="#{}#" />
		<cfargument name="depth" type="numeric" default="1" />
		
		<cfif not structKeyExists(variables, 'extender')>
			<cfset variables.extender = createObject('component', 'cf-compendium.inc.resource.utility.extend').init() />
		</cfif>
		
		<cfreturn variables.extender.extend( argumentCollection = arguments ) />
	</cffunction>
	
	<cffunction name="throw" access="public" returntype="void" output="false">
		<cfargument name="message" type="string" required="true" />
		<cfargument name="type" type="string" default="Application" />
		<cfargument name="detail" type="string" default="" />
		<cfargument name="errorCode" type="string" default="" />
		<cfargument name="extendedInfo" type="string" default="" />
		
		<cfthrow message="#arguments.message#" detail="#arguments.detail#" type="#arguments.type#" errorcode="#arguments.errorCode#" extendedinfo="#arguments.extendedInfo#" />
	</cffunction>
	
	<cffunction name="dump" access="public" returntype="void" output="false">
		<cfargument name="value" type="any" required="true" />
		
		<cfdump var="#arguments.value#" />
	</cffunction>
	
	<cffunction name="abort" access="public" returntype="void" output="false">
		<cfabort />
	</cffunction>
</cfcomponent>