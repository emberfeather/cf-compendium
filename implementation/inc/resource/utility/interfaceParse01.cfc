<!--- 
	Test Interface Comment
--->
<cfinterface>
	<!---
		Test Function Comment
	--->
	<cffunction name="init" access="public" returntype="any" output="false">
	</cffunction>
	
	<!---
		Test Function 2 Comment
	--->
	<cffunction name="testArguments" access="public" returntype="void" output="false">
		<cfargument name="arg1" type="string" required="true" />
		<cfargument name="arg2" type="numeric" required="true" />
	</cffunction>
</cfinterface>