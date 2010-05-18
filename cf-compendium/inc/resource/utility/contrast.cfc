<cfcomponent output="false">
	<cffunction name="init" access="public" returntype="component" output="false">
		<cfreturn this />
	</cffunction>
	
	<!--- 
		Compare the two elements and return true if they contain the same key value pairs, 
		regardless of ordering 
	--->
	<cffunction name="areEqual" access="public" returntype="boolean" output="false">
		<cfargument name="element1" type="any" required="true" />
		<cfargument name="element2" type="any" required="true" />
		<cfargument name="delimiter" type="string" default="," />
		
		<cfset var result = "" />
		
		<cfset result = contrast(arguments.element1, arguments.element2, arguments.delimiter)>
		
		<cfif listLen(result.uniquetofirst) eq 0 and listLen(result.uniquetofirst) eq 0>
			<cfreturn true>
		</cfif>
		
		<cfreturn false>
	</cffunction>
	
	<!--- 
		Will compare all the items in the first row of the multidimensional array.
		If there are any differences in any of the cells, it will return false.
		Otherwise will return true.
	--->
	<cffunction name="areEqualSet" access="public" returntype="boolean" output="false">
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
			<cfset equalSet[i] = contrast(arguments[1], arguments[i]) />
			
			<cfif listLen(equalset[i].uniqueToFirst) gt 0 or listLen(equalset[i].uniqueToSecond) gt 0>
				<cfreturn false />
			</cfif>
		</cfloop>
		
		<cfreturn true />
	</cffunction>
	
	<!---
		Used to contrast two arguments similar to the way a simple venn diagram works
	--->
	<cffunction name="contrast" access="public" returntype="struct" output="false">
		<cfargument name="element1" type="any" required="true" />
		<cfargument name="element2" type="any" required="true" />
		<cfargument name="delimiter" type="string" default="," />
		
		<cfset var result = { uniqueToFirst = '', same = '', uniqueToSecond = '' } />
		<cfset var set1 = '' />
		<cfset var set2 = '' />
		<cfset var uniqueList = '' />
		<cfset var i = '' />
		
		<!--- Set what we are going to contrast --->
		<cfif isSimpleValue(arguments.element1)>
			<cfset set1 = arguments.element1 />
		<cfelseif isStruct(arguments.element1)>
			<cfset set1 = structKeyList(arguments.element1, arguments.delimiter) />
		<cfelseif isArray(arguments.element1)>
			<cfset set1 = arrayToList(arguments.element1, arguments.delimiter) />
		<cfelse>
			<cfthrow message="Unable to contrast" detail="The first element type was not recognized when trying to contrast" />
		</cfif>
		
		<!--- Set what we are going to contrast --->
		<cfif isSimpleValue(arguments.element2)>
			<cfset set2 = arguments.element2 />
		<cfelseif isStruct(arguments.element2)>
			<cfset set2 = structKeyList(arguments.element2, arguments.delimiter) />
		<cfelseif isArray(arguments.element2)>
			<cfset set2 = arrayToList(arguments.element2, arguments.delimiter) />
		<cfelse>
			<cfthrow message="Unable to contrast" detail="The second element type was not recognized when trying to contrast" />
		</cfif>
		
		<!--- Do the contrasting --->
		
		<!--- Loop through all possible values --->
		<cfloop list="#set1##arguments.delimiter##set2#" index="i" delimiters="#arguments.delimiter#">
			<!--- Make sure we haven't alreadly looked at this value --->
			<cfif not listFindNoCase(uniqueList, i, arguments.delimiter)>
				<!--- Check where it exists --->
				<cfif listFindNoCase(set1, i, arguments.delimiter) and listFindNoCase(set2, i, arguments.delimiter)>
					<cfset result.same = listAppend(result.same, i, arguments.delimiter) />
				<cfelseif listFindNoCase(set1, i, arguments.delimiter)>
					<cfset result.uniqueToFirst = listAppend(result.uniqueToFirst, i, arguments.delimiter) />
				<cfelse>
					<cfset result.uniqueToSecond = listAppend(result.uniqueToSecond, i, arguments.delimiter) />
				</cfif>
				
				<!--- Add to the unique list so we don't do it again --->
				<cfset uniqueList = listAppend(uniqueList, i, arguments.delimiter) />
			</cfif>
		</cfloop>
		
		<cfreturn result />
	</cffunction>
	
	<!---
		Used to contrast a set arguments similar to the way a venn diagram works
	--->
	<cffunction name="contrastSet" access="public" returntype="any" output="false">
		<cfset var contrastSet = '' />
		<cfset var result = '' />
		<cfset var numArgs = arrayLen(arguments) />
		<cfset var i = '' />
		<cfset var x = '' />
		<cfset var y = '' />
		
		<!--- Need to at least call the function with something --->
		<cfif not numArgs>
			<cfthrow message="Cannot contrast nothing" detail="Cannot do a contrast with the absence of everything" />
		</cfif>
		
		<!--- Create the contrast result --->
		<cfset contrastSet = [] />
		
		<!--- Create the multi-dimension --->
		<cfloop from="1" to="#numArgs#" index="i">
			<cfset contrastSet[i] = [] />
		</cfloop>
		
		<!--- Do the contrasting for half --->
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
				<cfset contrastSet[x][y] = contrast(arguments[x], arguments[y]) />
				<!--- For debugging --->
				<!--- <cfset contrastSet[x][y] = 1 /> --->
			</cfloop>
		</cfloop>
		
		<!--- Invert the contrast for the other half --->
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
				<cfset contrastSet[x][y] = invert(contrastSet[y][x]) />
				<!--- For debugging --->
				<!--- <cfset contrastSet[x][y] = 2 /> --->
			</cfloop>
		</cfloop>
		
		<!--- Debugging Output --->
		<!---
		<code>
			<pre><cfloop from="1" to="#numArgs#" index="y"><cfloop from="1" to="#numArgs#" index="x"><cfoutput> #contrastSet[x][y]# </cfoutput></cfloop><cfoutput>#chr(10)#</cfoutput></cfloop></pre>
		</code>
		--->
		
		<cfreturn contrastSet />
	</cffunction>
	
	<!---
		Used to invert the contrast for comparing sets
	--->
	<cffunction name="invert" access="private" returntype="struct" output="false">
		<cfargument name="result" type="struct" required="true" />
		
		<cfset var invertedResult = duplicate(arguments.result) />
		
		<!--- Invert the values --->
		<cfset invertedResult.uniqueToFirst = arguments.result.uniqueToSecond />
		<cfset invertedResult.uniqueToSecond = arguments.result.uniqueToFirst />
		
		<cfreturn invertedResult />
	</cffunction>
</cfcomponent>
