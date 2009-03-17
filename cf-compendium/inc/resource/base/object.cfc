<!---
	Acts as the base for all objects to be based upon.
	Supports dynamic set and get function.
	Also has a default init function.
	Based upon code by Hal Helms and modified from there. 
--->
<cfcomponent extends="cf-compendium.inc.resource.base.base" output="false">
	<!---
		The basic init function 
	--->
	<cffunction name="init" access="public" returntype="component" output="false">
		<cfargument name="i18n" type="component" required="true" />
		<cfargument name="locale" type="string" default="en_US" />
		
		<cfset variables.instance = {} />
		<cfset variables.attributes = {} />
		<cfset variables.attributeOrder = '' />
		
		<cfset variables.i18n = {
				i18n = arguments.i18n,
				locale = arguments.locale,
				bundlePath = 'cf-compendium/i18n/resource/base',
				bundleName = 'object'
			} />
		
		<cfset variables.validation = {
				bundlePath = 'cf-compendium/i18n/resource/utility',
				bundleName = 'validation',
				componentPath = 'cf-compendium.inc.resource.utility.validation'
			} />
		
		<cfreturn this />
	</cffunction>
	
	<!---
		Used to add an attribute to the object with it's meta information
	--->
	<cffunction name="addAttribute" access="public" returntype="void" output="false">
		<cfargument name="attribute" type="string" required="true" />
		<cfargument name="defaultValue" type="any" default="" />
		<cfargument name="validation" type="struct" default="#structNew()#" />
		<cfargument name="form" type="struct" default="#structNew()#" />
		
		<cfset variables.attributes[arguments.attribute] = arguments />
		
		<!--- Add to the attribute order --->
		<cfset variables.attributeOrder = listAppend(variables.attributeOrder, arguments.attribute) />
		
		<cfset variables.instance[arguments.attribute] = arguments.defaultValue />
	</cffunction>
	
	<!---
		Takes a input and attempts to read the information needed for the object.
		<p>
		Reads input in the following formats:
		<ul>
		<li>Struct
		<li>Query
		<li>XML
		</ul>
	--->
	<cffunction name="deserialize" access="public" returntype="void" output="false">
		<cfargument name="input" type="any" required="true" />
		
		<cfset var i = '' />
		<cfset var j = '' />
		<cfset var exists = '' />
		<cfset var messages = [] />
		
		<!--- Figure out the type --->
		<cfif isXML(arguments.input)>
			<!--- Read in the object from xml --->
			<cfloop list="#structKeyList(variables.instance)#" index="i">
				<!--- Check for the xml root --->
				<cfif structKeyExists(arguments.input, 'xmlRoot')>
					<cfset arguments.input = arguments.input.xmlRoot />
				</cfif>
				
				<!--- If the current value is an array it should be pulled in as an array --->
				<cfif isArray(variables.instance[i])>
					<!--- Check if it exists as a child --->
					<cfset exists = false />
					
					<cfloop array="#arguments.input.xmlChildren#" index="j">
						<cfif j.xmlName EQ i>
							<cfset exists = true />
							
							<cfbreak />
						</cfif>
					</cfloop>
					
					<!--- Pull in the values --->
					<cfif exists>
						<!--- Reset the value --->
						<cfset variables.instance[i] = [] />
						
						<cfloop array="#arguments.input.xmlChildren#" index="j">
							<cftry>
								<cfif j.xmlName EQ i>
									<cfinvoke component="#this#" method="add#i#">
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
							<cfinvoke component="#this#" method="set#i#">
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
		<cfelseif isStruct(arguments.input)>
			<!--- Read in the object from a struct --->
			<cfloop list="#structKeyList(variables.instance)#" index="i">
				<cftry>
					<!--- If it exists in the struct pull it in --->
					<cfif structKeyExists(arguments.input, i)>
						<cfif isSimpleValue(arguments.input[i])>
							<cfinvoke component="#this#" method="set#i#">
								<cfinvokeargument name="value" value="#trim(arguments.input[i])#" />
							</cfinvoke>
						<cfelse>
							<cfinvoke component="#this#" method="set#i#">
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
			<!--- Read in the object from a query --->
			<cfloop list="#structKeyList(variables.instance)#" index="i">
				<cftry>
					<!--- If it exists in the query pull it in --->
					<cfif structKeyExists(arguments.input, i)>
						<!--- If the current value is an array it should be pulled in as an array --->
						<cfif isArray(variables.instance[i])>
							<!--- Reset the value --->
							<cfset variables.instance[i] = [] />
							
							<!--- Loop through and append --->
							<cfloop query="arguments.input">
								<cfinvoke component="#this#" method="add#i#">
									<cfinvokeargument name="value" value="#trim(arguments.input[i])#" />
								</cfinvoke>
							</cfloop>
						<cfelse>
							<cfinvoke component="#this#" method="set#i#">
								<cfinvokeargument name="value" value="#trim(arguments.input[i])#" />
							</cfinvoke>
						</cfif>
					</cfif>
					
					<!--- Catch any validation errors --->
					<cfcatch type="validation">
						<cfset arrayAppend(messages, cfcatch.message) />
					</cfcatch>
				</cftry>
			</cfloop>
		<cfelseif isJSON(arguments.input)>
			<!--- Read in the object from json --->
			<cfset this.deserialize(deserializeJSON(arguments.input)) />
		<cfelse>
			<cfthrow message="Cannot read the object from given input" detail="At this time the format of the input is not able to be read into the object." />
		</cfif>
		
		<!--- Check if there were any validation errors to rethrow --->
		<cfif arrayLen(messages)>
			<cfthrow type="validation" message="#arrayToList(messages, '|')#" />
		</cfif>
	</cffunction>
	
	<!---
		Used to get an attribute
	--->
	<cffunction name="getAttribute" access="public" returntype="struct" output="false">
		<cfargument name="attribute" type="string" required="true" />
		
		<cfreturn variables.attributes[arguments.attribute] />
	</cffunction>
	
	<!---
		Used to get an attribute's label
	--->
	<cffunction name="getAttributeLabel" access="public" returntype="string" output="false">
		<cfargument name="attribute" type="string" required="true" />
		
		<!--- Make sure that we have a bundle object --->
		<cfif NOT structKeyExists(variables.i18n, 'bundle')>
			<cfset variables.i18n.bundle = variables.i18n.i18n.getResourceBundle(variables.i18n.bundlePath, variables.i18n.bundleName, variables.i18n.locale) />
		</cfif>
		
		<cfreturn variables.i18n.bundle.getValue(attribute) />
	</cffunction>
	
	<!---
		Used to return a list of all the attributes publicly available 
		through the dynamic setters and getters.
	--->
	<cffunction name="getAttributeList" access="public" returntype="string" output="false">
		<cfreturn variables.attributeOrder />
	</cffunction>
	
	<!---
		Used to handle dynamic setters, getters, adders, adduniquers, and getterbyers
	--->
	<cffunction name="onMissingMethod" access="public" returntype="any" output="false">
		<cfargument name="missingMethodName" type="string" required="true" />
		<cfargument name="missingMethodArguments" type="struct" required="true" />
		
		<cfset var attribute = '' />
		<cfset var attributeSet = '' />
		<cfset var attributeValue = '' />
		<cfset var childAttribute = '' />
		<cfset var i = '' />
		<cfset var isUnique = '' />
		<cfset var j = '' />
		<cfset var prefix = '' />
		<cfset var result = '' />
		
		<!--- Do a regex on the name --->
		<cfset result = reFindNoCase('^(get|set|addUnique|add|length|reset)(.+)', arguments.missingMethodName, 1, true) />
		
		<!--- If we find don't find anything --->
		<cfif NOT result.pos[1]>
			<cfthrow message="Function not found" detail="The component has no function with name the name #arguments.missingMethodName#" />
		</cfif>
		
		<!--- Find the prefix --->
		<cfset prefix = mid(arguments.missingMethodName, result.pos[2], result.len[2]) />
		
		<!--- Find the attribute --->
		<cfset attribute = mid(arguments.missingMethodName, result.pos[3], result.len[3]) />
		
		<!--- Do the fun stuff --->
		<cfswitch expression="#prefix#">
			<cfcase value="add,addUnique">
				<!--- If it doesn't exist or isn't an array make it into an array --->
				<cfif NOT structKeyExists(variables.instance, attribute) OR NOT isArray(variables.instance[attribute])>
					<cfset variables.instance[attribute] = [] />
				</cfif>
				
				<!--- Add each of the arguments --->
				<cfloop array="#arguments.missingMethodArguments#" index="i">
					<cfif prefix EQ 'addUnique'>
						<cfset isUnique = true />
						
						<!--- Check if it is already in the array --->
						<cfloop array="#variables.instance[attribute]#" index="j">
							<cfif j EQ i>
								<cfset isUnique = false />
								
								<cfbreak />
							</cfif>
						</cfloop>
						
						<cfif isUnique>
							<cfset arrayAppend( variables.instance[attribute], i ) />
						</cfif>
					<cfelse>
						<cfset arrayAppend( variables.instance[attribute], i ) />
					</cfif>
				</cfloop>
			</cfcase>
			
			<cfcase value="get">
				<cfset result = reFindNoCase('(.+)By(.*)', attribute, 1, true) />
				
				<!--- Check if it is a simple get or a search --->
				<cfif NOT result.pos[1]>
					<!--- Simple get --->
					<cfreturn variables.instance[attribute] />
				<cfelse>
					<!--- Search --->
					
					<!--- Find the child attribute --->
					<cfif result.len[3]>
						<cfset childAttribute = mid(attribute, result.pos[3], result.len[3]) />
					</cfif>
					
					<!--- Find the attribute --->
					<cfset attribute = mid(attribute, result.pos[2], result.len[2]) />
					
					<!--- Get the attibute set to search --->
					<cfinvoke component="#this#" method="get#attribute#" returnvariable="attributeSet" />
					
					<!--- Check if it is an array --->
					<cfif NOT isArray(attributeSet)>
						<cfthrow message="Cannot find matches" detail="In order to find matching attibutes the attribute much be an array." />
					</cfif>
					
					<!--- Create the return array --->
					<cfset result = [] />
					
					<!--- Loop through and find the matches --->
					<cfloop array="#attributeSet#" index="i">
						<!--- Does this require an additional get? --->
						<cfif childAttribute NEQ '' AND isObject(i)>
							<cfinvoke component="#i#" method="get#childAttribute#" returnvariable="attributeValue" />
						<cfelse>
							<cfset attributeValue = i />
						</cfif>
						
						<!--- Do the comparison --->
						<cfif reFind(arguments.missingMethodArguments[1], attributeValue)>
							<!--- TODO can't duplicate objects? --->
							<!--- <cfset arrayAppend( result, duplicate(i) ) /> --->
							<cfset arrayAppend( result, i ) />
						</cfif>
					</cfloop>
					
					<cfreturn result />
				</cfif>
			</cfcase>
			
			<cfcase value="length">
				<cfif isArray(variables.instance[attribute])>
					<cfreturn arrayLen(variables.instance[attribute]) />
				<cfelseif isStruct(variables.instance[attribute])>
					<cfreturn structCount(variables.instance[attribute]) />
				<cfelseif isSimpleValue(variables.instance[attribute])>
					<cfreturn len(variables.instance[attribute]) />
				</cfif>
			</cfcase>
			
			<cfcase value="reset">
				<cfset variables.instance[attribute] = [] />
			</cfcase>
			
			<cfcase value="set">
				<!--- Check for any validation given in the attribute meta --->
				<cfif structKeyExists(variables.attributes, attribute) AND NOT structIsEmpty(variables.attributes[attribute].validation)>
					<!--- Make sure that we have a validator object --->
					<cfif NOT structKeyExists(variables, 'validator')>
						<cfset variables.validator = variables.i18n.i18n.getValidation(variables.i18n.locale, variables.validation.bundlePath, variables.validation.bundleName, variables.validation.componentPath) />
					</cfif>
					
					<!--- Try to validate with each of the specified tests against the validation object --->
					<cfloop list="#structKeyList(variables.attributes[attribute].validation)#" index="i">
						<cfinvoke component="#variables.validator#" method="#i#">
							<cfinvokeargument name="title" value="#getAttributeLabel(attribute)#" />
							<cfinvokeargument name="value" value="#arguments.missingMethodArguments[1]#" />
							<cfinvokeargument name="extra" value="#variables.attributes[attribute].validation[i]#" />
						</cfinvoke>
					</cfloop>
				</cfif>
				
				<!--- Set the value --->
				<cfset variables.instance[attribute] = arguments.missingMethodArguments[1] />
			</cfcase>
		</cfswitch>
	</cffunction>
	
	<!--- 
		Extend the variables to use the default if it is not defined in the arguments.
		<p>
		Similar in idea to the way jQuery uses extend with variables.
	--->
	<cffunction name="properties" access="private" output="false">
		<cfargument name="defaults" type="struct" required="true" />
		<cfargument name="values" type="struct" default="#structNew()#" />
		
		<!--- Set the variables instance --->
		<cfset variables.instance = this.extend(arguments.defaults, arguments.values) />
	</cffunction>
	
	<!---
		Dumps out the instance struct for the object
	--->
	<cffunction name="print" access="public" returntype="void" output="true">
		<cfdump var="#variables.instance#" />
	</cffunction>
	
	<!---
		Dumps out the instance struct for the object
	--->
	<cffunction name="printSet" access="public" returntype="void" output="true">
		<cfset var i = '' />
		
		<cfloop array="#variables.instance#" index="i">
			<cfif isObject(i)>
				<cfset i.print() />
			<cfelse>
				<cfdump var="#variables.instance#" />
			</cfif>
		</cfloop>
	</cffunction>
	
	<!---
		Used to serialize the object into a given format type
	--->
	<cffunction name="serialize" access="public" returntype="any" output="false">
		<cfargument name="format" type="string" default="struct" />
		
		<cfset var output = '' />
		<cfset var inner = '' />
		<cfset var i = '' />
		<cfset var j = '' />
		
		<cfswitch expression="#arguments.format#">
			<cfcase value="struct">
				<!--- Duplicate the instance variables into a struct --->
				<cfset output = duplicate(variables.instance) />
			</cfcase>
			<cfcase value="xml">
				<!--- Generate the xml --->
				<cfset output &= '<example' />
				
				<!--- Output the attributes --->
				<cfloop list="#structKeyList(variables.instance)#" index="i">
					<!--- Can handle a nested object? --->
					<cfif isObject(variables.instance[i])>
						<cfset inner &= chr(10) & variables.instance[i].serialize('xml') />
					<cfelseif isArray(variables.instance[i])>
						<!--- Loop and show each element --->
						<cfloop array="#variables.instance[i]#" index="j">
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
						<cfset output &= chr(10) & ' ' & i & '="' & variables.instance[i] & '"' />
					</cfif>
				</cfloop>
				
				<cfset output &= '>' />
				
				<cfset output &= inner />
				
				<cfset output &= '</example>' />
			</cfcase>
			<cfcase value="json">
				<!--- Serialize the struct output to a json format --->
				<cfset output = serializeJSON(this.serialize('struct')) />
			</cfcase>
			<cfdefaultcase>
				<cfthrow message="Cannot output the object as a #arguments.format#" detail="At this time the #arguments.format# format is not available." />
			</cfdefaultcase>
		</cfswitch>
		
		<cfreturn output />
	</cffunction>
	
	<!---
		Used to set the bundle information for the object
	--->
	<cffunction name="setI18NBundle" access="public" returntype="void" output="false">
		<cfargument name="bundlePath" type="string" required="true" />
		<cfargument name="bundleName" type="string" required="true" />
		
		<cfset variables.i18n.bundlePath = arguments.bundlePath />
		<cfset variables.i18n.bundleName = arguments.bundleName />
	</cffunction>
</cfcomponent>