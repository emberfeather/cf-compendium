<cfcomponent output="false">
	<cfset this.name = '{{key}}' />
	<cfset this.applicationTimeout = createTimeSpan(2, 0, 0, 0) />
	<cfset this.sessionManagement = true />
	<cfset this.sessionTimeout = createTimeSpan(0, 0, 30, 0) />
	
	<cfset this.mappings['/root'] = getDirectoryFromPath( getCurrentTemplatePath() ) />
	<cfset this.mappings['/plugins'] = this.mappings['/root'] & "plugins/" />
	
	<cffunction name="onApplicationStart" access="public" returntype="boolean" output="false">
		<cfset var appConfigFile = expandPath('config/application.json.cfm') />
		<cfset var sparkplug = createObject('component', 'cf-compendium.inc.resource.application.sparkplug').init( this.mappings['/root'] ) />
		
		<cfset variables.isDebugMode = true />
		
		<!--- Lock the application scope --->
		<cflock scope="application" type="exclusive" timeout="5">
			<!--- Start the application --->
			<cfset sparkplug.startApplication(application, variables.isDebugMode) />
		</cflock>
		
		<cfreturn true />
	</cffunction>
	
	<cffunction name="onError" access="public" returntype="void" output="false">
		<cfargument name="Exception" type="struct" required="true" />
		<cfargument name="EventName" type="string" required="true" />
		
		<cfset var errorLog = '' />
		
		<!--- Check if we have got far enough for the singletons --->
		<cfif structKeyExists(application, 'singletons') AND NOT variables.isDebugMode>
			<cfset errorLog = application.singletons.getErrorLog() />
			
			<cfset errorLog.log(argumentCollection = arguments) />
		<cfelse>
			<!--- Dump out the error --->
			<cfdump var="#arguments.exception#" /><cfabort />
		</cfif>
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
		
		<cfif NOT listFindNoCase(application.information.i18n.locales, SESSION.locale)>
			<cfset SESSION.locale = application.information.i18n.default />
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