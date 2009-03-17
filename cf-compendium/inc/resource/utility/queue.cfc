<cfcomponent output="false">
	<cffunction name="init" access="public" returnType="component" output="false">
		<cfset empty() />
		
		<cfreturn this />
	</cffunction>
	
	<!---
		Empties the queue
	--->
	<cffunction name="empty" access="public" returntype="void" output="false">
		<cfset variables.queue = [] />
	</cffunction>
	
	<!---
		Returns true if the queue is empty, otherwise false
	--->
	<cffunction name="isEmpty" access="public" returntype="boolean" output="false">
		<cfreturn arrayLen(variables.queue) EQ 0 />
	</cffunction>
	
	<!---
		Returns the number of items in the queue
	--->
	<cffunction name="length" access="public" returntype="numeric" output="false">
		<cfreturn arrayLen(variables.queue) />
	</cffunction>
	
	<!---
		Removes the item at the front of the non-empty queue.
	--->
	<cffunction name="pop" access="public" returntype="any" output="false">
		<cfset var value = '' />
		<cfset var current = length() />
		
		<cfif isEmpty()>
			<cfthrow message="Queue is empty" detail="Cannot pop from an empty queue" />
		</cfif>
		
		<!--- Get the last value --->
		<cfset value = variables.queue[current] />
		
		<!--- Remove the last element --->
		<cfset arrayDeleteAt(variables.queue, current) />
		
		<cfreturn value />
	</cffunction>
	
	<!---
		Prepends the value to the queue
	--->
	<cffunction name="push" access="public" returntype="void" output="false">
		<cfargument name="value" type="any" required="true" />
		
		<cfset arrayPrepend(variables.queue, arguments.value) />
	</cffunction>
</cfcomponent>