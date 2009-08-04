<cfcomponent extends="cf-compendium.inc.resource.base.navigation" output="false">
	<cffunction name="init" access="public" returntype="component" output="false">
		<cfargument name="i18n" type="component" required="true" />
		
		<cfset super.init() />
		
		<!--- Store the i18n information --->
		<cfset variables.i18n = arguments.i18n />
		
		<!--- Use a query for the navigation storage --->
		<cfset variables.navigationFields = 'pageID,level,title,navTitle,path,navPosition,description,ids,vars,attribute,attributeValue,allow,deny,secureOrder,defaults,locale,orderBy' />
		<cfset variables.navigationTypes = 'integer,integer,varChar,varChar,varChar,varChar,varChar,varChar,varChar,varChar,varChar,varChar,varChar,varChar,varChar,varChar,integer' />
		
		<!--- Use a query for the navigation storage --->
		<cfset variables.navigation = queryNew(variables.navigationFields, variables.navigationTypes) />
		
		<!--- Create a cache variable for navigation html caching --->
		<cfset variables.cachedHTML = {} />
		
		<!--- Use a mock ID incrementor --->
		<cfset variables.nextID = 1 />
		
		<!--- Path index to store id's for use in parent indexing --->
		<cfset variables.pathIndex = {} />
		
		<cfreturn this />
	</cffunction>
	
	<cffunction name="addNavElementsXML" access="private" returntype="void" output="false">
		<cfargument name="elements" type="array" required="true" />
		<cfargument name="bundle" type="component" required="true" />
		<cfargument name="level" type="numeric" default="1" />
		<cfargument name="parentPath" type="string" default="" />
		
		<cfset var i = '' />
		<cfset var args = '' />
		<cfset var currentRow = '' />
		<cfset var fullPath = '' />
		<cfset var locale = '' />
		<cfset var plainPath = '' />
		
		<!--- Get the locale of the bundle --->
		<cfset locale = arguments.bundle.getLocale() />
		
		<cfloop array="#arguments.elements#" index="i">
			<!--- Figure out the current path --->
			<cfset plainPath = arguments.parentPath & (len(arguments.parentPath) ? '.' : '') & i.xmlName />
			<cfset fullPath = locale & '.' & plainPath />
			
			<!--- Find out if need to insert as a new row --->
			<cfif NOT structKeyExists(variables.pathIndex, fullPath)>
				<cfset addNavRow() />
				
				<!--- Shortcut to the row index --->
				<cfset currentRow = variables.nextID - 1 />
				
				<cfset querySetCell(variables.navigation, 'level', arguments.level, currentRow) />
				<cfset querySetCell(variables.navigation, 'path', '.' & plainPath, currentRow) />
				<cfset querySetCell(variables.navigation, 'locale', locale, currentRow) />
				
				<!--- Check for a defined sort order --->
				<cfif structKeyExists(i.xmlAttributes, 'orderBy')>
					<cfset querySetCell(variables.navigation, 'orderBy', i.xmlAttributes.orderBy, currentRow) />
				<cfelse>
					<cfset querySetCell(variables.navigation, 'orderBy', 1, currentRow) />
				</cfif>
				
				<!--- Pull titles from resource bundle --->
				<cfset querySetCell(variables.navigation, 'title', bundle.getValue(plainPath), currentRow) />
				<cfset querySetCell(variables.navigation, 'navTitle', bundle.getValue(plainPath & "-nav"), currentRow) />
				
				<!--- update the index for the path --->
				<cfset variables.pathIndex[fullPath] = currentRow />
			<cfelse>
				<!--- Shortcut to the row index --->
				<cfset currentRow = variables.pathIndex[fullPath] />
			</cfif>
			
			<!--- Make arguments for the next level --->
			<cfset args = {
					elements = i.xmlChildren,
					level = arguments.level + 1,
					parentPath = plainPath,
					bundle = arguments.bundle
				} />
			
			<cfset addNavElementsXML( argumentCollection = args ) />
		</cfloop>
	</cffunction>
	
	<cffunction name="addNavRow" access="private" returntype="void" output="false">
		<!--- Add a new navigation row with default values --->
		<cfset queryAddRow(variables.navigation) />
		
		<cfset querySetCell(variables.navigation, 'pageID', variables.nextID) />
		<cfset querySetCell(variables.navigation, 'allow', '*') />
		<cfset querySetCell(variables.navigation, 'deny', '*') />
		<cfset querySetCell(variables.navigation, 'secureOrder', 'allow,deny') />
		<cfset querySetCell(variables.navigation, 'defaults', '*') />
		
		<cfset variables.nextID++ />
	</cffunction>
	
	<cffunction name="applyMask" access="public" returntype="void" output="false">
		<cfargument name="filename" type="string" required="true" />
		<cfargument name="bundlePath" type="string" required="true" />
		<cfargument name="bundleName" type="string" required="true" />
		<cfargument name="locales" type="string" default="en_US" />
		
		<cfset var fileContents = '' />
		<cfset var bundle = '' />
		<cfset var locale = '' />
		
		<!--- Read the navigation mask file --->
		<cfset fileContents = readMask(arguments.filename) />
		
		<cfif isXML(fileContents)>
			<cfset fileContents = xmlParse(fileContents).xmlRoot />
			
			<cfloop list="#arguments.locales#" index="locale">
				<!--- Set the resource bundle --->
				<cfset bundle = variables.i18n.getResourceBundle(arguments.bundlePath, arguments.bundleName, locale) />
				
				<!--- Add the navigation elements --->
				<cfset addNavElementsXML(fileContents.xmlChildren, bundle) />
			</cfloop>
		<cfelseif isJSON(fileContents)>
			<!--- TODO work with JSON file --->
			<cfthrow message="JSON not implemented" detail="JSON formatted navigation files have not been programmed yet" />
		<cfelse>
			<cfthrow message="Unrecognized mask format" detail="The format of the mask file at #arguments.fileName# is unrecognized" />
		</cfif>
	</cffunction>
	
	<!---
		A unique page Identifier is used for caching the navigation
		so extra does not need to be done to create navigation if
		it was already generated
	--->
	<cffunction name="createUniquePageID" access="private" returntype="string" output="false">
		<cfargument name="theURL" type="component" required="true" />
		<cfargument name="level" type="numeric" required="true" />
		<cfargument name="navPosition" type="string" required="true" />
		<cfargument name="options" type="struct" default="#structNew()#" />
		<cfargument name="locale" type="string" default="en_US" />
		
		<cfset var uniquePageID = '' />
		
		<cfset uniquePageID = arguments.locale & '-' & arguments.navPosition & '-' & arguments.level />
		
		<!--- TODO Make the identification string more unique --->
		
		<cfreturn uniquePageID />
	</cffunction>
	
	<cffunction name="getNav" access="public" returntype="query" output="false">
		<cfargument name="level" type="numeric" required="true" />
		<cfargument name="navPosition" type="string" required="true" />
		<cfargument name="parentPath" type="string" default="." />
		<cfargument name="options" type="struct" default="#structNew()#" />
		<cfargument name="locale" type="string" default="en_US" />
		<cfargument name="authUser" type="component" required="false" />
		
		<cfset var navigation = '' />
		
		<!--- Query the navigation query for the page information --->
		<cfquery name="navigation" dbtype="query">
			SELECT pageID, level, path, title, navTitle, navPosition, description, ids, vars, attribute, attributeValue, allow, deny, defaults, orderBy
			FROM variables.navigation
			WHERE level = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.level#" />
				AND navPosition = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.navPosition#" />
				AND path LIKE <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.parentPath#%" />
				AND locale = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.locale#" />
				<cfif structKeyExists(arguments.options, 'hideBlankNavTitles') and arguments.options.hideBlankNavTitles EQ true>
					AND navTitle <> <cfqueryparam cfsqltype="cf_sql_varchar" value="" />
				</cfif>
				<!--- TODO add in authUser type permission checking --->
				ORDER BY orderBy ASC, navTitle ASC
		</cfquery>
		
		<cfreturn navigation />
	</cffunction>
	
	<cffunction name="getNavigation" access="public" returntype="query" output="false">
		<cfreturn variables.navigation />
	</cffunction>
	
	<cffunction name="readMask" access="private" returntype="string" output="false">
		<cfargument name="filename" type="string" required="true" />
		
		<cfset var maskFileContents = '' />
		<cfset var maskFileName = arguments.filename />
		
		<cfif NOT fileExists(maskFileName)>
			<cfset maskFileName = expandPath(maskFileName) />
			
			<cfif NOT fileExists(maskFileName)>
				<cfthrow message="Mask file was not found" detail="The mask file was not found at #arguments.filename#" />
			</cfif>
		</cfif>
		
		<cffile action="read" file="#maskFileName#" variable="maskFileContents" />
		
		<cfreturn maskFileContents />
	</cffunction>
	
	<!---
		On navigation that is run by files the navigation html doesn't change
		on the fly, therefore, it should be cached to speed up template
		HTML generation.
		<p>
		Caching is performed unless a user is logged in.
	--->
	<cffunction name="toHTML" access="public" returntype="string" output="false">
		<cfargument name="theURL" type="component" required="true" />
		<cfargument name="level" type="numeric" required="true" />
		<cfargument name="navPosition" type="string" required="true" />
		<cfargument name="options" type="struct" default="#structNew()#" />
		<cfargument name="locale" type="string" default="en_US" />
		<cfargument name="authUser" type="component" required="false" />
		
		<cfset var html = '' />
		<cfset var uniquePageID = '' />
		
		<!--- Check for a logged-in user -- NO caching --->
		<cfif structKeyExists(arguments, 'authUser')>
			<cfreturn super.toHTML(argumentCollection = arguments) />
		</cfif>
		
		<!--- Determine a unique page identification for caching purposes --->
		<cfset uniquePageID = createUniquePageID(argumentCollection = arguments) />
		
		<!--- TODO enable the caching by removing next line --->
		<cfreturn super.toHTML(argumentCollection = arguments) />
		
		<!--- Do we need to create and cache the HTML? --->
		<cfif NOT structKeyExists(variables.cachedHTML, uniquePageID)>
			<cfset variables.cachedHTML[uniquePageID] = super.toHTML(argumentCollection = arguments) />
		</cfif>
		
		<!--- Return the cached navigation html --->
		<cfreturn variables.cachedHTML[uniquePageID] />
	</cffunction>
	
	<cffunction name="validate" access="public" returntype="void" output="false">
		<cfargument name="prefixes" type="string" required="true" />
		
		<!--- Recurse through the navigation and validate each of the elements --->
		<cfset validateChild(variables.navigation, 'index', arguments.prefixes) />
	</cffunction>
	
	<cffunction name="validateChild" access="private" returntype="void" output="false">
		<cfargument name="navigation" type="struct" required="true" />
		<cfargument name="filename" type="string" required="true" />
		<cfargument name="prefixes" type="string" required="true" />
		
		<cfset var i = '' />
		<cfset var j = '' />
		<cfset var completeFilename = '' />
		<cfset var isChildren = false />
		<cfset var isGrandchildren = false />
		<cfset var nonDefaultList = getNonDefaultList(variables.defaults, arguments.navigation) />
		<cfset var nonDefaultKeyList = '' />
		
		<cfloop list="#nonDefaultList#" index="i">
			<!--- If we have not already handled children --->
			<cfif NOT isChildren AND NOT structIsEmpty(arguments.navigation[i])>
				<!--- Check for the existance of the prefixed files --->
				<cfloop list="#arguments.prefixes#" index="j">
					<!--- camelCase the filename in preperation for adding prefix --->
					<cfset arguments.filename = ucase(left(arguments.filename, 1)) & lcase(right(arguments.filename, len(arguments.filename) - 1)) />
					
					<!--- Compile the full filename together --->
					<cfset completeFilename = arguments.contentPath & j & arguments.filename & '.cfm' />
					
					<!--- If the prefixed file does not exist create it --->
					<cfif NOT fileExists(completeFilename)>
						<cffile action="write" file="#completeFilename#" output="" />
					</cfif>
				</cfloop>
				
				<cfset isChildren = true />
			</cfif>
			
			<!--- Get the non-default key list --->
			<cfset nonDefaultKeyList = getNonDefaultList(variables.defaultKeys, arguments.navigation[i]) />
			
			<!--- Check for need to recurse --->
			<cfloop list="#nonDefaultKeyList#" index="j">
				<!--- Child needs to have a child ( grandchild ) to recurse --->
				<cfif hasChildren(arguments.navigation[i][j])>
					<!--- Compile the full filename together --->
					<cfset completeFilename = arguments.contentPath & lcase(arguments.filename) & '/' />
					
					<!--- If this is the first time with a grandchild make certain the directory exists --->
					<cfif NOT isGrandchildren>
						<cfif NOT directoryExists(completeFilename)>
							<cfdirectory action="create" directory="#completeFilename#" />
						</cfif>
						
						<cfset isGrandchildren = true />
					</cfif>
					
					<!--- Recurse to the next child --->
					<cfset validateChild(arguments.navigation[i][j], j, arguments.prefixes) />
				</cfif>
			</cfloop>
		</cfloop>
	</cffunction>
</cfcomponent>