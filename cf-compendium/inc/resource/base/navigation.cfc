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
		
		<!--- Get the navigation query --->
		<cfset navigation = this.getNav(argumentCollection = arguments) />
		
		<!--- Generate the html off the given navigation --->
		<cfset html = '<ul class="#arguments.navPosition# level-#arguments.level#">' />
		
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
	
	<cffunction name="toHTML" access="public" returntype="string" output="false">
		<cfargument name="theURL" type="component" required="true" />
		<cfargument name="level" type="numeric" required="true" />
		<cfargument name="navPosition" type="string" required="true" />
		<cfargument name="options" type="struct" default="#structNew()#" />
		<cfargument name="locale" type="string" default="en_US" />
		<cfargument name="authUser" type="component" required="false" />
		
		<!--- Clean a url variable for building links --->
		<cfset arguments.theURL.cleanCurrentPage() />
		
		<!--- TODO Use current URL to determine the base url for the navigation --->
		
		<cfreturn generateHTML(argumentCollection = arguments) />
	</cffunction>
</cfcomponent>