<cfcomponent output="false">
	<cffunction name="init" access="public" returntype="component" output="false">
		<cfargument name="i18n" type="component" required="true" />
		<cfargument name="locale" type="string" default="en_US" />
		
		<cfset variables.i18n = arguments.i18n />
		<cfset variables.locale = arguments.locale />
		<cfset variables.label = createObject('component', 'cf-compendium.inc.resource.i18n.label').init(arguments.i18n, arguments.locale) />
		
		<cfset variables.filters = [] />
		<cfset variables.numFilters = 0 />
		
		<!--- Set base bundle for translation --->
		<cfset addBundle('/cf-compendium/i18n/inc/resource/utility', 'filter') />
		
		<cfreturn this />
	</cffunction>
	
	<cffunction name="addBreak" access="public" returntype="void" output="false">
		<cfset arrayAppend(variables.filters, 'Filter Break') />
	</cffunction>
	
	<cffunction name="addBundle" access="public" returntype="void" output="false">
		<cfargument name="path" type="string" required="true" />
		<cfargument name="name" type="string" required="true" />
		
		<cfset variables.label.addBundle(argumentCollection = arguments) />
	</cffunction>
	
	<cffunction name="addFilter" access="public" returntype="void" output="false">
		<cfargument name="key" type="string" required="true" />
		<cfargument name="options" type="any" required="false" />
		
		<cfset var filter = {
			label = variables.label.get(arguments.key, ''),
			key = trim(arguments.key),
			options = ''
		} />
		
		<!--- Ensure the key is not blank --->
		<cfif filter.key eq ''>
			<cfthrow message="Cannot have a blank filter key" detail="The filter key was blank" />
		</cfif>
		
		<!--- Check if we need to store the options --->
		<cfif structKeyExists(arguments, 'options')>
			<cfset filter.options = arguments.options />
		</cfif>
		
		<!--- Add the new filter to th filters --->
		<cfset arrayAppend(filters, filter) />
		
		<!--- Increase the filter count --->
		<cfset variables.numFilters++ />
	</cffunction>
	
	<cffunction name="filterItem" access="private" returntype="string" output="false">
		<cfargument name="values" type="struct" required="true" />
		<cfargument name="filter" type="struct" required="true" />
		
		<!--- Check if it is a text filter --->
		<cfif not isObject(arguments.filter.options)>
			<cfreturn filterText(arguments.values, arguments.filter) />
		<cfelse>
			<!--- Check the number of filters --->
			<cfif length() eq 1>
				<!--- 'Smartly' determine what type of output would be best --->
				<cfswitch expression="#arguments.filter.options.length()#">
					<cfcase value="1">
						<cfreturn filterCheckbox(arguments.values, arguments.filter) />
					</cfcase>
					<cfcase value="2,3,4">
						<cfreturn filterRadio(arguments.values, arguments.filter) />
					</cfcase>
					<cfdefaultcase>
						<cfreturn filterSelect(arguments.values, arguments.filter) />
					</cfdefaultcase>
				</cfswitch>
			<cfelse>
				<!--- 'Smartly' determine what type of output would be best --->
				<cfswitch expression="#arguments.filter.options.length()#">
					<cfcase value="1">
						<cfreturn filterCheckbox(arguments.values, arguments.filter) />
					</cfcase>
					<cfdefaultcase>
						<cfreturn filterSelect(arguments.values, arguments.filter) />
					</cfdefaultcase>
				</cfswitch>
			</cfif>
		</cfif>
	</cffunction>
	
	<cffunction name="filterCheckbox" access="private" returntype="string" output="false">
		<cfargument name="values" type="struct" required="true" />
		<cfargument name="filter" type="struct" required="true" />
		
		<cfset var group = '' />
		<cfset var html = '' />
		<cfset var optGroups = arguments.filter.options.get() />
		<cfset var option = '' />
		<cfset var value = ( structKeyExists(arguments.values, arguments.filter.key) ? arguments.values[arguments.filter.key] : '' ) />
		
		<cfif filter.label neq ''>
			<cfset html &= '<strong class="capitalize">' & filter.label & ':</strong> ' />
		</cfif>
		
		<cfloop array="#optGroups#" index="group">
			<cfloop array="#group.options#" index="option">
				<cfset html &= '<input type="checkbox" id="filter-' & arguments.filter.key & '" name="' & arguments.filter.key & '" value="' & option.value & '"' />
				
				<cfif option.value eq value>
					<cfset html &= ' checked="checked"' />
				</cfif>
				
				<cfset html &= ' /> <label for="filter-' & arguments.filter.key & '">' & option.title & '</label>' />
			</cfloop>
		</cfloop>
		
		<cfreturn html />
	</cffunction>
	
	<cffunction name="filterRadio" access="private" returntype="string" output="false">
		<cfargument name="values" type="struct" required="true" />
		<cfargument name="filter" type="struct" required="true" />
		
		<cfset var group = '' />
		<cfset var html = '' />
		<cfset var optGroups = arguments.filter.options.get() />
		<cfset var option = '' />
		<cfset var value = ( structKeyExists(arguments.values, arguments.filter.key) ? arguments.values[arguments.filter.key] : '' ) />
		
		<cfif filter.label neq ''>
			<cfset html &= '<strong class="capitalize">' & filter.label & ':</strong> ' />
		</cfif>
		
		<cfloop array="#optGroups#" index="group">
			<cfloop array="#group.options#" index="option">
				<cfset html &= '<input type="radio" id="filter-' & arguments.filter.key & '-' & option.value & '" name="' & arguments.filter.key & '" value="' & option.value & '"' />
				
				<cfif option.value eq value>
					<cfset html &= ' checked="checked"' />
				</cfif>
				
				<cfset html &= ' /> <label for="filter-' & arguments.filter.key & '-' & option.value & '">' & option.title & '</label>' />
			</cfloop>
		</cfloop>
		
		<cfreturn html />
	</cffunction>
	
	<cffunction name="filterSelect" access="private" returntype="string" output="false">
		<cfargument name="values" type="struct" required="true" />
		<cfargument name="filter" type="struct" required="true" />
		
		<cfset var group = '' />
		<cfset var html = '' />
		<cfset var optGroups = arguments.filter.options.get() />
		<cfset var option = '' />
		<cfset var value = ( structKeyExists(arguments.values, arguments.filter.key) ? arguments.values[arguments.filter.key] : '' ) />
		
		<cfif filter.label neq ''>
			<cfset html &= '<label class="capitalize" for="filter-' & arguments.filter.key & '"><strong>' & filter.label & ':</strong></label>' />
		</cfif>
		
		<cfset html &= '<select id="filter-' & arguments.filter.key & '" name="' & arguments.filter.key & '">' />
		
		<cfloop array="#optGroups#" index="group">
			<cfif group.label neq ''>
				<cfset html &= '<optgroup label="' & group.label & '">' />
			</cfif>
			
			<cfloop array="#group.options#" index="option">
				<cfset html &= '<option value="' & option.value & '"' />
				
				<cfif option.value eq value>
					<cfset html &= ' selected="selected"' />
				</cfif>
				
				<cfset html &= '>' & option.title & '</option>' />
			</cfloop>
			
			<cfif group.label neq ''>
				<cfset html &= '</optgroup>' />
			</cfif>
		</cfloop>
		
		<cfset html &= '</select>' />
		
		<cfreturn html />
	</cffunction>
	
	<cffunction name="filterText" access="private" returntype="string" output="false">
		<cfargument name="values" type="struct" required="true" />
		<cfargument name="filter" type="struct" required="true" />
		
		<cfset var html = '' />
		<cfset var value = ( structKeyExists(arguments.values, arguments.filter.key) ? arguments.values[arguments.filter.key] : '' ) />
		<cfset var type = ( isStruct(arguments.filter.options) and structKeyExists(arguments.filter.options, 'type') ? arguments.filter.options['type'] : 'text' ) />
		
		<cfswitch expression="#type#">
			<cfcase value="date">
				<cfif len(value) and isDate(value)>
					<cfset value = dateFormat(value, 'yyyy-mm-dd') />
				</cfif>
			</cfcase>
		</cfswitch>
		
		<cfif filter.label neq ''>
			<cfset html &= '<label for="filter-' & arguments.filter.key & '" class="capitalize"><strong>' & filter.label & ': </strong></label>' />
		</cfif>
		
		<cfset html &= '<input id="filter-' & arguments.filter.key & '" type="' & type & '" name="' & arguments.filter.key & '" value="' & value & '" />' />
		
		<cfreturn html />
	</cffunction>
	
	<cffunction name="getLabel" access="public" returntype="component" output="false">
		<cfreturn variables.label />
	</cffunction>
	
	<cffunction name="length" access="public" returntype="numeric" output="false">
		<cfreturn variables.numFilters />
	</cffunction>
	
	<cffunction name="toHTML" access="public" returntype="string" output="false">
		<cfargument name="theUrl" type="component" required="true" />
		<cfargument name="values" type="struct" default="#{}#" />
		<cfargument name="options" type="struct" default="#{}#" />
		
		<cfset var html = '' />
		<cfset var filter = '' />
		
		<cfparam name="arguments.options.submit" default="filter">
		
		<!--- Reset the current page --->
		<cfset arguments.theUrl.setFilter('onPage', 1) />
		
		<!--- Check to make sure we have filters to display --->
		<cfif not length()>
			<cfthrow message="Missing filters" detail="Cannot generate filter html without filters" />
		</cfif>
		
		<!--- Create the html --->
		<cfloop array="#variables.filters#" index="filter">
			<!--- Check for a filter or a break --->
			<cfif isStruct(filter)>
				<cfset html &= filterItem(arguments.values, filter) />
			<cfelse>
				<!--- Found a break --->
				<cfset html &= '<br />' />
			</cfif>
		</cfloop>
		
		<!--- Wrap with the filter div --->
		<cfset html = '<div class="filter"><form method="POST" action="' & arguments.theUrl.getFilter() & '">' & html & '<input type="submit" value="' & variables.label.get(arguments.options.submit) & '"></form></div>' />
		
		<cfreturn html />
	</cffunction>
</cfcomponent>