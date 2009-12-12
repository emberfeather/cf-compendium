<cfcomponent output="false">
	<cffunction name="init" access="public" returnType="component" output="false">
		<cfargument name="locale" type="string" default="en_US" />
		
		<!--- Get the language details for the locale --->
		<cfset variables.lang = listFirst(arguments.locale, "_") />
		
		<!--- Check if there are more language details --->
		<cfif listLen(arguments.locale,"_") gt 1>
			<cfset variables.country = listGetAt(arguments.locale, 2, "_") />
			<cfset variables.variant = listLast(arguments.locale, "_") />
		</cfif>
		
		<cfreturn this />
	</cffunction>
	
	<!---
		Used to format a given message by finding all the {#} in the message and replacing them with the 
		appropriate value.
		<p>
		When using this function provide at least three arguments. The third and all after that will be used when
		needed in the message to replace the {#}s in the order recieved.
		<p>
		Since ColdFusion starts arrays with 1 and Java starts with 0 filled 0 with empty string
	--->
	<cffunction name="format" access="public" returntype="string" output="false">
		<cfargument name="message" type="string" required="true" />
		
		<cfset var i = '' />
		<cfset var match = '' />
		<cfset var matches = '' />
		<cfset var replacements = [''] />
		<cfset var theLocale = createObject("java","java.util.Locale") />
		<cfset var theMessageFormat = createObject("java", "java.text.MessageFormat") />
		
		<!--- Check to make sure they passed in enough arguments to do some formatting with --->
		<cfif arrayLen(arguments) lt 2>
			<cfthrow message="Missing Substitutions" detail="Please provide additional arguments to be used as substitutions in the message" />
		</cfif>
		
		<!--- Java cast any numeric replacements --->
		<cfloop from="2" to="#arrayLen(arguments)#" index="i">
			<cfif isNumeric(arguments[i])>
				<cfset arrayAppend(replacements, javaCast('float', arguments[i])) />
			<cfelse>
				<cfset arrayAppend(replacements, arguments[i]) />
			</cfif>
		</cfloop>
		
		<!--- Initialize the locale object --->
		<cfset theLocale.init( variables.lang, variables.country, variables.variant ) />
		
		<!--- Initialize the message format object --->
		<cfset theMessageFormat.init( arguments.message, theLocale ) />
		
		<cfreturn theMessageFormat.format( replacements.toArray() ) />
	</cffunction>
</cfcomponent>