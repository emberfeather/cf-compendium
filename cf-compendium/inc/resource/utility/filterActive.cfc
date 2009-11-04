<cfcomponent output="false">
	<cffunction name="init" access="public" returntype="component" output="false">
		<cfargument name="i18n" type="component" required="true" />
		<cfargument name="locale" type="string" default="en_US" />
		
		<cfset variables.i18n = arguments.i18n />
		<cfset variables.locale = arguments.locale />
		
		<cfset variables.bundles = [] />
		
		<!--- Set base bundle for translation --->
		<cfset addI18NBundle('/cf-compendium/i18n/inc/resource/utility', 'filter') />
		
		<cfreturn this />
	</cffunction>
	
	<cffunction name="addI18NBundle" access="public" returntype="void" output="false">
		<cfargument name="path" type="string" required="true" />
		<cfargument name="name" type="string" required="true" />
		
		<cfset arrayAppend(variables.bundles, variables.i18n.getResourceBundle(arguments.path, arguments.name, variables.locale)) />
	</cffunction>
	
	<cffunction name="filterItem" access="private" returntype="string" output="false">
		<cfargument name="key" type="string" required="true" />
		<cfargument name="value" type="string" required="true" />
		<cfargument name="href" type="string" required="true" />
		
		<cfreturn getLabel(arguments.key) & ': <strong>' & arguments.value & '</strong> <sup>(<a href="' & arguments.href & '">x</a>)</sup>' />
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
	
	<cffunction name="toHTML" access="public" returntype="string" output="false">
		<cfargument name="filter" type="any" required="true" />
		<cfargument name="theURL" type="component" required="true" />
		<cfargument name="keys" type="string" default="" />
		
		<cfset var html = '' />
		<cfset var key = '' />
		<cfset var value = '' />
		<cfset var currVal = '' />
		
		<!--- Check if there are no keys given --->
		<cfif arguments.keys EQ '' AND isStruct(arguments.filter)>
			<!--- Set the keys to everything alphebetically --->
			<cfset arguments.keys = listSort(structKeyList(arguments.filter), 'text') />
		</cfif>
		
		<cfsavecontent variable="html">
			<ul class="filterActive">
				<cfloop list="#arguments.keys#" index="key">
					<cfif isObject(arguments.filter)>
						<cfinvoke component="#filter#" method="search" returnvariable="value">
							<cfinvokeargument name="value" value="#key#" />
						</cfinvoke>
					<cfelseif structKeyExists(arguments.filter, key)>
						<cfset value = arguments.filter[key] />
					</cfif>
					
					<!--- Find the old value --->
					<cfset currVal = arguments.theURL.search(key) />
					
					<!--- Remove the key from the URL --->
					<cfset arguments.theURL.removeFilterActive(key) />
					
					<!--- If not blank add the item to the filter --->
					<cfif value NEQ ''>
						<li>
							<cfoutput>#filterItem(key, value, arguments.theURL.getFilterActive())#</cfoutput>
						</li>
					</cfif>
					
					<!--- Replace the key in the URL --->
					<cfset arguments.theURL.setFilterActive(key, currVal) />
				</cfloop>
			</ul>
		</cfsavecontent>
		
		<cfreturn html />
	</cffunction>
</cfcomponent>