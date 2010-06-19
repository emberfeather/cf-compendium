<!--- 
	Used to manage the url query string and to be stateful.
	<p>
	Uses named locations internally to keep track of the different states of the URL.
--->
<cfcomponent output="false">
	<cffunction name="init" access="public" returntype="any" output="false">
		<cfargument name="masterBase" type="any" default="" />
		<cfargument name="options" type="struct" default="#{}#" />
		
		<cfset var defaults = {
				start = '?',
				ampEncodeChar = '&amp;',
				eqEncodeChar = '=',
				ampChar = '&',
				eqChar = '='
			} />
		
		<cfset variables.extend = createObject('component', 'cf-compendium.inc.resource.utility.extend').init() />
		
		<!--- Extend the form options --->
		<cfset variables.urlOptions = variables.extend.extend(defaults, arguments.options) />
		
		<!--- Create the variable for named locations --->
		<cfset variables.locations = {} />
		
		<!--- Set the master URL location --->
		<cfif isStruct(arguments.masterBase)>
			<!--- Allow to pass in a struct as the master --->
			<cfset variables.locations[''] = duplicate(arguments.masterBase) />
		<cfelse>
			<!--- Parse the master from the queryString --->
			<cfset variables.locations[''] = parseQueryString(arguments.masterBase) />
		</cfif>
		
		<!--- Create the variable for location anchors --->
		<cfset variables.anchors = {} />
		
		<cfreturn this />
	</cffunction>
	
	<!---
		Sets a variable for the URL location given.
	--->
	<cffunction name="anchor" access="private" returntype="void" output="false">
		<cfargument name="locationName" type="string" required="true" />
		<cfargument name="value" type="string" default="" />
		
		<!--- Trim the anchor --->
		<cfset arguments.value = trim(arguments.value) />
		
		<!--- Set or remove the anchor --->
		<cfif arguments.value eq ''>
			<cfset structDelete(variables.anchors, arguments.locationName) />
		<cfelse>
			<cfset variables.anchors[arguments.locationName] = arguments.value />
		</cfif>
	</cffunction>
	
	<!--- 
		Completely clears the location if it exists, otherwise creates a 
		new clean location with a clean location.
		<p>
		A clean url is equivalent to giving a blank query string.
		<p>
		Will also clean out the master if requested with a blank string.
	--->
	<cffunction name="clean" access="private" returntype="void" output="false">
		<cfargument name="locationName" type="string" default=""/>
		
		<cfset variables.locations[arguments.locationName] = {} />
	</cffunction>
	
	<!--- 
		Clone an existing location.
		If the destination location is blank, clone the master
	--->
	<cffunction name="clone" access="private" returntype="void" output="false">
		<cfargument name="destinationLocation" type="string" required="true" />
		<cfargument name="sourceLocation" type="string" default="" />
		
		<cfset var location = duplicate(findLocation(arguments.sourceLocation)) />
		
		<cfset arguments.destinationLocation = trim(arguments.destinationLocation) />
		
		<!--- check if a location or master --->
		<cfset variables.locations[arguments.destinationLocation] = location />
	</cffunction>
	
	<!--- 
		Extend the URL location to use the supplied defaults if they aren't provided.
		<p>
		If the location name has not been created yet it will be created.
		Similar to override. Extend will not replace any existing values, where override will.
		
		EX:
		
		  XXXXX    (original values)
		 +   OOOO  (new values)
		 ----------
		  XXXXXOO
		
	--->
	<cffunction name="extend" access="private" returntype="void" output="false">
		<cfargument name="locationName" type="string" required="true" />
		<cfargument name="defaultQueryString" type="string" required="true" />
		
		<cfset variables.locations[arguments.locationName] = variables.extend.extend(parseQueryString(arguments.defaultQueryString), findLocation(arguments.locationName)) />
	</cffunction>
	
	<!---
		Finds the correct location and returns it.
		<p>
		If there the location doesn't exist it will create the location.
	--->
	<cffunction name="findLocation" access="private" returntype="struct" output="false">
		<cfargument name="locationName" type="string" required="true" />
		
		<cfset arguments.locationName = trim(arguments.locationName) />
		
		<!--- Check for valid location --->
		<cfif not has(arguments.locationName)>
			<cfset variables.locations[arguments.locationName] = duplicate(variables.locations['']) />
		</cfif>
		
		<cfreturn variables.locations[arguments.locationName] />
	</cffunction>
	
	<!---
		Finds and returns the formatted url location.
		<p>
		Has the option to use the encoded characters as separators.
	--->
	<cffunction name="get" access="private" returntype="string" output="false">
		<cfargument name="locationName" type="string" default="" />
		<cfargument name="useEncoded" type="boolean" default="true" />
		<cfargument name="options" type="struct" default="#{}#" />
		
		<cfset var formatted = '' />
		<cfset var current = '' />
		<cfset var ampChar = '' />
		<cfset var eqChar = '' />
		<cfset var keys = '' />
		<cfset var location = findLocation(arguments.locationName) />
		<cfset var getOptions = '' />
		
		<!--- Extend the options --->
		<cfset getOptions = variables.extend.extend(variables.urlOptions, arguments.options) />
		
		<!--- Check if using the encoded versions --->
		<cfif arguments.useEncoded>
			<cfset ampChar = getOptions.ampEncodeChar />
			<cfset eqChar = getOptions.eqEncodeChar />
		<cfelse>
			<cfset ampChar = getOptions.ampChar />
			<cfset eqChar = getOptions.eqChar />
		</cfif>
		
		<!--- Start out with the start string --->
		<cfset formatted = getOptions.start />
		
		<cfset keys = structKeyList(location) />
		
		<!--- Add each variable --->
		<cfloop list="#keys#" index="current">
			<cfset formatted &= current & eqChar & location[current] & ampChar />
		</cfloop>
		
		<!--- Remove the extra amp character --->
		<cfif listLen(keys)>
			<cfset formatted = Left(formatted, len(formatted) - len(ampChar)) />
		</cfif>
		
		<!--- Check for anchor --->
		<cfif structKeyExists(variables.anchors, arguments.locationName)>
			<cfset formatted &= '##' & variables.anchors[arguments.locationName] />
		</cfif>
		
		<cfreturn formatted />
	</cffunction>
	
	<!---
		Checks for the existance of a URL location name.
		<p>
		The master location always exists.
	--->
	<cffunction name="has" access="private" returntype="boolean" output="false">
		<cfargument name="locationName" type="string" default="" />
		
		<!--- Check if is master --->
		<cfif arguments.locationName eq ''>
			<cfreturn true />
		</cfif>
		
		<cfreturn structKeyExists(variables.locations, arguments.locationName) />
	</cffunction>
	
	<cffunction name="onMissingMethod" access="public" returntype="any" output="false">
		<cfargument name="missingMethodName" type="string" required="true" />
		<cfargument name="missingMethodArguments" type="struct" required="true" />
		
		<cfset var findParts = '' />
		<cfset var name = '' />
		<cfset var extra = '' />
		
		<!--- Since railo has uppercase missingMethodName need to have missingMethodName in lowercase --->
		<cfset arguments.missingMethodName = lCase(arguments.missingMethodName) />
		
		<!--- Find the parts of the function name we are interested in --->
		<cfset findParts = reFind('^(anchor|clean|clone|extend|get|has|override|redirect|remove|reset|search(id|boolean)?|set)(.*)', arguments.missingMethodName, 1, true) />
		
		<!--- Check if not one that we are equiped to handle --->
		<cfif not findParts.pos[1]>
			<cfthrow message="The #arguments.missingMethodName# method was not found" />
		</cfif>
		
		<!--- Set the name --->
		<cfset name = left(arguments.missingMethodName, findParts.len[2]) />
		
		<!--- Set the extra information --->
		<cfif findParts.len[4]>
			<cfset extra = mid(arguments.missingMethodName, findParts.pos[4], findParts.len[4]) />
		</cfif>
		
		<!--- Determine what we are really doing --->
		<cfswitch expression="#name#">
			<cfcase value="anchor">
				<cfif arrayLen(arguments.missingMethodArguments) eq 1>
					<cfreturn anchor(extra, arguments.missingMethodArguments[1]) />
				</cfif>
				
				<cfreturn anchor(extra) />
			</cfcase>
			
			<cfcase value="clean">
				<cfif arrayLen(arguments.missingMethodArguments) eq 1>
					<cfreturn clean(arguments.missingMethodArguments[1]) />
				</cfif>
				
				<cfreturn clean(extra) />
			</cfcase>
			
			<cfcase value="clone">
				<cfif arrayLen(arguments.missingMethodArguments) eq 1>
					<cfreturn clone(extra, arguments.missingMethodArguments[1]) />
				<cfelseif arrayLen(arguments.missingMethodArguments) eq 2>
					<cfreturn clone(arguments.missingMethodArguments[1], arguments.missingMethodArguments[2]) />
				</cfif>
				
				<cfreturn clone(extra) />
			</cfcase>
			
			<cfcase value="extend">
				<cfif arrayLen(arguments.missingMethodArguments) eq 2>
					<cfreturn extend(arguments.missingMethodArguments[1], arguments.missingMethodArguments[2]) />
				</cfif>
				
				<cfreturn this.extend(extra, arguments.missingMethodArguments[1]) />
			</cfcase>
			
			<cfcase value="get">
				<cfif len(extra)>
					<cfset arrayPrepend(arguments.missingMethodArguments, extra) />
				</cfif>
				
				<cfreturn get(argumentCollection = arguments.missingMethodArguments) />
			</cfcase>
			
			<cfcase value="has">
				<cfif arrayLen(arguments.missingMethodArguments) eq 1>
					<cfreturn has(arguments.missingMethodArguments[1]) />
				</cfif>
				
				<cfreturn has(extra) />
			</cfcase>
			
			<cfcase value="override">
				<cfif arrayLen(arguments.missingMethodArguments) eq 2>
					<cfreturn override(arguments.missingMethodArguments[1], arguments.missingMethodArguments[2]) />
				</cfif>
				
				<cfreturn override(extra, arguments.missingMethodArguments[1]) />
			</cfcase>
			
			<cfcase value="redirect">
				<cfif arrayLen(arguments.missingMethodArguments) eq 2>
					<cfset redirect(arguments.missingMethodArguments[1], arguments.missingMethodArguments[2]) />
				<cfelseif arrayLen(arguments.missingMethodArguments) eq 1>
					<cfset redirect(extra, arguments.missingMethodArguments[1]) />
				</cfif>
				
				<cfset redirect(extra) />
			</cfcase>
			
			<cfcase value="remove">
				<cfif arrayLen(arguments.missingMethodArguments) eq 1>
					<cfreturn remove(extra, arguments.missingMethodArguments[1]) />
				</cfif>
				
				<cfreturn remove(extra) />
			</cfcase>
			
			<cfcase value="reset">
				<cfif arrayLen(arguments.missingMethodArguments) eq 1>
					<cfreturn reset(extra, arguments.missingMethodArguments[1]) />
				</cfif>
				
				<cfreturn reset(extra) />
			</cfcase>
			
			<cfcase value="search">
				<cfif arrayLen(arguments.missingMethodArguments) eq 2>
					<cfreturn search(arguments.missingMethodArguments[1], arguments.missingMethodArguments[2]) />
				</cfif>
				
				<cfreturn search(extra, arguments.missingMethodArguments[1]) />
			</cfcase>
			
			<cfcase value="searchBoolean">
				<cfif arrayLen(arguments.missingMethodArguments) eq 2>
					<cfreturn searchBoolean(arguments.missingMethodArguments[1], arguments.missingMethodArguments[2]) />
				</cfif>
				
				<cfreturn searchBoolean(extra, arguments.missingMethodArguments[1]) />
			</cfcase>
			
			<cfcase value="searchID">
				<cfif arrayLen(arguments.missingMethodArguments) eq 2>
					<cfreturn searchID(arguments.missingMethodArguments[1], arguments.missingMethodArguments[2]) />
				</cfif>
				
				<cfreturn searchID(extra, arguments.missingMethodArguments[1]) />
			</cfcase>
			
			<cfcase value="set">
				<cfif arrayLen(arguments.missingMethodArguments) eq 3>
					<cfreturn set(arguments.missingMethodArguments[1], arguments.missingMethodArguments[2], arguments.missingMethodArguments[3]) />
				</cfif>
				
				<cfreturn set(extra, arguments.missingMethodArguments[1], arguments.missingMethodArguments[2]) />
			</cfcase>
		</cfswitch>
		
		<cfthrow message="The #arguments.missingMethodName# method was not found" />
	</cffunction>
	
	<!--- 
		Override is similar to extend, except that it will override any of the already existing parameters in the URL,
		where extend will only append non existing parameters
		
		EX:
		
		  XXXXX    (original values)
		 +   OOOO  (new values)
		 ----------
		  XXXOOOO
	--->
	<cffunction name="override" access="private" returntype="struct" output="false">
		<cfargument name="locationName" type="string" required="true" />
		<cfargument name="defaultQueryString" type="string" required="true" />
		
		<cfset var extend = createObject('component', 'cf-compendium.inc.resource.utility.extend').init() />
		
		<cfset variables.locations[arguments.locationName] = extend.extend(findLocation(arguments.locationName), parseQueryString(arguments.defaultQueryString)) />
		
		<cfreturn variables.locations[arguments.locationName] />
	</cffunction>
	
	<!---
		Parses a query string and converts to a struct using the & and = of normal URL query strings.
	--->
	<cffunction name="parseQueryString" access="public" returntype="struct" output="false">
		<cfargument name="queryString" type="string" required="true" />
		
		<cfset var tempUrl = {} />
		<cfset var current = '' />
		<cfset var i = '' />
		
		<!---
			Strip ? from the front of the query string if it's there
		--->
		<cfif left(arguments.queryString, 1) IS "?">
			<cfset arguments.queryString = right(arguments.queryString, len(arguments.queryString)-1) />
		</cfif>
		
		<cfloop list="#arguments.queryString#" index="current" delimiters="&">
			<cfset i = find('=', current) />
			
			<cfif i gt 0 and len(current) neq i>
				<!--- Add the value to the struct --->
				<cfset tempUrl[left(current, i - 1)] = right(current, len(current) - i) />
			<cfelseif i gt 0>
				<!--- Add the value to the struct --->
				<cfset tempUrl[left(current, i - 1)] = '' />
			<cfelse>
				<!--- Otherwise assume it is blank --->
				<cfset tempUrl[current] = '' />
			</cfif>
		</cfloop>
		
		<cfreturn tempUrl />
	</cffunction>
	
	<cffunction name="querystringKeyList" access="public" returntype="string" output="false">
		<cfargument name="locationName" type="string" default="" />
		
		<cfreturn structKeyList( findLocation( arguments.locationName ) ) />
	</cffunction>
	
	<!---
		Redirects to the given URL location.
	--->
	<cffunction name="redirect" access="private" returntype="void" output="false">
		<cfargument name="locationName" type="string" required="true" />
		<cfargument name="addToken" type="boolean" default="false" />
		
		<cflocation url="#get(arguments.locationName, false)#" addtoken="#arguments.addToken#" />
	</cffunction>
	
	<!---
		Removes a variable from the URL location given.
	--->
	<cffunction name="remove" access="private" returntype="void" output="false">
		<cfargument name="locationName" type="string" required="true" />
		<cfargument name="varName" type="string" required="true" />
		
		<cfset var location = '' />
		
		<!--- Get the location --->
		<cfset location = findLocation(arguments.locationName) />
		
		<!--- Remove the value --->
		<cfif structKeyExists(location, arguments.varName)>
			<cfset structDelete(location, arguments.varName) />
		</cfif>
	</cffunction>
	
	<!---
		Reset a URL location off of a query string
	--->
	<cffunction name="reset" access="private" returntype="void" output="false">
		<cfargument name="locationName" type="string" default="" />
		<cfargument name="queryString" type="string" default="" />
		
		<cfset var newLocation = '' />
		
		<cfset arguments.queryString = trim(arguments.queryString) />
		<cfset arguments.locationName = trim(arguments.locationName) />
		
		<cfset newLocation = parseQueryString(arguments.queryString) />
		
		<cfset variables.locations[arguments.locationName] = newLocation />
	</cffunction>
	
	<!---
		Searches a location or the master for a specific variable.
	--->
	<cffunction name="search" access="private" returntype="string" output="false">
		<cfargument name="locationName" type="string" default="" />
		<cfargument name="variableName" type="string" required="true" />
		
		<cfset var location = findLocation(arguments.locationName) />
		
		<cfif structKeyExists(location, arguments.variableName)>
			<cfreturn location[arguments.variableName] />
		</cfif>
		
		<cfreturn '' />
	</cffunction>
	
	<!---
		Searches an location or the master for an variable that is an Boolean.
	--->
	<cffunction name="searchBoolean" access="private" returntype="boolean" output="false">
		<cfargument name="locationName" type="string" default="" />
		<cfargument name="variableName" type="string" required="true" />
		
		<cfset var value = search(argumentCollection=arguments) />
		
		<!--- If not a number return a zero --->
		<cfif not isBoolean(value)>
			<cfreturn false />
		</cfif>
		
		<cfreturn value />
	</cffunction>
	
	<!---
		Searches an location or the master for an variable that is an id.
	--->
	<cffunction name="searchID" access="private" returntype="numeric" output="false">
		<cfargument name="locationName" type="string" default="" />
		<cfargument name="variableName" type="string" required="true" />
		
		<cfset var value = search(argumentCollection=arguments) />
		
		<!--- If not a number return a zero --->
		<cfif not isNumeric(value) or value eq ''>
			<cfreturn 0 />
		</cfif>
		
		<cfreturn value />
	</cffunction>
	
	<!---
		Sets a variable for the URL location given.
	--->
	<cffunction name="set" access="private" returntype="void" output="false">
		<cfargument name="locationName" type="string" required="true" />
		<cfargument name="varName" type="string" required="true" />
		<cfargument name="varValue" type="any" required="true" />
		
		<cfset var location = '' />
		
		<!--- Get the location --->
		<cfset location = findLocation(arguments.locationName) />
		
		<!--- Set the value --->
		<cfset location[arguments.varName] = arguments.varValue />
	</cffunction>
</cfcomponent>
