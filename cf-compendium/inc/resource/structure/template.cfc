<cfcomponent extends="cf-compendium.inc.resource.base.object" output="false">
	<cffunction name="init" access="public" returnType="component" output="false">
		<cfargument name="navigation" type="component" required="true" />
		<cfargument name="theURL" type="component" required="true" />
		<cfargument name="options" type="struct" default="#structNew()#" />
		
		<cfset var defaults = {
				attributes = {},
				authUser = '',
				pageTitles = [],
				levels = [],
				meta = {},
				scripts = [
					'http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js'
				],
				siteLink = '/',
				siteTitle = '',
				styles = []
			} />
		<cfset var i = '' />
		
		<cfset super.init() />
		
		<cfset properties(defaults, arguments.options) />
		
		<!--- Store the navigation and url objects --->
		<cfset variables.navigation = arguments.navigation />
		<cfset variables.theURL = arguments.theURL />
		
		<!--- Get the current page object --->
		<cfif NOT isObject(this.getAuthUser())>
			<cfset variables.currentPage = variables.navigation.locate(theURL) />
		<cfelse>
			<cfset variables.currentPage = variables.navigation.locate(theURL, this.getAuthUser()) />
		</cfif>
		
		<!--- Pull in the levels from the current page --->
		<cfloop array="#variables.currentPage.getLevels()#" index="i">
			<cfset this.addLevel(argumentCollection = i) />
		</cfloop>
		
		<cfreturn this />
	</cffunction>
	
	<!---
		Adds a level
	--->
	<cffunction name="addLevel" access="public" returntype="void" output="false">
		<cfargument name="title" type="string" required="true" />
		<cfargument name="link" type="string" default="##" />
		
		<cfset var level = {} />
		
		<cfset level.title = arguments.title />
		<cfset level.link = arguments.link />
		
		<cfset arrayAppend(variables.instance.levels, level) />
	</cffunction>
	
	<!---
		Uses the unique to add the scripts
	--->
	<cffunction name="addScripts" access="public" returntype="void" output="false">
		<cfset this.addUniqueScripts( argumentCollection = arguments ) />
	</cffunction>
	
	<!---
		Uses the unique to add the scripts
	--->
	<cffunction name="addStyle" access="public" returntype="void" output="false">
		<cfargument name="href" type="string" required="true" />
		<cfargument name="media" type="string" default="all" />
		
		<cfset this.addUniqueStyle( argumentCollection = arguments ) />
	</cffunction>
	
	<!---
		Uses the unique to add the scripts
	--->
	<cffunction name="addStyles" access="public" returntype="void" output="false">
		<cfset this.addUniqueStyles( argumentCollection = arguments ) />
	</cffunction>
	
	<!---
		Adds only a unique style
	--->
	<cffunction name="addUniqueStyle" access="public" returntype="void" output="false">
		<cfargument name="href" type="string" required="true" />
		<cfargument name="media" type="string" required="true" />
		
		<cfset var i = '' />
		<cfset var isUnique = '' />
		<cfset var j = '' />
		
		<!--- Check if it is already in the array --->
		<cfloop array="#variables.instance.styles#" index="j">
			<cfif j.href EQ arguments.href>
				<cfreturn />
			</cfif>
		</cfloop>
		
		<cfset style = {
				href = arguments.href,
				media = arguments.media
			} />
		
		<cfset arrayAppend( variables.instance.styles, style ) />
	</cffunction>
	
	<!---
		Adds only unique styles
	--->
	<cffunction name="addUniqueStyles" access="public" returntype="void" output="false">
		<cfset var i = '' />
		<cfset var isUnique = '' />
		<cfset var j = '' />
		
		<cfloop array="#arguments#" index="i">
			<cfset isUnique = true />
			
			<!--- Check if it is already in the array --->
			<cfloop array="#variables.instance.styles#" index="j">
				<cfif j.href EQ i>
					<cfset isUnique = false />
					
					<cfbreak />
				</cfif>
			</cfloop>
			
			<cfif isUnique>
				<cfset style = {
						href = i,
						media = 'all'
					} />
				
				<cfset arrayAppend( variables.instance.styles, style ) />
			</cfif>
		</cfloop>
	</cffunction>
	
	<!---
		Returns the attribute or a blank string if not found
	--->
	<cffunction name="getAttribute" access="public" returntype="string" output="false">
		<cfargument name="attributeName" type="string" required="true" />
		
		<!--- Check if it doesn't exist --->
		<cfif NOT structKeyExists(variables.instance.attributes, arguments.attributeName)>
			<cfreturn '' />
		</cfif>
		
		<cfreturn variables.instance.attributes[arguments.attributeName] />
	</cffunction>
	
	<!---
		Returns the formatted page titles as the breadcrumb
	--->
	<cffunction name="getBreadcrumb" access="public" returntype="string" output="false">
		<cfargument name="options" type="struct" default="#structNew()#" />
		
		<cfset var defaults = {
				separator = ' : ',
				showMultiple = true
			} />
		<cfset var extOptions = '' />
		<cfset var i = '' />
		<cfset var breadcrumb = '' />
		<cfset var numLevels = this.getLevel() />
		
		<!--- Check if there are page titles --->
		<cfif NOT numLevels>
			<cfthrow message="Missing Title" detail="There are no titles to retrieve" />
		</cfif>
		
		<!--- Extend out the options --->
		<cfset extOptions = this.extend(defaults, arguments.options) />
		
		<cfset breadcrumb = '<a href="' & variables.instance.levels[numLevels].link & '" title="' & variables.instance.levels[numLevels].title & '">' & variables.instance.levels[numLevels].title & '</a>' />
		
		<!--- If we are showing multiples --->
		<cfif extOptions.showMultiple>
			<cfloop from="#numLevels - 1#" to="1" index="i" step="-1">
				<cfset breadcrumb = '<a href="' & variables.instance.levels[i].link & '" title="' & variables.instance.levels[i].title & '">' & variables.instance.levels[i].title & '</a>' & extOptions.separator & breadcrumb />
			</cfloop>
		</cfif>
		
		<cfset breadcrumb = '<a href="' & this.getSiteLink() & '" title="' & this.getSiteTitle() & '">' & this.getSiteTitle() & '</a>' & extOptions.separator & breadcrumb />
		
		<cfreturn breadcrumb />
	</cffunction>
	
	<!---
		Returns the formatted page titles in reverse
	--->
	<cffunction name="getHtmlTitle" access="public" returntype="string" output="false">
		<cfargument name="options" type="struct" default="#structNew()#" />
		
		<cfset var defaults = {
				separator = ' : ',
				showMultiple = true
			} />
		<cfset var extOptions = '' />
		<cfset var i = '' />
		<cfset var htmlTitle = this.getSiteTitle() />
		<cfset var numLevels = this.getLevel() />
		
		<!--- Check if there are page titles --->
		<cfif NOT numLevels>
			<cfreturn this.getSiteTitle() />
		</cfif>
		
		<!--- Extend out the options --->
		<cfset extOptions = this.extend(defaults, arguments.options) />
		
		<cfset htmlTitle = variables.instance.levels[numLevels].title />
		
		<!--- If we are showing multiples --->
		<cfif extOptions.showMultiple>
			<cfloop from="#numLevels - 1#" to="1" index="i" step="-1">
				<cfset htmlTitle &= extOptions.separator & variables.instance.levels[i].title />
			</cfloop>
		</cfif>
		
		<cfset htmlTitle &= extOptions.separator & this.getSiteTitle() />
		
		<cfreturn htmlTitle />
	</cffunction>
	
	<cffunction name="getKey" access="public" returntype="string" output="false">
		<cfreturn variables.currentPage.getLastLevel().name />
	</cffunction>
	
	<!---
		Returns the number of levels in use
	--->
	<cffunction name="getLevel" access="public" returntype="numeric" output="false">
		<cfreturn arrayLen(variables.instance.levels) />
	</cffunction>
	
	<!---
		Returns the formatted meta information
	--->
	<cffunction name="getMeta" access="public" returntype="string" output="false">
		<cfset var i = '' />
		<cfset var meta = '' />
		
		<cfloop list="#structKeyList(variables.instance.meta)#" index="i">
			<!--- Check if it is a http-equiv or just a normal name --->
			<cfswitch expression="#i#">
				<cfcase value="content-type,expires,refresh,set-cookie">
					<cfset meta &= '<meta http-equiv="' & i & '" content="' & variables.instance.meta[i] & '" />' />
				</cfcase>
				<cfdefaultcase>
					<cfset meta &= '<meta name="' & i & '" content="' & variables.instance.meta[i] & '" />' />
				</cfdefaultcase>
			</cfswitch>
		</cfloop>
		
		<cfreturn meta />
	</cffunction>
	
	<!---
		Used to retrieve the formatted navigation element.
	--->
	<cffunction name="getNavigation" access="public" returntype="string" output="false">
		<cfargument name="level" type="numeric" default="1" />
		<cfargument name="position" type="string" required="true" />
		<cfargument name="options" type="struct" default="#structNew()#" />
		
		<cfset var defaults = {
				numLevels = 1,
				isExpanded = false,
				groupTag = '',
				outerTag = 'ul',
				innerTag = 'li'
			} />
		<cfset var navigation = variables.navigation.getNavigation(argumentCollection = arguments) />
		<cfset var tempHTML = '' />
		
		<cfset arguments.options = extend(defaults, arguments.options) />
		
		<!--- TODO Need to implement the getNavigation function in the navigation to correctly retrieve the structure needed for generating the html for the navigation --->
		
		<cfreturn tempHTML />
	</cffunction>
	
	<!---
		Returns the page title
	--->
	<cffunction name="getPageTitle" access="public" returntype="string" output="false">
		<cfargument name="level" type="numeric" default="#this.getLevel()#" />
		
		<cfset var numLevels = this.getLevel() />
		
		<!--- Check if there are page titles --->
		<cfif NOT numLevels>
			<cfreturn this.getSiteTitle() />
		</cfif>
		
		<!--- Check that we are requesting a level that exists --->
		<cfif arguments.level GT numLevels OR arguments.level LT 1>
			<cfthrow message="Invalid Level" detail="The #arguments.level# has not been defined" />
		</cfif>
		
		<cfreturn variables.instance.levels[arguments.level].title />
	</cffunction>
	
	<!---
		Returns the template path to include for the current page and prefix
	--->
	<cffunction name="getPath" access="public" returntype="string" output="false">
		<cfargument name="basePath" type="string" required="true" />
		<cfargument name="prefix" type="string" required="true" />
		
		<cfreturn variables.currentPage.getPath(argumentCollection = arguments) />
	</cffunction>
	
	<!---
		Used to retrieve a random file
	--->
	<cffunction name="getRandomFile" access="public" returntype="void" output="false">
		<cfset var tempHTML = '' />
		
		<cfreturn tempHTML />
	</cffunction>
	
	<!---
		Returns the scripts in HTML format
	--->
	<cffunction name="getScripts" access="public" returntype="string" output="false">
		<cfset var i = '' />
		<cfset var results = '' />
		
		<!--- Loop through each script and add it to the result --->
		<cfloop array="#variables.instance.scripts#" index="i">
			<cfset results &= '<script type="text/javascript" src="' & i & '"></script>' & chr(10) />
		</cfloop>
		
		<cfreturn results />
	</cffunction>
	
	<!---
		Returns the styles in HTML format
	--->
	<cffunction name="getStyles" access="public" returntype="string" output="false">
		<cfset var i = '' />
		<cfset var results = '' />
		
		<!--- Loop through each script and add it to the result --->
		<cfloop array="#variables.instance.styles#" index="i">
			<cfset results &= '<link rel="stylesheet" type="text/css" href="' & i.href & '" media="' & i.media & '" />' & chr(10) />
		</cfloop>
		
		<cfreturn results />
	</cffunction>
	
	<!---
		Returns if the attribute has been set
	--->
	<cffunction name="hasAttribute" access="public" returntype="string" output="false">
		<cfargument name="attributeName" type="string" required="true" />
		
		<cfreturn structKeyExists(variables.instance.attributes, arguments.attributeName) />
	</cffunction>
	
	<!---
		Sets the attribute to the specified value
	--->
	<cffunction name="setAttribute" access="public" returntype="void" output="false">
		<cfargument name="name" type="string" required="true" />
		<cfargument name="value" type="any" required="true" />
		
		<cfset variables.instance.attributes[arguments.name] = arguments.value />
	</cffunction>
	
	<!---
		Sets the meta information to the specified value
	--->
	<cffunction name="setMeta" access="public" returntype="void" output="false">
		<cfargument name="name" type="string" required="true" />
		<cfargument name="value" type="string" required="true" />
		
		<cfset variables.instance.meta[arguments.name] = arguments.value />
	</cffunction>
</cfcomponent>