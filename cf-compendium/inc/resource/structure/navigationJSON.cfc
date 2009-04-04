<cfcomponent implements="cf-compendium.inc.resource.structure.iNavigation" output="false">
	<cffunction name="init" access="public" returntype="component" output="false">
		<cfreturn this />
	</cffunction>
	
	<!---
		Finds the current page information from the url.
	--->
	<cffunction name="getCurrentPage" access="public" returntype="component" output="false">
		<cfargument name="url" type="component" required="true" />
		
		<cfset var currentPage = createObject('component', 'cf-compendium.inc.resource.structure.currentPage').init() />
		
		<cfreturn currentPage />
	</cffunction>
</cfcomponent>