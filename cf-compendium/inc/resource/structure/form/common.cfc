<!--- 
	Used to generate forms. This cfc is meant to be extended to have form elements with
	custom formatting.
--->
<cfcomponent extends="cf-compendium.inc.resource.base.formElement" output="false">
	<!--- 
		Add an element to the form to be displayed.
	--->
	<cffunction name="addElement" access="public" returntype="void" output="false">
		<cfargument name="theForm" type="component" required="true" />
		<cfargument name="elementType" type="string" required="true" />
		<cfargument name="options" type="struct" default="#{}#" />
		
		<!--- Check for a file form type --->
		<cfif arguments.elementType eq 'file'>
			<cfset arguments.theForm.setIsMultipart(true) />
		</cfif>
		
		<cfif arguments.elementType eq 'hidden'>
			<cfset arguments.options.noLabel = true />
		</cfif>
	</cffunction>
	
	<!---
		Common Attributes for the input element
		
		@see http://www.w3.org/TR/html5/the-input-element.html#the-input-element
	--->
	<cffunction name="attributesInput" access="public" returntype="string" output="false">
		<cfargument name="element" type="struct" required="true" />
		
		<cfreturn variables.attributes.attributes(arguments.element, [
			'accept',
			'alt',
			'autocomplete',
			'form',
			'formaction',
			'formenctype',
			'formmethod',
			'formnovalidate',
			'formtarget',
			'height',
			'list',
			'max',
			'maxlength',
			'min',
			'pattern',
			'placeholder',
			'size',
			'src',
			'step',
			'type',
			'width'
		], [
			'autofocus',
			'checked',
			'disabled',
			'multiple',
			'readonly',
			'required'
		], [
			'name',
			'value'
		]) />
	</cffunction>
	
	<!---
		Common Attributes for the meter element
		
		@see http://www.w3.org/TR/html5/the-button-element.html#the-meter-element
	--->
	<cffunction name="attributesMeter" access="public" returntype="string" output="false">
		<cfargument name="element" type="struct" required="true" />
		
		<cfreturn variables.attributes.attributes(arguments.element, [
			'form',
			'high',
			'low',
			'max',
			'min',
			'optimum',
			'value'
		]) />
	</cffunction>
	
	<!---
		Common Attributes for the select element
		
		@see http://www.w3.org/TR/html5/the-button-element.html#the-select-element
	--->
	<cffunction name="attributesSelect" access="public" returntype="string" output="false">
		<cfargument name="element" type="struct" required="true" />
		
		<cfreturn variables.attributes.attributes(arguments.element, [
			'form',
			'name',
			'size'
		], [
			'autofocus',
			'disabled',
			'multiple'
		]) />
	</cffunction>
	
	<!---
		Common Attributes for the textarea element
		
		@see http://www.w3.org/TR/html5/the-textarea-element.html
	--->
	<cffunction name="attributesTextarea" access="public" returntype="string" output="false">
		<cfargument name="element" type="struct" required="true" />
		
		<cfreturn variables.attributes.attributes(arguments.element, [
			'cols',
			'form',
			'maxlength',
			'name',
			'placeholder',
			'rows',
			'wrap'
		], [
			'autofocus',
			'disabled',
			'readonly',
			'required'
		]) />
	</cffunction>
	
	<cffunction name="elementButton" access="public" returntype="string" output="false">
		<cfargument name="element" type="struct" required="true" />
		<cfset arguments.element.type = arguments.element.elementType />
		
		<cfreturn elementInput(arguments.element) />
	</cffunction>
	
	<!--- 
		Creates the checkbox form element.
	--->
	<cffunction name="elementCheckbox" access="public" returntype="string" output="false">
		<cfargument name="element" type="struct" required="true" />
		
		<cfset var formatted = '' />
		<cfset var defaults = {} />
		<cfset var group = '' />
		<cfset var i = '' />
		<cfset var j = '' />
		<cfset var optGroups = '' />
		<cfset var option = '' />
		<cfset var originalID = '' />
		<cfset var originalValue = '' />
		
		<!--- Set defaults --->
		<cfset defaults.checked = false />
		<cfset defaults.value = '' />
		
		<!--- Extend the form options --->
		<cfset arguments.element = variables.extender.extend(defaults, arguments.element) />
		
		<!--- Check if we are showing a single element or many options --->
		<cfif structKeyExists(arguments.element, 'options')>
			<!--- Keep a hold on the original value --->
			<cfset originalValue = arguments.element.value />
			
			<!--- Save the original ID --->
			<cfset originalID = arguments.element.id />
			
			<cfset formatted = '<div class="options respect-float">' />
			
			<!--- Get the option groups --->
			<cfset optGroups = arguments.element.options.get() />
			
			<!--- Output the options --->
			<cfloop from="1" to="#arrayLen(optGroups)#" index="i">
				<cfset group = optGroups[i] />
				
				<cfif group.label neq ''>
					<cfset formatted &= '<div><div>' & variables.label.get(group.label) & '</div>' />
				</cfif>
				
				<cfloop from="1" to="#arrayLen(group.options)#" index="j">
					<cfset option = group.options[j] />
					
					<cfset arguments.element.value = option.value />
					<cfset arguments.element.id = originalID & '_' & j />
					
					<cfif isArray(originalValue)>
						<cfset arguments.element.checked = arrayFindNoCase(originalValue, option.value) gt 0 />
					<cfelse>
						<cfset arguments.element.checked = originalValue eq option.value />
					</cfif>
					
					<cfset formatted &= ' <label>' & elementCheckboxSingle(arguments.element) & option.title & '</label>' />
				</cfloop>
				
				<cfif group.label neq ''>
					<cfset formatted &= '</div>' />
				</cfif>
			</cfloop>
			
			<cfset formatted &= '</div>' />
		<cfelse>
			<!--- Just do a single element if no options found --->
			<cfset formatted = elementCheckboxSingle(arguments.element) />
		</cfif>
		
		<cfreturn formatted />
	</cffunction>
	
	<!--- 
		Creates the checkbox form element.
	--->
	<cffunction name="elementCheckboxSingle" access="public" returntype="string" output="false">
		<cfargument name="element" type="struct" required="true" />
		
		<cfset arguments.element.type = 'checkbox' />
		
		<cfreturn elementInput(arguments.element) />
	</cffunction>
	
	<cffunction name="elementColor" access="public" returntype="string" output="false">
		<cfargument name="element" type="struct" required="true" />
		
		<cfset arguments.element.type = arguments.element.elementType />
		
		<cfreturn elementInput(arguments.element) />
	</cffunction>
	
	<!--- 
		Creates the custom form element.
	--->
	<cffunction name="elementCustom" access="public" returntype="string" output="false">
		<cfargument name="element" type="struct" required="true" />
		
		<cfset var formatted = '' />
		
		<cfset formatted = '<div ' />
		
		<!--- Common HTML Attributes --->
		<cfset formatted &= variables.attributes.attributesHtml(arguments.element) />
		
		<cfset formatted &= '>' />
		
		<cfset formatted &= arguments.element.value />
		
		<cfset formatted &= '</div>' />
		
		<cfreturn formatted />
	</cffunction>
	
	<cffunction name="elementDataGrid" access="public" returntype="string" output="false">
		<cfargument name="element" type="struct" required="true" />
		
		<cfparam name="arguments.element.options" default="#{}#" />
		
		<!--- Do not output the form tags --->
		<cfset arguments.element.options.showForm = false />
		
		<cfreturn '<div class="wrapper">' & arguments.element.datagrid.toHTML( arguments.element.value, arguments.element.options ) & '</div>' />
	</cffunction>
	
	<cffunction name="elementDate" access="public" returntype="string" output="false">
		<cfargument name="element" type="struct" required="true" />
		
		<cfset arguments.element.type = arguments.element.elementType />
		
		<cfif isDate(arguments.element.value)>
			<cfset arguments.element.value = dateFormat(arguments.element.value, 'yyyy-mm-dd') />
		</cfif>
		
		<cfreturn elementInput(arguments.element) />
	</cffunction>
	
	<cffunction name="elementDateTime" access="public" returntype="string" output="false">
		<cfargument name="element" type="struct" required="true" />
		
		<cfset arguments.element.type = arguments.element.elementType />
		
		<cfif isDate(arguments.element.value)>
			<cfset arguments.element.value = dateFormat(arguments.element.value, 'yyyy-mm-dd') & 'T' & timeFormat(arguments.element.value, 'HH:mm:ss') & 'Z' />
		</cfif>
		
		<cfreturn elementInput(arguments.element) />
	</cffunction>
	
	<cffunction name="elementDateTimeLocal" access="public" returntype="string" output="false">
		<cfargument name="element" type="struct" required="true" />
		
		<cfset arguments.element.type = arguments.element.elementType />
		
		<cfif isDate(arguments.element.value)>
			<cfset arguments.element.value = dateFormat(arguments.element.value, 'yyyy-mm-dd') & 'T' & timeFormat(arguments.element.value, 'HH:mm:ss') />
		</cfif>
		
		<cfreturn elementInput(arguments.element) />
	</cffunction>
	
	<cffunction name="elementEmail" access="public" returntype="string" output="false">
		<cfargument name="element" type="struct" required="true" />
		
		<cfset arguments.element.type = arguments.element.elementType />
		
		<cfreturn elementInput(arguments.element) />
	</cffunction>
	
	<cffunction name="elementFile" access="public" returntype="string" output="false">
		<cfargument name="element" type="struct" required="true" />
		
		<cfset arguments.element.type = arguments.element.elementType />
		
		<cfreturn elementInput(arguments.element) />
	</cffunction>
	
	<cffunction name="elementHidden" access="public" returntype="string" output="false">
		<cfargument name="element" type="struct" required="true" />
		
		<cfset arguments.element.type = arguments.element.elementType />
		
		<cfreturn elementInput(arguments.element) />
	</cffunction>
	
	<cffunction name="elementImage" access="public" returntype="string" output="false">
		<cfargument name="element" type="struct" required="true" />
		
		<cfset arguments.element.type = arguments.element.elementType />
		
		<cfreturn elementInput(arguments.element) />
	</cffunction>
	
	<!--- 
		Creates the input form element.
	--->
	<cffunction name="elementInput" access="public" returntype="string" output="false">
		<cfargument name="element" type="struct" required="true" />
		
		<cfset var formatted = '' />
		
		<cfset formatted = '<input ' />
		
		<!--- Common HTML Attributes --->
		<cfset formatted &= variables.attributes.attributesHtml(arguments.element) />
		
		<!--- Common Element Attributes --->
		<cfset formatted &= attributesInput(arguments.element) />
		
		<cfset formatted &= '/>' />
		
		<cfreturn formatted />
	</cffunction>
	
	<!--- 
		Creates the meter form element.
	--->
	<cffunction name="elementMeter" access="public" returntype="string" output="false">
		<cfargument name="element" type="struct" required="true" />
		
		<cfset var formatted = '' />
		
		<cfset formatted = '<meter ' />
		
		<!--- Common HTML Attributes --->
		<cfset formatted &= variables.attributes.attributesHtml(arguments.element) />
		
		<!--- Common Element Attributes --->
		<cfset formatted &= attributesMeter(arguments.element) />
		
		<cfset formatted &= '>' />
		
		<cfif structKeyExists(arguments.element, 'text')>
			<cfset formatted &= arguments.element.text />
		</cfif>
		
		<cfset formatted &= '</meter>' />
		
		<cfreturn formatted />
	</cffunction>
	
	<cffunction name="elementMonth" access="public" returntype="string" output="false">
		<cfargument name="element" type="struct" required="true" />
		
		<cfset arguments.element.type = arguments.element.elementType />
		
		<cfif isDate(arguments.element.value)>
			<cfset arguments.element.value = dateFormat(arguments.element.value, 'yyyy-mm') />
		</cfif>
		
		<cfreturn elementInput(arguments.element) />
	</cffunction>
	
	<cffunction name="elementNumber" access="public" returntype="string" output="false">
		<cfargument name="element" type="struct" required="true" />
		
		<cfset arguments.element.type = arguments.element.elementType />
		
		<cfreturn elementInput(arguments.element) />
	</cffunction>
	
	<cffunction name="elementPassword" access="public" returntype="string" output="false">
		<cfargument name="element" type="struct" required="true" />
		
		<cfset arguments.element.type = arguments.element.elementType />
		
		<cfreturn elementInput(arguments.element) />
	</cffunction>
	
	<!--- 
		Creates the radio form element.
	--->
	<cffunction name="elementRadio" access="public" returntype="string" output="false">
		<cfargument name="element" type="struct" required="true" />
		
		<cfset var formatted = '' />
		<cfset var defaults = {} />
		<cfset var group = '' />
		<cfset var i = '' />
		<cfset var j = '' />
		<cfset var optGroups = '' />
		<cfset var option = '' />
		<cfset var originalID = '' />
		<cfset var originalValue = '' />
		
		<!--- Set defaults --->
		<cfset defaults.checked = false />
		<cfset defaults.value = '' />
		
		<!--- Extend the form options --->
		<cfset arguments.element = variables.extender.extend(defaults, arguments.element) />
		
		<!--- Check if we are showing a single element or many options --->
		<cfif structKeyExists(arguments.element, 'options')>
			<!--- Keep a hold on the original value --->
			<cfset originalValue = arguments.element.value />
			
			<!--- Save the original ID --->
			<cfset originalID = arguments.element.id />
			
			<cfset formatted = '<div class="options respect-float">' />
			
			<!--- Get the option groups --->
			<cfset optGroups = arguments.element.options.get() />
			
			<!--- Output the options --->
			<cfloop from="1" to="#arrayLen(optGroups)#" index="i">
				<cfset group = optGroups[i] />
				
				<cfif group.label neq ''>
					<cfset formatted &= '<div>' />
					
					<cfset formatted &= '<div>' & variables.label.get(group.label) & '</div>' />
				</cfif>
				
				<cfloop from="1" to="#arrayLen(group.options)#" index="j">
					<cfset option = group.options[j] />
					
					<cfset arguments.element.value = option.value />
					<cfset arguments.element.checked = originalValue eq option.value />
					<cfset arguments.element.id = originalID & '_' & j />
					
					<cfset formatted &= ' <label>' & elementRadioSingle(arguments.element) & option.title & '</label>' />
				</cfloop>
				
				<cfif group.label neq ''>
					<cfset formatted &= '</div>' />
				</cfif>
			</cfloop>
			
			<cfset formatted &= '</div>' />
		<cfelse>
			<!--- Just do a single element if no options found --->
			<cfset formatted = elementRadioSingle(arguments.element) />
		</cfif>
		
		<cfreturn formatted />
	</cffunction>
	
	<!--- 
		Creates the radio form element.
	--->
	<cffunction name="elementRadioSingle" access="public" returntype="string" output="false">
		<cfargument name="element" type="struct" required="true" />
		
		<cfset arguments.element.type = 'radio' />
		
		<cfreturn elementInput(arguments.element) />
	</cffunction>
	
	<cffunction name="elementRange" access="public" returntype="string" output="false">
		<cfargument name="element" type="struct" required="true" />
		
		<cfset arguments.element.type = arguments.element.elementType />
		
		<cfreturn elementInput(arguments.element) />
	</cffunction>
	
	<cffunction name="elementReCaptcha" access="public" returntype="string" output="false">
		<cfargument name="element" type="struct" required="true" />
		
		<cfset local.html = '' />
		<cfset local.error = (structKeyExists(arguments.element, 'error') and len(arguments.element.error) ? '&amp;error=' & arguments.element.error : '') />
		<cfset local.theme = (structKeyExists(arguments.element, 'theme') and len(arguments.element.theme) ? arguments.element.theme : '') />
		
		<cfsavecontent variable="local.html">
			<cfoutput>
				<div class="options">
					<cfif local.theme neq ''>
						<script type="text/javascript">
							var RecaptchaOptions = {
								theme : '#arguments.element.theme#'
							};
						</script>
					</cfif>
					<script type="text/javascript" src="http://www.google.com/recaptcha/api/challenge?k=#arguments.element.value##local.error#"></script>
					
					<noscript>
						<iframe src="http://www.google.com/recaptcha/api/noscript?k=#arguments.element.value##local.error#" height="300" width="500" frameborder="0"></iframe>
						<br>
						<textarea name="recaptcha_challenge_field" rows="3" cols="40"></textarea>
						<input type="hidden" name="recaptcha_response_field" value="manual_challenge">
					</noscript>
				</div>
			</cfoutput>
		</cfsavecontent>
		
		<cfreturn local.html />
	</cffunction>
	
	<cffunction name="elementReset" access="public" returntype="string" output="false">
		<cfargument name="element" type="struct" required="true" />
		
		<cfset arguments.element.type = arguments.element.elementType />
		
		<cfreturn elementInput(arguments.element) />
	</cffunction>
	
	<cffunction name="elementSearch" access="public" returntype="string" output="false">
		<cfargument name="element" type="struct" required="true" />
		
		<cfset arguments.element.type = arguments.element.elementType />
		
		<cfreturn elementInput(arguments.element) />
	</cffunction>
	
	<!--- 
		Creates the select form element.
	--->
	<cffunction name="elementSelect" access="public" returntype="string" output="false">
		<cfargument name="element" type="struct" required="true" />
		
		<cfset var formatted = '' />
		<cfset var group = '' />
		<cfset var option = '' />
		<cfset var optGroups = '' />
		<cfset var defaults = {
				multiple = false,
				size = 10,
				value = ''
			} />
		
		<!--- Extend the form options --->
		<cfset arguments.element = variables.extender.extend(defaults, arguments.element) />
		
		<!--- check for options --->
		<cfif not structKeyExists( arguments.element, 'options' )>
			<cfthrow message="Need options for select element" detail="Need to pass options to the select type of element" />
		</cfif>
		
		<cfset formatted = '<select ' />
		
		<!--- Common HTML Attributes --->
		<cfset formatted &= variables.attributes.attributesHtml(arguments.element) />
		
		<!--- Common Element Attributes --->
		<cfset formatted &= attributesSelect(arguments.element) />
		
		<cfset formatted &= '>' />
		
		<!--- Get the option groups --->
		<cfset optGroups = arguments.element.options.get() />
		
		<!--- Output the options --->
		<cfloop array="#optGroups#" index="group">
			<cfif group.label neq ''>
				<cfset formatted &= '<optgroup label="' & variables.label.get(group.label) & '">' />
			</cfif>
			
			<cfloop array="#group.options#" index="option">
				<cfset formatted &= '<option value="' & option.value & '"' />
				
				<!--- Selected --->
				<cfif option.value eq arguments.element.value>
					<cfset formatted &= ' selected="selected"' />
				</cfif>
				
				<cfset formatted &= '>' & option.title & '</option>' />
			</cfloop>
			
			<cfif group.label neq ''>
				<cfset formatted &= '</optgroup>' />
			</cfif>
		</cfloop>
		
		<cfset formatted &= '</select>' />
		
		<cfreturn formatted />
	</cffunction>
	
	<!--- 
		Creates the select form element.
	--->
	<cffunction name="elementSelectRange" access="public" returntype="string" output="false">
		<cfargument name="element" type="struct" required="true" />
		
		<cfset var formatted = '' />
		<cfset var i = '' />
		<cfset var defaults = {
				multiple = false,
				size = 10,
				rangeMin = 1,
				rangeMax = 100,
				rangeStep = 1
			} />
		
		<!--- Extend the form options --->
		<cfset arguments.element = variables.extender.extend(defaults, arguments.element) />
		
		<cfset formatted = '<select ' />
		
		<!--- Common HTML Attributes --->
		<cfset formatted &= variables.attributes.attributesHtml(arguments.element) />
		
		<!--- Common Element Attributes --->
		<cfset formatted &= attributesSelect(arguments.element) />
		
		<cfset formatted &= '>' />
		
		<cfset formatted &= '<option value=""></option>' />
		
		<cfloop from="#arguments.element.rangeMin#" to="#arguments.element.rangeMax#" index="i" step="#arguments.element.rangeStep#">
			<cfset formatted &= '<option value="#i#"' />
			
			<!--- Check for a selected value --->
			<cfif arguments.element.value eq i>
				<cfset formatted &= ' selected="selected"' />
			</cfif>
			
			<cfset formatted &= '>#i#</option>' />
		</cfloop>
		
		<cfset formatted &= '</select>' />
		
		<cfreturn formatted />
	</cffunction>
	
	<cffunction name="elementSubmit" access="public" returntype="string" output="false">
		<cfargument name="element" type="struct" required="true" />
		
		<cfset arguments.element.type = arguments.element.elementType />
		
		<cfreturn elementInput(arguments.element) />
	</cffunction>
	
	<cffunction name="elementTel" access="public" returntype="string" output="false">
		<cfargument name="element" type="struct" required="true" />
		
		<cfset arguments.element.type = arguments.element.elementType />
		
		<cfreturn elementInput(arguments.element) />
	</cffunction>
	
	<cffunction name="elementText" access="public" returntype="string" output="false">
		<cfargument name="element" type="struct" required="true" />
		
		<cfset arguments.element.type = arguments.element.elementType />
		
		<cfreturn elementInput(arguments.element) />
	</cffunction>
	
	<!--- 
		Creates the text area form element.
	--->
	<cffunction name="elementTextarea" access="public" returntype="string" output="false">
		<cfargument name="element" type="struct" required="true" />
		
		<cfset var formatted = '' />
		
		<cfset formatted = '<textarea ' />
		
		<!--- Common HTML Attributes --->
		<cfset formatted &= variables.attributes.attributesHtml(arguments.element) />
		
		<!--- Common Element Attributes --->
		<cfset formatted &= attributesTextarea(arguments.element) />
		
		<cfset formatted &= '>' />
		
		<cfset formatted &= arguments.element.value />
		
		<cfset formatted &= '</textarea>' />
		
		<cfreturn formatted />
	</cffunction>
	
	<cffunction name="elementTime" access="public" returntype="string" output="false">
		<cfargument name="element" type="struct" required="true" />
		
		<cfset arguments.element.type = arguments.element.elementType />
		
		<cfif isDate(arguments.element.value)>
			<cfset arguments.element.value = timeFormat(arguments.element.value, 'HH:mm:ss.l') />
		</cfif>
		
		<cfreturn elementInput(arguments.element) />
	</cffunction>
	
	<cffunction name="elementUrl" access="public" returntype="string" output="false">
		<cfargument name="element" type="struct" required="true" />
		
		<cfset arguments.element.type = arguments.element.elementType />
		
		<cfreturn elementInput(arguments.element) />
	</cffunction>
	
	<cffunction name="elementWeek" access="public" returntype="string" output="false">
		<cfargument name="element" type="struct" required="true" />
		
		<cfset arguments.element.type = arguments.element.elementType />
		
		<cfif isDate(arguments.element.value)>
			<cfset arguments.element.value = dateFormat(arguments.element.value, 'yyyy') & '-W' & week(arguments.element.value) />
		</cfif>
		
		<cfreturn elementInput(arguments.element) />
	</cffunction>
</cfcomponent>
