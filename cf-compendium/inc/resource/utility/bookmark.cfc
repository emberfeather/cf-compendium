<!---
	The bookmark object is used to track your position on different areas of the site.
	This is very helpful if you are doing form that takes multiple steps to complete yet
	you want to allow the user to leave the form and pickup where they left off.
	<p>
	This can also be used in various ways not dealing with forms also.
--->
<cfcomponent displayname="Bookmark Component" output="false">
	<cffunction name="init" access="public" returntype="component" output="false">
		<cfset variables.location = {} />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="set" access="public" returntype="void" output="false">
		<cfargument name="name" type="string" required="true" />
		<cfargument name="step" type="numeric" required="true" />
		
		<cfif step LTE 0 OR step GTE 100>
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
	
	<cffunction name="next" access="public" returntype="void" output="false">
		<cfargument name="name" type="string" required="true" />
		
		<cfif (variables.location[arguments.name] + 1) GTE 100>
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

