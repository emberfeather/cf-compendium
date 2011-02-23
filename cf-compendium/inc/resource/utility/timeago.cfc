<cfcomponent output="false">
	<cffunction name="init" access="public" returntype="component" output="false">
		<cfreturn this />
	</cffunction>
	
	<cffunction name="toHTML" access="public" returntype="string" output="false">
		<cfargument name="datetime" type="date" required="true" />
		
		<cfset var html = '' />
		
		<cfset html = '<time class="timeago" datetime="' />
		<cfset html &= dateFormat(arguments.datetime, 'yyyy-mm-dd') />
		<cfset html &= 'T' />
		<cfset html &= timeFormat(arguments.datetime, 'HH:mm:ss') />
		<cfset html &= '">' />
		<cfset html &= dateFormat(arguments.datetime, 'd mmm yyyy') & ' ' & timeFormat(arguments.dateTime, 'h:mm tt (zzz)') />
		<cfset html &= '</time>' />
		
		<cfreturn html />
	</cffunction>
</cfcomponent>
