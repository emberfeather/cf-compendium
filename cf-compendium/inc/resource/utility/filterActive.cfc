<cfcomponent output="false">
	<cffunction name="init" access="public" returntype="component" output="false">
		<cfargument name="i18n" type="component" required="true" />
		<cfargument name="locale" type="string" default="en_US" />
		
		<cfset variables.i18n = arguments.i18n />
		<cfset variables.locale = arguments.locale />
		<cfset variables.label = createObject('component', 'cf-compendium.inc.resource.i18n.label').init(arguments.i18n, arguments.locale) />
		
		<!--- Set base bundle for translation --->
		<cfset addBundle('/cf-compendium/i18n/inc/resource/utility', 'filter') />
		
		<cfreturn this />
	</cffunction>
	
	<cffunction name="addBundle" access="public" returntype="void" output="false">
		<cfargument name="path" type="string" required="true" />
		<cfargument name="name" type="string" required="true" />
		
		<cfset variables.label.addBundle( argumentCollection = arguments ) />
	</cffunction>
	
	<cffunction name="filterItem" access="private" returntype="string" output="false">
		<cfargument name="key" type="string" required="true" />
		<cfargument name="value" type="string" required="true" />
		<cfargument name="href" type="string" required="true" />
		
		<!--- Check for short UUID display --->
		<cfif right(arguments.key, 2) EQ 'ID' and len(arguments.value) eq 36>
			<cfset arguments.value = left(arguments.value, 8) />
		</cfif>
		
		<cfreturn '<span class="capitalize">' & variables.label.get(arguments.key) & '</span>: <strong>' & arguments.value & '</strong> <small>(<a href="' & arguments.href & '">&##x2717;</a>)</small>' />
	</cffunction>
	
	<cffunction name="toHTML" access="public" returntype="string" output="false">
		<cfargument name="filter" type="any" required="true" />
		<cfargument name="theUrl" type="component" required="true" />
		<cfargument name="keys" type="string" default="" />
		
		<cfset var html = '' />
		<cfset var key = '' />
		<cfset var value = '' />
		<cfset var currVal = '' />
		
		<!--- Check if there are no keys given --->
		<cfif arguments.keys eq '' and isStruct(arguments.filter)>
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
					<cfset currVal = arguments.theUrl.search(key) />
					
					<!--- Remove the key from the URL --->
					<cfset arguments.theUrl.removeFilterActive(key) />
					
					<!--- If not blank add the item to the filter --->
					<cfif value neq ''>
						<li>
							<cfoutput>#filterItem(key, value, arguments.theUrl.getFilterActive())#</cfoutput>
						</li>
					</cfif>
					
					<!--- Replace the key in the URL --->
					<cfset arguments.theUrl.setFilterActive(key, currVal) />
				</cfloop>
			</ul>
		</cfsavecontent>
		
		<cfreturn html />
	</cffunction>
</cfcomponent>
