<cfcomponent extends="cf-compendium.inc.resource.base.base" output="false">
	<cffunction name="init" access="public" returntype="component" output="false">
		
		<!--- Store the default values for the navigation elements --->
		<cfset variables.defaults = {
				title = '',
				navTitle = '',
				navPosition = '',
				desc = '',
				ids = '',
				vars = '',
				attributes = {},
				allow = '*',
				deny = '*',
				order = 'allow,deny'
			} />
		<cfset variables.navigation = {} />
		
		<cfreturn this />
	</cffunction>
	
	<cffunction name="expandNavigation" access="private" returntype="struct" output="false">
		<cfargument name="parsedNav" type="struct" required="true" />
		
		<cfset var i = '' />
		<cfset var j = '' />
		
		<!--- Look for non-reserved keys that signify more levels of navigation --->
		<cfloop list="#structKeyList(arguments.parsedNav)#" index="i">
			<!--- Check if it is one of the reserved keys --->
			<cfif NOT structKeyExists(variables.defaults, i) AND isStruct(arguments.parsedNav[i])>
				<!--- Don't want to expand the navigation keys, just the navigation elements --->
				<cfloop list="#structKeyList(arguments.parsedNav[i])#" index="j">
					<!--- Recurse into the navigation --->
					<cfset arguments.parsedNav[i][j] = expandNavigation(arguments.parsedNav[i][j]) />
				</cfloop>
			</cfif>
		</cfloop>
		
		<cfset arguments.parsedNav = extend(variables.defaults, arguments.parsedNav) />
		
		<cfreturn arguments.parsedNav />
	</cffunction>
	
	<cffunction name="hasChildren" access="public" returntype="boolean" output="false">
		<cfargument name="navigation" type="struct" required="true" />
		
		<cfset var i = '' />
		
		<!--- Check for children that are not reserved --->
		<cfloop list="#structKeyList(arguments.navigation)#" index="i">
			<!--- If it is not one of the reserved keys and is not empty --->
			<cfif NOT structKeyExists(variables.defaults, i) AND NOT structIsEmpty(arguments.navigation[i])>
				<cfreturn true />
			</cfif>
		</cfloop>
		
		<cfreturn false />
	</cffunction>
	
	<cffunction name="maskNavigation" access="private" returntype="struct" output="false">
		<cfargument name="navigation" type="struct" required="true" />
		<cfargument name="mask" type="struct" required="true" />
		
		<cfset var i = '' />
		
		<!--- Look for keys in the mask --->
		<cfloop list="#structKeyList(arguments.mask)#" index="i">
			<!--- If we already have a value for it --->
			<cfif isStruct(arguments.mask[i])>
				<!--- Make sure we have the default in the navigation before we proceed --->
				<cfif NOT structKeyExists(arguments.navigation, i)>
					<cfset arguments.navigation[i] = duplicate(variables.defaults) />
				</cfif>
				
				<!--- If the key is a struct, recurse --->
				<cfset arguments.navigation[i] = maskNavigation(arguments.navigation[i], arguments.mask[i]) />
			<cfelse>
				<!--- Pull the value into the navigation struct --->
				<cfset arguments.navigation[i] = arguments.mask[i] />
			</cfif>
		</cfloop>
		
		<cfreturn arguments.navigation />
	</cffunction>
	
	<cffunction name="readFile" access="private" returntype="string" output="false">
		<cfargument name="navigationFile" type="string" required="true" />
		
		<cfset var fileContents = '' />
		
		<!--- Check if the file path needs to be expanded --->
		<cfif NOT fileExists(arguments.navigationFile)>
			<cfset arguments.navigationFile = expandPath(arguments.navigationFile) />
		</cfif>
		
		<cffile action="read" file="#arguments.navigationFile#" variable="fileContents" />
		
		<cfreturn fileContents />
	</cffunction>
	
	<cffunction name="validate" access="public" returntype="void" output="false">
		<cfargument name="contentPath" type="string" required="true" />
		<cfargument name="prefixes" type="string" required="true" />
		
		<!--- Check if the directory needs to be expanded --->
		<cfif NOT directoryExists(arguments.contentPath)>
			<cfset arguments.contentPath = expandPath(arguments.contentPath) />
		</cfif>
		
		<!--- Normalize the directory path --->
		<cfif right(arguments.contentPath, 1) NEQ '/'>
			<cfset arguments.contentPath &= '/' />
		</cfif>
		
		<!--- Recurse through the navigation and validate each of the elements --->
		<cfset validateChild(variables.navigation, 'index', arguments.contentPath, arguments.prefixes) />
	</cffunction>
	
	<cffunction name="validateChild" access="private" returntype="void" output="false">
		<cfargument name="navigation" type="struct" required="true" />
		<cfargument name="filename" type="string" required="true" />
		<cfargument name="contentPath" type="string" required="true" />
		<cfargument name="prefixes" type="string" required="true" />
		
		<cfset var i = '' />
		<cfset var j = '' />
		<cfset var completeFilename = '' />
		<cfset var isChildren = false />
		<cfset var isGrandchildren = false />
		
		<!--- Check for recursion --->
		<cfloop list="#structKeyList(arguments.navigation)#" index="i">
			<!--- If it is not one of the reserved keys --->
			<cfif NOT structKeyExists(variables.defaults, i)>
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
				
				<!--- Check for need to recurse --->
				<cfloop list="#structKeyList(arguments.navigation[i])#" index="j">
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
						<cfset validateChild(arguments.navigation[i][j], j, completeFilename, arguments.prefixes) />
					</cfif>
				</cfloop>
			</cfif>
		</cfloop>
	</cffunction>
</cfcomponent>