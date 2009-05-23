<cfcomponent extends="cf-compendium.inc.resource.base.object" output="false">
	<cffunction name="init" access="public" returntype="component" output="false">
		<cfargument name="appBaseDirectory" type="string" required="true" />
		
		<cfset super.init() />
		
		<cfset variables.appBaseDirectory = arguments.appBaseDirectory />
		
		<cfreturn this />
	</cffunction>
	
	<cffunction name="normalizePath" access="public" returntype="string" output="false">
		<cfargument name="path" type="string" required="true" />
		
		<cfif right(arguments.path, 1) NEQ '/'>
			<cfreturn arguments.path & '/' />
		</cfif>
		
		<cfreturn path />
	</cffunction>
	
	<cffunction name="readApplicationConfig" access="public" returntype="struct" output="false">
		<cfset var appConfig = '' />
		<cfset var appConfigFile = normalizePath(variables.appBaseDirectory) & '/config/application.json.cfm' />
		
		<cfif NOT fileExists(appConfigFile)>
			<cfset appConfigFile = expandPath(appConfigFile) />
			
			<cfif NOT fileExists(appConfigFile)>
				<cfthrow message="Could not find the application configuration" detail="The application could not be detected at #variables.appBaseDirectory#" />
			</cfif>
		</cfif>
		
		<!--- Read the application config file --->
		<cffile action="read" file="#appConfigFile#" variable="appConfig" />
		
		<!--- Parse and return the config --->
		<cfreturn serializeJSON(appConfig) />
	</cffunction>
	
	<cffunction name="readPluginConfig" access="public" returntype="struct" output="false">
		<cfargument name="pluginKey" type="string" required="true" />
		
		<cfset var pluginConfig = '' />
		<cfset var pluginConfigFile = normalizePath(variables.appBaseDirectory) & '/plugins/' & arguments.pluginKey & '/config/plugin.json.cfm' />
		
		<cfif NOT fileExists(appConfigFile)>
			<cfset pluginConfigFile = expandPath(pluginConfigFile) />
			
			<cfif NOT fileExists(pluginConfigFile)>
				<cfthrow message="Could not find the plugin configuration" detail="The plugin could not be detected at #variables.appBaseDirectory# for #arguments.pluginKey#" />
			</cfif>
		</cfif>
		
		<!--- Read the application config file --->
		<cffile action="read" file="#pluginConfigFile#" variable="pluginConfig" />
		
		<!--- Parse and return the config --->
		<cfreturn serializeJSON(pluginConfig) />
	</cffunction>
	
	<cffunction name="startApplication" access="public" returntype="struct" output="false">
		<cfset var appConfig = '' />
		<cfset var defaultPluginConfig = {
				information = {
					key = 'unknown',
					title = 'unknown',
					i18n = {
						locales = 'en_US'
					},
					prerequisites = {
					},
					version = 'unknown'
				}
			} />
		<cfset var naviationMasks = {} />
		<cfset var i = '' />
		<cfset var j = '' />
		<cfset var newApplication = {
				information = {
					key = 'unknown',
					title = 'unknown',
					i18n = {
						base = '/root',
						locales = 'en_US'
					},
					admin = {
						directory = 'admin'
					}
				},
				plugins = {},
				singletons = {}
			} />
		<cfset var pluginConfig = '' />
		<cfset var pluginList = '' />
		<cfset var precedence = '' />
		
		<!--- Read in application information --->
		<cfset appConfig = readApplicationConfig(variables.appBaseDirectory) />
		
		<!--- Extend information from the config --->
		<cfif structKeyExists(appConfig, 'information')>
			<cfset newApplication.information = extend(newApplication.information, appConfig.information, -1) />
		</cfif>
		
		<!--- Pull in the list of plugins --->
		<cfif structKeyExists(appConfig, 'plugins')>
			<cfset pluginList = arrayToList(appConfig.plugins) />
		</cfif>
		
		<!--- Read in all plugin configs --->
		<cfloop list="#pluginList#" index="i">
			<cfset newApplication.plugins[i] = duplicate(defaultPluginConfig) />
			<cfset pluginConfig = readPluginConfig(variables.appBaseDirectory, i) />
			
			<!--- Extend information from the config --->
			<cfif structKeyExists(pluginConfig, 'information')>
				<cfset newApplication.plugins[i].information = extend(newApplication.plugins[i].information, appConfig.information, -1) />
			</cfif>
			
			<!--- Pull in the navigation masks --->
			<cfif structKeyExists(pluginConfig, 'navigation')>
				<cfset naviationMasks[i] = pluginConfig.navigation />
			</cfif>
		</cfloop>
		
		<!--- Start with the plugin list that we have as an unordered precedence --->
		<cfset precedence = pluginList />
		
		<!--- Check for plugin prerequisites --->
		<cfloop list="#pluginList#" index="i">
			<!--- Go through each prerequisite to see if we don't have one or if the version is wrong --->
			<cfloop list="#structKeyList(newApplication.plugins[i].information.prerequisites)#" index="j">
				<!--- Check for a completely missing plugin --->
				<cfif NOT structKeyExists(newApplication.plugins, j)>
					<cfthrow message="Missing required plugin" detail="The #j# plugin with a version at least #newApplication.plugins[i].information.prerequisites[j]# is required by the #i# plugin" />
				</cfif>
				
				<!--- Check that the version of the current plugin meets the prerequisite version --->
				<cfif compare(newApplication.plugins[j].inforamation.version, newApplication.plugins[i].information.prerequisites[j]) LT 0>
					<cfthrow message="Plugin too old" detail="The #j# plugin with a version at least #newApplication.plugins[i].information.prerequisites[j]# is required by the #i# plugin" />
				</cfif>
				
				<!--- Update the precedence to run install / updates based on prerequisites --->
				<cfset precedence = updatePrecedence(precedence, j) />
			</cfloop>
		</cfloop>
		
		<!--- TODO Install/Upgrade plugins --->
		<!--- TODO Create all singletons --->
		<!--- TODO Apply Navigation Masks --->
		<cfloop list="#precedence#" index="i">
		</cfloop>
		
		<cfreturn newApplication />
	</cffunction>
	
	<!---
		Used to update the list of plugins to account for the ones that should come first.
		Anything new is prequisite of something that is already in the list so it should be moved to the first.
	--->
	<cffunction name="updatePrecedence" access="public" returntype="string" output="false">
		<cfargument name="precedence" type="string" required="true" />
		<cfargument name="plugin" type="string" required="true" />
		
		<cfset var existsAt = '' />
		
		<cfset existsAt = listFind(arguments.precedence, arguments.plugin) />
		
		<cfif existsAt>
			<cfset arguments.precedence = listDeleteAt(arguments.precedence, existsAt) />
		</cfif>
		
		<cfreturn listPrepend(arguments.precedence, arguments.plugin) />
	</cffunction>
</cfcomponent>