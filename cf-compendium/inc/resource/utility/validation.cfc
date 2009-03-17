<cfcomponent output="false">
	<cffunction name="init" access="public" returnType="component" output="false">
		<cfargument name="theResourceBundle" type="component" required="true" />
		<cfargument name="theMessageFormatter" type="component" required="true" />
		
		<cfset variables.theResourceBundle = arguments.theResourceBundle />
		<cfset variables.theMessageFormatter = arguments.theMessageFormatter />
		
		<cfreturn this />
	</cffunction>
	
	<!---
		Tests if the value given is a valid ID
	--->
	<cffunction name="ID" access="public" returntype="void" output="false">
		<cfargument name="title" type="string" required="true" />
		<cfargument name="value" type="any" required="true" />
		
		<cfset var message = '' />
		
		<cfif NOT isNumeric(arguments.value) OR arguments.value LT 0>
			<!--- Get the message from the bundle --->
			<cfset message = variables.theResourceBundle.getValue('validation.id') />
			
			<cfthrow type="validation" message="#variables.theMessageFormatter.format( message, arguments.title )#" />
		</cfif>
	</cffunction>
	
	<!---
		Used to pass through and throw validation error.
	--->
	<cffunction name="invalid" access="public" returntype="void" output="false">
		<cfargument name="message" type="string" required="true" />
		
		<!--- Format for the message for specific locale and throw it --->
		<cfthrow type="validation" message="#variables.theMessageFormatter.format( argumentCollection = arguments )#" />
	</cffunction>
	
	<!---
		Tests if the value given is not over the max length
	--->
	<cffunction name="maxLength" access="public" returntype="void" output="false">
		<cfargument name="title" type="string" required="true" />
		<cfargument name="value" type="string" required="true" />
		<cfargument name="length" type="numeric" required="true" />
		
		<cfset var message = '' />
		
		<cfif len(arguments.value) GT arguments.length>
			<!--- Get the message from the bundle --->
			<cfset message = variables.theResourceBundle.getValue('validation.maxLength') />
			
			<cfthrow type="validation" message="#variables.theMessageFormatter.format( message, arguments.title, arguments.length )#" />
		</cfif>
	</cffunction>
	
	<!---
		Tests if the value given is not under the min length
	--->
	<cffunction name="minLength" access="public" returntype="void" output="false">
		<cfargument name="title" type="string" required="true" />
		<cfargument name="value" type="string" required="true" />
		<cfargument name="length" type="numeric" required="true" />
		
		<cfset var message = '' />
		
		<cfif len(arguments.value) LT arguments.length>
			<!--- Get the message from the bundle --->
			<cfset message = variables.theResourceBundle.getValue('validation.maxLength') />
			
			<cfthrow type="validation" message="#variables.theMessageFormatter.format( message, arguments.title, arguments.length )#" />
		</cfif>
	</cffunction>
	
	<!---
		Tests if the value given is not empty
	--->
	<cffunction name="notEmpty" access="public" returntype="void" output="false">
		<cfargument name="title" type="string" required="true" />
		<cfargument name="value" type="string" required="true" />
		
		<cfset var message = '' />
		
		<cfif trim(arguments.value) EQ ''>
			<!--- Get the message from the bundle --->
			<cfset message = variables.theResourceBundle.getValue('validation.notEmpty') />
			
			<cfthrow type="validation" message="#variables.theMessageFormatter.format( message, arguments.title )#" />
		</cfif>
	</cffunction>
	
	<!---
		Tests if the value given is not in the future
	--->
	<cffunction name="notFuture" access="public" returntype="void" output="false">
		<cfargument name="title" type="string" required="true" />
		<cfargument name="value" type="date" required="true" />
		
		<cfset var message = '' />
		
		<cfif arguments.value GT now()>
			<!--- Get the message from the bundle --->
			<cfset message = variables.theResourceBundle.getValue('validation.notFuture') />
			
			<cfthrow type="validation" message="#variables.theMessageFormatter.format( message, arguments.title )#" />
		</cfif>
	</cffunction>
	
	<!---
		Tests if the value given is not less than a given amount
	--->
	<cffunction name="notGreaterThan" access="public" returntype="void" output="false">
		<cfargument name="title" type="string" required="true" />
		<cfargument name="value" type="date" required="true" />
		<cfargument name="amount" type="numeric" required="true" />
		
		<cfset var message = '' />
		
		<cfif arguments.value GT arguments.amount>
			<!--- Get the message from the bundle --->
			<cfset message = variables.theResourceBundle.getValue('validation.notGreaterThan') />
			
			<cfthrow type="validation" message="#variables.theMessageFormatter.format( message, arguments.title, arguments.amount )#" />
		</cfif>
	</cffunction>
	
	<!---
		Tests if the value given is not less than a given amount
	--->
	<cffunction name="notLessThan" access="public" returntype="void" output="false">
		<cfargument name="title" type="string" required="true" />
		<cfargument name="value" type="date" required="true" />
		<cfargument name="amount" type="numeric" required="true" />
		
		<cfset var message = '' />
		
		<cfif arguments.value LT arguments.amount>
			<!--- Get the message from the bundle --->
			<cfset message = variables.theResourceBundle.getValue('validation.notLessThan') />
			
			<cfthrow type="validation" message="#variables.theMessageFormatter.format( message, arguments.title, arguments.amount )#" />
		</cfif>
	</cffunction>
	
	<!---
		Tests if the value given is not in the past
	--->
	<cffunction name="notPast" access="public" returntype="void" output="false">
		<cfargument name="title" type="string" required="true" />
		<cfargument name="value" type="date" required="true" />
		
		<cfset var message = '' />
		
		<cfif arguments.value LT now()>
			<!--- Get the message from the bundle --->
			<cfset message = variables.theResourceBundle.getValue('validation.notPast') />
			
			<cfthrow type="validation" message="#variables.theMessageFormatter.format( message, arguments.title )#" />
		</cfif>
	</cffunction>
</cfcomponent>