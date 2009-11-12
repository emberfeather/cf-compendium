<cfcomponent output="false">
	<cffunction name="init" access="public" returntype="component" output="false">
		<cfargument name="i18n" type="component" required="true" />
		<cfargument name="locale" type="string" default="en_US" />
		
		<cfset variables.i18n = arguments.i18n />
		<cfset variables.locale = arguments.locale />
		<cfset variables.bundles = [] />
		
		<cfreturn this />
	</cffunction>
	
	<cffunction name="addBundle" access="public" returntype="void" output="false">
		<cfargument name="path" type="string" required="true" />
		<cfargument name="name" type="string" required="true" />
		
		<cfset arrayAppend(variables.bundles, variables.i18n.getResourceBundle(arguments.path, arguments.name, variables.locale)) />
	</cffunction>
	
	<cffunction name="get" access="public" returntype="string" output="false">
		<cfargument name="key" type="string" required="true" />
		<cfargument name="default" type="string" default="N/A" />
		
		<cfset var i = '' />
		
		<!--- Check for no label --->
		<cfif arguments.key EQ ''>
			<cfreturn '' />
		</cfif>
		
		<!--- Find the first (LIFO) value for the label --->
		<cfloop from="#arrayLen(variables.bundles)#" to="1" index="i" step="-1">
			<cfif variables.bundles[i].hasKey(arguments.key)>
				<cfreturn variables.bundles[i].getValue(arguments.key) />
			</cfif>
		</cfloop>
		
		<cfreturn arguments.default />
	</cffunction>
	
	<!---
		Used to handle dynamic getters
	--->
	<cffunction name="onMissingMethod" access="public" returntype="any" output="false">
		<cfargument name="missingMethodName" type="string" required="true" />
		<cfargument name="missingMethodArguments" type="struct" required="true" />
		
		<cfset var attribute = '' />
		<cfset var j = '' />
		<cfset var prefix = '' />
		<cfset var result = '' />
		
		<!--- Do a regex on the name --->
		<cfset result = reFindNoCase('^(get)(.+)', arguments.missingMethodName, 1, true) />
		
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
				<!--- Check if there is a default value provided --->
				<cfif arrayLen(arguments.missingMethodArguments)>
					<cfreturn get(attribute, arguments.missingMethodArguments[1]) />
				</cfif>
				
				<cfreturn get(attribute) />
			</cfcase>
		</cfswitch>
	</cffunction>
</cfcomponent>