<cfcomponent extends="cf-compendium.inc.resource.base.base" output="false">
	<cffunction name="init" access="public" returntype="component" output="false">
		<!--- Store the default values for the navigation elements --->
		<cfset variables.defaults = {
				title = '',
				navTitle = '',
				desc = '',
				attributes = {},
				allow = '',
				deny = '',
				order = 'allow,deny'
			} />
		
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
		
		<cfif NOT fileExists(arguments.navigationFile)>
			<cfset arguments.navigationFile = expandPath(arguments.navigationFile) />
		</cfif>
		
		<cffile action="read" file="#arguments.navigationFile#" variable="fileContents" />
		
		<cfreturn fileContents />
	</cffunction>
</cfcomponent>