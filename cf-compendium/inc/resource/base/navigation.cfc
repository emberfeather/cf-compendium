<cfcomponent extends="cf-compendium.inc.resource.base.base" output="false">
	<cffunction name="init" access="public" returntype="component" output="false">
		<cfreturn this />
	</cffunction>
	
	<cffunction name="generateHTML" access="private" returntype="string" output="false">
		<cfargument name="theURL" type="component" required="true" />
		<cfargument name="level" type="numeric" required="true" />
		<cfargument name="navPosition" type="string" required="true" />
		<cfargument name="parentPath" type="string" default="." />
		<cfargument name="options" type="struct" default="#structNew()#" />
		<cfargument name="locale" type="string" default="en_US" />
		<cfargument name="authUser" type="component" required="false" />
		
		<cfset var attributes = '' />
		<cfset var html = '' />
		<cfset var isSelected = '' />
		<cfset var navigation = '' />
		<cfset var temp = '' />
		<cfset var defaults = {
				navClasses = []
			} />
		
		<!--- Extend the options --->
		<cfset arguments.options = extend(defaults, arguments.options) />
		
		<!--- For generating the navigation HTML exclude blank nav titles --->
		<cfset arguments.options.hideBlankNavTitles = true />
		
		<!--- Get the navigation query --->
		<cfset navigation = this.getNav(argumentCollection = arguments) />
		
		<!--- Generate the html off the given navigation --->
		<cfset html = '<ul class="' />
		
		<!--- Add navigation classes --->
		<cfif arrayLen(arguments.options.navClasses)>
			<cfset html &= arguments.options.navClasses[1] />
		</cfif>
		
		<cfset html &= ' ' & arguments.navPosition />
		<cfset html &= ' level-' & arguments.level />
		
		<!--- Close the opening ul --->
		<cfset html &= '">' />
		
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
				
				<!--- Decrement the depth so that it eventually ends --->
				<cfset temp = duplicate(arguments) />
				<cfset temp.level++ />
				<cfset temp.parentPath = navigation.path & '.' />
				<cfset temp.options = duplicate(arguments.options) />
				<cfset temp.options.depth-- />
				
				<!--- Check if there are nav classes being used --->
				<cfif arrayLen(arguments.options.navClasses)>
					<cfset arrayDeleteAt(temp.options.navClasses, 1) />
				</cfif>
				
				<!--- Generate the additional HTML for the sub navigation --->
				<cfset html &= generateHTML(argumentCollection = temp) />
			</cfif>
			
			<!--- Remove the navigation variable so it doesn't affect other navigation --->
			<cfset arguments.theURL.removeCurrentPage('_base') />
			
			<cfset html &= '</li>' />
		</cfoutput>
		
		<cfset html &= '</ul>' />
		
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
		<cfargument name="navPosition" type="string" required="true" />
		<cfargument name="options" type="struct" default="#structNew()#" />
		<cfargument name="locale" type="string" default="en_US" />
		<cfargument name="authUser" type="component" required="false" />
		
		<!--- Clean a url variable for building links --->
		<cfset arguments.theURL.cleanCurrentPage() />
		
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