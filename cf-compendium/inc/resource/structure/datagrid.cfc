<cfcomponent extends="cf-compendium.inc.resource.base.object" output="false">
	<cffunction name="init" access="public" returnType="component" output="false">
		<cfargument name="i18n" type="component" required="true" />
		<cfargument name="locale" type="string" default="en_US" />
		
		<cfset super.init() />
		
		<cfset variables.i18n = arguments.i18n />
		<cfset variables.locale = arguments.locale />
		<cfset variables.label = createObject('component', 'cf-compendium.inc.resource.i18n.label').init(arguments.i18n, arguments.locale) />
		
		<cfset variables.columns = [] />
		
		<!--- Set base bundle for translation --->
		<cfset addBundle('/cf-compendium/i18n/inc/resource/structure', 'datagrid') />
		
		<cfreturn this />
	</cffunction>
	
	<cffunction name="addColumn" access="public" returntype="void" output="false">
		<cfargument name="options" type="struct" default="#{}#" />
		
		<cfset var defaults = {
				class = '',
				format = '',
				key = '',
				label = '',
				link = [],
				linkClass = [],
				type = 'text',
				value = ''
			} />
		
		<!--- Normalize the options --->
		<cfif structKeyExists(arguments.options, 'link') and not isArray(arguments.options.link)>
			<cfset arguments.options.link = [ arguments.options.link ] />
		</cfif>
		
		<cfif structKeyExists(arguments.options, 'linkClass') and not isArray(arguments.options.linkClass)>
			<cfset arguments.options.linkClass = [ arguments.options.linkClass ] />
		</cfif>
		
		<cfset arrayAppend(variables.columns, extend(defaults, arguments.options)) />
	</cffunction>
	
	<cffunction name="addBundle" access="public" returntype="void" output="false">
		<cfargument name="path" type="string" required="true" />
		<cfargument name="name" type="string" required="true" />
		
		<cfset variables.label.addBundle(argumentCollection = arguments) />
	</cffunction>
	
	<cffunction name="calculateDerived" access="private" returntype="string" output="false">
		<cfargument name="derived" type="struct" required="true" />
		<cfargument name="type" type="string" required="true" />
		<cfargument name="key" type="string" required="true" />
		<cfargument name="data" type="any" required="true" />
		<cfargument name="rowNum" type="numeric" required="true" />
		<cfargument name="options" type="struct" default="#{}#" />
		
		<cfset var currentKey = '' />
		<cfset var i = '' />
		<cfset var result = '' />
		<cfset var safeKey = reReplace(arguments.key, '[^a-zA-Z0-9]', '-', 'all') />
		
		<cfswitch expression="#arguments.type#">
			<cfcase value="currentRow">
				<cfreturn arguments.rowNum + arguments.options.startRow - 1 />
			</cfcase>
			
			<cfcase value="sum">
				<cfset currentKey = 'sum-' & safeKey />
				
				<!--- Prime the variable --->
				<cfif not structKeyExists(arguments.derived, currentKey)>
					<cfset arguments.derived[currentKey] = 0 />
				</cfif>
				
				<cfif listLen(arguments.key)>
					<cfloop list="#arguments.key#" index="i">
						<cfif isQuery(arguments.data)>
							<cfset arguments.derived[currentKey] += arguments.data[i][arguments.rowNum] />
						<cfelseif isObject(arguments.data[arguments.rowNum])>
							<cfinvoke component="#arguments.data[arguments.rowNum]#" method="get#i#" returnvariable="result" />
							
							<cfset arguments.derived[currentKey] += result />
						<cfelseif isStruct(arguments.data[arguments.rowNum])>
							<cfset arguments.derived[currentKey] += arguments.data[arguments.rowNum][i] />
						<cfelse>
							<cfthrow message="Multiple keys not valid" detail="Cannot do a running sum with multiple keys if it is not a struct or object" />
						</cfif>
					</cfloop>
				<cfelse>
					<cfset arguments.derived[currentKey] += data[arguments.rowNum] />
				</cfif>
				
				<cfreturn arguments.derived[currentKey] />
			</cfcase>
		</cfswitch>
		
		<cfreturn '' />
	</cffunction>
	
	<cffunction name="createLink" access="private" returntype="string" output="false">
		<cfargument name="text" type="any" required="true" />
		<cfargument name="column" type="struct" required="true" />
		<cfargument name="data" type="any" required="true" />
		<cfargument name="rowNum" type="numeric" required="true" />
		<cfargument name="colNum" type="numeric" required="true" />
		<cfargument name="options" type="struct" default="#{}#" />
		
		<cfset var class = '' />
		<cfset var href = '' />
		<cfset var html = '' />
		<cfset var i = '' />
		<cfset var j = '' />
		<cfset var key = '' />
		<cfset var link = '' />
		<cfset var theUrl = '' />
		<cfset var value = '' />
		
		<!--- Determine if using a column or datagrid based url --->
		<cfset theUrl = (structKeyExists(arguments.column, 'theUrl') ? arguments.column.theUrl : arguments.options.theUrl) />
		
		<!--- Adjust for the startRow --->
		<cfset arguments.rowNum += arguments.options.startRow - 1 />
		
		<cfsavecontent variable="html">
			<cfoutput>
				<cfloop from="1" to="#arrayLen(arguments.column.link)#" index="i">
					<!--- Setup the base link values using the url override --->
					<cfif isStruct(arguments.options.linkBase)>
						<cfif structKeyExists(arguments.options.linkBase, arguments.column.key)>
							<cfinvoke component="#theUrl#" method="overrideDGCol#arguments.colNum#Link#i#">
								<cfinvokeargument name="value" value="#arguments.options.linkBase[arguments.column.key]#" />
							</cfinvoke>
						</cfif>
					<cfelseif arguments.options.linkBase neq ''>
						<cfinvoke component="#theUrl#" method="overrideDGCol#arguments.colNum#Link#i#">
							<cfinvokeargument name="value" value="#arguments.options.linkBase#" />
						</cfinvoke>
					</cfif>
					
					<cfloop list="#structKeyList(arguments.column.link[i])#" index="j">
						<cfset key = arguments.column.link[i][j] />
						
						<!--- Get the link value --->
						<cfif isNumeric(key)>
							<cfset value = key />
						<cfelseif isQuery(arguments.data) and structKeyExists(arguments.data, key)>
							<cfset value = arguments.data[key][arguments.rowNum] />
						<cfelseif isArray(arguments.data) and isObject(arguments.data[arguments.rowNum]) and arguments.data[arguments.rowNum].has__Key(key)>
							<cfinvoke component="#arguments.data[arguments.rowNum]#" method="get#key#" returnvariable="value" />
						<cfelseif isArray(arguments.data) and isStruct(arguments.data[arguments.rowNum]) and structKeyExists(arguments.data[arguments.rowNum], key)>
							<cfset value = arguments.data[arguments.rowNum][key] />
						<cfelseif isArray(arguments.data) and key eq '__value'>
							<cfset value = arguments.data[arguments.rowNum] />
						<cfelse>
							<cfset value = key />
						</cfif>
						
						<cfinvoke component="#theUrl#" method="setDGCol#arguments.colNum#Link#i#">
							<cfinvokeargument name="name" value="#j#" />
							<cfinvokeargument name="value" value="#value#" />
						</cfinvoke>
					</cfloop>
					
					<!--- Check if the value of the link is provided --->
					<cfif isArray(arguments.column.value)>
						<cfset arguments.text = variables.label.get(arguments.column.value[i]) />
					<cfelseif arguments.column.value neq ''>
						<cfset arguments.text = variables.label.get(arguments.column.value) />
					</cfif>
					
					<!--- Retrieve the URL --->
					<cfinvoke component="#theUrl#" method="getDGCol#arguments.colNum#Link#i#" returnvariable="href" />
					
					<a href="#href#" class="#(arrayLen(arguments.column.linkClass) gte i ? arguments.column.linkClass[i] : '')#">#formatValue(arguments.column, arguments.text)#</a>
				</cfloop>
			</cfoutput>
		</cfsavecontent>
		
		<cfreturn html />
	</cffunction>
	
	<cffunction name="formatValue" access="private" returntype="string" output="false">
		<cfargument name="column" type="struct" required="true" />
		<cfargument name="value" type="string" required="true" />
		
		<cfswitch expression="#arguments.column.type#">
			<cfcase value="date">
				<cfreturn dateFormat(arguments.value, arguments.column.format) />
			</cfcase>
			
			<cfcase value="time">
				<cfreturn timeFormat(arguments.value, arguments.column.format) />
			</cfcase>
			
			<!--- Use the format as a holder for a formatter --->
			<cfcase value="custom">
				<cfreturn arguments.column.format.toHTML(arguments.value) />
			</cfcase>
			
			<cfcase value="raw">
				<cfreturn arguments.value />
			</cfcase>
			
			<cfcase value="uuid">
				<cfreturn left(arguments.value, 8) />
			</cfcase>
			
			<cfdefaultcase>
				<cfreturn htmlEditFormat(arguments.value) />
			</cfdefaultcase>
		</cfswitch>
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
				linkBase = '',
				minimumRows = 15,
				numPerPage = 30,
				startRow = 1
			} />
		<cfset var derived = {} />
		<cfset var html = '' />
		<cfset var htmlColumns = '' />
		<cfset var htmlAggregates = '' />
		<cfset var hasAggregate = false />
		<cfset var i = '' />
		<cfset var item = '' />
		<cfset var result = '' />
		<cfset var rowNum = '' />
		<cfset var value = '' />
		
		<cfset arguments.options = extend(defaults, arguments.options) />
		
		<cfsavecontent variable="htmlColumns">
			<cfoutput>
				<tr>
					<cfset counter = 0 />
					
					<cfloop array="#variables.columns#" index="col">
						<th class="col #col.key# #col.class# column-#counter++# capitalize">
							#variables.label.get(col.label)#
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
							<td class="#col.key# #col.class# column-#counter++# capitalize">
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
												<cfif col.key neq ''>
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
													<cfif not structKeyExists(aggregate, currentKey)>
														<cfset aggregate[currentKey] = value />
													</cfif>
													
													<cfif value lt aggregate[currentKey]>
														<cfset aggregate[currentKey] = value />
													</cfif>
												</cfcase>
												
												<cfcase value="max">
													<cfif not structKeyExists(aggregate, currentKey)>
														<cfset aggregate[currentKey] = value />
													</cfif>
													
													<cfif value gt aggregate[currentKey]>
														<cfset aggregate[currentKey] = value />
													</cfif>
												</cfcase>
												
												<cfcase value="avg">
													<cfif not structKeyExists(aggregate, currentKey)>
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
													<cfif not structKeyExists(aggregate, currentKey)>
														<cfset aggregate[currentKey] = arguments.data[col.key] />
													</cfif>
													
													<cfif value lt aggregate[currentKey]>
														<cfset aggregate[currentKey] = arguments.data[col.key] />
													</cfif>
												</cfcase>
												
												<cfcase value="max">
													<cfif not structKeyExists(aggregate, currentKey)>
														<cfset aggregate[currentKey] = arguments.data[col.key] />
													</cfif>
													
													<cfif value gt aggregate[currentKey]>
														<cfset aggregate[currentKey] = arguments.data[col.key] />
													</cfif>
												</cfcase>
												
												<cfcase value="avg">
													<cfif not structKeyExists(aggregate, currentKey)>
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
					<cfif isArray(arguments.data) and arrayLen(arguments.data)>
						<cfset rowNum = 0 />
						
						<cfloop from="#arguments.options.startRow#" to="#min(arrayLen(arguments.data), arguments.options.startRow + arguments.options.numPerPage)#" index="i">
							<cfset item = arguments.data[i] />
							<cfset rowNum++ />
							
							<cfoutput>
								<tr>
									<cfif isObject(item)>
										<cfset counter = 0 />
										
										<cfloop array="#variables.columns#" index="col">
											<td class="#col.key# #col.class# column-#counter++#">
												<!--- Determine the value --->
												<cfif col.key neq ''>
													<cfinvoke component="#item#" method="get#col.key#" returnvariable="value" />
												<cfelseif structKeyExists(col, 'derived')>
													<cfset value = calculateDerived( derived, col.derived, col.key, data, rowNum, arguments.options ) />
												<cfelse>
													<cfset value = '&nbsp;' />
												</cfif>
												
												<!--- Check for a link --->
												<cfif arrayLen(col.link)>
													#createLink(value, col, data, rowNum, counter, arguments.options)#
												<cfelse>
													#formatValue(col, value)#
												</cfif>
											</td>
										</cfloop>
									<cfelseif isStruct(item)>
										<cfset counter = 0 />
										
										<cfloop array="#variables.columns#" index="col">
											<td class="#col.key# #col.class# column-#counter++#">
												<!--- Determine Value --->
												<cfif col.key neq ''>
													<cfset value = item[col.key] />
												<cfelseif structKeyExists(col, 'derived')>
													<cfset value = calculateDerived( derived, col.derived, col.key, data, rowNum, arguments.options ) />
												<cfelse>
													<cfset value = '&nbsp;' />
												</cfif>
												
												<!--- Check for a link --->
												<cfif arrayLen(col.link)>
													#createLink(value, col, data, rowNum, counter, arguments.options)#
												<cfelse>
													#formatValue(col, value)#
												</cfif>
											</td>
										</cfloop>
									<cfelseif isSimpleValue(item)>
										<cfloop array="#variables.columns#" index="col">
											<td class="#col.key# #col.class# column-#counter++#">
												<!--- Check for a link --->
												<cfif arrayLen(col.link)>
													#createLink(item, col, data, rowNum, counter, arguments.options)#
												<cfelse>
													#item#
												</cfif>
											</td>
										</cfloop>
									<cfelse>
										<cfthrow message="The data type passed in is not suported." detail="The type of the data in the array is not of type struct, object or simpleValue.">
									</cfif>
								</tr>
							</cfoutput>
							
							<!--- Check if we have enough rows displayed --->
							<cfif rowNum gte arguments.options.numPerPage>
								<cfbreak />
							</cfif>
						</cfloop>
					<cfelseif isQuery(arguments.data) and arguments.data.recordCount gt 0>
						<cfset rowNum = 0 />
						
						<cfoutput query="arguments.data" startrow="#arguments.options.startRow#" maxrows="#arguments.options.numPerPage#">
							<cfset rowNum++ />
							<tr>
								<cfset counter = 0 />
								
								<cfloop array="#variables.columns#" index="col">
									<td class="#col.key# #col.class# column-#counter++#">
										<!--- Determine Value --->
										<cfif col.key neq ''>
											<cfset value = arguments.data[col.key] />
										<cfelseif structKeyExists(col, 'derived')>
											<cfset value = calculateDerived( derived, col.derived, col.key, data, rowNum, arguments.options ) />
										<cfelse>
											<cfset value = '&nbsp;' />
										</cfif>
										
										<!--- Check for a link --->
										<cfif arrayLen(col.link)>
											#createLink(value, col, data, rowNum, counter, arguments.options)#
										<cfelse>
											#formatValue(col, value)#
										</cfif>
									</td>
								</cfloop>
							</tr>
						</cfoutput>
					<cfelse>
						<cfoutput>
							<tr>
								<td colspan="#arrayLen(variables.columns)#">
									#variables.label.get('noRecords')#
								</td>
							</tr>
						</cfoutput>
					</cfif>
				</tbody>
				<!--- Show footer --->
				<cfif arguments.options['minimumRows'] gt 0
					and (
						(isArray(arguments.data) and arrayLen(arguments.data) gte arguments.options['minimumRows'])
						or (isQuery(arguments.data) and arguments.data.recordCount gte arguments.options['minimumRows'])
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