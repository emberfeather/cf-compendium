<cfcomponent output="false">
	<cffunction name="init" access="public" returntype="component" output="false">
		<cfargument name="i18n" type="component" required="true" />
		<cfargument name="locale" type="string" default="en_US" />
		
		<cfset variables.i18n = arguments.i18n />
		<cfset variables.locale = arguments.locale />
		
		<cfset variables.bundles = [] />
		<cfset variables.filters = [] />
		<cfset variables.numFilters = 0 />
		
		<!--- Set base bundle for translation --->
		<cfset addI18NBundle('/cf-compendium/i18n/inc/resource/utility', 'filter') />
		
		<cfreturn this />
	</cffunction>
	
	<cffunction name="addBreak" access="public" returntype="void" output="false">
		<cfset arrayAppend(variables.filters, 'Filter Break') />
	</cffunction>
	
	<cffunction name="addFilter" access="public" returntype="void" output="false">
		<cfargument name="key" type="string" required="true" />
		<cfargument name="options" type="component" required="false" />
		
		<cfset var filter = {
				label = getLabel(arguments.key),
				key = trim(arguments.key),
				options = ''
			} />
		
		<!--- Ensure the key is not blank --->
		<cfif filter.key EQ ''>
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
	
	<cffunction name="addI18NBundle" access="public" returntype="void" output="false">
		<cfargument name="path" type="string" required="true" />
		<cfargument name="name" type="string" required="true" />
		
		<cfset arrayAppend(variables.bundles, variables.i18n.getResourceBundle(arguments.path, arguments.name, variables.locale)) />
	</cffunction>
	
	<cffunction name="getLabel" access="public" returntype="string" output="false">
		<cfargument name="key" type="string" required="true" />
		
		<cfset var i = '' />
		
		<!--- Check for no label --->
		<cfif arguments.key EQ ''>
			<cfreturn '' />
		</cfif>
		
		<!--- Find the first (LIFO) value for the label --->
		<cfloop from="#arrayLen(variables.bundles)#" to="1" index="i" step="-1">
			<cfif variables.bundles[i].hasKey(arguments.key)>
				<cfreturn variables.bundles[i].getValue(arguments.key) />
			</cfif>
		</cfloop>
		
		<cfreturn 'N/A' />
	</cffunction>
	
	<cffunction name="filterCheckbox" access="private" returntype="string" output="false">
		<cfargument name="theURL" type="component" required="true" />
		<cfargument name="filter" type="struct" required="true" />
		
		<cfset var group = '' />
		<cfset var html = '' />
		<cfset var optGroups = arguments.filter.options.get() />
		<cfset var option = '' />
		<cfset var value = arguments.theURL.search(arguments.filter.key) />
		
		<cfset html &= '<strong>' & filter.label & ':</strong> ' />
		
		<cfloop array="#optGroups#" index="group">
			<cfloop array="#group.options#" index="option">
				<cfset html &= '<label><input type="checkbox" name="' & arguments.filter.key & '" value="' & option.value & '"' />
				
				<cfif option.value EQ value>
					<cfset html &= ' checked="checked"' />
				</cfif>
				
				<cfset html &= ' /> ' & option.title & '</label>' />
			</cfloop>
		</cfloop>
		
		<cfreturn html />
	</cffunction>
	
	<cffunction name="filterRadio" access="private" returntype="string" output="false">
		<cfargument name="theURL" type="component" required="true" />
		<cfargument name="filter" type="struct" required="true" />
		
		<cfset var group = '' />
		<cfset var html = '' />
		<cfset var optGroups = arguments.filter.options.get() />
		<cfset var option = '' />
		<cfset var value = arguments.theURL.search(arguments.filter.key) />
		
		<cfset html &= '<strong>' & filter.label & ':</strong> ' />
		
		<cfloop array="#optGroups#" index="group">
			<cfloop array="#group.options#" index="option">
				<cfset html &= '<label><input type="radio" name="' & arguments.filter.key & '" value="' & option.value & '"' />
				
				<cfif option.value EQ value>
					<cfset html &= ' checked="checked"' />
				</cfif>
				
				<cfset html &= ' /> ' & option.title & '</label>' />
			</cfloop>
		</cfloop>
		
		<cfreturn html />
	</cffunction>
	
	<cffunction name="filterSelect" access="private" returntype="string" output="false">
		<cfargument name="theURL" type="component" required="true" />
		<cfargument name="filter" type="struct" required="true" />
		
		<cfset var group = '' />
		<cfset var html = '' />
		<cfset var optGroups = arguments.filter.options.get() />
		<cfset var option = '' />
		<cfset var value = arguments.theURL.search(arguments.filter.key) />
		
		<cfset html &= '<label><strong>' & filter.label & ':</strong> <select name="' & arguments.filter.key & '">' />
		
		<cfloop array="#optGroups#" index="group">
			<cfif group.label NEQ ''>
				<cfset html &= '<optgroup label="' & group.label & '">' />
			</cfif>
			
			<cfloop array="#group.options#" index="option">
				<cfset html &= '<option value="' & option.value & '"' />
				
				<cfif option.value EQ value>
					<cfset html &= ' selected="selected"' />
				</cfif>
				
				<cfset html &= '>' & option.title & '</option>' />
			</cfloop>
			
			<cfif group.label NEQ ''>
				<cfset html &= '</optgroup>' />
			</cfif>
		</cfloop>
		
		<cfset html &= '</select></label>' />
		
		<cfreturn html />
	</cffunction>
	
	<cffunction name="filterText" access="private" returntype="string" output="false">
		<cfargument name="theURL" type="component" required="true" />
		<cfargument name="filter" type="struct" required="true" />
		
		<cfset var html = '' />
		
		<cfset html &= '<label><strong>' & filter.label & ':</strong> <input type="text" name="' & arguments.filter.key & '" value="' & arguments.theURL.search(arguments.filter.key) & '" /></label>' />
		
		<cfreturn html />
	</cffunction>
	
	<cffunction name="length" access="public" returntype="numeric" output="false">
		<cfreturn variables.numFilters />
	</cffunction>
	
	<cffunction name="toHTML" access="public" returntype="string" output="false">
		<cfargument name="theURL" type="component" required="true" />
		<cfargument name="options" type="struct" default="#{}#" />
		
		<cfset var html = '' />
		<cfset var filter = '' />
		
		<cfparam name="arguments.options.submit" default="filter">
		
		<!--- Reset the current page for the filter --->
		<cfset arguments.theURL.setFilter('onPage', 1) />
		
		<!--- Check to make sure we have filters to display --->
		<cfif NOT length()>
			<cfthrow message="Missing filters" detail="Cannot generate filter html without filters" />
		</cfif>
		
		<!--- Create the html --->
		<cfloop array="#variables.filters#" index="filter">
			<!--- Check for a filter or a break --->
			<cfif isStruct(filter)>
				<!--- Check if it is a text filter --->
				<cfif NOT isObject(filter.options)>
					<cfset html &= filterText(arguments.theURL, filter) />
				<cfelse>
					<!--- Check the number of filters --->
					<cfif length() EQ 1>
						<!--- 'Smartly' determine what type of output would be best --->
						<cfswitch expression="#filter.options.length()#">
							<cfcase value="1">
								<cfset html &= filterCheckbox(arguments.theURL, filter) />
							</cfcase>
							<cfcase value="2,3,4">
								<cfset html &= filterRadio(arguments.theURL, filter) />
							</cfcase>
							<cfdefaultcase>
								<cfset html &= filterSelect(arguments.theURL, filter) />
							</cfdefaultcase>
						</cfswitch>
					<cfelse>
						<!--- 'Smartly' determine what type of output would be best --->
						<cfswitch expression="#filter.options.length()#">
							<cfcase value="1">
								<cfset html &= filterCheckbox(arguments.theURL, filter) />
							</cfcase>
							<cfdefaultcase>
								<cfset html &= filterSelect(arguments.theURL, filter) />
							</cfdefaultcase>
						</cfswitch>
					</cfif>
				</cfif>
			<cfelse>
				<!--- Found a break --->
				<cfset html &= '<br />' />
			</cfif>
		</cfloop>
		
		<!--- Wrap with the filter div --->
		<cfset html = '<div class="filter"><form method="POST" action="' & arguments.theURL.getFilter() & '">' & html & '<input type="submit" value="' & getLabel(arguments.options.submit) & '"></form></div>' />
		
		<cfreturn html />
	</cffunction>
</cfcomponent>