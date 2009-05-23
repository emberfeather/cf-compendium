<cfcomponent extends="cf-compendium.inc.resource.base.object" output="false">
	<cffunction name="normalizePath" access="public" returntype="string" output="false">
		<cfargument name="path" type="string" required="true" />
		
		<cfif right(arguments.path, 1) NEQ '/'>
			<cfreturn arguments.path & '/' />
		</cfif>
		
		<cfreturn path />
	</cffunction>
	
	<cffunction name="readApplicationConfig" access="public" returntype="struct" output="false">
		<cfargument name="appBaseDirectory" type="string" required="true" />
		
		<cfset var appConfig = '' />
		<cfset var appConfigFile = normalizePath(arguments.appBaseDirectory) & '/config/application.json.cfm' />
		
		<cfif NOT fileExists(appConfigFile)>
			<cfset appConfigFile = expandPath(appConfigFile) />
			
			<cfif NOT fileExists(appConfigFile)>
				<cfthrow message="Could not find the application configuration" detail="The application could not be detected at #arguments.appBaseDirectory#" />
			</cfif>
		</cfif>
		
		<!--- Read the application config file --->
		<cffile action="read" file="#appConfigFile#" variable="appConfig" />
		
		<!--- Parse and return the config --->
		<cfreturn serializeJSON(appConfig) />
	</cffunction>
	
	<cffunction name="readPluginConfig" access="public" returntype="struct" output="false">
		<cfargument name="appBaseDirectory" type="string" required="true" />
		<cfargument name="pluginKey" type="string" required="true" />
		
		<cfset var pluginConfig = '' />
		<cfset var pluginConfigFile = normalizePath(arguments.appBaseDirectory) & '/plugins/' & arguments.pluginKey & '/config/plugin.json.cfm' />
		
		<cfif NOT fileExists(appConfigFile)>
			<cfset pluginConfigFile = expandPath(pluginConfigFile) />
			
			<cfif NOT fileExists(pluginConfigFile)>
				<cfthrow message="Could not find the plugin configuration" detail="The plugin could not be detected at #arguments.appBaseDirectory# for #arguments.pluginKey#" />
			</cfif>
		</cfif>
		
		<!--- Read the application config file --->
		<cffile action="read" file="#pluginConfigFile#" variable="pluginConfig" />
		
		<!--- Parse and return the config --->
		<cfreturn serializeJSON(pluginConfig) />
	</cffunction>
	
	<cffunction name="startApplication" access="public" returntype="struct" output="false">
		<cfargument name="appBaseDirectory" type="string" required="true" />
		
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
		
		<!--- Read in application information --->
		<cfset appConfig = readApplicationConfig(arguments.appBaseDirectory) />
		
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
			<cfset pluginConfig = readPluginConfig(arguments.appBaseDirectory, i) />
			
			<!--- Extend information from the config --->
			<cfif structKeyExists(pluginConfig, 'information')>
				<cfset newApplication.plugins[i].information = extend(newApplication.plugins[i].information, appConfig.information, -1) />
			</cfif>
			
			<!--- Pull in the navigation masks --->
			<cfif structKeyExists(pluginConfig, 'navigation')>
				<cfset naviationMasks[i] = pluginConfig.navigation />
			</cfif>
		</cfloop>
		
		<!--- TODO Determine plugin precedence from prerequisites --->
		
		<!--- TODO Check for missing plugin prerequisites --->
		
		<!--- TODO Install/Upgrade plugins --->
		
		<!--- TODO Create all singletons --->
		
		<!--- TODO Apply Navigation Masks --->
		
		<cfreturn newApplication />
	</cffunction>
</cfcomponent>