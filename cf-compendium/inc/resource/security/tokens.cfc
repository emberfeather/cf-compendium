<cfcomponent output="false">
	<cffunction name="init" access="public" returntype="component" output="false">
		<cfset variables.instance = {} />
		
		<cfreturn this />
	</cffunction>
	
	<cffunction name="confirm" access="public" returntype="boolean" output="false">
		<cfargument name="token" type="string" required="true" />
		<cfargument name="value" type="string" required="true" />
		
		<cfif NOT has(arguments.token)>
			<cfreturn false />
		</cfif>
		
		<cfreturn variables.instance[arguments.token] EQ value />
	</cffunction>
	
	<cffunction name="get" access="public" returntype="string" output="false">
		<cfargument name="token" type="string" required="true" />
		<cfargument name="doReset" type="boolean" default="false" />
		
		<!--- Generate a new UUID token --->
		<cfif arguments.doReset OR NOT structKeyExists(variables.instance, arguments.token)>
			<cfset variables.instance[arguments.token] = createUUID() />
		</cfif>
		
		<cfreturn variables.instance[arguments.token] />
	</cffunction>
	
	<cffunction name="has" access="public" returntype="boolean" output="false">
		<cfargument name="token" type="string" required="true" />
		
		<cfreturn structKeyExists(variables.instance, arguments.token) />
	</cffunction>
	
	<cffunction name="onMissingMethod" access="public" returntype="any" output="false">
		<cfargument name="missingMethodName" type="string" required="true" />
		<cfargument name="missingMethodArguments" type="struct" required="true" />
		
		<cfset var newArguments = {} />
		<cfset var prefix = '' />
		<cfset var result = '' />
		
		<!--- Do a regex on the name --->
		<cfset result = reFindNoCase('^(get|has|confirm)(.+)', arguments.missingMethodName, 1, true) />
		
		<!--- If we find don't find anything --->
		<cfif NOT result.pos[1]>
			<cfthrow message="Function not found" detail="The component has no function with name the name #arguments.missingMethodName#" />
		</cfif>
		
		<!--- Find the prefix --->
		<cfset prefix = mid(arguments.missingMethodName, result.pos[2], result.len[2]) />
		
		<!--- Find the token --->
		<cfset newArguments.token = mid(arguments.missingMethodName, result.pos[3], result.len[3]) />
		
		<!--- Do the fun stuff --->
		<cfswitch expression="#prefix#">
			<cfcase value="confirm">
				<cfset newArguments.value = arguments.missingMethodArguments[1] />
				
				<cfreturn confirm( argumentCollection = newArguments ) />
			</cfcase>
			
			<cfcase value="get">
				<!--- Check for reset flag --->
				<cfif arrayLen(arguments.missingMethodArguments)>
					<cfset newArguments.doReset = arguments.missingMethodArguments[1] />
				</cfif>
				
				<cfreturn get( argumentCollection = newArguments ) />
			</cfcase>
			
			<cfcase value="has">
				<cfreturn has( argumentCollection = newArguments ) />
			</cfcase>
		</cfswitch>
	</cffunction>
</cfcomponent>