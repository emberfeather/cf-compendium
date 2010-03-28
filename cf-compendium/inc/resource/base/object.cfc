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
		<cfset variables.instance = {} />
		
		<cfreturn this />
	</cffunction>
	
	<!---
		Used to return a copy of the instance variables.
	--->
	<cffunction name="get__instance" access="public" returntype="struct" output="false">
		<cfreturn duplicate(variables.instance) />
	</cffunction>
	
	<!---
		Used to return a list of all the keys publicly available 
		through the dynamic setters and getters.
	--->
	<cffunction name="get__keyList" access="public" returntype="string" output="false">
		<cfreturn structKeyList(variables.instance) />
	</cffunction>
	
	<!---
		Checks for the existance of a key
	--->
	<cffunction name="has__key" access="public" returntype="boolean" output="false">
		<cfargument name="keyName" type="string" required="true" />
		
		<cfreturn structKeyExists(variables.instance, arguments.keyName) />
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
		<cfset result = reFindNoCase('^(get|set|addUnique|add|length|has|reset)(.+)', arguments.missingMethodName, 1, true) />
		
		<!--- If we find don't find anything --->
		<cfif not result.pos[1]>
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
				<cfif not structKeyExists(variables.instance, attribute) or not isArray(variables.instance[attribute])>
					<cfset variables.instance[attribute] = [] />
				</cfif>
				
				<!--- Add each of the arguments --->
				<cfloop array="#arguments.missingMethodArguments#" index="i">
					<cfif prefix eq 'addUnique'>
						<cfset isUnique = true />
						
						<!--- Check if it is already in the array --->
						<cfloop array="#variables.instance[attribute]#" index="j">
							<cfif j eq i>
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
				<cfif not result.pos[1]>
					<cfif left(attribute, 2) EQ '__'>
						<cfset result = getMetaData(this) />
						
						<!--- If it's just the __, return the meta information --->
						<cfif attribute EQ '__'>
							<cfreturn result />
						</cfif>
						
						<!--- Check for it in the meta data for the component --->
						<cfif structKeyExists(result, right(attribute, len(attribute) - 2))>
							<cfreturn result[right(attribute, len(attribute) - 2)] />
						</cfif>
					</cfif>
					
					<!--- Simple get --->
					<cfreturn variables.instance[attribute] />
				<cfelse>
					<!--- Search --->
					
					<!--- Find the child attribute --->
					<cfif result.len[3]>
						<cfset childAttribute = mid(attribute, result.pos[3], result.len[3]) />
					<cfelseif not arrayLen(arguments.missingMethodArguments)>
						<!--- If we didn't provide anything to search on just do a simple get --->
						<cfreturn variables.instance[attribute & 'By'] />
					</cfif>
					
					<!--- Find the attribute after the child attribute --->
					<cfset attribute = mid(attribute, result.pos[2], result.len[2]) />
					
					<!--- Get the attibute set to search --->
					<cfinvoke component="#this#" method="get#attribute#" returnvariable="attributeSet" />
					
					<!--- Check if it is an array --->
					<cfif not isArray(attributeSet)>
						<cfthrow message="Cannot find matches" detail="In order to find matching attibutes the attribute much be an array." />
					</cfif>
					
					<!--- Create the return array --->
					<cfset result = [] />
					
					<!--- Loop through and find the matches --->
					<cfloop array="#attributeSet#" index="i">
						<!--- Does this require an additional get? --->
						<cfif childAttribute neq '' and isObject(i)>
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
			
			<cfcase value="has">
				<cfreturn this.has__key(attribute) />
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
	<cffunction name="set__properties" access="private" output="false">
		<cfargument name="defaults" type="struct" required="true" />
		<cfargument name="values" type="struct" default="#{}#" />
		
		<!--- Set the variables instance --->
		<cfset variables.instance = extend(arguments.defaults, arguments.values) />
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
</cfcomponent>