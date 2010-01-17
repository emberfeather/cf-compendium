<!---
	Serializes and deserializes objects.
--->
<cfcomponent extends="cf-compendium.inc.resource.base.base" output="false">
	<!---
		The basic init function 
	--->
	<cffunction name="init" access="public" returntype="component" output="false">
		<cfreturn this />
	</cffunction>
	
	<!---
		Takes a input and attempts to read the information into an object.
		<p>
		Reads input in the following formats:
		<ul>
			<li>Struct</li>
			<li>Query</li>
			<li>XML</li>
		</ul>
		<p>
		Has the ability to read all keys from the input instead of just the keys
		already defined in the object by using the doComplete flag.
	--->
	<cffunction name="deserialize" access="public" returntype="component" output="false">
		<cfargument name="input" type="any" required="true" />
		<cfargument name="object" type="component" required="false" />
		<cfargument name="doComplete" type="boolean" default="false" />
		
		<cfset var i = '' />
		<cfset var j = '' />
		<cfset var exists = '' />
		<cfset var instance = '' />
		<cfset var value = '' />
		<cfset var messages = [] />
		<cfset var result = '' />
		<cfset var value = '' />
		
		<!--- Figure out the type --->
		<cfif not isSimpleValue(arguments.input) and isStruct(arguments.input) and not isXML(arguments.input)>
			<!--- Try to create the object from the structure information --->
			<cfset result = (structKeyExists(arguments, 'object') and isObject(arguments.object) ? arguments.object : getObject(arguments.input)) />
			
			<!--- Read in the object from a struct --->
			<cfloop list="#(arguments.doComplete ? structKeyList(arguments.input) : result.get__keyList())#" index="i">
				<cftry>
					<!--- If it exists in the struct pull it in --->
					<cfif structKeyExists(arguments.input, i)>
						<cfif isSimpleValue(arguments.input[i])>
							<cfinvoke component="#result#" method="set#i#">
								<cfinvokeargument name="value" value="#trim(arguments.input[i])#" />
							</cfinvoke>
						<cfelseif isStruct(arguments.input[i]) and structKeyExists(arguments.input[i], '__fullname')>
							<!--- Check if there is a fullname of a component defined that needs to be instantiated --->
							<cfinvoke component="#result#" method="set#i#">
								<cfinvokeargument name="value" value="#this.deserialize(arguments.input[i])#" />
							</cfinvoke>
						<cfelseif isArray(arguments.input[i])>
							<!--- Check if there is a fullname of a component defined that needs to be instantiated --->
							<cfloop from="1" to="#arrayLen(arguments.input[i])#" index="j">
								<cfif isStruct(arguments.input[i]) and structKeyExists(arguments.input[i], '__fullname')>
									<!--- Check if there is a fullname of a component defined that needs to be instantiated --->
									<cfinvoke component="#result#" method="set#i#">
										<cfinvokeargument name="value" value="#this.deserialize(arguments.input[i])#" />
									</cfinvoke>
								</cfif>
							</cfloop>
							
							<cfinvoke component="#result#" method="set#i#">
								<cfinvokeargument name="value" value="#arguments.input[i]#" />
							</cfinvoke>
						<cfelse>
							<cfinvoke component="#result#" method="set#i#">
								<cfinvokeargument name="value" value="#arguments.input[i]#" />
							</cfinvoke>
						</cfif>
					</cfif>
					
					<!--- Catch any validation errors --->
					<cfcatch type="validation">
						<cfset arrayAppend(messages, cfcatch.message) />
					</cfcatch>
				</cftry>
			</cfloop>
		<cfelseif isQuery(arguments.input)>
			<!--- Try to create the object from the structure information --->
			<cfset result = (structKeyExists(arguments, 'object') and isObject(arguments.object) ? arguments.object : getObject(arguments.input)) />
			
			<cfset instance = result.get__instance() />
			
			<!--- Read in the object from a query --->
			<cfloop list="#(arguments.doComplete ? structKeyList(arguments.input) : result.get__keyList())#" index="i">
				<cftry>
					<!--- If it exists in the query pull it in --->
					<cfif listFindNoCase(arguments.input.columnList, i)>
						<!--- If the current value is an array it should be pulled in as an array --->
						<cfif isArray(instance[i])>
							<!--- Reset the value --->
							<cfinvoke component="#result#" method="reset#i#" />
							
							<!--- Loop through and append --->
							<cfloop query="arguments.input">
								<cfset value = arguments.input[i] />
								
								<cfinvoke component="#result#" method="add#i#">
									<cfinvokeargument name="value" value="#trim(value)#" />
								</cfinvoke>
							</cfloop>
						<cfelse>
							<cfset value = arguments.input[i] />
							
							<cfinvoke component="#result#" method="set#i#">
								<cfinvokeargument name="value" value="#trim(value)#" />
							</cfinvoke>
						</cfif>
					</cfif>
					
					<!--- Catch any validation errors --->
					<cfcatch type="validation">
						<cfset arrayAppend(messages, cfcatch.message) />
					</cfcatch>
				</cftry>
			</cfloop>
		<cfelseif isXML(arguments.input)>
			<!--- Check for the xml root --->
			<cfif structKeyExists(arguments.input, 'xmlRoot')>
				<cfset arguments.input = arguments.input.xmlRoot />
			</cfif>
			
			<!--- Try to create the object from the structure information --->
			<cfset result = (structKeyExists(arguments, 'object') and isObject(arguments.object) ? arguments.object : getObject(arguments.input)) />
			
			<cfset instance = result.get__instance() />
			
			<!--- Read in the object from xml --->
			<cfloop list="#(arguments.doComplete ? structKeyList(arguments.input) : result.get__keyList())#" index="i">
				<!--- If the current value is an array it should be pulled in as an array --->
				<cfif isArray(instance[i])>
					<!--- Check if it exists as a child --->
					<cfset exists = false />
					
					<cfloop array="#arguments.input.xmlChildren#" index="j">
						<cfif j.xmlName eq i>
							<cfset exists = true />
							
							<cfbreak />
						</cfif>
					</cfloop>
					
					<!--- Pull in the values --->
					<cfif exists>
						<!--- Reset the value --->
						<cfinvoke component="#result#" method="reset#i#" />
						
						<cfloop array="#arguments.input.xmlChildren#" index="j">
							<cftry>
								<cfif j.xmlName eq i>
									<cfinvoke component="#result#" method="add#i#">
										<cfinvokeargument name="value" value="#trim(j.xmlText)#" />
									</cfinvoke>
								</cfif>
								
								<!--- Catch any validation errors --->
								<cfcatch type="validation">
									<cfset arrayAppend(messages, cfcatch.message) />
								</cfcatch>
							</cftry>
						</cfloop>
					</cfif>
				<cfelse>
					<!--- If it exists in the xml attributes pull it in --->
					<cfif structKeyExists(arguments.input.xmlAttributes, i)>
						<cftry>
							<cfinvoke component="#result#" method="set#i#">
								<cfinvokeargument name="value" value="#trim(arguments.input.xmlAttributes[i])#" />
							</cfinvoke>
							
							<!--- Catch any validation errors --->
							<cfcatch type="validation">
								<cfset arrayAppend(messages, cfcatch.message) />
							</cfcatch>
						</cftry>
					</cfif>
				</cfif>
			</cfloop>
		<cfelseif isJSON(arguments.input)>
			<!--- Read in the object from json --->
			<cfset result = this.deserialize(deserializeJSON(arguments.input)) />
		<cfelse>
			<cfthrow message="Cannot read the object from given input" detail="At this time the format of the input is not able to be read into the object." />
		</cfif>
		
		<!--- Check if there were any validation errors to rethrow --->
		<cfif arrayLen(messages)>
			<cfthrow type="validation" message="#arrayToList(messages, '|')#" />
		</cfif>
		
		<cfreturn result />
	</cffunction>
	
	<!--- Create an object to deserialize input into --->
	<cffunction name="getObject" access="private" returntype="component" output="false">
		<cfargument name="input" type="any" required="true" />
		
		<!--- Figure out the type --->
		<cfif (isStruct(arguments.input) or isQuery(arguments.input)) and structKeyExists(arguments.input, '__fullname')>
			<cfreturn createObject('component', arguments.input['__fullname']).init() />
		<cfelseif isXML(arguments.input) and structKeyExists(arguments.input.xmlAttributes, '__fullname')>
			<cfreturn createObject('component', arguments.input.xmlAttributes['__fullname']).init() />
		</cfif>
		
		<!--- Default to a normal object --->
		<cfreturn createObject('component', 'cf-compendium.inc.resource.base.object').init() />
	</cffunction>
	
	<!---
		Used to serialize the object into a given format type
	--->
	<cffunction name="serialize" access="public" returntype="any" output="false">
		<cfargument name="object" type="component" default="struct" />
		<cfargument name="format" type="string" default="struct" />
		
		<cfset var output = '' />
		<cfset var instance = '' />
		<cfset var inner = '' />
		<cfset var i = '' />
		<cfset var j = '' />
		
		<cfset instance = arguments.object.get__instance() />
		
		<cfswitch expression="#arguments.format#">
			<cfcase value="struct">
				<!--- Duplicate the instance variables into a struct --->
				<cfset output = instance />
				
				<!--- Add some of the meta information --->
				<cfset output['__fullname'] = arguments.object.get__fullname() />
				<cfset output['__name'] = arguments.object.get__name() />
			</cfcase>
			<cfcase value="xml">
				<!--- Generate the xml --->
				<cfset output &= '<example' />
				
				<!--- Output the attributes --->
				<cfloop list="#arguments.object.get__keyList()#" index="i">
					<!--- Can handle a nested object? --->
					<cfif isObject(instance[i])>
						<cfset inner &= chr(10) & instance[i].serialize('xml') />
					<cfelseif isArray(instance[i])>
						<!--- Loop and show each element --->
						<cfloop array="#instance[i]#" index="j">
							<cfset inner &= chr(10) & '	<' & i & '>' />
							
							<cfif isObject(j)>
								<!--- Handles other objects --->
								<cfset inner &= chr(10) & j.serialize('xml') />
							<cfelse>
								<!--- Handles basic types --->
								<cfset inner &= chr(10) & j />
							</cfif>
							
							<cfset inner &= chr(10) & '</' & i & '>' />
						</cfloop>
					<cfelse>
						<cfset output &= chr(10) & ' ' & i & '="' & instance[i] & '"' />
					</cfif>
				</cfloop>
				
				<cfset output &= '>' />
				
				<cfset output &= inner />
				
				<cfset output &= '</example>' />
			</cfcase>
			
			<cfcase value="json">
				<!--- Serialize the struct output to a json format --->
				<cfset output = serializeJSON(this.serialize(arguments.object, 'struct')) />
			</cfcase>
			
			<cfdefaultcase>
				<cfthrow message="Cannot output the object as a #arguments.format#" detail="At this time the #arguments.format# format is not available." />
			</cfdefaultcase>
		</cfswitch>
		
		<cfreturn output />
	</cffunction>
</cfcomponent>