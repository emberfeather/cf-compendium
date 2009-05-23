<cfcomponent output="false">
	<cfset this.name = '{{key}}' />
	<cfset this.applicationTimeout = createTimeSpan(2, 0, 0, 0) />
	<cfset this.sessionManagement = true />
	<cfset this.sessionTimeout = createTimeSpan(0, 0, 30, 0) />
	
	<cfset this.mappings['/root'] = getDirectoryFromPath( getCurrentTemplatePath() ) />
	<cfset this.mappings['/plugins'] = this.mappings['/root'] & "plugins/" />
	
	<cffunction name="onApplicationStart" access="public" returntype="boolean" output="false">
		<cfset var appConfigFile = expandPath('config/application.json.cfm') />
		<cfset var sparkplug = createObject('component', 'cf-compendium.inc.resource.application.sparkplug').init() />
		
		<!--- Lock the application scope --->
		<cflock scope="application" type="exclusive" timeout="5">
			<!--- Start the application --->
			<cfset application = sparkplug.startApplication( this.mappings['/root'] ) />
		</cflock>
		
		<cfreturn true />
	</cffunction>
	
	<cffunction name="onRequestStart" access="public" returntype="boolean" output="true">
		<cfargument name="targetPage" type="string" required="true" />
		
		<!--- Check for reinit --->
		<cfif structKeyExists(URL, 'reinit')>
			<cfset onApplicationStart() />
		</cfif>
		
		<cfreturn true />
	</cffunction>
	
	<cffunction name="onSessionStart" access="public" returntype="void" output="false">
		<cfset SESSION.locale = left(CGI.HTTP_ACCEPT_LANGUAGE, 4) />
		
		<cfif NOT listFindNoCase(application.locales, SESSION.locale)>
			<cfset SESSION.locale = application.defaultLocale />
		</cfif>
		
		<!--- Create the notification objects --->
		<cfset SESSION.notification = {
				message = createObject('component', 'cf-compendium.inc.resource.base.message').init(),
				error = createObject('component', 'cf-compendium.inc.resource.base.message').init(),
				success = createObject('component', 'cf-compendium.inc.resource.base.message').init()
			} />
		
		<!--- Change the class --->
		<cfset SESSION.notification.error.setClass('error') />
		<cfset SESSION.notification.success.setClass('success') />
	</cffunction>
</cfcomponent>