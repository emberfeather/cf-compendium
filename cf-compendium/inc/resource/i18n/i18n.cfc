<!---
	This component was created as a singleton that does JIT bundle and message formatting.
--->
<cfcomponent output="false">
	<cffunction name="init" access="public" returnType="component" output="false">
		<cfargument name="baseDirectory" type="string" required="true" />
		
		<!--- Normalize the baseDirectory --->
		<cfset arguments.baseDirectory = this.normalizePath(arguments.baseDirectory) />
		
		<cfif NOT directoryExists(arguments.baseDirectory)>
			<cfthrow message="Base directory not found" detail="The base directory for resource bundles was not found" />
		</cfif>
		
		<!--- Set the base directory of where to look for all the bundles --->
		<cfset variables.baseDirectory = arguments.baseDirectory />
		
		<!--- Create cache structs --->
		<cfset variables.bundles = {} />
		<cfset variables.formatters = {} />
		<cfset variables.validators = {} />
		
		<cfreturn this />
	</cffunction>
	
	<!---
		Returns a message format object
	--->
	<cffunction name="getMessageFormat" access="public" returntype="component" output="false">
		<cfargument name="locale" type="string" default="en_US" />
		
		<!--- Check if we already have one for the locale requested --->
		<cfif NOT structKeyExists(variables.formatters, arguments.locale)>
			<cfset variables.formatters[arguments.locale] = createObject('component', 'cf-compendium.inc.resource.i18n.messageFormat').init(arguments.locale) />
		</cfif>
		
		<cfreturn variables.formatters[arguments.locale] />
	</cffunction>
	
	<!---
		Adds a trailing slash if needed
	--->
	<cffunction name="normalizePath" access="private" returntype="string" output="false">
		<cfargument name="directoryPath" type="string" required="true" />
		
		<!--- Test for trailing slash --->
		<cfif right(arguments.directoryPath, 1) NEQ '/'>
			<cfreturn arguments.directoryPath & '/' />
		</cfif>
		
		<cfreturn arguments.directoryPath />
	</cffunction>
	
	<!---
		Returns a resource bundle
	--->
	<cffunction name="getResourceBundle" access="public" returntype="struct" output="false">
		<cfargument name="path" type="string" required="true" />
		<cfargument name="bundleName" type="string" required="true" />
		<cfargument name="bundleLocale" type="string" default="en_US" />
		
		<cfset var bundle = '' />
		<cfset var filePath = '' />
		<cfset var fileStream = '' />
		<cfset var key = '' />
		<cfset var keys = '' />
		<cfset var resourceBundle = '' />
		<cfset var base = '' />
		
		<!--- Normalize the path --->
		<cfset arguments.path = this.normalizePath(arguments.path) />
		
		<!--- Check if we are doing the base locale --->
		<cfif arguments.bundleLocale EQ ''>
			<cfset arguments.bundleLocale = 'base' />
		</cfif>
		
		<!--- Check if we already have a place for the bundle path --->
		<cfif NOT structKeyExists(variables.bundles, arguments.path)>
			<cfset variables.bundles[arguments.path] = {} />
		</cfif>
		
		<!--- Check if we already have a place for the bundle name --->
		<cfif NOT structKeyExists(variables.bundles[arguments.path], arguments.bundleName)>
			<cfset variables.bundles[arguments.path][arguments.bundleName] = {} />
		</cfif>
		
		<!--- Check if we already have a place for the bundle locale --->
		<cfif NOT structKeyExists(variables.bundles[arguments.path][arguments.bundleName], arguments.bundleLocale)>
			<!--- Create the bundle --->
			<cfset variables.bundles[arguments.path][arguments.bundleName][arguments.bundleLocale] = createObject('component', 'cf-compendium.inc.resource.i18n.resourceBundle').init(variables.baseDirectory & arguments.path, arguments.bundleName, arguments.bundleLocale) />
		</cfif>
		
		<cfreturn variables.bundles[arguments.path][arguments.bundleName][arguments.bundleLocale] />
	</cffunction>
	
	<!---
		Returns a common validation object
	--->
	<cffunction name="getValidation" access="public" returntype="component" output="false">
		<cfargument name="locale" type="string" default="en_US" />
		<cfargument name="bundlePath" type="string" default="cf-compendium/i18n/resource/utility" />
		<cfargument name="bundleName" type="string" default="validation" />
		<cfargument name="componentPath" type="string" default="cf-compendium.inc.resource.utility.validation" />
		
		<cfset var bundle = '' />
		<cfset var format = '' />
		
		<!--- Check if we already have one for the locale requested --->
		<cfif NOT structKeyExists(variables.validators, arguments.locale)>
			<cfset variables.validators[arguments.locale] = {} />
			
			<cfif NOT structKeyExists(variables.validators[arguments.locale], arguments.componentPath)>
				<!--- Grab the required args for a validation object --->
				<cfset bundle = this.getResourceBundle(bundlePath, arguments.bundleName, arguments.locale) />
				<cfset format = this.getMessageFormat(arguments.locale) />
				
				<!--- Create the validator object --->
				<cfset variables.validators[arguments.locale][arguments.componentPath] = createObject('component', arguments.componentPath).init(bundle, format) />
			</cfif>
		</cfif>
		
		<cfreturn variables.validators[arguments.locale][arguments.componentPath] />
	</cffunction>
</cfcomponent>