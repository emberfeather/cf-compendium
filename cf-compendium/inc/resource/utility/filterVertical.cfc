<cfcomponent extends="cf-compendium.inc.resource.utility.filter" output="false">
	<cffunction name="filterItem" access="private" returntype="string" output="false">
		<cfargument name="values" type="struct" required="true" />
		<cfargument name="filter" type="struct" required="true" />
		
		<cfreturn '<div>' & super.filterItem( argumentCollection = arguments ) & '</div>' />
	</cffunction>
</cfcomponent>
