<!--- 
	Used to generate forms. This cfc is meant to be extended to have form elements with
	custom formatting.
--->
<cfcomponent extends="cf-compendium.inc.resource.structure.form" output="false">
	<!--- 
		Add an element to the form to be displayed.
	--->
	<cffunction name="addElement" access="public" returntype="void" output="false">
		<cfargument name="elementType" type="string" required="true" />
		<cfargument name="options" type="struct" default="#{}#" />
		
		<cfset super.addElement(argumentCollection=arguments) />
		
		<!--- Check for a file form type --->
		<cfif arguments.elementType eq 'file'>
			<cfset variables.isMultipart = true />
		</cfif>
	</cffunction>
	
	<!---
		Common Attributes for the button element
		
		@see http://www.w3.org/TR/html5/the-button-element.html#the-button-element
	--->
	<cffunction name="commonAttributesButton" access="private" returntype="string" output="false">
		<cfargument name="element" type="struct" required="true" />
		
		<cfreturn commonAttributes(arguments.element, [
				'form',
				'formaction',
				'formenctype',
				'formmethod',
				'formnovalidate',
				'formtarget',
				'name',
				'type',
				'value'
			], [
				'autofocus',
				'disabled'
			]) />
	</cffunction>
	
	<!---
		Common Attributes for the input element
		
		@see http://www.w3.org/TR/html5/the-input-element.html#the-input-element
	--->
	<cffunction name="commonAttributesInput" access="private" returntype="string" output="false">
		<cfargument name="element" type="struct" required="true" />
		
		<cfreturn commonAttributes(arguments.element, [
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
				'name',
				'pattern',
				'placeholder',
				'size',
				'src',
				'step',
				'type',
				'value',
				'width'
			], [
				'autofocus',
				'checked',
				'disabled',
				'multiple',
				'readonly',
				'required'
			]) />
	</cffunction>
	
	<!---
		Common Attributes for the select element
		
		@see http://www.w3.org/TR/html5/the-button-element.html#the-select-element
	--->
	<cffunction name="commonAttributesSelect" access="private" returntype="string" output="false">
		<cfargument name="element" type="struct" required="true" />
		
		<cfreturn commonAttributes(arguments.element, [
				'form',
				'name',
				'size'
			], [
				'autofocus',
				'disabled',
				'multiple',
			]) />
	</cffunction>
	
	<!--- 
		Used to format the actual HTML element.
		<p>
		To add a custom element extend the form cfc and override the formatElement
		function and create a switch statement with the proper functions calls to the new
		elements. To keep the default elements available call super.formatElement in the default
		case of the override function.
	--->
	<cffunction name="elementToHTML" access="private" returntype="string" output="false">
		<cfargument name="element" type="struct" required="true" />
		
		<cfswitch expression="#arguments.element.elementType#">
			<cfcase value="button,color,date,datetime,datetime-local,email,file,hidden,image,month,number,password,range,reset,search,submit,tel,text,time,url,week">
				<cfset arguments.element.type = arguments.element.elementType />
				
				<cfreturn elementInput(arguments.element) />
			</cfcase>
			<cfcase value="checkbox">
				<cfreturn elementCheckbox(arguments.element) />
			</cfcase>
			<cfcase value="radio">
				<cfreturn elementRadio(arguments.element) />
			</cfcase>
			<cfcase value="select">
				<cfreturn elementSelect(arguments.element) />
			</cfcase>
			<cfcase value="selectRange">
				<cfreturn elementSelectRange(arguments.element) />
			</cfcase>
			<cfcase value="textarea">
				<cfreturn elementTextarea(arguments.element) />
			</cfcase>
			<cfdefaultcase>
				<cfset super.element(arguments.element) />
			</cfdefaultcase>
		</cfswitch>
	</cffunction>
	
	<!--- 
		Creates the checkbox form element.
	--->
	<cffunction name="elementCheckbox" access="private" returntype="string" output="false">
		<cfargument name="element" type="struct" required="true" />
		
		<cfset var formatted = '' />
		<cfset var defaults = {} />
		<cfset var group = '' />
		<cfset var i = '' />
		<cfset var j = '' />
		<cfset var optGroups = '' />
		<cfset var option = '' />
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
			
			<cfset formatted = '<div class="options">' />
			
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
					<cfset arguments.element.checked = originalValue eq option.value />
					
					<cfset formatted &= '<label>' />
					<cfset formatted &= elementCheckboxSingle(arguments.element, '_' & i & '_' & j) />
					<cfset formatted &= ' ' & option.title & '</label>' />
				</cfloop>
				
				<cfif group.label neq ''>
					<cfset formatted &= '</div>' />
				</cfif>
			</cfloop>
			
			<cfset formatted &= '<div class="clear"><!-- clear --></div>' />
			
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
	<cffunction name="elementCheckboxSingle" access="private" returntype="string" output="false">
		<cfargument name="element" type="struct" required="true" />
		
		<cfset arguments.element.type = 'checkbox' />
		
		<cfreturn elementInput(arguments.element) />
	</cffunction>
	
	<!--- 
		Creates the image form element.
	--->
	<cffunction name="elementInput" access="private" returntype="string" output="false">
		<cfargument name="element" type="struct" required="true" />
		
		<cfset var formatted = '' />
		
		<cfset formatted = '<input ' />
		
		<!--- Common HTML Attributes --->
		<cfset formatted &= commonAttributesHtml(arguments.element) />
		
		<!--- Common Input Attributes --->
		<cfset formatted &= commonAttributesInput(arguments.element) />
		
		<cfset formatted &= '/>' />
		
		<cfreturn formatted />
	</cffunction>
	
	<!--- 
		Creates the radio form element.
	--->
	<cffunction name="elementRadio" access="private" returntype="string" output="false">
		<cfargument name="element" type="struct" required="true" />
		
		<cfset var formatted = '' />
		<cfset var defaults = {} />
		<cfset var group = '' />
		<cfset var i = '' />
		<cfset var j = '' />
		<cfset var optGroups = '' />
		<cfset var option = '' />
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
			
			<cfset formatted = '<div class="options">' />
			
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
					<cfset arguments.element.checked = originalValue eq option.value />
					
					<cfset formatted &= '<label>' />
					
					<cfset formatted &= elementRadioSingle(arguments.element, '_' & i & '_' & j) />
					
					<cfset formatted &= ' ' & option.title & '</label>' />
				</cfloop>
				
				<cfif group.label neq ''>
					<cfset formatted &= '</div>' />
				</cfif>
			</cfloop>
			
			<cfset formatted &= '<div class="clear"><!-- clear --></div>' />
			
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
	<cffunction name="elementRadioSingle" access="private" returntype="string" output="false">
		<cfargument name="element" type="struct" required="true" />
		
		<cfset arguments.element.type = 'radio' />
		
		<cfreturn elementInput(arguments.element) />
	</cffunction>
	
	<!--- 
		Creates the select form element.
	--->
	<cffunction name="elementSelect" access="private" returntype="string" output="false">
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
		<cfset formatted &= commonAttributesHtml(arguments.element) />
		
		<!--- Common Element Attributes --->
		<cfset formatted &= commonAttributesSelect(arguments.element) />
		
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
	<cffunction name="elementSelectRange" access="private" returntype="string" output="false">
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
		<cfset formatted &= commonAttributesHtml(arguments.element) />
		
		<!--- Common Element Attributes --->
		<cfset formatted &= commonAttributesSelect(arguments.element) />
		
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
	
	<!--- 
		Creates the text area form element.
	--->
	<cffunction name="elementTextarea" access="private" returntype="string" output="false">
		<cfargument name="element" type="struct" required="true" />
		
		<cfset var formatted = '' />
		<cfset var defaults = {} />
		
		<!--- Set defaults --->
		<cfset defaults.cols = 100 />
		<cfset defaults.rows = 10 />
		<cfset defaults.readOnly = false />
		<cfset defaults.value = '' />
		
		<!--- Extend the form options --->
		<cfset arguments.element = variables.extender.extend(defaults, arguments.element) />
		
		<cfset formatted = '<textarea ' />
		
		<!--- Common HTML Attributes --->
		<cfset formatted &= commonAttributesHtml(arguments.element) />
		
		<!--- Name --->
		<cfset formatted &= 'name="' & arguments.element.name & '" ' />
		
		<!--- Rows --->
		<cfset formatted &= 'rows="' & arguments.element.rows & '" ' />
		
		<!--- Cols --->
		<cfset formatted &= 'cols="' & arguments.element.cols & '" ' />
		
		<!--- Disabled --->
		<cfif arguments.element.disabled eq true>
			<cfset formatted &= 'disabled="disabled" ' />
		</cfif>
		
		<!--- Read Only --->
		<cfif arguments.element.readOnly eq true>
			<cfset formatted &= 'readonly="readonly" ' />
		</cfif>
		
		<cfset formatted &= '>' />
		
		<cfset formatted &= arguments.element.value />
		
		<cfset formatted &= '</textarea>' />
		
		<cfreturn formatted />
	</cffunction>
	
	<!--- 
		Creates the time input form element.
	--->
	<cffunction name="elementTime" access="private" returntype="string" output="false">
		<cfargument name="element" type="struct" required="true" />
		
		<cfset arguments.element.type = 'time' />
		
		<cfreturn elementInput(arguments.element) />
	</cffunction>
	
	<!---
		Pulls in any meta information from the object for adding to the form
	--->
	<cffunction name="fromObjectAttribute" access="private" returntype="void" output="false">
		<cfargument name="object" type="component" required="true" />
		<cfargument name="name" type="string" required="true" />
		<cfargument name="attribute" type="struct" required="true" />
		
		<cfset var objectValue = '' />
		
		<cfif arguments.attribute.form.type eq 'checkbox'>
			<!--- For the checkbox we want to see if the value that the object has is the same as the value for the form --->
			<cfinvoke component="#arguments.object#" method="get#arguments.name#" returnvariable="objectValue" />
			
			<cfset arguments.attribute.form.checked = objectValue eq attribute.form.value />
		<cfelseif arguments.attribute.form.type eq 'password' and structKeyExists(attribute.form, 'value')>
			<!--- For Password elements that have a value defined as part of the meta information do nothing --->
		<cfelse>
			<cfset super.fromObjectAttribute(argumentCollection = arguments) />
		</cfif>
	</cffunction>
</cfcomponent>