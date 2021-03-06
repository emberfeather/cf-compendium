<!---
	Based off the javaRB component by paul hastings <paul@sustainableGIS.com>
	<p>
	This component was created to be used primarily in the application scope to
	pull the needed bundle as it is used in a JIT manner.
--->
<cfcomponent output="false">
	<cffunction name="init" access="public" returnType="component" output="false">
		<cfargument name="path" type="string" required="true" />
		<cfargument name="bundleName" type="string" required="true" />
		<cfargument name="bundleLocale" type="string" default="en_US" />
		
		<cfset var bundleResource = '' />
		
		<!--- Create object for extending --->
		<cfset variables.theExtender = createObject('component', 'cf-compendium.inc.resource.utility.extend').init() />
		
		<!--- Read in the bundle --->
		<cfset bundleResource = read( argumentCollection = arguments ) />
		
		<!--- Create cache for resource bundles --->
		<cfset variables.keys = bundleResource.keys />
		<cfset variables.bundle = bundleResource.bundle />
		
		<!--- Store the locale --->
		<cfset variables.locale = arguments.bundleLocale />
		
		<cfreturn this />
	</cffunction>
	
	<!---
		Returns a struct representing the resource bundle
	--->
	<cffunction name="get" access="public" returntype="struct" output="false">
		<cfreturn variables.bundle />
	</cffunction>
	
	<!---
		Returns an array representing the resource bundle keys
	--->
	<cffunction name="getKeys" access="public" returntype="array" output="false">
		<cfreturn variables.keys />
	</cffunction>
	
	<!---
		Returns the locale of the bundle
	--->
	<cffunction name="getLocale" access="public" returntype="string" output="false">
		<cfreturn variables.locale />
	</cffunction>
	
	<!---
		Returns an string of the resource bundle key
	--->
	<cffunction name="getValue" access="public" returntype="string" output="false">
		<cfargument name="key" type="string" required="true" />
		
		<!--- Check if the key exists --->
		<cfif not structKeyExists(variables.bundle, arguments.key)>
			<cfthrow message="Bundle Key Does Not Exist" detail="The bundle key (#arguments.key#) does not exist in the bundle" />
		</cfif>
		
		<cfreturn variables.bundle[arguments.key] />
	</cffunction>
	
	<!---
		Returns true if the key exists in the bundle
	--->
	<cffunction name="hasKey" access="public" returntype="boolean" output="false">
		<cfargument name="key" type="string" required="true" />
		
		<cfreturn structKeyExists(variables.bundle, arguments.key) />
	</cffunction>
	
	<!---
		Adds a trailing slash if needed
	--->
	<cffunction name="normalizePath" access="private" returntype="string" output="false">
		<cfargument name="directoryPath" type="string" required="true" />
		
		<!--- Test for trailing slash --->
		<cfif right(arguments.directoryPath, 1) neq '/'>
			<cfreturn arguments.directoryPath & '/' />
		</cfif>
		
		<cfreturn arguments.directoryPath />
	</cffunction>
	
	<!---
		Returns a struct representing the resource bundle
	--->
	<cffunction name="read" access="private" returntype="struct" output="false">
		<cfargument name="path" type="string" required="true" />
		<cfargument name="bundleName" type="string" required="true" />
		<cfargument name="bundleLocale" type="string" default="en_US" />
		
		<cfset var bundleResource = { keys = [], bundle = {} } />
		<cfset var filePath = '' />
		<cfset var fileStream = '' />
		<cfset var key = '' />
		<cfset var keys = '' />
		<cfset var base = '' />
		<cfset var resourceBundle = '' />
		
		<!--- Normalize the path --->
		<cfset filePath = normalizePath(arguments.path) />
		
		<!--- Check if we are doing the base bundle --->
		<cfif arguments.bundleLocale eq ''>
			<cfset arguments.bundleLocale = 'base' />
		</cfif>
		
		<!--- Check that the file path exists --->
		<cfif not directoryExists(filePath)>
			<cfif directoryExists(expandPath(filePath))>
				<cfset filePath = expandPath(filePath) />
			<cfelseif directoryExists(expandPath('/' & filePath))>
				<cfset filePath = expandPath('/' & filePath) />
			<cfelse>
				<cfthrow message="Bundle directory not found" detail="The bundle directory for resource bundle was not found at #filePath#" />
			</cfif>
		</cfif>
		
		<!--- Keep adding to the file path for the bundle name --->
		<cfset filePath &= arguments.bundleName />
		
		<!--- Keep adding to the file path for the locale --->
		<cfif arguments.bundleLocale neq 'base'>
			<cfset filePath &= '_' & arguments.bundleLocale />
		</cfif>
		
		<!--- Keep adding to the file path for the suffix --->
		<cfset filePath &= '.properties' />
		
		<!--- Check if the resource bundle exists --->
		<cfif not fileExists(filePath)>
			<cfthrow message="Resource bundle not found" detail="The resource bundle was not found at #filepath#" />
		</cfif>
		
		<!--- Check if we only have a CF mapped path --->
		<cfif fileExists(expandPath(filePath))>
			<cfset filePath = expandPath(filePath) />
		</cfif>
		
		<!--- Create the objects --->
		<cfset fileStream = createObject('java', 'java.io.FileInputStream') />
		<cfset resourceBundle = createObject('java', 'java.util.PropertyResourceBundle') />
		
		<!--- Read in the resource bundle --->
		
		<!--- Open the file stream --->
		<cfset fileStream.init(filePath) />
		
		<!--- Initialize the resource bundle --->
		<cfset resourceBundle.init(fileStream) />
		
		<!--- Retrieve the bundle keys --->
		<cfset keys = resourceBundle.getKeys() />
		
		<!--- Create the bundle structure --->
		<cfloop condition="keys.hasMoreElements()">
			<cfset key = keys.nextElement() />
			
			<!--- Append the key to the keys array --->
			<cfset arrayAppend( bundleResource.keys, key ) />
			
			<cfset bundleResource.bundle[key] = trim(resourceBundle.handleGetObject(key)) />
		</cfloop>
		
		<!--- Close the file stream --->
		<cfset fileStream.close() />
		
		<!--- If this is not the base bundle extend it to provide defaults --->
		<cfif arguments.bundleLocale neq 'base'>
			<cfset base = read(arguments.path, arguments.bundleName, '') />
			
			<cfset bundleResource.keys = evaluate(serialize(base.keys)) />
			<cfset bundleResource.bundle = variables.theExtender.extend(base.bundle, bundleResource.bundle) />
		</cfif>
		
		<cfreturn bundleResource />
	</cffunction>
</cfcomponent>