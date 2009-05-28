<cfcomponent extends="cf-compendium.inc.resource.base.object" output="false">
	<cffunction name="init" access="public" returntype="component" output="false">
		<cfargument name="appBaseDirectory" type="string" required="true" />
		
		<cfset super.init() />
		
		<cfset variables.appBaseDirectory = normalizePath(arguments.appBaseDirectory) />
		
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
		<cfset var appConfigFile = variables.appBaseDirectory & 'config/application.json.cfm' />
		
		<cfif NOT fileExists(appConfigFile)>
			<cfset appConfigFile = expandPath(appConfigFile) />
			
			<cfif NOT fileExists(appConfigFile)>
				<cfthrow message="Could not find the application configuration" detail="The application could not be detected at #variables.appBaseDirectory#" />
			</cfif>
		</cfif>
		
		<!--- Read the application config file --->
		<cffile action="read" file="#appConfigFile#" variable="appConfig" />
		
		<!--- Parse and return the config --->
		<cfreturn deserializeJSON(appConfig) />
	</cffunction>
	
	<cffunction name="readPluginConfig" access="public" returntype="struct" output="false">
		<cfargument name="pluginKey" type="string" required="true" />
		
		<cfset var pluginConfig = '' />
		<cfset var pluginConfigFile = variables.appBaseDirectory & 'plugins/' & arguments.pluginKey & '/config/plugin.json.cfm' />
		
		<cfif NOT fileExists(pluginConfigFile)>
			<cfset pluginConfigFile = expandPath(pluginConfigFile) />
			
			<cfif NOT fileExists(pluginConfigFile)>
				<cfthrow message="Could not find the plugin configuration" detail="The plugin could not be detected at #variables.appBaseDirectory# for #arguments.pluginKey#" />
			</cfif>
		</cfif>
		
		<!--- Read the application config file --->
		<cffile action="read" file="#pluginConfigFile#" variable="pluginConfig" />
		
		<!--- Parse and return the config --->
		<cfreturn deserializeJSON(pluginConfig) />
	</cffunction>
	
	<cffunction name="readPluginVersion" access="public" returntype="struct" output="false">
		<cfargument name="pluginKey" type="string" required="true" />
		
		<cfset var defaultVersion = {
				version = ''
			} />
		<cfset var pluginVersion = '' />
		<cfset var pluginVersionFile = variables.appBaseDirectory & 'plugins/' & arguments.pluginKey & '/config/version.json.cfm' />
		
		<cfif NOT fileExists(pluginVersionFile)>
			<cfset pluginVersionFile = expandPath(pluginVersionFile) />
		</cfif>
		
		<cfif fileExists(pluginVersionFile)>
			<!--- Read the application version file --->
			<cffile action="read" file="#pluginVersionFile#" variable="pluginVersion" />
			
			<!--- Parse and return the version --->
			<cfreturn extend(defaultVersion, deserializeJSON(pluginVersion)) />
		<cfelse>
			<cfreturn defaultVersion />
		</cfif>
	</cffunction>
	
	<cffunction name="setDefaultSingletons" access="public" returntype="void" output="false">
		<cfargument name="newApplication" type="struct" required="true" />
		
		<cfset var temp = '' />
		
		<!--- Create the navigation singleton --->
		<cfset temp = createObject('component', 'cf-compendium.inc.resource.structure.navigationJSON').init() />
		<cfset arguments.newApplication.singletons.setNavigation(temp) />
		
		<!--- Create the i18n singleton --->
		<cfset temp = createObject('component', 'cf-compendium.inc.resource.i18n.i18n').init(expandPath(arguments.newApplication.information.i18n.base)) />
		<cfset arguments.newApplication.singletons.setI18N(temp) />
	</cffunction>
	
	<cffunction name="startApplication" access="public" returntype="struct" output="false">
		<cfargument name="newApplication" type="struct" required="true" />
		<cfargument name="isDebugMode" type="boolean" default="false" />
		
		<cfset var appConfig = '' />
		<cfset var compareVersion = '' />
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
		<cfset var navigation = '' />
		<cfset var i = '' />
		<cfset var j = '' />
		<cfset var pluginConfig = '' />
		<cfset var pluginList = '' />
		<cfset var pluginVersion = '' />
		<cfset var precedence = '' />
		
		<!--- Set the default application variables --->
		<cfset arguments.newApplication['information'] = {
				key = 'unknown',
				title = 'unknown',
				i18n = {
					base = '/root',
					default = 'en_US',
					locales = 'en_US'
				},
				admin = {
					directory = 'admin'
				}
			} />
		<cfset arguments.newApplication['plugins'] = {} />
		<cfset arguments.newApplication['singletons'] = createObject('component', 'cf-compendium.inc.resource.application.singletons').init(arguments.isDebugMode) />
		
		<!--- Read in application information --->
		<cfset appConfig = readApplicationConfig() />
		
		<!--- Extend information from the config --->
		<cfif structKeyExists(appConfig, 'information')>
			<cfset newApplication.information = extend(newApplication.information, appConfig.information, -1) />
		</cfif>
		
		<!--- Create the default set of singletons --->
		<cfset setDefaultSingletons(newApplication) />
		
		<!--- Pull in the list of plugins --->
		<cfif structKeyExists(appConfig, 'plugins')>
			<cfset pluginList = arrayToList(appConfig.plugins) />
		</cfif>
		
		<!--- Read in all plugin configs --->
		<cfloop list="#pluginList#" index="i">
			<cfset newApplication.plugins[i] = duplicate(defaultPluginConfig) />
			<cfset pluginConfig = readPluginConfig(i) />
			
			<!--- Extend information from the config --->
			<cfif structKeyExists(pluginConfig, 'information')>
				<cfset newApplication.plugins[i] = extend(newApplication.plugins[i], pluginConfig, -1) />
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
				<cfset compareVersion = compare(newApplication.plugins[j].information.version, newApplication.plugins[i].information.prerequisites[j]) />
				
				<cfif compareVersion LT 0>
					<cfthrow message="Plugin too old" detail="The #j# plugin with a version at least #newApplication.plugins[i].information.prerequisites[j]# is required by the #i# plugin" />
				<cfelseif compareVersion GT 0>
					<cflog type="information" application="true" log="application" text="The #j# plugin is at version #newApplication.plugins[j].information.version# when the #i# plugin is expecting #newApplication.plugins[i].information.prerequisites[j]#" />
				</cfif>
				
				<!--- Update the precedence to run install / updates based on prerequisites --->
				<cfset precedence = updatePrecedence(precedence, j) />
			</cfloop>
		</cfloop>
		
		<!--- Go through the plugins in the order determined by dependency precedence --->
		<cfloop list="#precedence#" index="i">
			<!--- Create the configurer for the plugin --->
			<cfset configurer = createObject('component', 'plugins.' & i & '.config.configure').init() />
			
			<!--- Read in the plugin version information --->
			<cfset pluginVersion = readPluginVersion(i) />
			
			<!--- Call the configure function which handles installs/upgrades and singleton creation for the plugin --->
			<cfset configurer.update(newApplication.plugins[i], pluginVersion) />
			
			<!--- Configure the application for the plugin --->
			<cfset configurer.configure(newApplication) />
			
			<!--- Retrieve the navigation object --->
			<cfset navigation = newApplication.singletons.getNavigation() />
			
			<cfloop array="#newApplication.plugins[i].navigation#" index="j">
				<!--- Apply Navigation Masks --->
				<cfset navigation.applyMask( variables.appBaseDirectory & 'plugins/' & i & '/config/navigation/' & j ) />
			</cfloop>
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
		
		<cfset var existsAt = listFind(arguments.precedence, arguments.plugin) />
		
		<!--- It is already exists in the precedence remove it --->
		<cfif existsAt>
			<cfset arguments.precedence = listDeleteAt(arguments.precedence, existsAt) />
		</cfif>
		
		<cfreturn listPrepend(arguments.precedence, arguments.plugin) />
	</cffunction>
</cfcomponent>