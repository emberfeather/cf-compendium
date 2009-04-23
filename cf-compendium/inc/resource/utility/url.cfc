<!--- 
	Used to manage the url query string and to be stateful.
	<p>
	Uses named locations internally to keep track of the different states of the URL.
--->
<cfcomponent output="false">
	<cffunction name="init" access="public" returntype="any" output="false">
		<cfargument name="queryString" type="string" default="" />
		<cfargument name="options" type="struct" default="#structNew()#" />
		
		<cfset var theExtender = createObject('component', 'cf-compendium.inc.resource.utility.extend').init() />
		
		<!--- Set defaults for form --->
		<cfset variables.urlOptions = structNew() />
		<cfset variables.urlOptions.start = '?' />
		<cfset variables.urlOptions.ampEncodeChar = '&amp;' />
		<cfset variables.urlOptions.eqEncodeChar = '=' />
		<cfset variables.urlOptions.ampChar = '&' />
		<cfset variables.urlOptions.eqChar = '=' />
		
		<!--- Extend the form options --->
		<cfset variables.urlOptions = theExtender.extend(variables.urlOptions, arguments.options) />
		
		<!--- Set the master URL location --->
		<cfset variables.master = parseQueryString(arguments.queryString) />
		
		<!--- Create the variable for named locations --->
		<cfset variables.locations = structNew() />
		
		<cfreturn this />
	</cffunction>
	
	<!--- 
		Completely clears the location if it exists, otherwise creates a 
		new clean location with a clean location.
		<p>
		A clean url is equivalent to giving a blank query string.
		<p>
		Will also clean out the master if requested with a blank string.
	--->
	<cffunction name="clean" access="public" returntype="void" output="false">
		<cfargument name="locationName" type="string" default=""/>
		
		<!--- check if an location or master --->
		<cfif arguments.locationName EQ ''>
			<cfset variables.master = structNew() />
		<cfelse>
			<cfset variables.locations[arguments.locationName] = structNew() />
		</cfif>
	</cffunction>
	
	
	<!--- 
		Clone an existing location.
		If the destination location is blank, clone the master
	--->
	<cffunction name="clone" access="public" returntype="void" output="false">
		<cfargument name="sourceLocation" type="string" required="true" />
		<cfargument name="destinationLocation" type="string" required="true" />
		
		<cfset var location = duplicate(getLocation(arguments.sourceLocation)) />
		
		<cfset arguments.destinationLocation = trim(arguments.destinationLocation) />
		
		<!--- check if a location or master --->
		<cfif arguments.destinationLocation EQ ''>
			<cfset variables.master = location />
		<cfelse>
			<cfset variables.locations[arguments.destinationLocation] = location />
		</cfif>
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
	<cffunction name="extend" access="public" returntype="void" output="false">
		<cfargument name="locationName" type="string" required="true" />
		<cfargument name="defaultQueryString" type="string" required="true" />
		
		<cfset var theExtender = createObject('component', 'cf-compendium.inc.resource.utility.extend').init() />
		
		<cfset variables.locations[arguments.locationName] = theExtender.extend(parseQueryString(arguments.defaultQueryString), getLocation(arguments.locationName)) />
	</cffunction>
		
	<!---
		Finds and returns the formatted url location.
		<p>
		Has the option to use the encoded characters as separators.
	--->
	<cffunction name="get" access="public" returntype="string" output="false">
		<cfargument name="locationName" type="string" default="" />
		<cfargument name="useEncoded" type="boolean" default="true" />
		
		<cfset var formatted = '' />
		<cfset var current = '' />
		<cfset var ampChar = '' />
		<cfset var eqChar = '' />
		<cfset var location=getLocation(arguments.locationName)>
		
		<!--- Check if using the encoded versions --->
		<cfif arguments.useEncoded>
			<cfset ampChar = variables.urlOptions.ampEncodeChar />
			<cfset eqChar = variables.urlOptions.eqEncodeChar />
		<cfelse>
			<cfset ampChar = variables.urlOptions.ampChar />
			<cfset eqChar = variables.urlOptions.eqChar />
		</cfif>
		
		<!--- Start out with the start string --->
		<cfset formatted = variables.urlOptions.start />
		
		<!--- Add each variable --->
		<cfloop list="#structKeyList(location)#" index="current">
			<cfset formatted &= current & eqChar & location[current] & ampChar />
		</cfloop>
		
		<!--- Remove the extra amp character --->
		<cfif len(formatted) GT len(ampChar)>
			<cfset formatted = Left(formatted, len(formatted) - len(ampChar)) />
		</cfif>
		
		<cfreturn formatted />
	</cffunction>
	
	<!---
		Finds the correct location and returns it.
		<p>
		If there the location doesn't exist it will create the location.
	--->
	<cffunction name="getLocation" access="private" returntype="struct" output="false">
		<cfargument name="locationName" type="string" required="true" />
		
		<cfset arguments.locationName = trim(arguments.locationName) />
		
		<!--- Check for valid location --->
		<cfif NOT isLocation(arguments.locationName)>
			<cfset variables.locations[arguments.locationName] = duplicate(variables.master) />
		</cfif>
		
		<cfif arguments.locationName NEQ ''>
			<cfreturn variables.locations[arguments.locationName] />
		<cfelse>
			<cfreturn variables.master />
		</cfif>
	</cffunction>
	
	<!---
		Checks for the existance of a URL location name.
		<p>
		The master location always exists.
	--->
	<cffunction name="isLocation" access="public" returntype="boolean" output="false">
		<cfargument name="locationName" type="string" required="true" />
		
		<!--- Check if is master --->
		<cfif arguments.locationName EQ ''>
			<cfreturn true />
		</cfif>
		
		<cfreturn structKeyExists(variables.locations, arguments.locationName) />
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
	<cffunction name="override" access="public" returntype="struct" output="false">
		<cfargument name="locationName" type="string" required="true" />
		<cfargument name="defaultQueryString" type="string" required="true" />
		
		<cfset var theExtender = createObject('component', 'cf-compendium.inc.resource.utility.extend').init() />
		
		<cfset variables.locations[arguments.locationName] = theExtender.extend(getLocation(arguments.locationName), parseQueryString(arguments.defaultQueryString)) />
		
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
			
			<cfif i GT 0 AND len(current) NEQ i>
				<!--- Add the value to the struct --->
				<cfset tempUrl[left(current, i - 1)] = right(current, len(current) - i) />
			<cfelseif i GT 0>
				<!--- Add the value to the struct --->
				<cfset tempUrl[left(current, i - 1)] = '' />
			<cfelse>
				<!--- Otherwise assume it is blank --->
				<cfset tempUrl[current] = '' />
			</cfif>
		</cfloop>
		
		<cfreturn tempUrl />
	</cffunction>
	
	<!---
		Removes a variable from the URL location given.
	--->
	<cffunction name="remove" access="public" returntype="void" output="false">
		<cfargument name="locationName" type="string" required="true" />
		<cfargument name="varName" type="string" required="true" />
		
		<cfset var location = '' />
		
		<!--- Get the location --->
		<cfset location = getLocation(arguments.locationName) />
		
		<!--- Remove the value --->
		<cfif structKeyExists(location, arguments.varName)>
			<cfset structDelete(location, arguments.varName) />
		</cfif>
	</cffunction>
	
	<!---
		Reset a URL location off of a query string or duplicate the master if no string given.
	--->
	<cffunction name="setLocation" access="public" returntype="void" output="false">
		<cfargument name="locationName" type="string" required="true" />
		<cfargument name="queryString" type="string" default="" />
				
		<cfset var newLocation = '' />
		
		<cfset arguments.queryString = trim(arguments.queryString) />
		<cfset arguments.locationName = trim(arguments.locationName) />
		
		<cfset newLocation = parseQueryString(arguments.queryString) />
		
		<cfif arguments.locationName EQ ''>
			<cfset variables.master = newLocation />
		<cfelse>
			<cfset variables.locations[arguments.locationName] = newLocation />
		</cfif>
	</cffunction>
	
	<!---
		Searches a location or the master for a specific variable.
	--->
	<cffunction name="search" access="public" returntype="string" output="false">
		<cfargument name="locationName" type="string" default="" />
		<cfargument name="variableName" type="string" required="true" />
		
		<cfset var location = getLocation(arguments.locationName) />
		
		<cfif structKeyExists(location, arguments.variableName)>
			<cfreturn location[arguments.variableName] />
		</cfif>
		
		<cfreturn '' />
	</cffunction>
	
	<!---
		Searches an location or the master for an variable that is an id.
	--->
	<cffunction name="searchID" access="public" returntype="numeric" output="false">
		<cfargument name="locationName" type="string" default="" />
		<cfargument name="variableName" type="string" required="true" />
		
		<cfset var value = search(argumentCollection=arguments) />
		
		<!--- If not a number return a zero --->
		<cfif NOT isNumeric(value)>
			<cfreturn 0 />
		</cfif>
		
		<cfreturn value />
	</cffunction>
	
	<!---
		Sets a variable for the URL location given.
	--->
	<cffunction name="set" access="public" returntype="void" output="false">
		<cfargument name="locationName" type="string" required="true" />
		<cfargument name="varName" type="string" required="true" />
		<cfargument name="varValue" type="any" required="true" />
		
		<cfset var location = '' />
		
		<!--- Get the location --->
		<cfset location = getLocation(arguments.locationName) />
		
		<!--- Set the value --->
		<cfset location[arguments.varName] = arguments.varValue />
	</cffunction>
</cfcomponent>
