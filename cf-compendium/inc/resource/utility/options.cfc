<!--- 
	Used to create options for passing between objects.
--->
<cfcomponent extends="cf-compendium.inc.resource.base.base" output="false">
	<cffunction name="init" access="public" returntype="component" output="false">
		<cfset variables.options = [] />
		<cfset variables.groups = [] />
		<cfset variables.length = 0 />
		
		<cfreturn this />
	</cffunction>
	
	<cffunction name="addGroup" access="public" returntype="void" output="false">
		<cfargument name="label" type="string" default="" />
		
		<cfset var group = {
				label = trim(arguments.label),
				options = variables.options
			} />
		
		<!--- Make sure we are actually going to be adding options --->
		<cfif NOT arrayLen(variables.options)>
			<cfthrow message="Can not add an option group without options" detail="Need to add options before adding a group" />
		</cfif>
		
		<!--- Reset the options --->
		<cfset variables.options = [] />
		
		<cfset arrayAppend(variables.groups, group) />
	</cffunction>
	
	<cffunction name="addOption" access="public" returntype="void" output="false">
		<cfargument name="title" type="string" required="true" />
		<cfargument name="value" type="string" default="" />
		
		<cfset var option = {
				title = trim(arguments.title),
				value = trim(arguments.value)
			} />
		
		<cfset variables.length++ />
		
		<cfset arrayAppend(variables.options, option) />
	</cffunction>
	
	<cffunction name="get" access="public" returntype="array" output="false">
		<!--- Make sure we have at least one group and that all options are part of a group --->
		<cfif NOT arrayLen(variables.groups) OR arrayLen(variables.options)>
			<cfset addGroup() />
		</cfif>
		
		<cfreturn duplicate(variables.groups) />
	</cffunction>
	
	<cffunction name="length" access="public" returntype="numeric" output="false">
		<cfreturn variables.length />
	</cffunction>
</cfcomponent>