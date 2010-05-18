<cfcomponent output="false">
	<cffunction name="init" access="public" returntype="component" output="false">
		<cfreturn this />
	</cffunction>
	
	<!--- 
		Compare the two elements and return true if they contain the same key value pairs, 
		regardless of ordering 
	--->
	<cffunction name="areEquivalent" access="public" returntype="boolean" output="false">
		<cfargument name="element1" type="any" required="true" />
		<cfargument name="element2" type="any" required="true" />
		<cfargument name="delimiter" type="string" default="," />
		
		<cfreturn equivalent(arguments.element1, arguments.element2, arguments.delimiter)>
	</cffunction>
	
	<!--- 
		Will compare all the items in the first row of the multidimensional array.
		If there are any differences in any of the cells, it will return false.
		Otherwise will return true.
	--->
	<cffunction name="areEquivalentSet" access="public" returntype="boolean" output="false">
		<cfset var equalSet = [] />
		<cfset var i = '' />
		<cfset var numArgs = arrayLen(arguments) />
		
		<!--- Need to at least call the function with something --->
		<cfif not numArgs>
			<cfthrow message="Cannot compare nothing" detail="Cannot do a comparision with the absence of everything" />
		</cfif>
		
		<!---
			Look at each item and make sure that the uniquetofirst attribute is zero.
			If there are any items in the array that have a unique value, drop out and return false.
		--->
		<cfloop from="2" to="#numArgs#" index="i">
			<cfif not equivalent(arguments[1], arguments[i])>
				<cfreturn false />
			</cfif>
		</cfloop>
		
		<cfreturn true />
	</cffunction>
	
	<!---
		Used to equivalent two arguments similar to the way a simple venn diagram works
	--->
	<cffunction name="equivalent" access="public" returntype="boolean" output="false">
		<cfargument name="element1" type="any" required="true" />
		<cfargument name="element2" type="any" required="true" />
		<cfargument name="delimiter" type="string" default="," />
		
		<cfset var set1 = '' />
		<cfset var set2 = '' />
		<cfset var uniqueList = '' />
		<cfset var i = '' />
		
		<!--- Set what we are going to equivalent --->
		<cfif isSimpleValue(arguments.element1)>
			<cfif not isSimpleValue(arguments.element2)>
				<cfreturn false />
			</cfif>
			
			<!--- Check if they are different lengths --->
			<cfif listLen(arguments.element1, arguments.delimiter) neq listLen(arguments.element2, arguments.delimiter)>
				<cfreturn false />
			</cfif>
			
			<cfloop from="1" to="#listLen(arguments.element1)#" index="i" delimiters="#arguments.delimiter#">
				<cfif listGetAt(arguments.element1, i, arguments.delimiter) neq listGetAt(arguments.element2, i, arguments.delimiter)>
					<cfreturn false />
				</cfif>
			</cfloop>
		<cfelseif isStruct(arguments.element1)>
			<cfset set1 = structKeyList(arguments.element1, arguments.delimiter) />
			
			<cfif not isStruct(arguments.element2)>
				<cfreturn false />
			</cfif>
			
			<cfset set2 = structKeyList(arguments.element2, arguments.delimiter) />
			
			<!--- Check if they are different lengths --->
			<cfif listLen(set1, arguments.delimiter) neq listLen(set2, arguments.delimiter)>
				<cfreturn false />
			</cfif>
			
			<!--- check if there is a mismatch between keys --->
			<cfloop list="#set1##arguments.delimiter##set2#" index="i" delimiters="#arguments.delimiter#">
				<!--- Make sure we haven't alreadly looked at this value --->
				<cfif not listFindNoCase(uniqueList, i, arguments.delimiter)>
					<!--- Check where it exists --->
					<cfif not ( listFindNoCase(set1, i, arguments.delimiter) and listFindNoCase(set2, i, arguments.delimiter) )>
						<cfreturn false />
					</cfif>
					
					<!--- Add to the unique list so we don't do it again --->
					<cfset uniqueList = listAppend(uniqueList, i, arguments.delimiter) />
				</cfif>
			</cfloop>
			
			<!--- check if there is a mismatch between keys --->
			<cfloop list="#set1#" index="i" delimiters="#arguments.delimiter#">
				<cfif isSimpleValue(arguments.element1[i])>
					<cfif not isSimpleValue(arguments.element2[i])>
						<cfreturn false />
					</cfif>
					
					<cfif not equivalent(arguments.element1[i], arguments.element2[i], arguments.delimiter)>
						<cfreturn false />
					</cfif>
				<cfelseif isStruct(arguments.element1[i])>
					<cfif not isStruct(arguments.element2[i])>
						<cfreturn false />
					</cfif>
					
					<cfif not equivalent(arguments.element1[i], arguments.element2[i], arguments.delimiter)>
						<cfreturn false />
					</cfif>
				<cfelseif isArray(arguments.element1[i])>
					<cfif not isArray(arguments.element2[i])>
						<cfreturn false />
					</cfif>
					
					<cfif not equivalent(arguments.element1[i], arguments.element2[i], arguments.delimiter)>
						<cfreturn false />
					</cfif>
				<cfelse>
					<cfthrow message="Unable to find equivalency" detail="Could not determine how to evaluate equivalency of complex objects" />
				</cfif>
			</cfloop>
		<cfelseif isArray(arguments.element1)>
			<cfif not isArray(arguments.element2)>
				<cfreturn false />
			</cfif>
			
			<!--- Check if they are different lengths --->
			<cfif arrayLen(arguments.element1) neq arrayLen(arguments.element2)>
				<cfreturn false />
			</cfif>
			
			<cfloop from="1" to="#arrayLen(arguments.element1)#" index="i">
				<cfif isSimpleValue(arguments.element1[i])>
					<cfif not isSimpleValue(arguments.element2[i])>
						<cfreturn false />
					</cfif>
					
					<cfif not equivalent(arguments.element1[i], arguments.element2[i], arguments.delimiter)>
						<cfreturn false />
					</cfif>
				<cfelseif isStruct(arguments.element1[i])>
					<cfif not isStruct(arguments.element2[i])>
						<cfreturn false />
					</cfif>
					
					<cfif not equivalent(arguments.element1[i], arguments.element2[i], arguments.delimiter)>
						<cfreturn false />
					</cfif>
				<cfelseif isArray(arguments.element1[i])>
					<cfif not isArray(arguments.element2[i])>
						<cfreturn false />
					</cfif>
					
					<cfif not equivalent(arguments.element1[i], arguments.element2[i], arguments.delimiter)>
						<cfreturn false />
					</cfif>
				<cfelse>
					<cfthrow message="Unable to find equivalency" detail="Could not determine how to evaluate equivalency of complex objects" />
				</cfif>
			</cfloop>
		<cfelse>
			<cfthrow message="Unable to find equivalency" detail="The element types were not recognized when trying to test" />
		</cfif>
		
		<cfreturn true />
	</cffunction>
	
	<!---
		Used to equivalent a set arguments similar to the way a venn diagram works
	--->
	<cffunction name="equivalentSet" access="public" returntype="array" output="false">
		<cfset var equivalentSet = '' />
		<cfset var result = '' />
		<cfset var numArgs = arrayLen(arguments) />
		<cfset var i = '' />
		<cfset var x = '' />
		<cfset var y = '' />
		
		<!--- Need to at least call the function with something --->
		<cfif not numArgs>
			<cfthrow message="Cannot equivalent nothing" detail="Cannot do a equivalent with the absence of everything" />
		</cfif>
		
		<!--- Create the equivalent result --->
		<cfset equivalentSet = [] />
		
		<!--- Create the multi-dimension --->
		<cfloop from="1" to="#numArgs#" index="i">
			<cfset equivalentSet[i] = [] />
		</cfloop>
		
		<!--- Do the equivalenting for half --->
		<!---
			|---|---|---|
			| X |   |   |
			|---|---|---|
			| X | X |   |
			|---|---|---|
			| X | X | X |
			|---|---|---|
		--->
		<cfloop from="1" to="#numArgs#" index="x">
			<cfloop from="#x#" to="#numArgs#" index="y">
				<cfset equivalentSet[x][y] = equivalent(arguments[x], arguments[y]) />
			</cfloop>
		</cfloop>
		
		<!--- Invert the equivalent for the other half --->
		<!---
			|---|---|---|
			|   | X | X |
			|---|---|---|
			|   |   | X |
			|---|---|---|
			|   |   |   |
			|---|---|---|
		--->
		<cfloop from="2" to="#numArgs#" index="x">
			<cfloop from="1" to="#x - 1#" index="y">
				<cfset equivalentSet[x][y] = not equivalentSet[y][x] />
			</cfloop>
		</cfloop>
		
		<cfreturn equivalentSet />
	</cffunction>
</cfcomponent>
