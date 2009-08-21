<cfcomponent extends="cf-compendium.inc.resource.base.base" output="false">
	<cffunction name="init" access="public" returntype="component" output="false">
		<cfreturn this />
	</cffunction>
	
	<cffunction name="explodePath" access="public" returntype="array" output="false">
		<cfargument name="path" type="string" required="true" />
		
		<cfset var exploded = [] />
		<cfset var part = '' />
		<cfset var partLen = '' />
		<cfset var search = 0 />
		
		<cfset search = find('.', arguments.path, search) />
		
		<cfloop condition="search GT 0">
			<!--- Make sure that only the root will end with a period --->
			<cfset partLen = (search GT 1 ? search - 1 : search) />
			
			<!--- Retrieve the part of the path --->
			<cfset part = left(arguments.path, partLen) />
			
			<!--- Add the part --->
			<cfset arrayAppend(exploded, part) />
			
			<cfset search = find('.', arguments.path, search + 1) />
		</cfloop>
		
		<!--- The full path is part of the explode --->
		<cfset arrayAppend(exploded, arguments.path) />
		
		<cfreturn exploded />
	</cffunction>
	
	<cffunction name="generateHTML" access="private" returntype="string" output="false">
		<cfargument name="theURL" type="component" required="true" />
		<cfargument name="level" type="numeric" required="true" />
		<cfargument name="navPosition" type="any" required="true" />
		<cfargument name="parentPath" type="string" default="." />
		<cfargument name="options" type="struct" default="#{}#" />
		<cfargument name="locale" type="string" default="en_US" />
		<cfargument name="authUser" type="component" required="false" />
		
		<cfset var attributes = '' />
		<cfset var defaults = {
				navClasses = []
			} />
		<cfset var html = '' />
		<cfset var isSelected = '' />
		<cfset var navigation = '' />
		<cfset var positions = '' />
		<cfset var temp = '' />
		
		<!--- Extend the options --->
		<cfset arguments.options = extend(defaults, arguments.options) />
		
		<!--- For generating the navigation HTML exclude blank nav titles --->
		<cfset arguments.options.hideBlankNavTitles = true />
		
		<!--- Store the nav positions for later --->
		<cfset positions = arguments.navPosition />
		
		<!--- Check if we are dealing with an array of positions or not --->
		<cfif isArray(arguments.navPosition)>
			<cfif NOT arrayLen(arguments.navPosition)>
				<cfthrow message="Missing nav position" detail="No nav position was provided for level #arguments.level#" />
			</cfif>
			
			<cfset arguments.navPosition = arguments.navPosition[1] />
		</cfif>
		
		<!--- Get the navigation query --->
		<cfset navigation = this.getNav(argumentCollection = arguments) />
		
		<!--- Check for blank navigation --->
		<cfif NOT navigation.recordCount>
			<cfreturn html />
		</cfif>
		
		<!--- Generate the html off the given navigation --->
		<cfset html = '<ul class="' />
		
		<!--- Add navigation classes --->
		<cfif arrayLen(arguments.options.navClasses)>
			<cfset html &= arguments.options.navClasses[1] />
		</cfif>
		
		<cfset html &= ' ' & arguments.navPosition />
		<cfset html &= ' level-' & arguments.level />
		
		<!--- Close the opening ul --->
		<cfset html &= '">' & chr(10) />
		
		<cfoutput query="navigation" group="pageID">
			<!--- Discover the attributes for the page --->
			<cfset attributes = {} />
			
			<cfif navigation.attribute NEQ ''>
				<cfoutput>
					<cfset attributes[navigation.attribute] = navigation.attributeValue />
				</cfoutput>
			</cfif>
			
			<!--- Set the navigation  --->
			<cfset arguments.theURL.setCurrentPage('_base', navigation.path) />
			<cfset isSelected = arguments.theURL.search('_base') EQ navigation.path />
			
			<cfset html &= '<li>' />
			
			<cfset html &= '<a' />
			
				<!--- href --->
				<cfset html &= ' href="' & arguments.theURL.getCurrentPage() & '"' />
				
				<!--- class --->
				<cfset html &= ' class="' />
				
					<!--- Check if we are currently selected --->
					<cfif isSelected>
						<cfset html &= 'selected' />
					</cfif>
				
				<cfset html &= '"' />
			
			<cfset html &= '>' />
			
			<cfset html &= navigation.navTitle />
			
			<cfset html &= '</a>' />
			
			<!---
				Check for
				 - option to recurse sub-navigation
				 - option to only create navigation for the current navigation path
			--->
			<cfif structKeyExists(arguments.options, 'depth')
				AND arguments.options.depth NEQ 1
				AND (
					NOT structKeyExists(arguments.options, 'selectedOnly')
					OR arguments.options.selectedOnly EQ false
					OR isSelected
				)>
				<cfset html  &= chr(10) />
				
				<!--- Decrement the depth so that it eventually ends --->
				<cfset temp = duplicate(arguments) />
				<cfset temp.level++ />
				<cfset temp.parentPath = navigation.path & '.' />
				<cfset temp.options = duplicate(arguments.options) />
				<cfset temp.options.depth-- />
				
				<!--- Check if there are multiple nav classes being used --->
				<cfif arrayLen(arguments.options.navClasses)>
					<cfset arrayDeleteAt(temp.options.navClasses, 1) />
				</cfif>
				
				<!--- Set the position to the original --->
				<cfset temp.navPosition = duplicate(positions) />
				
				<!--- Remove the first position since it has already been used --->
				<cfif isArray(temp.navPosition)>
					<cfset arrayDeleteAt(temp.navPosition, 1) />
				</cfif>
				
				<!--- Generate the additional HTML for the sub navigation --->
				<cfset html &= generateHTML(argumentCollection = temp) />
			</cfif>
			
			<!--- Remove the navigation variable so it doesn't affect other navigation --->
			<cfset arguments.theURL.removeCurrentPage('_base') />
			
			<cfset html &= '</li>' & chr(10) />
		</cfoutput>
		
		<cfset html &= '</ul>' & chr(10) />
		
		<cfreturn html />
	</cffunction>
	
	<cffunction name="getBasePathForLevel" access="public" returntype="string" output="false">
		<cfargument name="level" type="numeric" required="true" />
		<cfargument name="basePath" type="string" required="true" />
		
		<cfset var count = 0 />
		<cfset var i = '' />
		<cfset var position = 0 />
		
		<!--- Check for no base path --->
		<cfif arguments.basePath EQ ''>
			<cfset arguments.basePath = '.' />
		</cfif>
		
		<!--- Want to make sure it ends in a period for searching --->
		<cfif right(arguments.basePath, 1) NEQ '.'>
			<cfset arguments.basePath &= '.' />
		</cfif>
		
		<!--- Find the proper level we are looking for --->
		<cfloop from="1" to="#arguments.level#" index="i">
			<!--- Start with the next position to not get stuck --->
			<cfset position = find('.', arguments.basePath, position + 1) />
			
			<!--- If we can't find it stop looking --->
			<cfif position EQ 0>
				<cfbreak />
			</cfif>
		</cfloop>
		
		<!--- If not found, lower in levels that we have --->
		<!--- EX: looking for level 3 when only on level 1 --->
		<cfif position EQ 0>
			<cfreturn '' />
		</cfif>
		
		<!--- Return the portion we are looking for --->
		<cfreturn left(arguments.basePath, position) />
	</cffunction>
	
	<cffunction name="toHTML" access="public" returntype="string" output="false">
		<cfargument name="theURL" type="component" required="true" />
		<cfargument name="level" type="numeric" required="true" />
		<cfargument name="navPosition" type="any" required="true" />
		<cfargument name="options" type="struct" default="#{}#" />
		<cfargument name="locale" type="string" default="en_US" />
		<cfargument name="authUser" type="component" required="false" />
		
		<!--- Set the base parent path dependent upon the current level --->
		<cfset arguments.parentPath = getBasePathForLevel(arguments.level, arguments.theURL.search('_base')) />
		
		<!---
			If we can't find a parent path for the level we are looking
			then we shouldn't have a navigation to generate.
		--->
		<cfif arguments.parentPath EQ ''>
			<cfreturn '' />
		</cfif>
		
		<cfreturn generateHTML(argumentCollection = arguments) />
	</cffunction>
</cfcomponent>