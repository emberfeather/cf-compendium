<cfcomponent output="false">
	<cffunction name="init" access="public" returntype="component" output="false">
		<cfreturn this />
	</cffunction>
	
	<cffunction name="attributes" access="public" returntype="string" output="false">
		<cfargument name="element" type="struct" required="true" />
		<cfargument name="valueAttributes" type="array" default="#[]#" />
		<cfargument name="booleanAttributes" type="array" default="#[]#" />
		<cfargument name="requiredValueAttributes" type="array" default="#[]#" />
		
		<cfset var formatted = '' />
		<cfset var keys = '' />
		<cfset var i = '' />
		
		<cfloop from="1" to="#arrayLen(arguments.valueAttributes)#" index="i">
			<cfif structKeyExists(arguments.element, arguments.valueAttributes[i]) and arguments.element[arguments.valueAttributes[i]] neq ''>
				<cfset formatted &= arguments.valueAttributes[i] & '="' & arguments.element[arguments.valueAttributes[i]] & '" ' />
			</cfif>
		</cfloop>
		
		<cfloop from="1" to="#arrayLen(arguments.booleanAttributes)#" index="i">
			<cfif structKeyExists(arguments.element, arguments.booleanAttributes[i]) and arguments.element[arguments.booleanAttributes[i]] eq true>
				<cfset formatted &= arguments.booleanAttributes[i] & ' ' />
			</cfif>
		</cfloop>
		
		<cfloop from="1" to="#arrayLen(arguments.requiredValueAttributes)#" index="i">
			<cfif structKeyExists(arguments.element, arguments.requiredValueAttributes[i])>
				<cfset formatted &= arguments.requiredValueAttributes[i] & '="' & arguments.element[arguments.requiredValueAttributes[i]] & '" ' />
			</cfif>
		</cfloop>
		
		<!--- data-* attributes --->
		<cfif structKeyExists(arguments.element, 'data') and isStruct(arguments.element.data)>
			<cfloop collection="#arguments.element.data#" item="i">
				<cfset formatted &= 'data-' & i & '="' & arguments.element.data[i] & '" ' />
			</cfloop>
		</cfif>
		
		<cfreturn formatted />
	</cffunction>
	
	<!---
		Common Attributes in HTML
		
		@see http://www.w3.org/TR/html5/elements.html#global-attributes
	--->
	<cffunction name="attributesHtml" access="public" returntype="string" output="false">
		<cfargument name="element" type="struct" required="true" />
		
		<cfreturn attributes(arguments.element, [
			'accesskey',
			'class',
			'contenteditable',
			'contextmenu',
			'dir',
			'draggable',
			'id',
			'lang',
			'spellcheck',
			'style',
			'tabindex',
			'title'
		], [
			'hidden'
		]) />
	</cffunction>
</cfcomponent>
