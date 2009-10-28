<cfcomponent extends="cf-compendium.inc.resource.base.object" output="false">
	<cffunction name="init" access="public" returnType="component" output="false">
		<cfargument name="i18n" type="component" required="true" />
		<cfargument name="locale" type="string" default="en_US" />
		
		<cfset super.init() />
		
		<cfset variables.i18n = arguments.i18n />
		<cfset variables.locale = arguments.locale />
		
		<cfset variables.columns = [] />
		<cfset variables.bundles = [] />
		
		<!--- Set base bundle for translation --->
		<cfset addI18NBundle('/cf-compendium/i18n/inc/resource/structure', 'datagrid') />
		
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
	
	<cffunction name="addI18NBundle" access="public" returntype="void" output="false">
		<cfargument name="path" type="string" required="true" />
		<cfargument name="name" type="string" required="true" />
		
		<cfset arrayAppend(variables.bundles, variables.i18n.getResourceBundle(arguments.path, arguments.name, variables.locale)) />
	</cffunction>
	
	<cffunction name="calculateDerived" access="private" returntype="string" output="false">
		<cfargument name="derived" type="struct" required="true" />
		<cfargument name="type" type="string" required="true" />
		<cfargument name="keys" type="string" required="true" />
		<cfargument name="data" type="any" required="true" />
		<cfargument name="row" type="numeric" required="true" />
		<cfargument name="options" type="struct" default="#{}#" />
		
		<cfset var currentKey = '' />
		<cfset var key = '' />
		<cfset var result = '' />
		<cfset var safeKey = reReplace(arguments.keys, '[^a-zA-Z0-9]', '-', 'all') />
		
		<cfswitch expression="#arguments.type#">
			<cfcase value="currentRow">
				<cfreturn arguments.row + arguments.options.startRow - 1 />
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
	
	<cffunction name="getLabel" access="public" returntype="string" output="false">
		<cfargument name="key" type="string" required="true" />
		
		<cfset var i = '' />
		
		<!--- Check for no label --->
		<cfif arguments.key EQ ''>
			<cfreturn '' />
		</cfif>
		
		<!--- Find the first (LIFO) value for the label --->
		<cfloop from="#arrayLen(variables.bundles)#" to="1" index="i" step="-1">
			<cfif variables.bundles[i].hasKey(arguments.key)>
				<cfreturn variables.bundles[i].getValue(arguments.key) />
			</cfif>
		</cfloop>
		
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
				minimumRows = 15,
				numPerPage = 30,
				startRow = 1
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
							#getLabel(col.label)#
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
									
									<cfswitch expression="#col.aggregate#">
										<cfcase value="sum">
											<cfset aggregate[currentKey] = 0 />
										</cfcase>
									</cfswitch>
									
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
												
												<cfcase value="min">
													<cfif NOT structKeyExists(aggregate, currentKey)>
														<cfset aggregate[currentKey] = value />
													</cfif>
													
													<cfif value LT aggregate[currentKey]>
														<cfset aggregate[currentKey] = value />
													</cfif>
												</cfcase>
												
												<cfcase value="max">
													<cfif NOT structKeyExists(aggregate, currentKey)>
														<cfset aggregate[currentKey] = value />
													</cfif>
													
													<cfif value GT aggregate[currentKey]>
														<cfset aggregate[currentKey] = value />
													</cfif>
												</cfcase>
												
												<cfcase value="avg">
													<cfif NOT structKeyExists(aggregate, currentKey)>
														<cfset aggregate[currentKey] = 0 />
														<cfset aggregate[currentKey & '-cnt'] = 0 />
													</cfif>
													
													<cfset aggregate[currentKey] += value />
													<cfset aggregate[currentKey & '-cnt']++ />
												</cfcase>
											</cfswitch>
										</cfloop>
									<cfelseif isQuery(arguments.data)>
										<cfloop query="arguments.data">
											<cfswitch expression="#col.aggregate#">
												<cfcase value="sum">
													<cfset aggregate[currentKey] += arguments.data[col.key] />
												</cfcase>
												
												<cfcase value="min">
													<cfif NOT structKeyExists(aggregate, currentKey)>
														<cfset aggregate[currentKey] = arguments.data[col.key] />
													</cfif>
													
													<cfif value LT aggregate[currentKey]>
														<cfset aggregate[currentKey] = arguments.data[col.key] />
													</cfif>
												</cfcase>
												
												<cfcase value="max">
													<cfif NOT structKeyExists(aggregate, currentKey)>
														<cfset aggregate[currentKey] = arguments.data[col.key] />
													</cfif>
													
													<cfif value GT aggregate[currentKey]>
														<cfset aggregate[currentKey] = arguments.data[col.key] />
													</cfif>
												</cfcase>
												
												<cfcase value="avg">
													<cfif NOT structKeyExists(aggregate, currentKey)>
														<cfset aggregate[currentKey] = 0 />
														<cfset aggregate[currentKey & '-cnt'] = 0 />
													</cfif>
													
													<cfset aggregate[currentKey] += arguments.data[col.key] />
													<cfset aggregate[currentKey & '-cnt']++ />
												</cfcase>
											</cfswitch>
										</cfloop>
									<cfelse>
										<cfthrow message="The data type passed in is not supported." detail="The type of the data passed in is not a query or array.">
									</cfif>
									
									<cfswitch expression="#col.aggregate#">
										<cfcase value="avg">
											<cfset aggregate[currentKey] /= aggregate[currentKey & '-cnt'] />
										</cfcase>
									</cfswitch>
									
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
			<table class="datagrid #arguments.options.class#">
				<cfoutput>
					<thead>
						#htmlColumns#
						#htmlAggregates#
					</thead>
				</cfoutput>
				<tbody>
					<cfif isArray(arguments.data)>
						<cfset row = 0 />
						
						<cfloop array="#arguments.data#" index="item">
							<cfset row++ />
							
							<cfoutput>
								<tr>
									<cfif isObject(item)>
										<cfset counter = 0 />
										
										<cfloop array="#variables.columns#" index="col">
											<td class="#col.key# #col.class# column-#counter++#">
												<cfif col.key NEQ ''>
													<cfinvoke component="#item#" method="get#col.key#" returnvariable="result" />
													
													#result#
												<cfelseif structKeyExists(col, 'derived')>
													#calculateDerived( derived, col.derived, col.keys, data, row, arguments.options )#
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
													#calculateDerived( derived, col.derived, col.keys, data, row, arguments.options )#
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
							</cfoutput>
							
							<!--- Check if we have enough rows displayed --->
							<cfif row GTE arguments.options.numPerPage>
								<cfbreak />
							</cfif>
						</cfloop>
					<cfelseif isQuery(arguments.data)>
						<cfset row = 0 />
						
						<cfoutput query="arguments.data" startrow="#arguments.options.startRow#" maxrows="#arguments.options.numPerPage#">
							<cfset row++ />
							<tr>
								<cfset counter = 0 />
								
								<cfloop array="#variables.columns#" index="col">
									<td class="#col.key# #col.class# column-#counter++#">
										<cfif col.key NEQ ''>
											#arguments.data[col.key]#
										<cfelseif structKeyExists(col, 'derived')>
											#calculateDerived( derived, col.derived, col.keys, data, row, arguments.options )#
										<cfelse>
											&nbsp;
										</cfif>
									</td>
								</cfloop>
							</tr>
						</cfoutput>
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
					<cfoutput>
						<tfoot>
							#htmlAggregates#
							#htmlColumns#
						</tfoot>
					</cfoutput>
				</cfif>
			</table>
		</cfsavecontent>
		
		<cfreturn html />
	</cffunction>
</cfcomponent>