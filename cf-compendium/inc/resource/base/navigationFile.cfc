<cfcomponent extends="cf-compendium.inc.resource.base.base" output="false">
	<cffunction name="init" access="public" returntype="component" output="false">
		<!--- Store the default values for the navigation elements --->
		<cfset variables.defaults = {
				title = '',
				desc = '',
				ids = '',
				vars = '',
				precedence = '*',
				attributes = {},
				allow = '*',
				deny = '*',
				defaults = '*',
				order = 'allow,deny',
				navTitle = '',
				navPosition = ''
			} />
		<cfset variables.defaultKeys = {
				precedence = '*'
			} />
		<cfset variables.navigation = {} />
		
		<cfreturn this />
	</cffunction>
	
	<cffunction name="checkMatch" access="private" returntype="any" output="false">
		<cfargument name="element" type="struct" required="true" />
		<cfargument name="authUser" type="component" required="false" />
		
		<cfset var isExplicitAllow = arguments.element.allow EQ '*' />
		<cfset var isExplicitDeny = arguments.element.deny EQ '*' />
		
		<!--- Check if we have to worry about the user for permissions --->
		<cfif structKeyExists(arguments, 'authUser')>
			<!--- Check for an actual named explicit --->
			<cfif NOT isExplicitAllow AND isListCollision(arguments.element.allow, arrayToList(arguments.authUser.getUserTypes()))>
				<cfset isExplicitAllow = true />
			</cfif>
			
			<!--- Check for an actual named explicit --->
			<cfif NOT isExplicitDeny AND isListCollision(arguments.element.deny, arrayToList(arguments.authUser.getUserTypes()))>
				<cfset isExplicitDeny = true />
			</cfif>
		</cfif>
		
		<!--- Check the order --->
		<cfif listFirst(arguments.element.order) EQ 'allow'>
			<cfif isExplicitAllow OR NOT isExplicitDeny>
				<cfreturn arguments.element />
			</cfif>
		<cfelse>
			<cfif NOT isExplicitDeny OR isExplicitAllow>
				<cfreturn arguments.element />
			</cfif>
		</cfif>
		
		<!--- Didn't make it through the match --->
		<cfreturn '' />
	</cffunction>
	
	<cffunction name="expandNavigation" access="private" returntype="struct" output="false">
		<cfargument name="parsedNav" type="struct" required="true" />
		
		<cfset var i = '' />
		<cfset var j = '' />
		<cfset var nonDefaultList = '' />
		<cfset var nonDefaultKeyList = '' />
		
		<!--- Expand the current node --->
		<cfset arguments.parsedNav = extend(variables.defaults, arguments.parsedNav) />
		
		<!--- Get the non-default list --->
		<cfset nonDefaultList = getNonDefaultList(variables.defaults, arguments.parsedNav) />
		
		<!--- Look for more levels of navigation --->
		<cfloop list="#nonDefaultList#" index="i">
			<cfif isStruct(arguments.parsedNav[i])>
				<!--- Expand the navigation keys --->
				<cfset arguments.parsedNav[i] = extend(variables.defaultKeys, arguments.parsedNav[i]) />
				
				<!--- Get the non-default key list --->
				<cfset nonDefaultKeyList = getNonDefaultList(variables.defaultKeys, arguments.parsedNav[i]) />
				
				<!--- Expand the navigation elements --->
				<cfloop list="#nonDefaultKeyList#" index="j">
					<cfif NOT structKeyExists(defaultKeys, j)>
						<!--- Recurse into the navigation --->
						<cfset arguments.parsedNav[i][j] = expandNavigation(arguments.parsedNav[i][j]) />
					</cfif>
				</cfloop>
			</cfif>
		</cfloop>
		
		<cfreturn arguments.parsedNav />
	</cffunction>
	
	<cffunction name="getNavigation" access="public" returntype="array" output="false">
		<cfargument name="theURL" type="component" required="true" />
		<cfargument name="level" type="numeric" required="true" />
		<cfargument name="navPosition" type="string" required="true" />
		<cfargument name="options" type="struct" default="#structNew()#" />
		<cfargument name="authUser" type="component" required="false" />
		
		<cfset var currNavigation = [] />
		
		<!--- Clean a url variable for building links --->
		<cfset arguments.theURL.clean('currentPage') />
		
		<!--- Need to traverse the url to find out the navigation --->
		<cfif structKeyExists(arguments, 'authUser')>
			<cfset getNavigationChild(variables.navigation, currNavigation, arguments.theURL, arguments.level, arguments.navPosition, arguments.options, arguments.authUser) />
		<cfelse>
			<cfset getNavigationChild(variables.navigation, currNavigation, arguments.theURL, arguments.level, arguments.navPosition, arguments.options) />
		</cfif>
		
		<cfreturn currNavigation />
	</cffunction>
	
	<cffunction name="getNavigationChild" access="private" returntype="void" output="false">
		<cfargument name="navigation" type="struct" required="true" />
		<cfargument name="currNavigation" type="array" required="true" />
		<cfargument name="theURL" type="component" required="true" />
		<cfargument name="level" type="numeric" required="true" />
		<cfargument name="navPosition" type="string" required="true" />
		<cfargument name="options" type="struct" default="#structNew()#" />
		<cfargument name="authUser" type="component" required="false" />
		
		<cfset var i = '' />
		<cfset var matched= '' />
		
		<!--- If we are not on the first level, find it --->
		<cfif arguments.level GT 1>
			<!--- Locate the page that matches the url --->
			<cfif structKeyExists(arguments, 'authUser')>
				<cfset matched = locateMatch(arguments.navigation, arguments.theURL, arguments.authUser) />
			<cfelse>
				<cfset matched = locateMatch(arguments.navigation, arguments.theURL) />
			</cfif>
			
			<!--- If we didn't find it then it doesn't exist --->
			<cfif NOT isStruct(matched.match)>
				<cfreturn />
			</cfif>
			
			<!--- Add to url --->
			<cfset arguments.theURL.set('currentPage', lcase(matched.urlVar), lcase(matched.urlValue)) />
			
			<!--- Recurse --->
			<cfif structKeyExists(arguments, 'authUser')>
				<cfset getNavigationChild(variables.navigation, currNavigation, arguments.theURL, arguments.level - 1, arguments.navPosition, arguments.options, arguments.authUser) />
			<cfelse>
				<cfset getNavigationChild(variables.navigation, currNavigation, arguments.theURL, arguments.level - 1, arguments.navPosition, arguments.options) />
			</cfif>
		<cfelse>
			<!--- We are on the level 1 --->
			<cfthrow message="Incomplete: Need to figure out how to implement this correctly" />
		</cfif>
	</cffunction>
	
	<cffunction name="getNonDefaultList" access="private" returntype="string" output="false">
		<cfargument name="defaults" type="struct" required="true" />
		<cfargument name="navigation" type="struct" required="true" />
		
		<cfset var i = '' />
		<cfset var nonDefaultList = '' />
		
		<!--- If it is not any precedence return the specified precedence --->
		<cfif arguments.navigation.precedence NEQ '*'>
			<cfreturn arguments.navigation.precedence />
		</cfif>
		
		<!--- Find all the keys that are not part of the reserved defaults --->
		<cfloop list="#structKeyList(arguments.navigation)#" index="i">
			<cfif NOT structKeyExists(arguments.defaults, i)>
				<cfset nonDefaultList = listAppend(nonDefaultList, i) />
			</cfif>
		</cfloop>
		
		<cfreturn nonDefaultList />
	</cffunction>
	
	<cffunction name="hasChildren" access="public" returntype="boolean" output="false">
		<cfargument name="navigation" type="struct" required="true" />
		
		<cfset var i = '' />
		<cfset var nonDefaultList = getNonDefaultList(variables.defaults, arguments.navigation) />
		
		<!--- Check for any that are not empty children --->
		<cfloop list="#nonDefaultList#" index="i">
			<cfif NOT structIsEmpty(arguments.navigation[i])>
				<cfreturn true />
			</cfif>
		</cfloop>
		
		<cfreturn false />
	</cffunction>
	
	<cffunction name="isListCollision" access="private" returntype="boolean" output="false">
		<cfargument name="list1" type="string" required="true" />
		<cfargument name="list2" type="string" required="true" />
		
		<cfset var i = '' />
		
		<cfloop list="#list1#" index="i">
			<cfif listFindNoCase(list2, i)>
				<cfreturn true />
			</cfif>
		</cfloop>
		
		<cfreturn false />
	</cffunction>
	
	<cffunction name="locate" access="public" returntype="component" output="false">
		<cfargument name="theURL" type="component" required="true" />
		<cfargument name="authUser" type="component" required="false" />
		
		<cfset var currentPage = createObject('component', 'cf-compendium.inc.resource.structure.currentPage').init() />
		
		<!--- Clean a url variable for building links --->
		<cfset arguments.theURL.clean('currentPage') />
		
		<!--- Need to traverse the url to find out the current page --->
		<cfif structKeyExists(arguments, 'authUser')>
			<cfset locateChild(variables.navigation, currentPage, arguments.theURL, arguments.authUser) />
		<cfelse>
			<cfset locateChild(variables.navigation, currentPage, arguments.theURL) />
		</cfif>
		
		<cfreturn currentPage />
	</cffunction>
	
	<cffunction name="locateChild" access="private" returntype="void" output="false">
		<cfargument name="navigation" type="struct" required="true" />
		<cfargument name="currentPage" type="component" required="true" />
		<cfargument name="theURL" type="component" required="true" />
		<cfargument name="authUser" type="component" required="false" />
		
		<cfset var i = '' />
		<cfset var matched = '' />
		<cfset var nonDefaultList = getNonDefaultList(variables.defaults, arguments.navigation) />
		<cfset var nonDefaultKeyList = '' />
		
		<!--- Locate the page that matches the url --->
		<cfif structKeyExists(arguments, 'authUser')>
			<cfset matched = locateMatch(arguments.navigation, arguments.theURL, arguments.authUser) />
		<cfelse>
			<cfset matched = locateMatch(arguments.navigation, arguments.theURL) />
		</cfif>
		
		<!--- If we found a match add the information and recurse --->
		<cfif isStruct(matched.match)>
			<!--- Add to current page --->
			<cfset arguments.theURL.set('currentPage', lcase(matched.urlVar), lcase(matched.urlValue)) />
			<cfset arguments.currentPage.addLevel(lcase(matched.urlVar), lcase(matched.urlValue), matched.match.title, arguments.theURL.get('currentPage')) />
			
			<!--- Recurse --->
			<cfif structKeyExists(arguments, 'authUser')>
				<cfset locateChild(matched.match, currentPage, arguments.theURL, arguments.authUser) />
			<cfelse>
				<cfset locateChild(matched.match, currentPage, arguments.theURL) />
			</cfif>
		</cfif>
	</cffunction>
	
	<cffunction name="locateMatch" access="private" returntype="struct" output="false">
		<cfargument name="navigation" type="struct" required="true" />
		<cfargument name="theURL" type="component" required="true" />
		<cfargument name="authUser" type="component" required="false" />
		
		<cfset var i = '' />
		<cfset var matched = {
				match = '',
				urlVar = '',
				urlValue = ''
			} />
		<cfset var nonDefaultList = getNonDefaultList(variables.defaults, arguments.navigation) />
		<cfset var nonDefaultKeyList = '' />
		
		<!--- Check if given an explicit element of the navigation --->
		<cfloop list="#nonDefaultList#" index="i">
			<!--- Found the url value to check navigation for --->
			<cfset matched.urlValue = arguments.theURL.search('', i) />
			
			<!--- If we found a value check for a match --->
			<cfif matched.urlValue NEQ ''>
				<cfloop list="#structKeyList(arguments.navigation[i])#" index="j">
					<cfif j EQ matched.urlValue>
						<!--- Check if using a user --->
						<cfif structKeyExists(arguments, 'authUser')>
							<cfset matched.match = checkMatch(arguments.navigation[i][j], arguments.authUser) />
						<cfelse>
							<cfset matched.match = checkMatch(arguments.navigation[i][j]) />
						</cfif>
						
						<!--- Save the url value for later --->
						<cfset matched.urlVar = i />
						
						<cfbreak />
					</cfif>
				</cfloop>
			</cfif>
			
			<!--- If we found a match stop looking --->
			<cfif isStruct(matched.match)>
				<cfbreak />
			</cfif>
		</cfloop>
		
		<!--- If we didn't find a valid breadth first match look for a default --->
		<cfif NOT isStruct(matched.match)>
			<cfloop list="#nonDefaultList#" index="i">
				<!--- Get the non-default key list --->
				<cfset nonDefaultKeyList = getNonDefaultList(variables.defaultKeys, arguments.navigation[i]) />
				
				<!--- Check for a default --->
				<cfloop list="#nonDefaultKeyList#" index="j">
					<!--- Check if using a user --->
					<cfif structKeyExists(arguments, 'authUser') AND (arguments.navigation[i][j].defaults EQ '*' OR isListCollistion(arguments.navigation[i][j].defaults, arguments.authUser.getUserTypes()))>
						<cfset matched.match = checkMatch(arguments.navigation[i][j], arguments.authUser) />
					<cfelseif arguments.navigation[i][j].defaults EQ '*'>
						<cfset matched.match = checkMatch(arguments.navigation[i][j]) />
					</cfif>
					
					<!--- Only break if we did find a valid default --->
					<cfif isStruct(matched.match)>
						<cfset matched.urlVar = i />
						<cfset matched.urlValue = j />
						
						<cfbreak />
					</cfif>
				</cfloop>
				
				<!--- Keep breaking if we found a match --->
				<cfif isStruct(matched.match)>
					<cfbreak />
				</cfif>
			</cfloop>
		</cfif>
		
		<cfreturn matched />
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
					<cfset validateChild(arguments.navigation[i][j], j, completeFilename, arguments.prefixes) />
				</cfif>
			</cfloop>
		</cfloop>
	</cffunction>
</cfcomponent>