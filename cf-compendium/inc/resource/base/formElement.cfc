<cfcomponent output="false">
	<cffunction name="init" access="public" returntype="component" output="false">
		<cfset variables.attributes = createObject('component', 'cf-compendium.inc.resource.structure.form.attributes').init() />
		<cfset variables.extender = createObject('component', 'cf-compendium.inc.resource.utility.extend').init() />
		
		<cfreturn this />
	</cffunction>
	
	<cffunction name="extendElement" access="public" returntype="struct" output="false">
		<cfargument name="elementType" type="string" required="true" />
		<cfargument name="options" type="struct" default="#{}#" />
		
		<cfset local.element = variables.extender.extend({
			accessKey = '',
			class = '',
			contentEditable = '',
			contextMenu = '',
			desc = '',
			dir = '',
			disabled = false,
			draggable = '',
			elementClass = '',
			hidden = '',
			label = '',
			lang = '',
			link = '',
			postElement = '',
			preElement = '',
			required = false,
			size = '',
			spellcheck = '',
			tabIndex = '',
			tip = '',
			title = ''
		}, arguments.options) />
		
		<!--- Set the element type --->
		<cfset local.element.elementType = arguments.elementType />
		
		<cfreturn local.element />
	</cffunction>
	
	<cffunction name="set__label" access="public" returntype="void" output="false">
		<cfargument name="label" type="component" required="true" />
		
		<cfset variables.label = arguments.label />
	</cffunction>
</cfcomponent>
