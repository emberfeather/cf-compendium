<!---
	The bookmark object is used to track your position on different areas of the site.
	This is very helpful if you are doing form that takes multiple steps to complete yet
	you want to allow the user to leave the form and pickup where they left off.
	<p>
	This can also be used in various ways not dealing with forms also.
--->
<cfcomponent output="false">
	<cffunction name="init" access="public" returntype="component" output="false">
		<cfset variables.location = {} />
		
		<cfset variables.limit = 100 />
		
		<cfreturn this />
	</cffunction>
	
	<cffunction name="set" access="public" returntype="void" output="false">
		<cfargument name="name" type="string" required="true" />
		<cfargument name="step" type="numeric" required="true" />
		
		<cfif step LTE 0 OR step GTE variables.limit>
			<cfthrow message="Value for variable 'Step' is out of bounds." />	
		<cfelse>
			<cfset variables.location[arguments.name] = step />
		</cfif>
	</cffunction>
	
	<cffunction name="get" access="public" returntype="numeric" output="false">
		<cfargument name="name" type="string" required="true" />
		
		<cfif NOT structKeyExists(variables.location, arguments.name)>
			<cfset this.set(arguments.name, 1) />
		</cfif>
		
		<cfreturn variables.location[arguments.name] />
	</cffunction>
	
	<!---
		Used to handle dynamic setters, getters, nexters, prevers, and resetter
	--->
	<cffunction name="onMissingMethod" access="public" returntype="any" output="false">
		<cfargument name="missingMethodName" type="string" required="true" />
		<cfargument name="missingMethodArguments" type="struct" required="true" />
		
		<cfset var attribute = '' />
		<cfset var i = '' />
		<cfset var isUnique = '' />
		<cfset var j = '' />
		<cfset var prefix = '' />
		<cfset var result = '' />
		
		<!--- Do a regex on the name --->
		<cfset result = reFindNoCase('^(get|set|next|prev|reset)(.+)', arguments.missingMethodName, 1, true) />
		
		<!--- If we find don't find anything --->
		<cfif NOT result.pos[1]>
			<cfthrow message="Function not found" detail="The component has no function with name the name #arguments.missingMethodName#" />
		</cfif>
		
		<!--- Find the prefix --->
		<cfset prefix = mid(arguments.missingMethodName, result.pos[2], result.len[2]) />
		
		<!--- Find the attribute --->
		<cfset attribute = mid(arguments.missingMethodName, result.pos[3], result.len[3]) />
		
		<!--- Do the fun stuff --->
		<cfswitch expression="#prefix#">
			<cfcase value="get">
				<cfreturn this.get(attribute) />
			</cfcase>
			
			<cfcase value="next">
				<cfset this.next(attribute) />
			</cfcase>
			
			<cfcase value="prev">
				<cfset this.prev(attribute) />
			</cfcase>
			
			<cfcase value="reset">
				<cfset this.reset(attribute) />
			</cfcase>
			
			<cfcase value="set">
				<cfset this.set(attribute, arguments.missingMethodArguments[1]) />
			</cfcase>
		</cfswitch>
	</cffunction>
	
	<cffunction name="next" access="public" returntype="void" output="false">
		<cfargument name="name" type="string" required="true" />
		
		<cfif (variables.location[arguments.name] + 1) GTE variables.limit>
			<cfthrow message="Next step for #arguments.name# is out of bounds." />
		<cfelse>
			<cfset variables.location[arguments.name]++ />
		</cfif>
	</cffunction>
	
	<cffunction name="prev" access="public" returntype="void" output="false">
		<cfargument name="name" type="string" required="true" />
		
		<cfif (variables.location[arguments.name] - 1) LTE 0>
			<cfthrow message="Previous step for #arguments.name# is out of bounds." />
		<cfelse>
			<cfset variables.location[arguments.name]-- />
		</cfif>
	</cffunction>
		
	<cffunction name="reset" access="public" returntype="void" output="false">
		<cfargument name="name" type="string" required="true" />
		
		<cfset variables.location[arguments.name] = 1 />
	</cffunction>
</cfcomponent>