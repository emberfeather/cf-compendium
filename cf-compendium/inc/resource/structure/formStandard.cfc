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
			<cfcase value="button">
				<cfreturn elementButton(arguments.element) />
			</cfcase>
			<cfcase value="checkbox">
				<cfreturn elementCheckbox(arguments.element) />
			</cfcase>
			<cfcase value="file">
				<cfreturn elementFile(arguments.element) />
			</cfcase>
			<cfcase value="hidden">
				<cfreturn elementHidden(arguments.element) />
			</cfcase>
			<cfcase value="image">
				<cfreturn elementImage(arguments.element) />
			</cfcase>
			<cfcase value="password">
				<cfreturn elementPassword(arguments.element) />
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
			<cfcase value="text">
				<cfreturn elementText(arguments.element) />
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
		Creates the button form element.
	--->
	<cffunction name="elementButton" access="private" returntype="string" output="false">
		<cfargument name="element" type="struct" required="true" />
		
		<cfset var formatted = '' />
		<cfset var defaults = {} />
		
		<!--- Set defaults --->
		<cfset defaults.type = 'button' />
		<cfset defaults.value = 'changeMe' />
		
		<!--- Extend the form options --->
		<cfset arguments.element = variables.extender.extend(defaults, arguments.element) />
		
		<cfset formatted = '<button ' />
		
		<!--- Type --->
		<cfset formatted &= 'type="' & arguments.element.type & '" ' />
		
		<!--- ID --->
		<cfset formatted &= 'id="' & arguments.element.id & '" ' />
		
		<!--- Name --->
		<cfset formatted &= 'name="' & arguments.element.name & '" ' />
		
		<!--- Title --->
		<cfif arguments.element.title neq ''>
			<cfset formatted &= 'title="' & arguments.element.title & '" ' />
		</cfif>
		
		<!--- Disabled --->
		<cfif arguments.element.disabled>
			<cfset formatted &= 'disabled="disabled" ' />
		</cfif>
		
		<!--- Class --->
		<cfif arguments.element.class neq ''>
			<cfset formatted &= 'class="' & arguments.element.class & '" ' />
		</cfif>
		
		<cfset formatted &= '>' />
		
		<!--- Value --->
		<cfset formatted &= arguments.element.value />
		
		<cfset formatted &= '</button>' />
		
		<cfreturn formatted />
	</cffunction>
	
	<!--- 
		Creates the checkbox form element.
	--->
	<cffunction name="elementCheckbox" access="private" returntype="string" output="false">
		<cfargument name="element" type="struct" required="true" />
		
		<cfset var formatted = '' />
		<cfset var defaults = {} />
		<cfset var i = '' />
		<cfset var j = '' />
		<cfset var optGroups = '' />
		
		<!--- Set defaults --->
		<cfset defaults.checked = false />
		<cfset defaults.value = '' />
		
		<!--- Extend the form options --->
		<cfset arguments.element = variables.extender.extend(defaults, arguments.element) />
		
		<!--- Check if we are showing a single element or many options --->
		<cfif structKeyExists(arguments.element, 'options')>
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
		
		<cfset var formatted = '' />
		
		<cfset formatted = '<input type="checkbox" ' />
		
		<!--- ID --->
		<cfset formatted &= 'id="' & arguments.element.id & '" ' />
		
		<!--- Name --->
		<cfset formatted &= 'name="' & arguments.element.name & '" ' />
		
		<!--- Value --->
		<cfset formatted &= 'value="' & arguments.element.value & '" ' />
		
		<!--- Title --->
		<cfif arguments.element.title neq ''>
			<cfset formatted &= 'title="' & arguments.element.title & '" ' />
		</cfif>
		
		<!--- Checked --->
		<cfif arguments.element.checked eq true>
			<cfset formatted &= 'checked="checked" ' />
		</cfif>
		
		<!--- Disabled --->
		<cfif arguments.element.disabled eq true>
			<cfset formatted &= 'disabled="disabled" ' />
		</cfif>
		
		<!--- Class --->
		<cfif arguments.element.class neq ''>
			<cfset formatted &= 'class="' & arguments.element.class & '" ' />
		</cfif>
		
		<cfset formatted &= '/>' />
		
		<cfreturn formatted />
	</cffunction>
	
	<!--- 
		Creates the file form element.
	--->
	<cffunction name="elementFile" access="private" returntype="string" output="false">
		<cfargument name="element" type="struct" required="true" />
		
		<cfset var formatted = '' />
		<cfset var defaults = {} />
		
		<!--- Set defaults --->
		<cfset defaults.accept = '' />
		
		<!--- Extend the form options --->
		<cfset arguments.element = variables.extender.extend(defaults, arguments.element) />
		
		<cfset formatted = '<input type="file" ' />
		
		<!--- ID --->
		<cfset formatted &= 'id="' & arguments.element.id & '" ' />
		
		<!--- Name --->
		<cfset formatted &= 'name="' & arguments.element.name & '" ' />
		
		<!--- Title --->
		<cfif arguments.element.title neq ''>
			<cfset formatted &= 'title="' & arguments.element.title & '" ' />
		</cfif>
		
		<!--- Accept --->
		<cfif arguments.element.accept neq ''>
			<cfset formatted &= 'accept="' & arguments.element.accept & '" ' />
		</cfif>
		
		<!--- Disabled --->
		<cfif arguments.element.disabled eq true>
			<cfset formatted &= 'disabled="disabled" ' />
		</cfif>
		
		<!--- Class --->
		<cfif arguments.element.class neq ''>
			<cfset formatted &= 'class="' & arguments.element.class & '" ' />
		</cfif>
		
		<cfset formatted &= '/>' />
		
		<cfreturn formatted />
	</cffunction>
	
	<!--- 
		Creates the hidden range form element.
	--->
	<cffunction name="elementHidden" access="private" returntype="string" output="false">
		<cfargument name="element" type="struct" required="true" />
		
		<cfset var formatted = '' />
		<cfset var defaults = {} />
		
		<!--- Set defaults --->
		<cfset defaults.value = '' />
		
		<!--- Extend the form options --->
		<cfset arguments.element = variables.extender.extend(defaults, arguments.element) />
		
		<cfset formatted = '<input type="hidden" ' />
		
		<!--- ID --->
		<cfset formatted &= 'id="' & arguments.element.id & '" ' />
		
		<!--- Name --->
		<cfset formatted &= 'name="' & arguments.element.name & '" ' />
		
		<!--- Class --->
		<cfif arguments.element.class neq ''>
			<cfset formatted &= 'class="' & arguments.element.class & '" ' />
		</cfif>
		
		<!--- Value --->
		<cfset formatted &= 'value="' & arguments.element.value & '" ' />
		
		<cfset formatted &= '/>' />
		
		<cfreturn formatted />
	</cffunction>
	
	<!--- 
		Creates the image form element.
	--->
	<cffunction name="elementImage" access="private" returntype="string" output="false">
		<cfargument name="element" type="struct" required="true" />
		
		<cfset var formatted = '' />
		<cfset var defaults = {} />
		
		<!--- Set defaults --->
		<cfset defaults.alt = '' />
		<cfset defaults.src = '' />
		
		<!--- Extend the form options --->
		<cfset arguments.element = variables.extender.extend(defaults, arguments.element) />
		
		<cfset formatted = '<input type="image" ' />
		
		<!--- ID --->
		<cfset formatted &= 'id="' & arguments.element.id & '" ' />
		
		<!--- Name --->
		<cfset formatted &= 'name="' & arguments.element.name & '" ' />
		
		<!--- Title --->
		<cfif arguments.element.title neq ''>
			<cfset formatted &= 'title="' & arguments.element.title & '" ' />
		</cfif>
		
		<!--- Disabled --->
		<cfif arguments.element.disabled eq true>
			<cfset formatted &= 'disabled="disabled" ' />
		</cfif>
		
		<!--- Size --->
		<cfif isNumeric(arguments.element.size) and arguments.element.size gt 0>
			<cfset formatted &= 'size="' & arguments.element.size & '" ' />
		</cfif>
		
		<!--- Alt --->
		<cfif arguments.element.alt neq ''>
			<cfset formatted &= 'alt="' & arguments.element.alt & '" ' />
		</cfif>
		
		<!--- Src --->
		<cfif arguments.element.src neq ''>
			<cfset formatted &= 'src="' & arguments.element.src & '" ' />
		</cfif>
		
		<!--- Value --->
		<cfif arguments.element.value neq ''>
			<cfset formatted &= 'value="' & arguments.element.value & '" ' />
		</cfif>
		
		<!--- Class --->
		<cfif arguments.element.class neq ''>
			<cfset formatted &= 'class="' & arguments.element.class & '" ' />
		</cfif>
		
		<cfset formatted &= '/>' />
		
		<cfreturn formatted />
	</cffunction>
	
	<!--- 
		Creates the password form element.
	--->
	<cffunction name="elementPassword" access="private" returntype="string" output="false">
		<cfargument name="element" type="struct" required="true" />
		
		<cfset var formatted = '' />
		<cfset var defaults = {} />
		
		<!--- Set defaults --->
		<cfset defaults.maxlength = '' />
		<cfset defaults.readOnly = false />
		<cfset defaults.value = '' />
		
		<!--- Extend the form options --->
		<cfset arguments.element = variables.extender.extend(defaults, arguments.element) />
		
		<cfset formatted = '<input type="password" ' />
		
		<!--- ID --->
		<cfset formatted &= 'id="' & arguments.element.id & '" ' />
		
		<!--- Name --->
		<cfset formatted &= 'name="' & arguments.element.name & '" ' />
		
		<!--- Title --->
		<cfif arguments.element.title neq ''>
			<cfset formatted &= 'title="' & arguments.element.title & '" ' />
		</cfif>
		
		<!--- Max Length --->
		<cfif isNumeric(arguments.element.maxLength) and arguments.element.maxLength gt 0>
			<cfset formatted &= 'maxLength="' & arguments.element.maxLength & '" ' />
		</cfif>
		
		<!--- Disabled --->
		<cfif arguments.element.disabled eq true>
			<cfset formatted &= 'disabled="disabled" ' />
		</cfif>
		
		<!--- Read Only --->
		<cfif arguments.element.readOnly eq true>
			<cfset formatted &= 'readonly="readonly" ' />
		</cfif>
		
		<!--- Size --->
		<cfif isNumeric(arguments.element.size) and arguments.element.size gt 0>
			<cfset formatted &= 'size="' & arguments.element.size & '" ' />
		</cfif>
		
		<!--- Value --->
		<cfif arguments.element.value neq ''>
			<cfset formatted &= 'value="' & arguments.element.value & '" ' />
		</cfif>
		
		<!--- Class --->
		<cfif arguments.element.class neq ''>
			<cfset formatted &= 'class="' & arguments.element.class & '" ' />
		</cfif>
		
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
		<cfset var i = '' />
		<cfset var j = '' />
		<cfset var optGroups = '' />
		
		<!--- Set defaults --->
		<cfset defaults.checked = false />
		<cfset defaults.value = '' />
		
		<!--- Extend the form options --->
		<cfset arguments.element = variables.extender.extend(defaults, arguments.element) />
		
		<!--- Check if we are showing a single element or many options --->
		<cfif structKeyExists(arguments.element, 'options')>
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
		<cfargument name="postfix" type="string" default="" />
		
		<cfset var formatted = '' />
		
		<cfset formatted = '<input type="radio" ' />
		
		<!--- ID --->
		<cfset formatted &= 'id="' & arguments.element.id & arguments.postfix & '" ' />
		
		<!--- Name --->
		<cfset formatted &= 'name="' & arguments.element.name & '" ' />
		
		<!--- Value --->
		<cfset formatted &= 'value="' & arguments.element.value & '" ' />
		
		<!--- Title --->
		<cfif arguments.element.title neq ''>
			<cfset formatted &= 'title="' & arguments.element.title & '" ' />
		</cfif>
		
		<!--- Checked --->
		<cfif arguments.element.checked eq true>
			<cfset formatted &= 'checked="checked" ' />
		</cfif>
		
		<!--- Disabled --->
		<cfif arguments.element.disabled eq true>
			<cfset formatted &= 'disabled="disabled" ' />
		</cfif>
		
		<!--- Class --->
		<cfif arguments.element.class neq ''>
			<cfset formatted &= 'class="' & arguments.element.class & '" ' />
		</cfif>
		
		<cfset formatted &= '/>' />
		
		<cfreturn formatted />
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
		
		<!--- ID --->
		<cfset formatted &= 'id="' & arguments.element.id & '" ' />
		
		<!--- Title --->
		<cfif arguments.element.title neq ''>
			<cfset formatted &= 'title="' & arguments.element.title & '" ' />
		</cfif>
		
		<!--- Name --->
		<cfif arguments.element.name neq ''>
			<cfset formatted &= 'name="' & arguments.element.name & '" ' />
		</cfif>
		
		<!--- Multiple --->
		<cfif arguments.element.multiple eq true>
			<cfset formatted &= 'multiple="multiple" ' />
		</cfif>
		
		<!--- Disabled --->
		<cfif arguments.element.disabled>
			<cfset formatted &= 'disabled="disabled" ' />
		</cfif>
		
		<!--- Class --->
		<cfif arguments.element.class neq ''>
			<cfset formatted &= 'class="' & arguments.element.class & '" ' />
		</cfif>
		
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
		
		<!--- ID --->
		<cfset formatted &= 'id="' & arguments.element.id & '" ' />
		
		<!--- Title --->
		<cfif arguments.element.title neq ''>
			<cfset formatted &= 'title="' & arguments.element.title & '" ' />
		</cfif>
		
		<!--- Name --->
		<cfif arguments.element.name neq ''>
			<cfset formatted &= 'name="' & arguments.element.name & '" ' />
		</cfif>
		
		<!--- Multiple --->
		<cfif arguments.element.multiple eq true>
			<cfset formatted &= 'multiple="multiple" ' />
		</cfif>
		
		<!--- Size --->
		<cfif arguments.element.size neq ''>
			<cfset formatted &= 'size="' & arguments.element.size & '" ' />
		</cfif>
		
		<!--- Disabled --->
		<cfif arguments.element.disabled>
			<cfset formatted &= 'disabled="disabled" ' />
		</cfif>
		
		<!--- Class --->
		<cfif arguments.element.class neq ''>
			<cfset formatted &= 'class="' & arguments.element.class & '" ' />
		</cfif>
		
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
		Creates the text form element.
	--->
	<cffunction name="elementText" access="private" returntype="string" output="false">
		<cfargument name="element" type="struct" required="true" />
		
		<cfset var formatted = '' />
		<cfset var defaults = {} />
		
		<!--- Set defaults --->
		<cfset defaults.maxlength = '' />
		<cfset defaults.readOnly = false />
		<cfset defaults.value = '' />
		
		<!--- Extend the form options --->
		<cfset arguments.element = variables.extender.extend(defaults, arguments.element) />
		
		<cfset formatted = '<input type="text" ' />
		
		<!--- ID --->
		<cfset formatted &= 'id="' & arguments.element.id & '" ' />
		
		<!--- Name --->
		<cfset formatted &= 'name="' & arguments.element.name & '" ' />
		
		<!--- Title --->
		<cfif arguments.element.title neq ''>
			<cfset formatted &= 'title="' & arguments.element.title & '" ' />
		</cfif>
		
		<!--- Max Length --->
		<cfif isNumeric(arguments.element.maxLength) and arguments.element.maxLength gt 0>
			<cfset formatted &= 'maxLength="' & arguments.element.maxLength & '" ' />
		</cfif>
		
		<!--- Disabled --->
		<cfif arguments.element.disabled eq true>
			<cfset formatted &= 'disabled="disabled" ' />
		</cfif>
		
		<!--- Read Only --->
		<cfif arguments.element.readOnly eq true>
			<cfset formatted &= 'readonly="readonly" ' />
		</cfif>
		
		<!--- Size --->
		<cfif isNumeric(arguments.element.size) and arguments.element.size gt 0>
			<cfset formatted &= 'size="' & arguments.element.size & '" ' />
		</cfif>
		
		<!--- Value --->
		<cfif arguments.element.value neq ''>
			<cfset formatted &= 'value="' & arguments.element.value & '" ' />
		</cfif>
		
		<!--- Class --->
		<cfif arguments.element.class neq ''>
			<cfset formatted &= 'class="' & arguments.element.class & '" ' />
		</cfif>
		
		<cfset formatted &= '/>' />
		
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
		
		<!--- ID --->
		<cfset formatted &= 'id="' & arguments.element.id & '" ' />
		
		<!--- Name --->
		<cfset formatted &= 'name="' & arguments.element.name & '" ' />
		
		<!--- Rows --->
		<cfset formatted &= 'rows="' & arguments.element.rows & '" ' />
		
		<!--- Cols --->
		<cfset formatted &= 'cols="' & arguments.element.cols & '" ' />
		
		<!--- Title --->
		<cfif arguments.element.title neq ''>
			<cfset formatted &= 'title="' & arguments.element.title & '" ' />
		</cfif>
		
		<!--- Disabled --->
		<cfif arguments.element.disabled eq true>
			<cfset formatted &= 'disabled="disabled" ' />
		</cfif>
		
		<!--- Read Only --->
		<cfif arguments.element.readOnly eq true>
			<cfset formatted &= 'readonly="readonly" ' />
		</cfif>
		
		<!--- Class --->
		<cfif arguments.element.class neq ''>
			<cfset formatted &= 'class="' & arguments.element.class & '" ' />
		</cfif>
		
		<cfset formatted &= '>' />
		
		<cfset formatted &= arguments.element.value />
		
		<cfset formatted &= '</textarea>' />
		
		<cfreturn formatted />
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