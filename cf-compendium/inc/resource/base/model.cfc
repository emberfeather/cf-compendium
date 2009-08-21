<!---
	Acts as the base for all objects to be based upon.
	Supports dynamic set and get function.
	Also has a default init function.
	Based upon code by Hal Helms and modified from there. 
--->
<cfcomponent extends="cf-compendium.inc.resource.base.object" output="false">
	<!---
		The basic init function 
	--->
	<cffunction name="init" access="public" returntype="component" output="false">
		<cfargument name="i18n" type="component" required="true" />
		<cfargument name="locale" type="string" default="en_US" />
		
		<cfset variables.instance = {} />
		<cfset variables.attributes = {} />
		<cfset variables.attributeOrder = '' />
		
		<cfset variables.i18n = {
				i18n = arguments.i18n,
				locale = arguments.locale,
				bundlePath = '/cf-compendium/i18n/resource/base',
				bundleName = 'object'
			} />
		
		<cfset variables.validation = {
				bundlePath = '/cf-compendium/i18n/resource/utility',
				bundleName = 'validation',
				componentPath = 'cf-compendium.inc.resource.utility.validation'
			} />
		
		<cfreturn this />
	</cffunction>
	
	<!---
		Used to add an attribute to the object with it's meta information
	--->
	<cffunction name="addAttribute" access="public" returntype="void" output="false">
		<cfargument name="attribute" type="string" required="true" />
		<cfargument name="defaultValue" type="any" default="" />
		<cfargument name="validation" type="struct" default="#{}#" />
		<cfargument name="form" type="struct" default="#{}#" />
		<cfargument name="dataGrid" type="struct" default="#{}#" />
		<cfargument name="options" type="struct" default="#{}#" />
		
		<cfset variables.attributes[arguments.attribute] = arguments />
		
		<!--- Add to the attribute order --->
		<cfset variables.attributeOrder = listAppend(variables.attributeOrder, arguments.attribute) />
		
		<cfset variables.instance[arguments.attribute] = arguments.defaultValue />
		
		<!--- Check for a confirm form option --->
		<cfif structKeyExists(arguments.form, 'confirm')>
			<cfset variables.instance[arguments.attribute & 'Confirm'] = arguments.defaultValue />
		</cfif>
	</cffunction>
	
	<cffunction name="createValidator" access="public" returntype="void" output="false">
		<cfset variables.validator = variables.i18n.i18n.getValidation(variables.i18n.locale, variables.validation.bundlePath, variables.validation.bundleName, variables.validation.componentPath) />
	</cffunction>
	
	<!---
		Used to get an attribute
	--->
	<cffunction name="getAttribute" access="public" returntype="struct" output="false">
		<cfargument name="attribute" type="string" required="true" />
		
		<cfreturn variables.attributes[arguments.attribute] />
	</cffunction>
	
	<!---
		Used to get an attribute's label
	--->
	<cffunction name="getAttributeLabel" access="public" returntype="string" output="false">
		<cfargument name="attribute" type="string" required="true" />
		
		<!--- Make sure that we have a bundle object --->
		<cfif NOT structKeyExists(variables.i18n, 'bundle')>
			<cfset variables.i18n.bundle = variables.i18n.i18n.getResourceBundle(variables.i18n.bundlePath, variables.i18n.bundleName, variables.i18n.locale) />
		</cfif>
		
		<cfreturn variables.i18n.bundle.getValue(attribute) />
	</cffunction>
	
	<!---
		Used to return a list of all the attributes publicly available 
		through the dynamic setters and getters.
	--->
	<cffunction name="getAttributeList" access="public" returntype="string" output="false">
		<cfreturn variables.attributeOrder />
	</cffunction>
	
	<!---
		Checks for the existance of an attribute
	--->
	<cffunction name="hasAttribute" access="public" returntype="boolean" output="false">
		<cfargument name="attributeName" type="string" required="true" />
		
		<cfreturn structKeyExists(variables.attributeOrder, arguments.attributeName) />
	</cffunction>
	
	<!---
		Used to handle dynamic setters, getters, adders, adduniquers, and getterbyers
	--->
	<cffunction name="onMissingMethod" access="public" returntype="any" output="false">
		<cfargument name="missingMethodName" type="string" required="true" />
		<cfargument name="missingMethodArguments" type="struct" required="true" />
		
		<cfset var attribute = '' />
		<cfset var attributeSet = '' />
		<cfset var attributeValue = '' />
		<cfset var childAttribute = '' />
		<cfset var i = '' />
		<cfset var isUnique = '' />
		<cfset var j = '' />
		<cfset var prefix = '' />
		<cfset var result = '' />
		
		<!--- Do a regex on the name --->
		<cfset result = reFindNoCase('^(set)(.+)', arguments.missingMethodName, 1, true) />
		
		<!--- If we find don't find anything --->
		<cfif NOT result.pos[1]>
			<cfreturn super.onMissingMethod(argumentCollection = arguments) />
		</cfif>
		
		<!--- Find the prefix --->
		<cfset prefix = mid(arguments.missingMethodName, result.pos[2], result.len[2]) />
		
		<!--- Find the attribute --->
		<cfset attribute = mid(arguments.missingMethodName, result.pos[3], result.len[3]) />
		
		<!--- Do the fun stuff --->
		<cfswitch expression="#prefix#">
			<cfcase value="set">
				<!--- Check for any validation given in the attribute meta --->
				<cfif structKeyExists(variables.attributes, attribute) AND NOT structIsEmpty(variables.attributes[attribute].validation)>
					<!--- Make sure that we have a validator object --->
					<cfif NOT structKeyExists(variables, 'validator')>
						<cfset createValidator() />
					</cfif>
					
					<!--- Try to validate with each of the specified tests against the validation object --->
					<cfloop list="#structKeyList(variables.attributes[attribute].validation)#" index="i">
						<cfif isStruct(variables.attributes[attribute].validation[i])>
							<!--- If it is a struct we can use it as an argument collection --->
							<cfset variables.attributes[attribute].validation[i].label = getAttributeLabel(attribute) />
							<cfset variables.attributes[attribute].validation[i].value = arguments.missingMethodArguments />
							
							<cfinvoke component="#variables.validator#" method="#i#" argumentcollection="#variables.attributes[attribute].validation[i]#" />
						<cfelseif isArray(variables.attributes[attribute].validation[i])>
							<!--- If it is an array we can use it as an argument collection --->
							<cfset arrayPrepend(variables.attributes[attribute].validation[i], arguments.missingMethodArguments) />
							<cfset arrayPrepend(variables.attributes[attribute].validation[i], getAttributeLabel(attribute)) />
							
							<cfinvoke component="#variables.validator#" method="#i#" argumentcollection="#variables.attributes[attribute].validation[i]#" />
						<cfelse>
							<cfinvoke component="#variables.validator#" method="#i#">
								<cfinvokeargument name="label" value="#getAttributeLabel(attribute)#" />
								<cfinvokeargument name="value" value="#arguments.missingMethodArguments[1]#" />
								<cfinvokeargument name="extra" value="#variables.attributes[attribute].validation[i]#" />
							</cfinvoke>
						</cfif>
					</cfloop>
				</cfif>
				
				<!--- Set the value --->
				<cfset variables.instance[attribute] = arguments.missingMethodArguments[1] />
			</cfcase>
		</cfswitch>
	</cffunction>
	
	<!---
		Used to set the bundle information for the object
	--->
	<cffunction name="setI18NBundle" access="public" returntype="void" output="false">
		<cfargument name="bundlePath" type="string" required="true" />
		<cfargument name="bundleName" type="string" required="true" />
		
		<cfset variables.i18n.bundlePath = arguments.bundlePath />
		<cfset variables.i18n.bundleName = arguments.bundleName />
	</cffunction>
</cfcomponent>