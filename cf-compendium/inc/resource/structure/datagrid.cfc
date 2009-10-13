<cfcomponent extends="cf-compendium.inc.resource.base.object" output="false">
	<cffunction name="init" access="public" returnType="component" output="false">
		<cfargument name="options" type="struct" default="#{}#" />
		
		<cfset super.init() />
		
		<cfset variables.columns = {} />
		<cfset variables.columnList = "" />
		
		<cfreturn this />
	</cffunction>
	
	<cffunction name="addColumn" access="public" returntype="void" output="false">
		<cfargument name="columnName" type="string" required="true" />
		<cfargument name="options" type="struct" default="#{}#" />
		
		<cfset var defaults = {
				label = arguments.columnName,
				class = ''
			} />
		
		<cfset arguments.options = extend(defaults, arguments.options) />
		
		<cfif arguments.columnName EQ "">
			<cfthrow message="Invalid value for columnName" detail="columnName cannot be an empty string.">
		</cfif>
		
		<cfset variables.columnList = listAppend(variables.columnList, arguments.columnName) />
		<cfset variables.columns[arguments.columnName] = arguments.options />
	</cffunction>
	
	<cffunction name="getColumnList" access="public" returntype="string" output="false">
		<cfreturn variables.columnList />
	</cffunction>
	
	<cffunction name="toHTML" access="public" returntype="string" output="false">
		<cfargument name="data" type="any" required="true" />
		<cfargument name="options" type="struct" default="#{}#" />
		
		<cfset var html = '' />
		
		<cfsavecontent variable="html">
			<cfdump var="#arguments.data#" />
		</cfsavecontent>
		
		<cfreturn html />
	</cffunction>
</cfcomponent>