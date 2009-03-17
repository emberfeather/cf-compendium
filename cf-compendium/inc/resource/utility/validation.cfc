<cfcomponent output="false">
	<cffunction name="init" access="public" returnType="component" output="false">
		<cfargument name="resourceBundle" type="component" required="true" />
		<cfargument name="messageFormatter" type="component" required="true" />
		
		<cfset variables.resourceBundle = arguments.resourceBundle />
		<cfset variables.messageFormatter = arguments.messageFormatter />
		
		<cfreturn this />
	</cffunction>
	
	<!---
		Tests if the value given is a valid ID
	--->
	<cffunction name="ID" access="public" returntype="void" output="false">
		<cfargument name="title" type="string" required="true" />
		<cfargument name="value" type="any" required="true" />
		<cfargument name="extra" type="string" default="" />
		
		<cfset var message = '' />
		
		<cfif NOT isNumeric(arguments.value) OR arguments.value LT 0>
			<!--- Get the message from the bundle --->
			<cfset message = variables.resourceBundle.getValue('id') />
			
			<cfthrow type="validation" message="#variables.messageFormatter.format( message, arguments.title )#" />
		</cfif>
	</cffunction>
	
	<!---
		Tests if the value given is not over the max length
	--->
	<cffunction name="maxLength" access="public" returntype="void" output="false">
		<cfargument name="title" type="string" required="true" />
		<cfargument name="value" type="string" required="true" />
		<cfargument name="extra" type="numeric" required="true" />
		
		<cfset var message = '' />
		
		<cfif len(arguments.value) GT arguments.extra>
			<!--- Get the message from the bundle --->
			<cfset message = variables.resourceBundle.getValue('maxLength') />
			
			<cfthrow type="validation" message="#variables.messageFormatter.format( message, arguments.title, arguments.extra )#" />
		</cfif>
	</cffunction>
	
	<!---
		Tests if the value given is not under the min length
	--->
	<cffunction name="minLength" access="public" returntype="void" output="false">
		<cfargument name="title" type="string" required="true" />
		<cfargument name="value" type="string" required="true" />
		<cfargument name="extra" type="numeric" required="true" />
		
		<cfset var message = '' />
		
		<cfif len(arguments.value) LT arguments.extra>
			<!--- Get the message from the bundle --->
			<cfset message = variables.resourceBundle.getValue('minLength') />
			
			<cfthrow type="validation" message="#variables.messageFormatter.format( message, arguments.title, arguments.extra )#" />
		</cfif>
	</cffunction>
	
	<!---
		Tests if the value given is not empty
	--->
	<cffunction name="notEmpty" access="public" returntype="void" output="false">
		<cfargument name="title" type="string" required="true" />
		<cfargument name="value" type="string" required="true" />
		<cfargument name="extra" type="string" default="" />
		
		<cfset var message = '' />
		
		<cfif trim(arguments.value) EQ ''>
			<!--- Get the message from the bundle --->
			<cfset message = variables.resourceBundle.getValue('notEmpty') />
			
			<cfthrow type="validation" message="#variables.messageFormatter.format( message, arguments.title )#" />
		</cfif>
	</cffunction>
	
	<!---
		Tests if the value given is not in the future
	--->
	<cffunction name="notFuture" access="public" returntype="void" output="false">
		<cfargument name="title" type="string" required="true" />
		<cfargument name="value" type="date" required="true" />
		<cfargument name="extra" type="string" default="" />
		
		<cfset var message = '' />
		
		<cfif arguments.value GT now()>
			<!--- Get the message from the bundle --->
			<cfset message = variables.resourceBundle.getValue('notFuture') />
			
			<cfthrow type="validation" message="#variables.messageFormatter.format( message, arguments.title )#" />
		</cfif>
	</cffunction>
	
	<!---
		Tests if the value given is not less than a given amount
	--->
	<cffunction name="notGreaterThan" access="public" returntype="void" output="false">
		<cfargument name="title" type="string" required="true" />
		<cfargument name="value" type="date" required="true" />
		<cfargument name="extra" type="numeric" required="true" />
		
		<cfset var message = '' />
		
		<cfif arguments.value GT arguments.extra>
			<!--- Get the message from the bundle --->
			<cfset message = variables.resourceBundle.getValue('notGreaterThan') />
			
			<cfthrow type="validation" message="#variables.messageFormatter.format( message, arguments.title, arguments.extra )#" />
		</cfif>
	</cffunction>
	
	<!---
		Tests if the value given is not less than a given amount
	--->
	<cffunction name="notLessThan" access="public" returntype="void" output="false">
		<cfargument name="title" type="string" required="true" />
		<cfargument name="value" type="date" required="true" />
		<cfargument name="extra" type="numeric" required="true" />
		
		<cfset var message = '' />
		
		<cfif arguments.value LT arguments.extra>
			<!--- Get the message from the bundle --->
			<cfset message = variables.resourceBundle.getValue('notLessThan') />
			
			<cfthrow type="validation" message="#variables.messageFormatter.format( message, arguments.title, arguments.extra )#" />
		</cfif>
	</cffunction>
	
	<!---
		Tests if the value given is not in the past
	--->
	<cffunction name="notPast" access="public" returntype="void" output="false">
		<cfargument name="title" type="string" required="true" />
		<cfargument name="value" type="date" required="true" />
		<cfargument name="extra" type="string" default="" />
		
		<cfset var message = '' />
		
		<cfif arguments.value LT now()>
			<!--- Get the message from the bundle --->
			<cfset message = variables.resourceBundle.getValue('notPast') />
			
			<cfthrow type="validation" message="#variables.messageFormatter.format( message, arguments.title )#" />
		</cfif>
	</cffunction>
</cfcomponent>