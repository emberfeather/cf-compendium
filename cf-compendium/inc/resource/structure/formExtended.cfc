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
	<cffunction name="elementToHTML" access="public" returntype="string" output="false">
		<cfargument name="element" type="struct" required="true" />
		
		<cfswitch expression="#arguments.element.elementType#">
			<cfcase value="autocomplete">
				<cfreturn elementAutocomplete(arguments.element) />
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
				<cfreturn super.elementToHTML(arguments.element) />
			</cfdefaultcase>
		</cfswitch>
	</cffunction>
	
	<!--- 
		Creates the date form element.
	--->
	<cffunction name="elementAutocomplete" access="private" returntype="string" output="false">
		<cfargument name="element" type="struct" required="true" />
		
		<cfset var autoOptions = [] />
		<cfset var formatted = '' />
		<cfset var defaults = {
			'data' = {}
		} />
		<cfset var group = '' />
		<cfset var option = '' />
		<cfset var optGroups = '' />
		
		<!--- Extend the form options --->
		<cfset arguments.element = variables.extender.extend(defaults, arguments.element) />
		
		<cfset arguments.element.class &= ' autocomplete' />
		
		<!--- check for options --->
		<cfif not structKeyExists( arguments.element, 'options' )>
			<cfthrow message="Need options for autocomplete element" detail="Need to pass options to the autocomplete type of element" />
		</cfif>
		
		<!--- Get the option groups --->
		<cfset optGroups = arguments.element.options.get() />
		
		<!--- Output the options --->
		<cfloop array="#optGroups#" index="group">
			<cfloop array="#group.options#" index="option">
				<cfset arrayAppend(autoOptions, {
					'category' = ( group.label neq '' ? variables.label.get(group.label) : '' ),
					'label' = option.title,
					'value' = option.value
				}) />
			</cfloop>
		</cfloop>
		
		<cfset arguments.element.data.options = replace(serializeJson(autoOptions), '"', '&quot;', 'all') />
		
		<cfset arguments.element.type = 'text' />
		
		<cfreturn elementInput(arguments.element) />
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
		
		<cfset formatted = 'The #arguments.element.elementType# element has not been programmed yet.' />
		
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
		
		<cfset formatted = 'The #arguments.element.elementType# element has not been programmed yet.' />
		
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
		
		<cfset formatted = 'The #arguments.element.elementType# element has not been programmed yet.' />
		
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
		
		<cfset formatted = 'The #arguments.element.elementType# element has not been programmed yet.' />
		
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
		
		<cfset formatted = 'The #arguments.element.elementType# element has not been programmed yet.' />
		
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
		
		<cfset formatted = 'The #arguments.element.elementType# element has not been programmed yet.' />
		
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
		
		<cfset formatted = 'The #arguments.element.elementType# element has not been programmed yet.' />
		
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
		
		<cfset formatted = 'The #arguments.element.elementType# element has not been programmed yet.' />
		
		<cfreturn formatted />
	</cffunction>
</cfcomponent>