<!--- 
	Used to generate forms. This cfc is meant to be extended to have form elements with
	custom formatting.
--->
<cfcomponent output="false">
	<cffunction name="init" access="public" returntype="any" output="false">
		<cfargument name="id" type="string" required="true" />
		<cfargument name="i18n" type="component" required="true" />
		<cfargument name="locale" type="string" default="en_US" />
		
		<cfset variables.i18n = arguments.i18n />
		<cfset variables.locale = arguments.locale />
		
		<!--- Store the name of the form --->
		<!--- Used for keeping multiple forms on the same page unique --->
		<cfset variables.id = arguments.id />
		
		<!--- Set defaults for form --->
		<cfset variables.isMultipart = false />
		
		<!--- Set the variables for the form --->
		<cfset variables.sections = arrayNew(1) />
		<cfset variables.tabs = arrayNew(1) />
		<cfset variables.fieldsets = arrayNew(1) />
		<cfset variables.elements = arrayNew(1) />
		
		<!--- Create an objects --->
		<cfset variables.extender = createObject('component', 'cf-compendium.inc.resource.utility.extend').init() />
		<cfset variables.label = createObject('component', 'cf-compendium.inc.resource.i18n.label').init(arguments.i18n, arguments.locale) />
		
		<!--- Set base bundle for translation --->
		<cfset addBundle('/cf-compendium/i18n/inc/resource/structure', 'form') />
		
		<cfreturn this />
	</cffunction>
	
	<cffunction name="addBundle" access="public" returntype="void" output="false">
		<cfargument name="path" type="string" required="true" />
		<cfargument name="name" type="string" required="true" />
		
		<cfset variables.label.addBundle(argumentCollection = arguments) />
	</cffunction>
	
	<!--- 
		Add an element to the form to be displayed.
	--->
	<cffunction name="addElement" access="public" returntype="void" output="false">
		<cfargument name="elementType" type="string" required="true" />
		<cfargument name="options" type="struct" default="#{}#" />
		
		<cfset var defaults = {
				class = '',
				desc = '',
				disabled = false,
				id = variables.id & '-section' & arrayLen(variables.sections) + 1 & '-tab' & arrayLen(variables.tabs) + 1 & '-element' & arrayLen(variables.elements) + 1,
				label = '',
				link = '',
				name = '',
				postElement = '',
				preElement = '',
				required = false,
				size = '',
				tip = '',
				title = ''
			} />
		<cfset var element = '' />
		
		<!--- Extend the form options --->
		<cfset element = variables.extender.extend(defaults, arguments.options) />
		
		<!--- Set the element type --->
		<cfset element.elementType = arguments.elementType />
		
		<!--- Append the the element --->
		<cfset arrayAppend(variables.elements, element) />
	</cffunction>
	
	<!--- 
		Add a fieldset to the form to be displayed.
	--->
	<cffunction name="addFieldset" access="public" returntype="void" output="false">
		<cfargument name="options" type="struct" default="#{}#" />
		
		<cfset var defaults = {} />
		<cfset var fieldset = '' />
		
		<!--- Set defaults --->
		<cfset defaults.title = '' />
		<cfset defaults.class = '' />
		<cfset defaults.legend = '' />
		
		<!--- Extend the form options --->
		<cfset fieldset = variables.extender.extend(defaults, arguments.options) />
		
		<!--- Set the forced --->
		<cfset fieldset.id = variables.id & '-section' & arrayLen(variables.sections) + 1 & '-tab' & arrayLen(variables.tabs) + 1 & '-fieldset' & arrayLen(variables.fieldsets) + 1 />
		
		<!--- Check if there are elements to use to create a fieldset --->
		<cfif arrayLen(variables.elements) gt 0>
			<!--- Add the current and clear the array --->
			<cfset fieldset.elements = variables.elements />
			<cfset variables.elements = [] />
			
			<!--- Add the fieldset to the array --->
			<cfset arrayAppend(variables.fieldsets, fieldset) />
		</cfif>
	</cffunction>
	
	<!--- 
		Add a section to the form to be displayed.
	--->
	<cffunction name="addSection" access="public" returntype="void" output="false">
		<cfargument name="options" type="struct" default="#{}#" />
		
		<cfset var defaults = {} />
		<cfset var section = '' />
		
		<!--- Set defaults --->
		<cfset defaults.title = '' />
		<cfset defaults.class = '' />
		
		<!--- Extend the form options --->
		<cfset section = variables.extender.extend(defaults, arguments.options) />
		
		<!--- Set the forced --->
		<cfset section.id = variables.id & '-section' & arrayLen(variables.sections) + 1 />
		
		<!--- Close out any open tabs --->
		<cfset addTab() />
		
		<cfif arrayLen(variables.tabs) gt 0>
			<!--- Add the current clear the array --->
			<cfset section.tabs = variables.tabs />
			<cfset variables.tabs = [] />
			
			<!--- Add the fieldset to the array --->
			<cfset arrayAppend(variables.sections, section) />
		</cfif>
	</cffunction>
	
	<!--- 
		Add a tab to the form to be displayed.
	--->
	<cffunction name="addTab" access="public" returntype="void" output="false">
		<cfargument name="options" type="struct" default="#{}#" />
		
		<cfset var defaults = {} />
		<cfset var tab = '' />
		
		<!--- Set defaults --->
		<cfset defaults.title = '' />
		<cfset defaults.class = '' />
		
		<!--- Extend the form options --->
		<cfset tab = variables.extender.extend(defaults, arguments.options) />
		
		<!--- Set the forced --->
		<cfset tab.id = variables.id & '-section' & arrayLen(variables.sections) + 1 & '-tab' & arrayLen(variables.tabs) + 1 />
		
		<!--- Close out any open fieldset --->
		<cfset addFieldset() />
		
		<cfif arrayLen(variables.fieldsets) gt 0>
			<!--- Add the current and clear the array --->
			<cfset tab.fieldsets = variables.fieldsets />
			<cfset variables.fieldsets = [] />
			
			<!--- Add the fieldset to the array --->
			<cfset arrayAppend(variables.tabs, tab) />
		</cfif>
	</cffunction>
	
	<!--- 
		Used to format the actual HTML element.
		<p>
		The base form component does not have any functionality for formatting form
		elements. The component needs to be extended to show the elements.
	--->
	<cffunction name="elementToHTML" access="private" returntype="string" output="false">
		<cfargument name="element" type="struct" required="true" />
		
		<cfthrow message="Unsupported Form Element" detail="The #arguments.element.type# type of element is currently unsupported." />
	</cffunction>
	
	<!--- 
		Retrieve the closing form tag.
		<p>
		This is very useful when the form needs a special layout. EX: multi-column.
		Since the actual showForm is section based it does not output the form tag unless
		all sections are being displayed.
	--->
	<cffunction name="getFormClose" access="public" returntype="string" output="false">
		<cfreturn '</form>' />
	</cffunction>
	
	<!--- 
		Retrieve the opening form tag.
		<p>
		This is very useful when the form needs a special layout. EX: multi-column.
		Since the actual showForm is section based it does not output the form tag unless
		all sections are being displayed.
	--->
	<cffunction name="getFormOpen" access="public" returntype="string" output="false">
		<cfargument name="action" type="string" required="true" />
		<cfargument name="options" type="struct" default="#{}#" />
		
		<cfset var defaults = '' />
		<cfset var extendedOptions = '' />
		<cfset var formatted = '' />
		
		<!--- Set defaults for form --->
		<cfset defaults = {
				method = 'POST',
				isMultipart = false,
				accept = '',
				acceptCharset = '',
				target = '',
				title = '',
				class = ''
			} />
		
		<!--- Extend the form options --->
		<cfset extendedOptions = variables.extender.extend(defaults, arguments.options) />
		
		<!--- Check for valid action --->
		<cfif trim(arguments.action) eq ''>
			<cfthrow message="Invalid form action" detail="A form action is required." />
		</cfif>
		
		<!--- Open Tag --->
		<cfset formatted &= '<form class="form"' />
		
		<!--- Output id --->
		<cfset formatted &= ' id="' & variables.id & '"' />
		
		<!--- Output action --->
		<cfset formatted &= ' action="' & arguments.action & '"' />
		
		<!--- Output enctype --->
		<cfif variables.isMultipart>
			<cfset formatted &= ' enctype="multipart/form-data"' />
		</cfif>
		
		<!--- Title --->
		<cfif extendedOptions.title neq ''>
			<cfset formatted &= ' title="' & extendedOptions.title & '"' />
		</cfif>
		
		<!--- Class --->
		<cfif extendedOptions.class neq ''>
			<cfset formatted &= ' class="' & extendedOptions.class & '"' />
		</cfif>
		
		<!--- Output accepts --->
		<cfif extendedOptions.accept neq ''>
			<cfset formatted &= ' accept="' & extendedOptions.accept & '"' />
		</cfif>
		
		<!--- Output acceptCharset --->
		<cfif extendedOptions.acceptCharset neq ''>
			<cfset formatted &= ' accept-charset="' & extendedOptions.acceptCharset & '"' />
		</cfif>
		
		<!--- Output target --->
		<cfif extendedOptions.target neq ''>
			<cfset formatted &= ' target="' & extendedOptions.target & '"' />
		</cfif>
		
		<!--- Check for multipart form --->
		<cfif extendedOptions.method eq 'POST'>
			<cfset formatted &= ' method="POST"' />
		<cfelse>
			<cfset formatted &= ' method="GET"' />
		</cfif>
		
		<!--- Close Tag --->
		<cfset formatted &= '>' />
		
		<cfreturn formatted />
	</cffunction>
	
	<!--- 
		Retrieve the closing form tag.
		<p>
		This is very useful when the form needs a special layout. EX: multi-column.
		Since the actual showForm is section based it does not output the form tag unless
		all sections are being displayed.
	--->
	<cffunction name="getFormSubmit" access="public" returntype="string" output="false">
		<cfargument name="options" type="struct" default="#{}#" />
		
		<cfset var defaults = structNew() />
		<cfset var extendedOptions = '' />
		<cfset var formatted = '' />
		
		<!--- Set defaults for form --->
		<cfset defaults.class = '' />
		<cfset defaults.submit = 'Submit' />
		<cfset defaults.reset = '' />
		
		<!--- Extend the form options --->
		<cfset extendedOptions = variables.extender.extend(defaults, arguments.options) />
		
		<!--- Open --->
		<cfset formatted &= '<div ' />
		
		<!--- Class --->
		<cfset formatted &= 'class="submit ' & extendedOptions.class & '" ' />
		
		<!--- Close --->
		<cfset formatted &= '>' />
		
		<!--- Submit --->
		<cfif extendedOptions.submit neq ''>
			<cfset formatted &= '<input type="submit" value="' & variables.label.get(extendedOptions.submit) & '" />' />
		</cfif>
		
		<!--- Reset --->
		<cfif extendedOptions.reset neq ''>
			<cfset formatted &= '<input type="reset" value="' & variables.label.get(extendedOptions.reset) & '" />' />
		</cfif>
		
		<!--- Close --->
		<cfset formatted &= '</div>' />
		
		<cfreturn formatted />
	</cffunction>
	
	<cffunction name="getNumSections" access="public" returntype="numeric" output="false">
		<!--- Close out any open sections --->
		<cfset addSection() />
		
		<cfreturn arrayLen(variables.sections) />
	</cffunction>
	
	<!--- 
		Formats the given fieldset into html output.
	--->
	<cffunction name="showElement" access="private" returntype="string" output="false">
		<cfargument name="element" type="struct" required="true" />
		
		<cfset var formatted = '' />
		
		<!--- hidden elements should not be shown --->
		<cfif arguments.element.elementType neq 'hidden'>
			<!--- Start the tag --->
			<cfset formatted = '<div class="element' />
			
			<!--- Check for a required element --->
			<cfif arguments.element.required>
				<cfset formatted &= ' required' />
			</cfif>
			
			<!--- Finish div --->
			<cfset formatted &= '">' />
			
			<!--- Output the label --->
			<cfif arguments.element.label neq ''>
				<cfset formatted &= '<label' />
				
				<cfif arguments.element.id neq ''>
					<cfset formatted &= ' for="' & arguments.element.id & '"' />
				</cfif>
				
				<cfset formatted &= '>' & variables.label.get(arguments.element.label) & ':</label> ' />
			</cfif>
			
			<!--- Add the pre element text --->
			<cfset formatted &= arguments.element.preElement />
		</cfif>
		
		<!--- Get the html for the element --->
		<cfset formatted &= elementToHTML(arguments.element) />
		
		<!--- hidden elements should not be shown --->
		<cfif arguments.element.elementType neq 'hidden'>
			<!--- Add the post element text --->
			<cfset formatted &= arguments.element.postElement />
			
			<!--- End the tag --->
			<cfset formatted &= '</div>' />
		</cfif>
		
		<cfreturn formatted />
	</cffunction>
	
	<!--- 
		Formats the given fieldset into html output.
	--->
	<cffunction name="showFieldset" access="private" returntype="string" output="false">
		<cfargument name="fieldset" type="struct" required="true" />
		
		<cfset var formatted = '' />
		<cfset var i = '' />
		
		<!--- Reset the element alternating row --->
		<cfset variables.altRow = 0 />
		
		<!--- Start the tag --->
		<cfset formatted = '<fieldset' />
		
		<cfif arguments.fieldset.id neq ''>
			<cfset formatted &= ' id="' & arguments.fieldset.id & '"' />
		</cfif>
		
		<!--- Title --->
		<cfif arguments.fieldset.title neq ''>
			<cfset formatted &= ' title="' & arguments.fieldset.title & '"' />
		</cfif>
		
		<!--- Class --->
		<cfif arguments.fieldset.class neq ''>
			<cfset formatted &= ' class="' & arguments.fieldset.class & '"' />
		</cfif>
		
		<!--- End the start tag --->
		<cfset formatted &= '>' />
		
		<!--- Output legend --->
		<cfif arguments.fieldset.legend neq ''>
			<cfset formatted &= '<legend>' & arguments.fieldset.legend & '</legend>' />
		</cfif>
		
		<cfloop from="1" to="#arrayLen(arguments.fieldset.elements)#" index="i">
			<cfset formatted &= showElement(arguments.fieldset.elements[i]) />
		</cfloop>
		
		<!--- End the tag --->
		<cfset formatted &= '</fieldset>' />
		
		
		<cfreturn formatted />
	</cffunction>
	
	<!--- 
		If no section option is given then the entire form will be generated.
		Uses the order that the sections were added as the reference to the section option.
	--->
	<cffunction name="showForm" access="private" returntype="string" output="false">
		<cfargument name="action" type="string" required="true" />
		<cfargument name="options" type="struct" default="#{}#" />
		
		<cfset var defaults = structNew() />
		<cfset var numSections = '' />
		<cfset var formatted = '' />
		<cfset var extendedOptions = '' />
		<cfset var i = '' />
		
		<!--- Set defaults for form --->
		<cfset defaults.section = 0 />
		
		<!--- Extend the form options --->
		<cfset extendedOptions = variables.extender.extend(defaults, arguments.options) />
		
		<!--- Get the number of sections --->
		<cfset numSections = getNumSections() />
		
		<!--- Check for an empty form --->
		<cfif numSections eq 0>
			<cfthrow message="There are no form elements." detail="Please add at least one form element before showing the form." />
		</cfif>
		
		<!--- Check if showing just a section --->
		<cfif defaults.section gt 0>
			<!--- Check for out of bounds section --->
			<cfif defaults.section gt numSections>
				<cfthrow message="There are not #defaults.section# sections." detail="Please select a section that is between 1 and #numSections#." />
			</cfif>
			
			<cfset formatted = showSection(variables.sections[defaults.section]) />
		<cfelse>
			<!--- Show the entire form --->
			<!--- Get the start form tag --->
			<cfset formatted = getFormOpen(arguments.action, extendedOptions) />
			
			<cfloop from="1" to="#numSections#" index="i">
				<cfset formatted &= showSection(variables.sections[i]) />
			</cfloop>
			
			<!--- Get the end form tag --->
			<cfset formatted &= getFormSubmit(arguments.options) />
			
			<!--- Get the end form tag --->
			<cfset formatted &= getFormClose() />
		</cfif>
		
		<cfreturn formatted />
	</cffunction>
	
	<!--- 
		Formats the given section into html output.
	--->
	<cffunction name="showSection" access="private" returntype="string" output="false">
		<cfargument name="section" type="struct" required="true" />
		
		<cfset var formatted = '' />
		<cfset var numTabs = '' />
		<cfset var i = '' />
		
		<!--- Get the number of tabs --->
		<cfset numTabs = arrayLen(arguments.section.tabs) />
		
		<!--- Create the tabs navigation if multiple --->
		<cfif numTabs gt 1>
			<cfset formatted &= '<ul class="tabs">' />
			
			<cfloop from="1" to="#numTabs#" index="i">
				<cfset formatted &= '<li><a href="##">' & arguments.section.tabs[i].title & '</a></li>' />
			</cfloop>
			
			<cfset formatted &= '</ul>' />
		</cfif>
		
		<!--- Start the tag --->
		<cfset formatted &= '<div' />
		
		<!--- Output id --->
		<cfset formatted &= ' id="' & arguments.section.id & '"' />
		
		<!--- Title --->
		<cfif arguments.section.title neq ''>
			<cfset formatted &= ' title="' & arguments.section.title & '"' />
		</cfif>
		
		<!--- Class --->
		<cfif arguments.section.class neq ''>
			<cfset formatted &= ' class="section ' & arguments.section.class & '"' />
		</cfif>
		
		<!--- Close Tab --->
		<cfset formatted &= '>' />
		
		<!--- Add the output for each tab --->
		<cfloop from="1" to="#numTabs#" index="i">
			<cfset formatted &= showTab(arguments.section.tabs[i]) />
		</cfloop>
		
		<!--- End the tag --->
		<cfset formatted &= '</div>' />
		
		<cfreturn formatted />
	</cffunction>
	
	<!--- 
		Formats the given tab into html output.
	--->
	<cffunction name="showTab" access="private" returntype="string" output="false">
		<cfargument name="tab" type="struct" required="true" />
		
		<cfset var formatted = '' />
		<cfset var i = '' />
		
		<!--- Start the tag --->
		<cfset formatted = '<div' />
		
		<!--- Output id --->
		<cfset formatted &= ' id="' & arguments.tab.id & '"' />
		
		<!--- Title --->
		<cfif arguments.tab.title neq ''>
			<cfset formatted &= ' title="' & arguments.tab.title & '"' />
		</cfif>
		
		<!--- Class --->
		<cfif arguments.tab.class neq ''>
			<cfset formatted &= ' class="tab ' & arguments.tab.class & '"' />
		</cfif>
		
		<!--- Close Tab --->
		<cfset formatted &= '>' />
		
		<!--- Add the output for each fieldset --->
		<cfloop from="1" to="#arrayLen(arguments.tab.fieldsets)#" index="i">
			<cfset formatted &= showFieldset(arguments.tab.fieldsets[i]) />
		</cfloop>
		
		<!--- End the tag --->
		<cfset formatted &= '</div>' />
		
		<cfreturn formatted />
	</cffunction>
	
	<!---
		Public facing function to get the html for a form.
	--->
	<cffunction name="toHTML" access="public" returntype="string" output="false">
		<cfargument name="action" type="string" default="" />
		<cfargument name="options" type="struct" default="#{}#" />
		
		<cfreturn showForm( argumentCollection = arguments ) />
	</cffunction>
	
	<!--- 
		TODO Remove... debugging purposes only
	--->
	<cffunction name="print" access="public" returntype="void" output="true">
		<cfdump var="#variables.sections#" />
	</cffunction>
</cfcomponent>