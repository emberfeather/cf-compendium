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
				label = '',
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
		
		<cfset var col = '' />
		<cfset var counter = '' />
		<cfset var defaults = {
				class = ''
			} />
		<cfset var html = '' />
		<cfset var item = '' />
		<cfset var result = '' />
		
		<cfset arguments.options = extend(defaults, arguments.options) />
		
		<cfset html = '<table class="datagrid #arguments.options.class#">' />
		
		<cfset html &= '<thead>'>
		
		<cfset html &= '<tr>'>
		
		<cfset counter = 0 />
		
		<cfloop list="#variables.columnList#" index="col">
			<cfset html &= '<th class="col ' & col & ' ' & variables.columns[col].class & ' column-' & counter++ & '">' & variables.columns[col].label & '</th>' />
		</cfloop>
		
		<cfset html &= '</tr>'>
		
		<cfset html &= '</thead>'>
		
		<cfset html &= '<tbody>'>
		
		<cfif isArray(arguments.data)>
			<cfloop array="#arguments.data#" index="item">
				<cfset html &= '<tr>'>
				
				<cfif isStruct(item)>
					<cfset counter = 0 />
					
					<cfloop list="#variables.columnList#" index="col">
						<cfset html &= '<td class="col ' & col & ' ' & variables.columns[col].class & ' column-' & counter++ & '">' & item[col] & '</td>' />
					</cfloop>
				<cfelseif isObject(item)>
					<cfset counter = 0 />
					
					<cfloop list="#variables.columnList#" index="col">
						<cfinvoke component="#item#" method="get#col#" returnvariable="result" />
						
						<cfset html &= '<td class="col ' & col & ' ' & variables.columns[col].class & ' column-' & counter++ & '">' & result & '</td>' />
					</cfloop>
				<cfelseif isSimpleValue(item)>
					<cfset html &= '<td class="col ' & col & ' ' & variables.columns[col].class & ' column-' & counter++ & '">' & item & '</td>' />
				<cfelse>
					<cfthrow message="The data type passed in is not suported." detail="The type of the data in the array is not of type struct, object or simpleValue.">
				</cfif>
				
				<cfset html &= '</tr>'>
			</cfloop>
		<cfelseif isQuery(arguments.data)>
			<cfloop query="arguments.data">
				<cfset html &= '<tr>'>
				
				<cfset counter = 0 />
				
				<cfloop list="#variables.columnList#" index="col">
					<cfset html &= '<td class="col ' & col & ' ' & variables.columns[col].class & ' column-' & counter++ & '">' & arguments.data[col] & '</td>' />
				</cfloop>
				
				<cfset html &= '</tr>'>
			</cfloop>
		<cfelse>
			<cfthrow message="The data type passed in is not suported." detail="The type of the data passed in is not of type query or array.">
		</cfif>
		
		<cfset html &= '</tbody>'>
		
		<cfset html &= '</table>'>
		
		<cfreturn html />
	</cffunction>
</cfcomponent>