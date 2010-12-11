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
	<cffunction name="deserialize" access="public" returntype="any" output="false">
		<cfargument name="input" type="any" required="true" />
		<cfargument name="object" type="component" required="false" />
		<cfargument name="doComplete" type="boolean" default="false" />
		<cfargument name="isTrustedSource" type="boolean" default="false" />
		
		<cfset var i = '' />
		<cfset var j = '' />
		<cfset var exists = '' />
		<cfset var instance = '' />
		<cfset var keys = '' />
		<cfset var messages = [] />
		<cfset var result = '' />
		<cfset var value = '' />
		<cfset var useObject = '' />
		
		<!--- Figure out the type --->
		<cfif structKeyExists(arguments, 'object') and isObject(arguments.object)>
			<cfset result = arguments.object />
		<cfelseif arguments.isTrustedSource>
			<!--- Try to create the object from the structure information --->
			<cfset result = getObject(arguments.input) />
		<cfelse>
			<cfset result = {} />
		</cfif>
		
		<cfset useObject = isObject(result) />
		
		<cfif isStruct(arguments.input)>
			<!--- Get the keys to fill --->
			<cfif useObject>
				<cfset keys = arguments.doComplete ? structKeyList(arguments.input) : result.get__keyList() />
			<cfelse>
				<cfset keys = structKeyList(arguments.input) />
			</cfif>
			
			<!--- Read in the object from a struct --->
			<cfloop list="#keys#" index="i">
				<cftry>
					<!--- If it exists in the struct pull it in --->
					<cfif structKeyExists(arguments.input, i)>
						<cfif isSimpleValue(arguments.input[i])>
							<cfif useObject>
								<cfinvoke component="#result#" method="set#i#">
									<cfinvokeargument name="value" value="#trim(arguments.input[i])#" />
								</cfinvoke>
							<cfelse>
								<cfset result[i] = trim(arguments.input[i]) />
							</cfif>
						<cfelseif isArray(arguments.input[i])>
							<cfif !useObject>
								<cfset result[i] = [] />
							</cfif>
							
							<cfloop from="1" to="#arrayLen(arguments.input[i])#" index="j">
								<cfif useObject>
									<cfinvoke component="#result#" method="add#i#">
										<cfinvokeargument name="value" value="#this.deserialize(input = arguments.input[i][j], doComplete = arguments.doComplete, isTrustedSource = arguments.isTrustedSource)#" />
									</cfinvoke>
								<cfelse>
									<cfset arrayAppend(result[i], this.deserialize(input = arguments.input[i][j], doComplete = arguments.doComplete, isTrustedSource = arguments.isTrustedSource)) />
								</cfif>
							</cfloop>
						<cfelse>
							<cfif useObject>
								<cfinvoke component="#result#" method="set#i#">
									<cfinvokeargument name="value" value="#this.deserialize(input = arguments.input[i], doComplete = arguments.doComplete, isTrustedSource = arguments.isTrustedSource)#" />
								</cfinvoke>
							<cfelse>
								<cfset result[i] = this.deserialize(input = arguments.input[i], doComplete = arguments.doComplete, isTrustedSource = arguments.isTrustedSource) />
							</cfif>
						</cfif>
					</cfif>
					
					<!--- Catch any validation errors --->
					<cfcatch type="validation">
						<cfset arrayAppend(messages, cfcatch.message) />
					</cfcatch>
				</cftry>
			</cfloop>
		<cfelseif isQuery(arguments.input)>
			<cfif useObject>
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
			<cfelse>
				<cfset result = arguments.input />
			</cfif>
		<cfelseif isJSON(arguments.input)>
			<!--- Read in the object from json --->
			<cfset result = this.deserialize(input = deserializeJSON(arguments.input), doComplete = arguments.doComplete, isTrustedSource = arguments.isTrustedSource) />
		<cfelse>
			<!--- Don't know anything special to do with it... --->
			<cfset result = arguments.input />
		</cfif>
		
		<!--- Check if there were any validation errors to rethrow --->
		<cfif arrayLen(messages)>
			<cfthrow type="validation" message="#arrayToList(messages, '|')#" />
		</cfif>
		
		<cfreturn result />
	</cffunction>
	
	<!--- Create an object to deserialize input into --->
	<cffunction name="getObject" access="private" returntype="any" output="false">
		<cfargument name="input" type="any" required="true" />
		
		<!--- Figure out the type --->
		<cfif (isStruct(arguments.input) or isQuery(arguments.input)) and structKeyExists(arguments.input, '__fullname')>
			<cfreturn createObject('component', arguments.input['__fullname']).init() />
		</cfif>
		
		<!--- Default to a struct --->
		<cfreturn {} />
	</cffunction>
<cfscript>
	// Used to serialize the object into a given format type
	public any function serialize( required any source, string format = 'struct' ) {
		var i = '';
		var inner = '';
		var instance = '';
		var j = '';
		var key = '';
		var keys = '';
		var result = '';
		
		result = arguments.source;
		
		switch(arguments.format) {
			case 'struct':
				if(isObject(result) && structKeyExists(result, 'get__instance')) {
					result = result.get__instance();
					
					// Handle nested objects
					for( key in result ) {
						result[key] = this.serialize(result[key], 'struct');
					}
					
					// Add meta information
					result['__fullname'] = arguments.source.get__fullname();
					result['__name'] = arguments.source.get__name();
				} else if(isArray(result)) {
					for(i = 1; i <= arrayLen(result); i++) {
						if(!isSimplevalue(result[i])) {
							result[i] = this.serialize(result[i], 'struct');
						}
					}
				} else if(isStruct(result)) {
					for( key in result ) {
						result[key] = this.serialize(result[key], 'struct');
					}
				}
				
				break;
			case 'json':
				result = serializeJSON(this.serialize(arguments.source, 'struct'));
				
				break;
			default:
				throw(message="Cannot result the object as a #arguments.format#", detail="At this time the #arguments.format# format is not available.");
		}
		
		return result;
	}
</cfscript>
</cfcomponent>
