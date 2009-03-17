<cfcomponent output="false">
	<cffunction name="init" access="public" returnType="component" output="false">
		<cfset empty() />
		
		<cfreturn this />
	</cffunction>
	
	<!---
		Empties the stack
	--->
	<cffunction name="empty" access="public" returntype="void" output="false">
		<cfset variables.stack = [] />
	</cffunction>
	
	<!---
		Returns true if the stack is empty, otherwise false
	--->
	<cffunction name="isEmpty" access="public" returntype="boolean" output="false">
		<cfreturn arrayLen(variables.stack) EQ 0 />
	</cffunction>
	
	<!---
		Returns the number of items in the stack
	--->
	<cffunction name="length" access="public" returntype="numeric" output="false">
		<cfreturn arrayLen(variables.stack) />
	</cffunction>
	
	<!---
		Removes the item at the end of the non-empty stack.
	--->
	<cffunction name="pop" access="public" returntype="any" output="false">
		<cfset var value = '' />
		<cfset var current = length() />
		
		<cfif isEmpty()>
			<cfthrow message="Stack is empty" detail="Cannot pop from an empty stack" />
		</cfif>
		
		<!--- Get the last value --->
		<cfset value = variables.stack[current] />
		
		<!--- Remove the last element --->
		<cfset arrayDeleteAt(variables.stack, current) />
		
		<cfreturn value />
	</cffunction>
	
	<!---
		Appends the value to the stack
	--->
	<cffunction name="push" access="public" returntype="void" output="false">
		<cfargument name="value" type="any" required="true" />
		
		<cfset arrayAppend(variables.stack, arguments.value) />
	</cffunction>
</cfcomponent>