<!--- 
	Test Component Comment
--->
<cfcomponent output="false">
	<!---
		Test Function Comment
	--->
	<cffunction name="init" access="public" returntype="any" output="false">
		<cfreturn this />
	</cffunction>
	
	<!---
		Test Function 2 Comment
	--->
	<cffunction name="testArguments" access="public" returntype="void" output="false">
		<cfargument name="arg1" type="string" required="true" />
		<cfargument name="arg2" type="numeric" required="true" />
		
		<!--- Do nothing --->
	</cffunction>
</cfcomponent>