<!---
	Used as a utility component to extend a struct to contain a set of defaults.
--->
<cfcomponent output="false">
	<cffunction name="init" access="public" returntype="any" output="false">
		<cfreturn this />
	</cffunction>
	
	<!---
		Used to create a new struct that contains all of the values from the original
		along with the defaults if not already defined in the original struct.
		<p>
		Similar in idea to the way jQuery uses extend with objects.
		<p>
		Can also specify the number of levels to extend.
	--->
	<cffunction name="extend" access="public" output="false">
		<cfargument name="defaults" type="struct" required="true" />
		<cfargument name="original" type="struct" default="#structNew()#" />
		<cfargument name="depth" type="numeric" default="1" />
		
		<cfset var extended = duplicate(arguments.original) />
		<cfset var i = '' />
		
		<!--- Loop through and test each value in the values struct and see if it has been set already --->
		<cfloop list="#structKeyList(arguments.defaults)#" index="i">
			<cfif NOT structKeyExists(extended, i)>
				<cfset extended[i] = arguments.defaults[i] />
			<cfelseif arguments.depth GT 1 AND isStruct(arguments.defaults[i]) AND isStruct(extended[i])>
				<cfset extended[i] = extend(arguments.defaults[i], extended[i], arguments.depth - 1) />
			</cfif>
		</cfloop>
		
		<cfreturn extended />
	</cffunction>
</cfcomponent>