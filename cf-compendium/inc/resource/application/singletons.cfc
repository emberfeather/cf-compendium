<cfcomponent output="false">
	<cffunction name="init" access="public" returntype="component" output="false">
		<cfargument name="isDebugMode" type="boolean" required="true" />
		
		<cfset variables.isDebugMode = arguments.isDebugMode />
		<cfset variables.instance = {} />
		
		<cfreturn this />
	</cffunction>
	
	<cffunction name="onMissingMethod" access="public" returntype="any" output="false">
		<cfargument name="missingMethodName" type="string" required="true" />
		<cfargument name="missingMethodArguments" type="struct" required="true" />
		
		<cfset var attribute = '' />
		<cfset var prefix = '' />
		<cfset var result = '' />
		
		<!--- Do a regex on the name --->
		<cfset result = reFindNoCase('^(get|set)(.+)', arguments.missingMethodName, 1, true) />
		
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
				<!--- If there isn't a singleton defined create a stub --->
				<cfif NOT structKeyExists(variables.instance, attribute)>
					<cfset variables.instance[attribute] = createObject('component', 'cf-compendium.inc.resource.base.stub').init(attribute, variables.isDebugMode) />
				</cfif>
				
				<cfreturn variables.instance[attribute] />
			</cfcase>
			
			<cfcase value="set">
				<cfset variables.instance[attribute] = arguments.missingMethodArguments[1] />
			</cfcase>
		</cfswitch>
	</cffunction>
	
	<cffunction name="print" access="public" returntype="void" output="true">
		<cfdump var="#variables.instance#" />
	</cffunction>
</cfcomponent>