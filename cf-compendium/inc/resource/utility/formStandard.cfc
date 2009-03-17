<!--- 
	Used to generate forms. This cfc is meant to be extended to have form elements with
	custom formatting.
--->
<cfcomponent extends="cf-compendium.inc.resource.utility.form" output="false">
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
		<cfif arguments.element.title NEQ ''>
			<cfset formatted &= 'title="' & arguments.element.title & '" ' />
		</cfif>
		
		<!--- Disabled --->
		<cfif arguments.element.disabled>
			<cfset formatted &= 'disabled="disabled" ' />
		</cfif>
		
		<!--- Class --->
		<cfif arguments.element.class NEQ ''>
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
		
		<!--- Set defaults --->
		<cfset defaults.checked = false />
		<cfset defaults.value = '' />
		
		<!--- Extend the form options --->
		<cfset arguments.element = variables.extender.extend(defaults, arguments.element) />
		
		<cfset formatted = '<input type="checkbox" ' />
		
		<!--- ID --->
		<cfset formatted &= 'id="' & arguments.element.id & '" ' />
		
		<!--- Name --->
		<cfset formatted &= 'name="' & arguments.element.name & '" ' />
		
		<!--- Value --->
		<cfset formatted &= 'value="' & arguments.element.value & '" ' />
		
		<!--- Title --->
		<cfif arguments.element.title NEQ ''>
			<cfset formatted &= 'title="' & arguments.element.title & '" ' />
		</cfif>
		
		<!--- Checked --->
		<cfif arguments.element.checked EQ true>
			<cfset formatted &= 'checked="checked" ' />
		</cfif>
		
		<!--- Disabled --->
		<cfif arguments.element.disabled EQ true>
			<cfset formatted &= 'disabled="disabled" ' />
		</cfif>
		
		<!--- Class --->
		<cfif arguments.element.class NEQ ''>
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
		<cfif arguments.element.title NEQ ''>
			<cfset formatted &= 'title="' & arguments.element.title & '" ' />
		</cfif>
		
		<!--- Accept --->
		<cfif arguments.element.accept NEQ ''>
			<cfset formatted &= 'accept="' & arguments.element.accept & '" ' />
		</cfif>
		
		<!--- Disabled --->
		<cfif arguments.element.disabled EQ true>
			<cfset formatted &= 'disabled="disabled" ' />
		</cfif>
		
		<!--- Class --->
		<cfif arguments.element.class NEQ ''>
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
		<cfif arguments.element.class NEQ ''>
			<cfset formatted &= 'class="' & arguments.element.class & '" ' />
		</cfif>
		
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
		<cfif arguments.element.title NEQ ''>
			<cfset formatted &= 'title="' & arguments.element.title & '" ' />
		</cfif>
		
		<!--- Disabled --->
		<cfif arguments.element.disabled EQ true>
			<cfset formatted &= 'disabled="disabled" ' />
		</cfif>
		
		<!--- Size --->
		<cfif isNumeric(arguments.element.size) AND arguments.element.size GT 0>
			<cfset formatted &= 'size="' & arguments.element.size & '" ' />
		</cfif>
		
		<!--- Alt --->
		<cfif arguments.element.alt NEQ ''>
			<cfset formatted &= 'alt="' & arguments.element.alt & '" ' />
		</cfif>
		
		<!--- Src --->
		<cfif arguments.element.src NEQ ''>
			<cfset formatted &= 'src="' & arguments.element.src & '" ' />
		</cfif>
		
		<!--- Value --->
		<cfif arguments.element.value NEQ ''>
			<cfset formatted &= 'value="' & arguments.element.value & '" ' />
		</cfif>
		
		<!--- Class --->
		<cfif arguments.element.class NEQ ''>
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
		<cfif arguments.element.title NEQ ''>
			<cfset formatted &= 'title="' & arguments.element.title & '" ' />
		</cfif>
		
		<!--- Max Length --->
		<cfif isNumeric(arguments.element.maxLength) AND arguments.element.maxLength GT 0>
			<cfset formatted &= 'maxLength="' & arguments.element.maxLength & '" ' />
		</cfif>
		
		<!--- Disabled --->
		<cfif arguments.element.disabled EQ true>
			<cfset formatted &= 'disabled="disabled" ' />
		</cfif>
		
		<!--- Read Only --->
		<cfif arguments.element.readOnly EQ true>
			<cfset formatted &= 'readonly="readonly" ' />
		</cfif>
		
		<!--- Size --->
		<cfif isNumeric(arguments.element.size) AND arguments.element.size GT 0>
			<cfset formatted &= 'size="' & arguments.element.size & '" ' />
		</cfif>
		
		<!--- Value --->
		<cfif arguments.element.value NEQ ''>
			<cfset formatted &= 'value="' & arguments.element.value & '" ' />
		</cfif>
		
		<!--- Class --->
		<cfif arguments.element.class NEQ ''>
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
		
		<!--- Set defaults --->
		<cfset defaults.checked = false />
		<cfset defaults.value = '' />
		
		<!--- Extend the form options --->
		<cfset arguments.element = variables.extender.extend(defaults, arguments.element) />
		
		<cfset formatted = '<input type="radio" ' />
		
		<!--- ID --->
		<cfset formatted &= 'id="' & arguments.element.id & '" ' />
		
		<!--- Name --->
		<cfset formatted &= 'name="' & arguments.element.name & '" ' />
		
		<!--- Value --->
		<cfset formatted &= 'value="' & arguments.element.value & '" ' />
		
		<!--- Title --->
		<cfif arguments.element.title NEQ ''>
			<cfset formatted &= 'title="' & arguments.element.title & '" ' />
		</cfif>
		
		<!--- Checked --->
		<cfif arguments.element.checked EQ true>
			<cfset formatted &= 'checked="checked" ' />
		</cfif>
		
		<!--- Disabled --->
		<cfif arguments.element.disabled EQ true>
			<cfset formatted &= 'disabled="disabled" ' />
		</cfif>
		
		<!--- Size --->
		<cfif isNumeric(arguments.element.size) AND arguments.element.size GT 0>
			<cfset formatted &= 'size="' & arguments.element.size & '" ' />
		</cfif>
		
		<!--- Class --->
		<cfif arguments.element.class NEQ ''>
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
		<cfset var defaults = {} />
		
		<!--- Set defaults --->
		<cfset defaults.multiple = false />
		<cfset defaults.size = 10 />
		
		<!--- Extend the form options --->
		<cfset arguments.element = variables.extender.extend(defaults, arguments.element) />
		
		<cfset formatted = '<select ' />
		
		<!--- ID --->
		<cfset formatted &= 'id="' & arguments.element.id & '" ' />
		
		<!--- Title --->
		<cfif arguments.element.title NEQ ''>
			<cfset formatted &= 'title="' & arguments.element.title & '" ' />
		</cfif>
		
		<!--- Name --->
		<cfif arguments.element.name NEQ ''>
			<cfset formatted &= 'name="' & arguments.element.name & '" ' />
		</cfif>
		
		<!--- Multiple --->
		<cfif arguments.element.multiple EQ true>
			<cfset formatted &= 'multiple="multiple" ' />
		</cfif>
		
		<!--- Size --->
		<cfif arguments.element.size NEQ ''>
			<cfset formatted &= 'size="' & arguments.element.size & '" ' />
		</cfif>
		
		<!--- Disabled --->
		<cfif arguments.element.disabled NEQ ''>
			<cfset formatted &= 'disabled="disabled" ' />
		</cfif>
		
		<!--- Class --->
		<cfif arguments.element.class NEQ ''>
			<cfset formatted &= 'class="' & arguments.element.class & '" ' />
		</cfif>
		
		<cfset formatted &= '>' />
		
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
		<cfif arguments.element.title NEQ ''>
			<cfset formatted &= 'title="' & arguments.element.title & '" ' />
		</cfif>
		
		<!--- Max Length --->
		<cfif isNumeric(arguments.element.maxLength) AND arguments.element.maxLength GT 0>
			<cfset formatted &= 'maxLength="' & arguments.element.maxLength & '" ' />
		</cfif>
		
		<!--- Disabled --->
		<cfif arguments.element.disabled EQ true>
			<cfset formatted &= 'disabled="disabled" ' />
		</cfif>
		
		<!--- Read Only --->
		<cfif arguments.element.readOnly EQ true>
			<cfset formatted &= 'readonly="readonly" ' />
		</cfif>
		
		<!--- Size --->
		<cfif isNumeric(arguments.element.size) AND arguments.element.size GT 0>
			<cfset formatted &= 'size="' & arguments.element.size & '" ' />
		</cfif>
		
		<!--- Value --->
		<cfif arguments.element.value NEQ ''>
			<cfset formatted &= 'value="' & arguments.element.value & '" ' />
		</cfif>
		
		<!--- Class --->
		<cfif arguments.element.class NEQ ''>
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
		<cfif arguments.element.title NEQ ''>
			<cfset formatted &= 'title="' & arguments.element.title & '" ' />
		</cfif>
		
		<!--- Disabled --->
		<cfif arguments.element.disabled EQ true>
			<cfset formatted &= 'disabled="disabled" ' />
		</cfif>
		
		<!--- Read Only --->
		<cfif arguments.element.readOnly EQ true>
			<cfset formatted &= 'readonly="readonly" ' />
		</cfif>
		
		<!--- Class --->
		<cfif arguments.element.class NEQ ''>
			<cfset formatted &= 'class="' & arguments.element.class & '" ' />
		</cfif>
		
		<cfset formatted &= '>' />
		
		<cfset formatted &= arguments.element.value />
		
		<cfset formatted &= '</textarea>' />
		
		<cfreturn formatted />
	</cffunction>
</cfcomponent>