<cfcomponent output="false">
	<cffunction name="init" access="public" returntype="component" output="false">
		<cfset variables.instance = {} />
		<cfset variables.base62 = createObject('component', 'cf-compendium.inc.resource.utility.base62').init() />
		
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
		
		<!--- Generate a new base62 token using a random number --->
		<cfif arguments.doReset OR NOT structKeyExists(variables.instance, arguments.token)>
			<cfset variables.instance[arguments.token] = variables.base62.valueToBase62( randRange(100,999999999) & randRange(100,999999999) & randRange(100,999999999) ) />
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
		
		<cfset var attribute = '' />
		<cfset var attributeSet = '' />
		<cfset var attributeValue = '' />
		<cfset var childAttribute = '' />
		<cfset var i = '' />
		<cfset var isUnique = '' />
		<cfset var j = '' />
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
		
		<!--- Find the attribute --->
		<cfset attribute = mid(arguments.missingMethodName, result.pos[3], result.len[3]) />
		
		<!--- Make the attribute the first argument --->
		<cfset arrayPrepend(arguments.missingMethodArguments, attribute) />
		
		<!--- Do the fun stuff --->
		<cfswitch expression="#prefix#">
			<cfcase value="confirm">
				<cfreturn confirm( argumentCollection = arguments.missingMethodArguments ) />
			</cfcase>
			
			<cfcase value="get">
				<cfreturn get( argumentCollection = arguments.missingMethodArguments ) />
			</cfcase>
			
			<cfcase value="has">
				<cfreturn has( argumentCollection = arguments.missingMethodArguments ) />
			</cfcase>
		</cfswitch>
	</cffunction>
</cfcomponent>