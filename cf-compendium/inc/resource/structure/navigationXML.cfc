<cfcomponent extends="cf-compendium.inc.resource.base.navigationFile" output="false">
	<cffunction name="addNavElements" access="private" returntype="void" output="false">
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
			
			<cfset addNavElements( argumentCollection = args ) />
		</cfloop>
	</cffunction>
	
	<cffunction name="applyMask" access="public" returntype="void" output="false">
		<cfargument name="filename" type="string" required="true" />
		<cfargument name="bundlePath" type="string" required="true" />
		<cfargument name="bundleName" type="string" required="true" />
		<cfargument name="locales" type="string" default="en_US" />
		
		<cfset var fileContents = '' />
		<cfset var bundle = '' />
		<cfset var locale = '' />
		
		<!--- Read and parse the navigation mask file --->
		<cfset fileContents = xmlParse(readMask(arguments.filename)).xmlRoot />
		
		<cfloop list="#arguments.locales#" index="locale">
			<!--- Set the resource bundle --->
			<cfset bundle = variables.i18n.getResourceBundle(arguments.bundlePath, arguments.bundleName, locale) />
			
			<!--- Add the navigation elements --->
			<cfset addNavElements(fileContents.xmlChildren, bundle) />
		</cfloop>
	</cffunction>
</cfcomponent>