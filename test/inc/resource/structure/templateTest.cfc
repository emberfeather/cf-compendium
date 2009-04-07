<cfcomponent extends="mxunit.framework.TestCase" output="false">
	<!---
		Test that the getAttribute function works.
	--->
	<cffunction name="testGetAttribute" access="public" returntype="void" output="false">
		<cfset var i18n = createObject('component', 'cf-compendium.inc.resource.i18n.i18n').init(expandPath('/')) />
		<cfset var template = createObject('component', 'cf-compendium.inc.resource.structure.template').init(i18n) />
		
		<cfset template.setAttribute('testing', 'yippee') />
		
		<cfset assertEquals('yippee', template.getAttribute('testing')) />
	</cffunction>
	
	<!---
		Test that the getAttribute function works without the attribute being set.
	--->
	<cffunction name="testGetAttributeSansAttribute" access="public" returntype="void" output="false">
		<cfset var i18n = createObject('component', 'cf-compendium.inc.resource.i18n.i18n').init(expandPath('/')) />
		<cfset var template = createObject('component', 'cf-compendium.inc.resource.structure.template').init(i18n) />
		
		<cfset assertEquals('', template.getAttribute('testing')) />
	</cffunction>
	
	<!---
		Test that the getBreadcrumb function works.
	--->
	<cffunction name="testGetBreadcrumb" access="public" returntype="void" output="false">
		<cfset var i18n = createObject('component', 'cf-compendium.inc.resource.i18n.i18n').init(expandPath('/')) />
		<cfset var template = createObject('component', 'cf-compendium.inc.resource.structure.template').init(i18n) />
		
		<cfset template.addLevel('Testing', '/') />
		
		<cfset assertEquals('<a href="/" title=""></a> : <a href="/" title="Testing">Testing</a>', template.getBreadcrumb()) />
	</cffunction>
	
	<!---
		Test that the getBreadcrumb function works with multiple levels.
	--->
	<cffunction name="testGetBreadcrumbMulti" access="public" returntype="void" output="false">
		<cfset var i18n = createObject('component', 'cf-compendium.inc.resource.i18n.i18n').init(expandPath('/')) />
		<cfset var template = createObject('component', 'cf-compendium.inc.resource.structure.template').init(i18n) />
		
		<cfset template.addLevel('Testing', '/') />
		<cfset template.addLevel('More', '/') />
		
		<cfset assertEquals('<a href="/" title=""></a> : <a href="/" title="Testing">Testing</a> : <a href="/" title="More">More</a>', template.getBreadcrumb()) />
	</cffunction>
	
	<!---
		Test that the getBreadcrumb function works.
	--->
	<cffunction name="testGetBreadcrumbMultiSeparator" access="public" returntype="void" output="false">
		<cfset var options = { separator = ' | ' } />
		<cfset var i18n = createObject('component', 'cf-compendium.inc.resource.i18n.i18n').init(expandPath('/')) />
		<cfset var template = createObject('component', 'cf-compendium.inc.resource.structure.template').init(i18n) />
		
		<cfset template.addLevel('Testing', '/') />
		<cfset template.addLevel('More', '/') />
		
		<cfset assertEquals('<a href="/" title=""></a> | <a href="/" title="Testing">Testing</a> | <a href="/" title="More">More</a>', template.getBreadcrumb(options)) />
	</cffunction>
	
	<!---
		Test that the getBreadcrumb function works.
	--->
	<cffunction name="testGetBreadcrumbSansLink" access="public" returntype="void" output="false">
		<cfset var i18n = createObject('component', 'cf-compendium.inc.resource.i18n.i18n').init(expandPath('/')) />
		<cfset var template = createObject('component', 'cf-compendium.inc.resource.structure.template').init(i18n) />
		
		<cfset template.addLevel('Testing') />
		
		<cfset assertEquals('<a href="/" title=""></a> : <a href="##" title="Testing">Testing</a>', template.getBreadcrumb()) />
	</cffunction>
	
	<!---
		Test that the getBreadcrumb function works.
	--->
	<cffunction name="testGetBreadcrumbSeparator" access="public" returntype="void" output="false">
		<cfset var options = { separator = ' | ' } />
		<cfset var i18n = createObject('component', 'cf-compendium.inc.resource.i18n.i18n').init(expandPath('/')) />
		<cfset var template = createObject('component', 'cf-compendium.inc.resource.structure.template').init(i18n) />
		
		<cfset template.addLevel('Testing', '/') />
		
		<cfset assertEquals('<a href="/" title=""></a> | <a href="/" title="Testing">Testing</a>', template.getBreadcrumb(options)) />
	</cffunction>
	
	<!---
		Test that the getBreadcrumb function works.
	--->
	<cffunction name="testGetBreadcrumbSingle" access="public" returntype="void" output="false">
		<cfset var options = { showMultiple = false } />
		<cfset var i18n = createObject('component', 'cf-compendium.inc.resource.i18n.i18n').init(expandPath('/')) />
		<cfset var template = createObject('component', 'cf-compendium.inc.resource.structure.template').init(i18n) />
		
		<cfset template.addLevel('Testing', '/') />
		<cfset template.addLevel('More', '/') />
		
		<cfset assertEquals('<a href="/" title=""></a> : <a href="/" title="More">More</a>', template.getBreadcrumb(options)) />
	</cffunction>
	
	<!---
		Test that the getHTMLTitle function works.
	--->
	<cffunction name="testGetHTMLTitle" access="public" returntype="void" output="false">
		<cfset var i18n = createObject('component', 'cf-compendium.inc.resource.i18n.i18n').init(expandPath('/')) />
		<cfset var template = createObject('component', 'cf-compendium.inc.resource.structure.template').init(i18n) />
		
		<cfset template.addLevel('Testing') />
		
		<cfset assertEquals('Testing : ', template.getHtmlTitle()) />
	</cffunction>
	
	<!---
		Test that the getHtmlTitle function works with multiple titles.
	--->
	<cffunction name="testGetHTMLTitleMulti" access="public" returntype="void" output="false">
		<cfset var i18n = createObject('component', 'cf-compendium.inc.resource.i18n.i18n').init(expandPath('/')) />
		<cfset var template = createObject('component', 'cf-compendium.inc.resource.structure.template').init(i18n) />
		
		<cfset template.addLevel('Testing') />
		<cfset template.addLevel('Again') />
		
		<cfset assertEquals('Again : Testing : ', template.getHtmlTitle()) />
	</cffunction>
	
	<!---
		Test that the getHtmlTitle function works with multiple titles and custom separator.
	--->
	<cffunction name="testGetHTMLTitleMultiSeparator" access="public" returntype="void" output="false">
		<cfset var options = { separator = ' | ' } />
		<cfset var i18n = createObject('component', 'cf-compendium.inc.resource.i18n.i18n').init(expandPath('/')) />
		<cfset var template = createObject('component', 'cf-compendium.inc.resource.structure.template').init(i18n) />
		
		<cfset template.addLevel('Testing') />
		<cfset template.addLevel('Again') />
		
		<cfset assertEquals('Again | Testing | ', template.getHtmlTitle(options)) />
	</cffunction>
	
	<!---
		Test that the getHtmlTitle function works with multiple titles but returning the last title.
	--->
	<cffunction name="testGetHTMLTitleSingle" access="public" returntype="void" output="false">
		<cfset var options = { showMultiple = false } />
		<cfset var i18n = createObject('component', 'cf-compendium.inc.resource.i18n.i18n').init(expandPath('/')) />
		<cfset var template = createObject('component', 'cf-compendium.inc.resource.structure.template').init(i18n) />
		
		<cfset template.addLevel('Testing') />
		<cfset template.addLevel('Again') />
		
		<cfset assertEquals('Again : ', template.getHtmlTitle(options)) />
	</cffunction>
	
	<!---
		Test that the getHtmlTitle function works with multiple titles but returning the last title and custom separator.
	--->
	<cffunction name="testGetHTMLTitleSingleSeparator" access="public" returntype="void" output="false">
		<cfset var options = { separator = ' | ', showMultiple = false } />
		<cfset var i18n = createObject('component', 'cf-compendium.inc.resource.i18n.i18n').init(expandPath('/')) />
		<cfset var template = createObject('component', 'cf-compendium.inc.resource.structure.template').init(i18n) />
		
		<cfset template.addLevel('Testing') />
		<cfset template.addLevel('Again') />
		
		<cfset assertEquals('Again | ', template.getHtmlTitle(options)) />
	</cffunction>
	
	<!---
		Test that the getLevel function works.
	--->
	<cffunction name="testGetLevel" access="public" returntype="void" output="false">
		<cfset var i18n = createObject('component', 'cf-compendium.inc.resource.i18n.i18n').init(expandPath('/')) />
		<cfset var template = createObject('component', 'cf-compendium.inc.resource.structure.template').init(i18n) />
		
		<cfset template.addLevel('Testing') />
		
		<cfset assertEquals(1, template.getLevel()) />
	</cffunction>
	
	<!---
		Test that the getLevel function works on the main level.
	--->
	<cffunction name="testGetLevelSansLevel" access="public" returntype="void" output="false">
		<cfset var i18n = createObject('component', 'cf-compendium.inc.resource.i18n.i18n').init(expandPath('/')) />
		<cfset var template = createObject('component', 'cf-compendium.inc.resource.structure.template').init(i18n) />
		
		<cfset assertEquals(0, template.getLevel()) />
	</cffunction>
	
	<!---
		Test that the getMeta function with a http-equiv.
	--->
	<cffunction name="testGetMetaHttpEquiv" access="public" returntype="void" output="false">
		<cfset var i18n = createObject('component', 'cf-compendium.inc.resource.i18n.i18n').init(expandPath('/')) />
		<cfset var template = createObject('component', 'cf-compendium.inc.resource.structure.template').init(i18n) />
		
		<cfset template.setMeta('refresh', 5) />
		
		<cfset assertEquals('<meta http-equiv="refresh" content="5" />', template.getMeta()) />
	</cffunction>
	
	<!---
		Test that the getMeta function with a name.
	--->
	<cffunction name="testGetMetaName" access="public" returntype="void" output="false">
		<cfset var i18n = createObject('component', 'cf-compendium.inc.resource.i18n.i18n').init(expandPath('/')) />
		<cfset var template = createObject('component', 'cf-compendium.inc.resource.structure.template').init(i18n) />
		
		<cfset template.setMeta('description', 'Awesome') />
		
		<cfset assertEquals('<meta name="description" content="Awesome" />', template.getMeta()) />
	</cffunction>
	
	<!---
		Test that the getPageTitle function works.
	--->
	<cffunction name="testGetPageTitle" access="public" returntype="void" output="false">
		<cfset var i18n = createObject('component', 'cf-compendium.inc.resource.i18n.i18n').init(expandPath('/')) />
		<cfset var template = createObject('component', 'cf-compendium.inc.resource.structure.template').init(i18n) />
		
		<cfset template.addLevel('Testing') />
		
		<cfset assertEquals('Testing', template.getPageTitle()) />
	</cffunction>
	
	<!---
		Test that the getPageTitle function doesn't work without a title.
	--->
	<cffunction name="testGetPageTitleFailSansTitle" access="public" returntype="void" output="false">
		<cfset var i18n = createObject('component', 'cf-compendium.inc.resource.i18n.i18n').init(expandPath('/')) />
		<cfset var template = createObject('component', 'cf-compendium.inc.resource.structure.template').init(i18n) />
		
		<cftry>
			<cfset template.getPageTitle() />
			<cfset fail('Should not be able to getPageTitle without any titles') />
			
			<cfcatch type="mxunit.exception.AssertionFailedError"><cfrethrow /></cfcatch>
			<cfcatch type="any"><!--- Expect to get here ---></cfcatch>
		</cftry>
	</cffunction>
	
	<!---
		Test that the getPageTitle function fails when requesting an invalid level.
	--->
	<cffunction name="testGetPageTitleFailWithInvalidLevel" access="public" returntype="void" output="false">
		<cfset var i18n = createObject('component', 'cf-compendium.inc.resource.i18n.i18n').init(expandPath('/')) />
		<cfset var template = createObject('component', 'cf-compendium.inc.resource.structure.template').init(i18n) />
		
		<cftry>
			<cfset template.addLevel('Testing') />
			<cfset template.addLevel('Multiple') />
			<cfset template.getPageTitle(3) />
			
			<cfset fail('Should not be able to getPageTitle with an invalid level') />
			
			<cfcatch type="mxunit.exception.AssertionFailedError"><cfrethrow /></cfcatch>
			<cfcatch type="any"><!--- Expect to get here ---></cfcatch>
		</cftry>
	</cffunction>
	
	<!---
		Test that the getPageTitle function works when requesting a different level.
	--->
	<cffunction name="testGetPageTitleWithLevel" access="public" returntype="void" output="false">
		<cfset var i18n = createObject('component', 'cf-compendium.inc.resource.i18n.i18n').init(expandPath('/')) />
		<cfset var template = createObject('component', 'cf-compendium.inc.resource.structure.template').init(i18n) />
		
		<cfset template.addLevel('Testing') />
		<cfset template.addLevel('Multiple') />
		
		<cfset assertEquals('Testing', template.getPageTitle(1)) />
	</cffunction>
	
	<!---
		Test that the getStyles function works when you have added a stylesheet.
	--->
	<cffunction name="testGetStyles" access="public" returntype="void" output="false">
		<cfset var style = 'testing.css' />
		<cfset var i18n = createObject('component', 'cf-compendium.inc.resource.i18n.i18n').init(expandPath('/')) />
		<cfset var template = createObject('component', 'cf-compendium.inc.resource.structure.template').init(i18n) />
		
		<cfset template.addUniqueStyles(style) />
		
		<cfset assertEquals('<link rel="stylesheet" type="text/css" href="' & style & '" />' & chr(10), template.getStyles()) />
	</cffunction>
	
	<!---
		Test that the getStyles function works when you have not added a stylesheet.
	--->
	<cffunction name="testGetStylesSanScript" access="public" returntype="void" output="false">
		<cfset var i18n = createObject('component', 'cf-compendium.inc.resource.i18n.i18n').init(expandPath('/')) />
		<cfset var template = createObject('component', 'cf-compendium.inc.resource.structure.template').init(i18n) />
		
		<cfset assertEquals('', template.getStyles()) />
	</cffunction>
	
	<!---
		Test that the hasAttribute function works.
	--->
	<cffunction name="testHasAttributeFalse" access="public" returntype="void" output="false">
		<cfset var i18n = createObject('component', 'cf-compendium.inc.resource.i18n.i18n').init(expandPath('/')) />
		<cfset var template = createObject('component', 'cf-compendium.inc.resource.structure.template').init(i18n) />
		
		<cfset assertFalse(template.hasAttribute('testing')) />
	</cffunction>
	
	<!---
		Test that the hasAttribute function works.
	--->
	<cffunction name="testHasAttributeTrue" access="public" returntype="void" output="false">
		<cfset var i18n = createObject('component', 'cf-compendium.inc.resource.i18n.i18n').init(expandPath('/')) />
		<cfset var template = createObject('component', 'cf-compendium.inc.resource.structure.template').init(i18n) />
		
		<cfset template.setAttribute('testing', 'yippee') />
		
		<cfset assertTrue(template.hasAttribute('testing')) />
	</cffunction>
</cfcomponent>