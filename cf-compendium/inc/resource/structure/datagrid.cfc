<cfcomponent extends="cf-compendium.inc.resource.base.object" output="false">
<cfscript>
	public component function init(required component i18n, string locale = 'en_US') {
		super.init();
		
		variables.i18n = arguments.i18n;
		variables.locale = arguments.locale;
		variables.label = createObject('component', 'cf-compendium.inc.resource.i18n.label').init(arguments.i18n, arguments.locale);
		variables.format = createObject('component', 'cf-compendium.inc.resource.format.format').init(arguments.i18n, arguments.locale);
		
		variables.columns = [];
		
		// Set base bundle for translation
		addBundle('/cf-compendium/i18n/inc/resource/structure', 'datagrid');
		
		return this;
	}
	
	public void function addColumn(struct options = {}) {
		var defaults = {
			class = '',
			format = {},
			isHeader = false,
			key = '',
			label = '',
			link = [],
			linkClass = [],
			title = '',
			value = ''
		};
		
		// Normalize the options
		if (structKeyExists(arguments.options, 'link') && !isArray(arguments.options.link)) {
			arguments.options.link = [ arguments.options.link ];
		}
		
		if (structKeyExists(arguments.options, 'linkClass') && !isArray(arguments.options.linkClass)) {
			arguments.options.linkClass = [ arguments.options.linkClass ];
		}
		
		arrayAppend(variables.columns, extend(defaults, arguments.options));
	}
	
	public void function addBundle(required string path, required string name) {
		variables.label.addBundle(argumentCollection = arguments);
		variables.format.add__bundle(argumentCollection = arguments);
	}
	
	public void function addFormatter(required component formatter) {
		variables.format.add__formatter(arguments.formatter);
	}
</cfscript>
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
	
	<cffunction name="createElement" access="private" returntype="string" output="false">
		<cfargument name="value" type="string" required="true" />
		<cfargument name="column" type="struct" required="true" />
		<cfargument name="data" type="any" required="true" />
		<cfargument name="rowNum" type="numeric" required="true" />
		
		<cfset local.prefix = structKeyExists(arguments.column, 'prefix') ? arguments.column.prefix & '-' : '' />
		
		<cfset arguments.column.element.value = arguments.value />
		<cfset arguments.column.element.id = local.prefix & arguments.column.key & '-' & numberFormat(arguments.rowNum, '0000') />
		<cfset arguments.column.element.name = local.prefix & arguments.column.key & '-' & numberFormat(arguments.rowNum, '0000') />
		
		<!--- Check for mappings --->
		<cfif structKeyExists(arguments.column.element, 'mappings')>
			<cfloop list="#structKeyList(arguments.column.element.mappings)#" index="local.i">
				<cfset arguments.column.element[local.i] = getValue(arguments.data, arguments.rowNum, arguments.column.element.mappings[local.i]) />
			</cfloop>
		</cfif>
		
		<cfif arguments.column.element.elementType eq 'checkbox' and not structKeyExists(arguments.column.element, 'options')>
			<cfif arguments.value eq arguments.column.element.originalValue>
				<cfset arguments.column.element.checked = true />
			<cfelse>
				<cfset structDelete(arguments.column.element, 'checked') />
			</cfif>
		</cfif>
		
		<cfreturn variables.theForm.theForm.elementToHtml(arguments.column.element) />
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
		<cfset var title = '' />
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
							<cfset theUrl['overrideDGCol#arguments.colNum#Link#i#'](arguments.options.linkBase[arguments.column.key]) />
						</cfif>
					<cfelseif arguments.options.linkBase neq ''>
						<cfset theUrl['overrideDGCol#arguments.colNum#Link#i#'](arguments.options.linkBase) />
					</cfif>
					
					<cfloop list="#structKeyList(arguments.column.link[i])#" index="j">
						<cfset value = getValue(arguments.data, arguments.rowNum, arguments.column.link[i][j]) />
						
						<cfset theUrl['setDGCol#arguments.colNum#Link#i#'](j, value) />
					</cfloop>
					
					<!--- Check if the value of the link is provided --->
					<cfif isArray(arguments.column.value)>
						<cfset arguments.text = variables.label.get(arguments.column.value[i]) />
					<cfelseif arguments.column.value neq ''>
						<cfset arguments.text = variables.label.get(arguments.column.value) />
					</cfif>
					
					<cfset href = theUrl['getDGCol#arguments.colNum#Link#i#']() />
					
					<a href="#href#" class="#(arrayLen(arguments.column.linkClass) gte i ? arguments.column.linkClass[i] : '')#">#this.format(arguments.text, arguments.column.format)#</a>
				</cfloop>
			</cfoutput>
		</cfsavecontent>
		
		<cfreturn html />
	</cffunction>
<cfscript>
	private string function format( required string value, struct format = {}, boolean isHeader = false ) {
		local.result = '';
		local.keys = listToArray(structKeyList(arguments.format));
		
		for(local.i = 1; local.i <= arrayLen(local.keys); local.i++) {
			arguments.value = variables.format[local.keys[local.i]](arguments.value, arguments.format[local.keys[local.i]]);
		}
		
		if(arguments.isHeader) {
			arguments.value = variables.label.get(arguments.value, arguments.value);
		}
		
		return arguments.value;
	}
	
	public string function getNestedValue( required struct data, required string key ) {
		var currentKey = '';
		var nextKey = '';
		
		if(structKeyExists(arguments.data, arguments.key)) {
			return arguments.data[arguments.key];
		}
		
		currentKey = listFirst(arguments.key, '.');
		nextKey = listRest(arguments.key, '.');
		
		
		if(structKeyExists(arguments.data, currentKey) && isStruct(arguments.data[currentKey])) {
			return getNestedValue( arguments.data[currentKey], nextKey );
		}
		
		return '';
	}
</cfscript>
	<cffunction name="getValue" access="private" returntype="any" output="false">
		<cfargument name="data" type="any" required="true" />
		<cfargument name="rowNum" type="numeric" required="true" />
		<cfargument name="key" type="string" required="true" />
		
		<cfset var i = '' />
		<cfset var keys = '' />
		<cfset var value = '' />
		
		<cfif isNumeric(arguments.key)>
			<cfset value = arguments.key />
		<cfelseif isQuery(arguments.data) and structKeyExists(arguments.data, arguments.key)>
			<cfset value = ( isObject(arguments.data[arguments.key][arguments.rowNum]) ? toString(arguments.data[arguments.key][arguments.rowNum]) : arguments.data[arguments.key][arguments.rowNum]) />
		<cfelseif isArray(arguments.data) and isObject(arguments.data[arguments.rowNum]) and arguments.data[arguments.rowNum].has__Key(arguments.key)>
			<cfinvoke component="#arguments.data[arguments.rowNum]#" method="get#arguments.key#" returnvariable="value" />
		<cfelseif isArray(arguments.data) and isStruct(arguments.data[arguments.rowNum]) and structKeyExists(arguments.data[arguments.rowNum], arguments.key)>
			<cfset value = arguments.data[arguments.rowNum][arguments.key] />
		<cfelseif isArray(arguments.data) and arguments.key eq '__value'>
			<cfset value = arguments.data[arguments.rowNum] />
		<cfelseif isStruct(arguments.data)>
			<cfset keys = listSort(structKeyList(arguments.data), 'textNoCase') />
			
			<cfset i = listGetAt(keys, arguments.rowNum) />
			
			<cfif structKeyExists(arguments.data[i], arguments.key)>
				<cfset value = arguments.data[i][arguments.key] />
			<cfelse>
				<cfset value = arguments.key />
			</cfif>
		<cfelse>
			<cfset value = arguments.key />
		</cfif>
		
		<cfreturn value />
	</cffunction>
	
	<cffunction name="setForm" access="public" returntype="void" output="false">
		<cfargument name="theForm" type="component" required="true" />
		<cfargument name="action" type="string" default="." />
		<cfargument name="options" type="struct" default="#{}#" />
		
		<cfset variables.theForm = arguments />
	</cffunction>
	
	<cffunction name="toHTML" access="public" returntype="string" output="false">
		<cfargument name="data" type="any" required="true" />
		<cfargument name="options" type="struct" default="#{}#" />
		
		<cfset var aggregate = {} />
		<cfset var col = '' />
		<cfset var counter = '' />
		<cfset var currentKey = '' />
		<cfset var derived = {} />
		<cfset var html = '' />
		<cfset var htmlColumns = '' />
		<cfset var htmlAggregates = '' />
		<cfset var hasAggregate = false />
		<cfset var i = '' />
		<cfset var item = '' />
		<cfset var key = '' />
		<cfset var keys = '' />
		<cfset var result = '' />
		<cfset var rowNum = '' />
		<cfset var title = '' />
		<cfset var value = '' />
		
		<cfset arguments.options = extend({
			class = '',
			linkBase = '',
			minimumRows = 15,
			numPerPage = 30,
			startRow = 1,
			showForm = true
		}, arguments.options) />
		
		<!--- Make sure the form only shows when there is a form to display --->
		<cfset arguments.options.showForm = arguments.options.showForm and structKeyExists(variables, 'theForm') />
		
		<!--- Prepare for form elements if there is a form --->
		<cfif structKeyExists(variables, 'theForm')>
			<cfloop from="1" to="#arrayLen(variables.columns)#" index="i">
				<cfif structKeyExists(variables.columns[i], 'element')>
					<cfset variables.columns[i].element = variables.theForm.theForm.extendElement(argumentCollection = variables.columns[i].element) />
					
					<!--- Store the original value since it gets changed every loop through the data --->
					<cfset variables.columns[i].element.originalValue = (structKeyExists(variables.columns[i].element, 'value') ? variables.columns[i].element.value : '') />
				</cfif>
			</cfloop>
		</cfif>
		
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
							<#(col.isHeader ? 'th' : 'td')# class="#col.key# #col.class# column-#counter++# capitalize">
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
													<cfset value = item['get' & col.key]() />
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
							</#(col.isHeader ? 'th' : 'td')#>
						</cfloop>
					</tr>
				</cfoutput>
			</cfsavecontent>
		</cfif>
		
		<cfsavecontent variable="html">
			<cfif arguments.options.showForm>
				<cfoutput>#variables.theForm.theForm.getFormOpen(variables.theForm.action, variables.theForm.options)#</cfoutput>
			</cfif>
			
			<table class="datagrid <cfoutput>#arguments.options.class#</cfoutput>">
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
											<cfset title = col.title neq '' ? getValue(data, rowNum, col.title) : '' />
											
											<#(col.isHeader ? 'th' : 'td')# class="#col.key# #col.class# column-#counter++#" <cfif title != ''>data-title="#title#"</cfif>>
												<!--- Determine the value --->
												<cfif col.key neq ''>
													<cfset value = item['get' & col.key]() />
												<cfelseif structKeyExists(col, 'derived')>
													<cfset value = calculateDerived( derived, col.derived, col.key, data, rowNum, arguments.options ) />
												<cfelse>
													<cfset value = '&nbsp;' />
												</cfif>
												
												<!--- Check for a link --->
												<cfif arrayLen(col.link)>
													#createLink(value, col, data, rowNum, counter, arguments.options)#
												<cfelseif structKeyExists(col, 'element')>
													#createElement(value, col, data, rowNum)#
												<cfelse>
													#this.format(value, col.format, col.isHeader)#
												</cfif>
											</#(col.isHeader ? 'th' : 'td')#>
										</cfloop>
									<cfelseif isStruct(item)>
										<cfset counter = 0 />
										
										<cfloop array="#variables.columns#" index="col">
											<cfset title = col.title neq '' ? getValue(data, rowNum, col.title) : '' />
											
											<#(col.isHeader ? 'th' : 'td')# class="#col.key# #col.class# column-#counter++#" <cfif title != ''>data-title="#title#"</cfif>>
												<!--- Determine Value --->
												<cfif col.key neq ''>
													<cfif structKeyExists(item, col.key)>
														<cfset value = item[col.key] />
													<cfelse>
														<cfset value = getNestedValue(item, col.key) />
													</cfif>
												<cfelseif structKeyExists(col, 'derived')>
													<cfset value = calculateDerived( derived, col.derived, col.key, data, rowNum, arguments.options ) />
												<cfelse>
													<cfset value = '&nbsp;' />
												</cfif>
												
												<!--- Check for a link --->
												<cfif arrayLen(col.link)>
													#createLink(value, col, data, rowNum, counter, arguments.options)#
												<cfelseif structKeyExists(col, 'element')>
													#createElement(value, col, data, rowNum)#
												<cfelse>
													#this.format(value, col.format, col.isHeader)#
												</cfif>
											</#(col.isHeader ? 'th' : 'td')#>
										</cfloop>
									<cfelseif isSimpleValue(item)>
										<cfloop array="#variables.columns#" index="col">
											<cfset title = col.title neq '' ? getValue(data, rowNum, col.title) : '' />
											
											<#(col.isHeader ? 'th' : 'td')# class="#col.key# #col.class# column-#counter++#" <cfif title != ''>data-title="#title#"</cfif>>
												<!--- Check for a link --->
												<cfif arrayLen(col.link)>
													#createLink(item, col, data, rowNum, counter, arguments.options)#
												<cfelseif structKeyExists(col, 'element')>
													#createElement(item, col, data, rowNum)#
												<cfelse>
													#item#
												</cfif>
											</#(col.isHeader ? 'th' : 'td')#>
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
									<cfset title = col.title neq '' ? getValue(data, rowNum, col.title) : '' />
									
									<#(col.isHeader ? 'th' : 'td')# class="#col.key# #col.class# column-#counter++#" <cfif title != ''>data-title="#title#"</cfif>>
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
										<cfelseif structKeyExists(col, 'element')>
											#createElement(value, col, data, rowNum)#
										<cfelse>
											#this.format(value, col.format, col.isHeader)#
										</cfif>
									</#(col.isHeader ? 'th' : 'td')#>
								</cfloop>
							</tr>
						</cfoutput>
					<cfelseif isObject(arguments.data) and structKeyExists(arguments.data, 'hasNext') and structKeyExists(arguments.data, 'next') and structKeyExists(arguments.data, 'count') and arguments.data.count() gt 0>
						<cfset rowNum = 0 />
						
						<cfoutput>
							<cfloop condition="arguments.data.hasNext()">
								<cfset local.current = arguments.data.next() />
								
								<cfset rowNum++ />
								<tr>
									<cfset counter = 0 />
									
									<cfloop array="#variables.columns#" index="col">
										<!--- Mocking the data as an array of structs and hardcoding the row --->
										<cfset title = col.title neq '' ? getValue([ local.current ], 1, col.title) : '' />
										
										<#(col.isHeader ? 'th' : 'td')# class="#col.key# #col.class# column-#counter++#" <cfif title != ''>data-title="#title#"</cfif>>
											<!--- Determine Value --->
											<cfif col.key neq ''>
												<cfset value = local.current[col.key] />
											<cfelse>
												<cfset value = '&nbsp;' />
											</cfif>
											
											<!--- Check for a link --->
											<cfif arrayLen(col.link)>
												<!--- Mocking the data as an array of structs and hardcoding the row --->
												#createLink(value, col, [ local.current ], 1, counter, arguments.options)#
											<cfelseif structKeyExists(col, 'element')>
												#createElement(value, col, data, rowNum)#
											<cfelse>
												#this.format(value, col.format, col.isHeader)#
											</cfif>
										</#(col.isHeader ? 'th' : 'td')#>
									</cfloop>
								</tr>
							</cfloop>
						</cfoutput>
					<cfelseif isStruct(arguments.data) and structCount(arguments.data) gt 0 and not (isObject(arguments.data) and structKeyExists(arguments.data, 'hasNext') and structKeyExists(arguments.data, 'next') and structKeyExists(arguments.data, 'count'))>
						<cfset keys = listSort(structKeyList(arguments.data), 'textNoCase') />
						
						<cfset rowNum = 0 />
						
						<cfoutput>
							<cfloop from="#arguments.options.startRow#" to="#min(listLen(keys), arguments.options.startRow + arguments.options.numPerPage)#" index="i">
								<cfset key = listGetAt(keys, i) />
								
								<cfset rowNum++ />
								<tr>
									<cfset counter = 0 />
									
									<cfloop array="#variables.columns#" index="col">
										<cfset title = col.title neq '' ? getValue(data, rowNum, col.title) : '' />
										
										<#(col.isHeader ? 'th' : 'td')# class="#col.key# #col.class# column-#counter++#" <cfif title != ''>data-title="#title#"</cfif>>
											<!--- Determine Value --->
											<cfif col.key neq ''>
												<cfset value = arguments.data[key][col.key] />
											<cfelseif structKeyExists(col, 'derived')>
												<cfset value = calculateDerived( derived, col.derived, col.key, data, rowNum, arguments.options ) />
											<cfelse>
												<cfset value = '&nbsp;' />
											</cfif>
											
											<!--- Check for a link --->
											<cfif arrayLen(col.link)>
												#createLink(value, col, data, rowNum, counter, arguments.options)#
											<cfelseif structKeyExists(col, 'element')>
												#createElement(value, col, data, rowNum)#
											<cfelse>
												#this.format(value, col.format, col.isHeader)#
											</cfif>
										</#(col.isHeader ? 'th' : 'td')#>
									</cfloop>
								</tr>
							</cfloop>
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
			
			<cfif arguments.options.showForm>
				<cfoutput>
					#variables.theForm.theForm.getFormSubmit()#
					#variables.theForm.theForm.getFormClose()#
				</cfoutput>
			</cfif>
		</cfsavecontent>
		
		<cfreturn html />
	</cffunction>
</cfcomponent>
