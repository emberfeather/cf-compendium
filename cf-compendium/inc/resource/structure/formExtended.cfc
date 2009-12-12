<!--- 
	Used to generate extended forms. This cfc extends to have custom form elements.
	<p>
	Please note: To gain the advantage of the extended form cfc requires the use of jQuery.
--->
<cfcomponent displayname="form" extends="cf-compendium.inc.resource.structure.formStandard" output="false">
	<!--- 
		Used to format the actual HTML element.
		<p>
		The extended form cfc supports the following types of form elements:
		<li>date - Date
		<li>datetime - Date and Time
		<li>dateRange - Date Range
		<li>datetimeRange - Date and Time Range
		<li>multilist - Multi List
		<li>numberRange - Number Range
		<li>numberRangeSlide - Number Range Slider
		<li>numberSlide - Number Slider
	--->
	<cffunction name="element" access="private" returntype="string" output="false">
		<cfargument name="element" type="struct" required="true" />
		
		<cfswitch expression="#arguments.element.type#">
			<cfcase value="date">
				<cfreturn elementDate(arguments.element) />
			</cfcase>
			<cfcase value="datetime">
				<cfreturn elementDatetime(arguments.element) />
			</cfcase>
			<cfcase value="dateRange">
				<cfreturn elementDateRange(arguments.element) />
			</cfcase>
			<cfcase value="datetimeRange">
				<cfreturn elementDatetimeRange(arguments.element) />
			</cfcase>
			<cfcase value="multilist">
				<cfreturn elementMultilist(arguments.element) />
			</cfcase>
			<cfcase value="numberRange">
				<cfreturn elementRange(arguments.element) />
			</cfcase>
			<cfcase value="numberRangeSlide">
				<cfreturn elementRangeSlide(arguments.element) />
			</cfcase>
			<cfcase value="numberSlide">
				<cfreturn elementNumberSlide(arguments.element) />
			</cfcase>
			<cfdefaultcase>
				<cfreturn super.element(arguments.element) />
			</cfdefaultcase>
		</cfswitch>
	</cffunction>
	
	<!--- 
		Creates the date form element.
	--->
	<cffunction name="elementDate" access="private" returntype="string" output="false">
		<cfargument name="element" type="struct" required="true" />
		
		<cfset var formatted = '' />
		
		<cfset formatted = '< ' />
		
		<!--- Add additional attributes --->
		
		<cfset formatted &= ' />' />
		
		<cfset formatted = 'The #arguments.element.type# element has not been programmed yet.' />
		
		<cfreturn formatted />
	</cffunction>
	
	<!--- 
		Creates the date and time form element.
	--->
	<cffunction name="elementDatetime" access="private" returntype="string" output="false">
		<cfargument name="element" type="struct" required="true" />
		
		<cfset var formatted = '' />
		
		<cfset formatted = '< ' />
		
		<!--- Add additional attributes --->
		
		<cfset formatted &= ' />' />
		
		<cfset formatted = 'The #arguments.element.type# element has not been programmed yet.' />
		
		<cfreturn formatted />
	</cffunction>
	
	<!--- 
		Creates the date range form element.
	--->
	<cffunction name="elementDateRange" access="private" returntype="string" output="false">
		<cfargument name="element" type="struct" required="true" />
		
		<cfset var formatted = '' />
		
		<cfset formatted = '< ' />
		
		<!--- Add additional attributes --->
		
		<cfset formatted &= ' />' />
		
		<cfset formatted = 'The #arguments.element.type# element has not been programmed yet.' />
		
		<cfreturn formatted />
	</cffunction>
	
	<!--- 
		Creates the date and time range form element.
	--->
	<cffunction name="elementDatetimeRange" access="private" returntype="string" output="false">
		<cfargument name="element" type="struct" required="true" />
		
		<cfset var formatted = '' />
		
		<cfset formatted = '< ' />
		
		<!--- Add additional attributes --->
		
		<cfset formatted &= ' />' />
		
		<cfset formatted = 'The #arguments.element.type# element has not been programmed yet.' />
		
		<cfreturn formatted />
	</cffunction>

	<!--- 
		Creates the multilist form element.
	--->
	<cffunction name="elementMultilist" access="private" returntype="string" output="false">
		<cfargument name="element" type="struct" required="true" />
		
		<cfset var formatted = '' />
		
		<cfset formatted = '< ' />
		
		<!--- Add additional attributes --->
		
		<cfset formatted &= ' />' />
		
		<cfset formatted = 'The #arguments.element.type# element has not been programmed yet.' />
		
		<cfreturn formatted />
	</cffunction>
	
	<!--- 
		Creates the range form element.
	--->
	<cffunction name="elementNumberRange" access="private" returntype="string" output="false">
		<cfargument name="element" type="struct" required="true" />
		
		<cfset var formatted = '' />
		
		<cfset formatted = '< ' />
		
		<!--- Add additional attributes --->
		
		<cfset formatted &= ' />' />
		
		<cfset formatted = 'The #arguments.element.type# element has not been programmed yet.' />
		
		<cfreturn formatted />
	</cffunction>
	
	<!--- 
		Creates the number slider form element.
	--->
	<cffunction name="elementNumberSlide" access="private" returntype="string" output="false">
		<cfargument name="element" type="struct" required="true" />
		
		<cfset var formatted = '' />
		
		<cfset formatted = '< ' />
		
		<!--- Add additional attributes --->
		
		<cfset formatted &= ' />' />
		
		<cfset formatted = 'The #arguments.element.type# element has not been programmed yet.' />
		
		<cfreturn formatted />
	</cffunction>
	
	<!--- 
		Creates the number range slider form element.
	--->
	<cffunction name="elementNumberRangeSlide" access="private" returntype="string" output="false">
		<cfargument name="element" type="struct" required="true" />
		
		<cfset var formatted = '' />
		
		<cfset formatted = '< ' />
		
		<!--- Add additional attributes --->
		
		<cfset formatted &= ' />' />
		
		<cfset formatted = 'The #arguments.element.type# element has not been programmed yet.' />
		
		<cfreturn formatted />
	</cffunction>
	
	<!--- 
		Creates the text area form element.
	--->
	<cffunction name="elementTextarea" access="private" returntype="string" output="false">
		<cfargument name="element" type="struct" required="true" />
		
		<cfset var formatted = '' />
		
		<cfset formatted = '<textarea ' />
		
		<!--- Rows --->
		<cfset formatted &= 'rows="' & arguments.element.rows & '" ' />
		
		<!--- Cols --->
		<cfset formatted &= 'cols="' & arguments.element.cols & '" ' />
		
		<!--- Add additional attributes --->
		<!--- Name --->
		<cfif arguments.element.name neq ''>
			<cfset formatted &= 'name="' & arguments.element.name & '" ' />
		</cfif>
		
		<!--- Disabled --->
		<cfif arguments.element.disabled eq true>
			<cfset formatted &= 'disabled="disabled" ' />
		</cfif>
		
		<!--- Read Only --->
		<cfif arguments.element.readOnly eq true>
			<cfset formatted &= 'readonly="readonly" ' />
		</cfif>
		
		<cfset formatted &= '>' />
		
		<cfset formatted &= '</textarea>' />
		
		<cfset formatted = 'The #arguments.element.type# element has not been programmed yet.' />
		
		<cfreturn formatted />
	</cffunction>
</cfcomponent>