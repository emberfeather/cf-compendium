<cfcomponent extends="mxunit.framework.TestCase" output="false">
	<!---
		Test that the getAttribute function works.
	--->
	<cffunction name="testGetAttribute" access="public" returntype="void" output="false">
		<cfset var navigation = createObject('component', 'cf-compendium.inc.resource.structure.navigationJSON').init('/implementation/config/navigation001.json.cfm') />
		<cfset var theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init() />
		<cfset var template = createObject('component', 'cf-compendium.inc.resource.structure.template').init(navigation, theURL) />
		
		<cfset template.setAttribute('testing', 'yippee') />
		
		<cfset assertEquals('yippee', template.getAttribute('testing')) />
	</cffunction>
	
	<!---
		Test that the getAttribute function works without the attribute being set.
	--->
	<cffunction name="testGetAttributeSansAttribute" access="public" returntype="void" output="false">
		<cfset var navigation = createObject('component', 'cf-compendium.inc.resource.structure.navigationJSON').init('/implementation/config/navigation001.json.cfm') />
		<cfset var theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init() />
		<cfset var template = createObject('component', 'cf-compendium.inc.resource.structure.template').init(navigation, theURL) />
		
		<cfset assertEquals('', template.getAttribute('testing')) />
	</cffunction>
	
	<!---
		Test that the getHtmlTitle function works with multiple titles but returning the last title.
	--->
	<cffunction name="testGetHTMLTitleSingle" access="public" returntype="void" output="false">
		<cfset var options = { showMultiple = false } />
		<cfset var navigation = createObject('component', 'cf-compendium.inc.resource.structure.navigationJSON').init('/implementation/config/navigation001.json.cfm') />
		<cfset var theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init() />
		<cfset var template = createObject('component', 'cf-compendium.inc.resource.structure.template').init(navigation, theURL) />
		
		<cfset template.addLevel('Testing') />
		<cfset template.addLevel('Again') />
		
		<cfset assertEquals('Again : ', template.getHtmlTitle(options)) />
	</cffunction>
	
	<!---
		Test that the getHtmlTitle function works with multiple titles but returning the last title and custom separator.
	--->
	<cffunction name="testGetHTMLTitleSingleSeparator" access="public" returntype="void" output="false">
		<cfset var options = { separator = ' | ', showMultiple = false } />
		<cfset var navigation = createObject('component', 'cf-compendium.inc.resource.structure.navigationJSON').init('/implementation/config/navigation001.json.cfm') />
		<cfset var theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init() />
		<cfset var template = createObject('component', 'cf-compendium.inc.resource.structure.template').init(navigation, theURL) />
		
		<cfset template.addLevel('Testing') />
		<cfset template.addLevel('Again') />
		
		<cfset assertEquals('Again | ', template.getHtmlTitle(options)) />
	</cffunction>
	
	<!---
		Test that the getMeta function with a http-equiv.
	--->
	<cffunction name="testGetMetaHttpEquiv" access="public" returntype="void" output="false">
		<cfset var navigation = createObject('component', 'cf-compendium.inc.resource.structure.navigationJSON').init('/implementation/config/navigation001.json.cfm') />
		<cfset var theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init() />
		<cfset var template = createObject('component', 'cf-compendium.inc.resource.structure.template').init(navigation, theURL) />
		
		<cfset template.setMeta('refresh', 5) />
		
		<cfset assertEquals('<meta http-equiv="refresh" content="5" />', template.getMeta()) />
	</cffunction>
	
	<!---
		Test that the getMeta function with a name.
	--->
	<cffunction name="testGetMetaName" access="public" returntype="void" output="false">
		<cfset var navigation = createObject('component', 'cf-compendium.inc.resource.structure.navigationJSON').init('/implementation/config/navigation001.json.cfm') />
		<cfset var theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init() />
		<cfset var template = createObject('component', 'cf-compendium.inc.resource.structure.template').init(navigation, theURL) />
		
		<cfset template.setMeta('description', 'Awesome') />
		
		<cfset assertEquals('<meta name="description" content="Awesome" />', template.getMeta()) />
	</cffunction>
	
	<!---
		Test that the getPageTitle function works.
	--->
	<cffunction name="testGetPageTitle" access="public" returntype="void" output="false">
		<cfset var navigation = createObject('component', 'cf-compendium.inc.resource.structure.navigationJSON').init('/implementation/config/navigation001.json.cfm') />
		<cfset var theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init() />
		<cfset var template = createObject('component', 'cf-compendium.inc.resource.structure.template').init(navigation, theURL) />
		
		<cfset template.addLevel('Testing') />
		
		<cfset assertEquals('Testing', template.getPageTitle()) />
	</cffunction>
	
	<!---
		Test that the getStyles function works when you have added a stylesheet.
	--->
	<cffunction name="testGetStyles" access="public" returntype="void" output="false">
		<cfset var style = 'testing.css' />
		<cfset var navigation = createObject('component', 'cf-compendium.inc.resource.structure.navigationJSON').init('/implementation/config/navigation001.json.cfm') />
		<cfset var theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init() />
		<cfset var template = createObject('component', 'cf-compendium.inc.resource.structure.template').init(navigation, theURL) />
		
		<cfset template.addUniqueStyles(style) />
		
		<cfset assertEquals('<link rel="stylesheet" type="text/css" href="' & style & '" media="all" />' & chr(10), template.getStyles()) />
	</cffunction>
	
	<!---
		Test that the getStyles function works when you have not added a stylesheet.
	--->
	<cffunction name="testGetStylesSanScript" access="public" returntype="void" output="false">
		<cfset var navigation = createObject('component', 'cf-compendium.inc.resource.structure.navigationJSON').init('/implementation/config/navigation001.json.cfm') />
		<cfset var theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init() />
		<cfset var template = createObject('component', 'cf-compendium.inc.resource.structure.template').init(navigation, theURL) />
		
		<cfset assertEquals('', template.getStyles()) />
	</cffunction>
	
	<!---
		Test that the hasAttribute function works.
	--->
	<cffunction name="testHasAttributeFalse" access="public" returntype="void" output="false">
		<cfset var navigation = createObject('component', 'cf-compendium.inc.resource.structure.navigationJSON').init('/implementation/config/navigation001.json.cfm') />
		<cfset var theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init() />
		<cfset var template = createObject('component', 'cf-compendium.inc.resource.structure.template').init(navigation, theURL) />
		
		<cfset assertFalse(template.hasAttribute('testing')) />
	</cffunction>
	
	<!---
		Test that the hasAttribute function works.
	--->
	<cffunction name="testHasAttributeTrue" access="public" returntype="void" output="false">
		<cfset var navigation = createObject('component', 'cf-compendium.inc.resource.structure.navigationJSON').init('/implementation/config/navigation001.json.cfm') />
		<cfset var theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init() />
		<cfset var template = createObject('component', 'cf-compendium.inc.resource.structure.template').init(navigation, theURL) />
		
		<cfset template.setAttribute('testing', 'yippee') />
		
		<cfset assertTrue(template.hasAttribute('testing')) />
	</cffunction>
</cfcomponent>