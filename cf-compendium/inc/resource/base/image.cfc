<cfcomponent output="false">
	<!---
		Used to break the image name into the base part and the file extension.
	--->
	<cffunction name="explodeImageName" access="private" returntype="struct" output="false">
		<cfargument name="imageName" type="string" required="true" />
		
		<cfset var parts = {} />
		<cfset var search = '' />
		
		<!--- Search for parts of the image name --->
		<cfset search = reFind('(.*)(\.[^\.]*)$', arguments.imageName, 1, true) />
		
		<!--- Check if we were able to locate the image name --->
		<cfif NOT search.pos[1]>
			<cfthrow message="#arguments.imageName# is an invalid image name." />
		</cfif>
		
		<!--- Get the base of the image name --->
		<cfset parts.name = mid(arguments.imageName, search.pos[2], search.len[2]) />
		
		<!--- Get the extension of the image name --->
		<cfset parts.ext = mid(arguments.imageName, search.pos[3], search.len[3]) />
		
		<cfreturn parts />
	</cffunction>
</cfcomponent>