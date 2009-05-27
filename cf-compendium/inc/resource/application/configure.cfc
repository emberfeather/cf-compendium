<cfcomponent extends="cf-compendium.inc.resource.base.object" output="false">
	<cffunction name="configure" access="public" returntype="void" output="false">
		<cfargument name="newApplication" type="struct" required="true" />
		
		<!--- Base does nothing --->
	</cffunction>
	
	<cffunction name="update" access="public" returntype="void" output="false">
		<cfargument name="plugin" type="struct" required="true" />
		<cfargument name="version" type="struct" default="#structNew()#" />
		
		<!--- Base does nothing --->
	</cffunction>
</cfcomponent>