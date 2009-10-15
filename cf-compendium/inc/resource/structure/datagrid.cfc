<cfcomponent extends="cf-compendium.inc.resource.base.object" output="false">
	<cffunction name="init" access="public" returnType="component" output="false">
		<cfargument name="theURL" type="component" required="true" />
		
		<cfset super.init() />
		
		<cfset variables.theURL = arguments.theURL />
		
		<cfset variables.columns = [] />
		
		<cfreturn this />
	</cffunction>
	
	<cffunction name="addColumn" access="public" returntype="void" output="false">
		<cfargument name="options" type="struct" default="#{}#" />
		
		<cfset var defaults = {
				key = '',
				keys = '',
				label = '&nbsp;',
				class = ''
			} />
		
		<cfset arrayAppend(variables.columns, extend(defaults, arguments.options)) />
	</cffunction>
	
	<cffunction name="calculateDerived" access="private" returntype="string" output="false">
		<cfargument name="derived" type="struct" required="true" />
		<cfargument name="type" type="string" required="true" />
		<cfargument name="keys" type="string" required="true" />
		<cfargument name="data" type="any" required="true" />
		<cfargument name="row" type="numeric" required="true" />
		
		<cfset var currentKey = '' />
		<cfset var key = '' />
		<cfset var result = '' />
		<cfset var safeKey = reReplace(arguments.keys, '[^a-zA-Z0-9]', '-', 'all') />
		
		<cfswitch expression="#arguments.type#">
			<cfcase value="currentRow">
				<cfreturn arguments.row />
			</cfcase>
			
			<cfcase value="sum">
				<cfset currentKey = 'sum-' & safeKey />
				
				<!--- Prime the variable --->
				<cfif NOT structKeyExists(arguments.derived, currentKey)>
					<cfset arguments.derived[currentKey] = 0 />
				</cfif>
				
				<cfif listLen(arguments.keys)>
					<cfloop list="#arguments.keys#" index="key">
						<cfif isQuery(data)>
							<cfset arguments.derived[currentKey] += data[key][row] />
						<cfelseif isObject(data[row])>
							<cfinvoke component="#data[row]#" method="get#key#" returnvariable="result" />
							
							<cfset arguments.derived[currentKey] += result />
						<cfelseif isStruct(data[row])>
							<cfset arguments.derived[currentKey] += data[row][key] />
						<cfelse>
							<cfthrow message="Multiple keys not valid" detail="Cannot do a running sum with multiple keys if it is not a struct or object" />
						</cfif>
					</cfloop>
				<cfelse>
					<cfset arguments.derived[currentKey] += data[row] />
				</cfif>
				
				<cfreturn arguments.derived[currentKey] />
			</cfcase>
		</cfswitch>
		
		<cfreturn '' />
	</cffunction>
	
	<cffunction name="toHTML" access="public" returntype="string" output="false">
		<cfargument name="data" type="any" required="true" />
		<cfargument name="options" type="struct" default="#{}#" />
		
		<cfset var aggregate = {} />
		<cfset var col = '' />
		<cfset var counter = '' />
		<cfset var currentKey = '' />
		<cfset var defaults = {
				class = '',
				startingRow = 1,
				minimumRows = 15
			} />
		<cfset var derived = {} />
		<cfset var html = '' />
		<cfset var htmlColumns = '' />
		<cfset var htmlAggregates = '' />
		<cfset var hasAggregate = false />
		<cfset var item = '' />
		<cfset var result = '' />
		<cfset var row = '' />
		<cfset var value = '' />
		
		<cfset arguments.options = extend(defaults, arguments.options) />
		
		<cfsavecontent variable="htmlColumns">
			<cfoutput>
				<tr>
					<cfset counter = 0 />
					
					<cfloop array="#variables.columns#" index="col">
						<th class="col #col.key# #col.class# column-#counter++#">
							#col.label#
						</th>
						
						<cfif structKeyExists(col, 'aggregate')>
							<cfset hasAggregate = true />
						</cfif>
					</cfloop>
				</tr>
			</cfoutput>
		</cfsavecontent>
		
		<!--- Only generate HTML for aggregates if it has any aggregates --->
		<cfif hasAggregate>
			<cfsavecontent variable="htmlAggregates">
				<cfoutput>
					<tr class="aggregate">
						<cfset counter = 0 />
						
						<cfloop array="#variables.columns#" index="col">
							<td class="#col.key# #col.class# column-#counter++#">
								<cfif structKeyExists(col, 'aggregate')>
									<cfset currentKey = col.key & '-' & col.aggregate />
									
									<!--- Prime aggregate --->
									<cfset aggregate[currentKey] = 0 />
									
									<!--- Calculate the aggregate --->
									<cfif isArray(arguments.data)>
										<cfloop array="#arguments.data#" index="item">
											<cfif isObject(item)>
												<cfif col.key NEQ ''>
													<cfinvoke component="#item#" method="get#col.key#" returnvariable="value" />
												</cfif>
											<cfelseif isStruct(item)>
												<cfset value = item[col.key] />
											<cfelseif isSimpleValue(item)>
												<cfset value = item />
											<cfelse>
												<cfthrow message="The data type passed in is not suported." detail="The type of the data in the array is not of type struct, object or simpleValue.">
											</cfif>
											
											<cfswitch expression="#col.aggregate#">
												<cfcase value="sum">
													<cfset aggregate[currentKey] += value />
												</cfcase>
											</cfswitch>
										</cfloop>
									<cfelseif isQuery(arguments.data)>
										<cfloop query="arguments.data">
											<cfswitch expression="#col.aggregate#">
												<cfcase value="sum">
													<cfset aggregate[currentKey] += arguments.data[col.key] />
												</cfcase>
											</cfswitch>
										</cfloop>
									<cfelse>
										<cfthrow message="The data type passed in is not supported." detail="The type of the data passed in is not a query or array.">
									</cfif>
									
									#aggregate[currentKey]#
								<cfelse>
									&nbsp;
								</cfif>
							</td>
						</cfloop>
					</tr>
				</cfoutput>
			</cfsavecontent>
		</cfif>
		
		<cfsavecontent variable="html">
			<cfoutput>
				<table class="datagrid #arguments.options.class#">
					<thead>
						#htmlColumns#
						#htmlAggregates#
					</thead>
					<tbody>
						<cfif isArray(arguments.data)>
							<cfset row = 0 />
							
							<cfloop array="#arguments.data#" index="item">
								<cfset row++ />
								
								<tr>
									<cfif isObject(item)>
										<cfset counter = 0 />
										
										<cfloop array="#variables.columns#" index="col">
											<td class="#col.key# #col.class# column-#counter++#">
												<cfif col.key NEQ ''>
													<cfinvoke component="#item#" method="get#col.key#" returnvariable="result" />
													
													#result#
												<cfelseif structKeyExists(col, 'derived')>
													#calculateDerived( derived, col.derived, col.keys, data, row )#
												<cfelse>
													&nbsp;
												</cfif>
											</td>
										</cfloop>
									<cfelseif isStruct(item)>
										<cfset counter = 0 />
										
										<cfloop array="#variables.columns#" index="col">
											<td class="#col.key# #col.class# column-#counter++#">
												<cfif col.key NEQ ''>
													#item[col.key]#
												<cfelseif structKeyExists(col, 'derived')>
													#calculateDerived( derived, col.derived, col.keys, data, row )#
												<cfelse>
													&nbsp;
												</cfif>
											</td>
										</cfloop>
									<cfelseif isSimpleValue(item)>
										<td class="#col.key# #col.class# column-#counter++#">
											#item#
										</td>
									<cfelse>
										<cfthrow message="The data type passed in is not suported." detail="The type of the data in the array is not of type struct, object or simpleValue.">
									</cfif>
								</tr>
							</cfloop>
						<cfelseif isQuery(arguments.data)>
							<cfloop query="arguments.data">
								<tr>
									<cfset counter = 0 />
									
									<cfloop array="#variables.columns#" index="col">
										<td class="#col.key# #col.class# column-#counter++#">
											<cfif col.key NEQ ''>
												#arguments.data[col.key]#
											<cfelseif structKeyExists(col, 'derived')>
												#calculateDerived( derived, col.derived, col.keys, data, arguments.data.currentRow )#
											<cfelse>
												&nbsp;
											</cfif>
										</td>
									</cfloop>
								</tr>
							</cfloop>
						<cfelse>
							<cfthrow message="The data type passed in is not supported." detail="The type of the data passed in is not a query or array.">
						</cfif>
					</tbody>
					<!--- Show footer --->
					<cfif arguments.options['minimumRows'] GT 0
						AND (
							(isArray(arguments.data) AND arrayLen(arguments.data) GTE arguments.options['minimumRows'])
							OR (isQuery(arguments.data) AND arguments.data.recordCount GTE arguments.options['minimumRows'])
						)>
						<tfoot>
							#htmlAggregates#
							#htmlColumns#
						</tfoot>
					</cfif>
				</table>
			</cfoutput>
		</cfsavecontent>
		
		<cfreturn html />
	</cffunction>
</cfcomponent>