<cfcomponent extends="mxunit.framework.TestCase" output="false">
	<!---
		Test that the getAttribute function works.
	--->
	<cffunction name="testGetAttribute" access="public" returntype="void" output="false">
		<cfset var theTemplate = createObject('component', 'cf-compendium.inc.resource.structure.template').init() />
		
		<cfset theTemplate.setAttribute('testing', 'yippee') />
		
		<cfset assertEquals('yippee', theTemplate.getAttribute('testing')) />
	</cffunction>
	
	<!---
		Test that the getAttribute function works without the attribute being set.
	--->
	<cffunction name="testGetAttributeSansAttribute" access="public" returntype="void" output="false">
		<cfset var theTemplate = createObject('component', 'cf-compendium.inc.resource.structure.template').init() />
		
		<cfset assertEquals('', theTemplate.getAttribute('testing')) />
	</cffunction>
	
	<!---
		Test that the getBreadcrumb function works.
	--->
	<cffunction name="testGetBreadcrumb" access="public" returntype="void" output="false">
		<cfset var theTemplate = createObject('component', 'cf-compendium.inc.resource.structure.template').init() />
		
		<cfset theTemplate.addLevel('Testing', '/') />
		
		<cfset assertEquals('<a href="/" title=""></a> : <a href="/" title="Testing">Testing</a>', theTemplate.getBreadcrumb()) />
	</cffunction>
	
	<!---
		Test that the getBreadcrumb function works with multiple levels.
	--->
	<cffunction name="testGetBreadcrumbMulti" access="public" returntype="void" output="false">
		<cfset var theTemplate = createObject('component', 'cf-compendium.inc.resource.structure.template').init() />
		
		<cfset theTemplate.addLevel('Testing', '/') />
		<cfset theTemplate.addLevel('More', '/') />
		
		<cfset assertEquals('<a href="/" title=""></a> : <a href="/" title="Testing">Testing</a> : <a href="/" title="More">More</a>', theTemplate.getBreadcrumb()) />
	</cffunction>
	
	<!---
		Test that the getBreadcrumb function works.
	--->
	<cffunction name="testGetBreadcrumbMultiSeparator" access="public" returntype="void" output="false">
		<cfset var options = { separator = ' | ' } />
		<cfset var theTemplate = createObject('component', 'cf-compendium.inc.resource.structure.template').init() />
		
		<cfset theTemplate.addLevel('Testing', '/') />
		<cfset theTemplate.addLevel('More', '/') />
		
		<cfset assertEquals('<a href="/" title=""></a> | <a href="/" title="Testing">Testing</a> | <a href="/" title="More">More</a>', theTemplate.getBreadcrumb(options)) />
	</cffunction>
	
	<!---
		Test that the getBreadcrumb function works.
	--->
	<cffunction name="testGetBreadcrumbSansLink" access="public" returntype="void" output="false">
		<cfset var theTemplate = createObject('component', 'cf-compendium.inc.resource.structure.template').init() />
		
		<cfset theTemplate.addLevel('Testing') />
		
		<cfset assertEquals('<a href="/" title=""></a> : <a href="##" title="Testing">Testing</a>', theTemplate.getBreadcrumb()) />
	</cffunction>
	
	<!---
		Test that the getBreadcrumb function works.
	--->
	<cffunction name="testGetBreadcrumbSeparator" access="public" returntype="void" output="false">
		<cfset var options = { separator = ' | ' } />
		<cfset var theTemplate = createObject('component', 'cf-compendium.inc.resource.structure.template').init() />
		
		<cfset theTemplate.addLevel('Testing', '/') />
		
		<cfset assertEquals('<a href="/" title=""></a> | <a href="/" title="Testing">Testing</a>', theTemplate.getBreadcrumb(options)) />
	</cffunction>
	
	<!---
		Test that the getBreadcrumb function works.
	--->
	<cffunction name="testGetBreadcrumbSingle" access="public" returntype="void" output="false">
		<cfset var options = { showMultiple = false } />
		<cfset var theTemplate = createObject('component', 'cf-compendium.inc.resource.structure.template').init() />
		
		<cfset theTemplate.addLevel('Testing', '/') />
		<cfset theTemplate.addLevel('More', '/') />
		
		<cfset assertEquals('<a href="/" title=""></a> : <a href="/" title="More">More</a>', theTemplate.getBreadcrumb(options)) />
	</cffunction>
	
	<!---
		Test that the getHTMLTitle function works.
	--->
	<cffunction name="testGetHTMLTitle" access="public" returntype="void" output="false">
		<cfset var theTemplate = createObject('component', 'cf-compendium.inc.resource.structure.template').init() />
		
		<cfset theTemplate.addLevel('Testing') />
		
		<cfset assertEquals('Testing : ', theTemplate.getHtmlTitle()) />
	</cffunction>
	
	<!---
		Test that the getHtmlTitle function works with multiple titles.
	--->
	<cffunction name="testGetHTMLTitleMulti" access="public" returntype="void" output="false">
		<cfset var theTemplate = createObject('component', 'cf-compendium.inc.resource.structure.template').init() />
		
		<cfset theTemplate.addLevel('Testing') />
		<cfset theTemplate.addLevel('Again') />
		
		<cfset assertEquals('Again : Testing : ', theTemplate.getHtmlTitle()) />
	</cffunction>
	
	<!---
		Test that the getHtmlTitle function works with multiple titles and custom separator.
	--->
	<cffunction name="testGetHTMLTitleMultiSeparator" access="public" returntype="void" output="false">
		<cfset var options = { separator = ' | ' } />
		<cfset var theTemplate = createObject('component', 'cf-compendium.inc.resource.structure.template').init() />
		
		<cfset theTemplate.addLevel('Testing') />
		<cfset theTemplate.addLevel('Again') />
		
		<cfset assertEquals('Again | Testing | ', theTemplate.getHtmlTitle(options)) />
	</cffunction>
	
	<!---
		Test that the getHtmlTitle function works with multiple titles but returning the last title.
	--->
	<cffunction name="testGetHTMLTitleSingle" access="public" returntype="void" output="false">
		<cfset var options = { showMultiple = false } />
		<cfset var theTemplate = createObject('component', 'cf-compendium.inc.resource.structure.template').init() />
		
		<cfset theTemplate.addLevel('Testing') />
		<cfset theTemplate.addLevel('Again') />
		
		<cfset assertEquals('Again : ', theTemplate.getHtmlTitle(options)) />
	</cffunction>
	
	<!---
		Test that the getHtmlTitle function works with multiple titles but returning the last title and custom separator.
	--->
	<cffunction name="testGetHTMLTitleSingleSeparator" access="public" returntype="void" output="false">
		<cfset var options = { separator = ' | ', showMultiple = false } />
		<cfset var theTemplate = createObject('component', 'cf-compendium.inc.resource.structure.template').init() />
		
		<cfset theTemplate.addLevel('Testing') />
		<cfset theTemplate.addLevel('Again') />
		
		<cfset assertEquals('Again | ', theTemplate.getHtmlTitle(options)) />
	</cffunction>
	
	<!---
		Test that the getLevel function works.
	--->
	<cffunction name="testGetLevel" access="public" returntype="void" output="false">
		<cfset var theTemplate = createObject('component', 'cf-compendium.inc.resource.structure.template').init() />
		
		<cfset theTemplate.addLevel('Testing') />
		
		<cfset assertEquals(1, theTemplate.getLevel()) />
	</cffunction>
	
	<!---
		Test that the getLevel function works on the main level.
	--->
	<cffunction name="testGetLevelSansLevel" access="public" returntype="void" output="false">
		<cfset var theTemplate = createObject('component', 'cf-compendium.inc.resource.structure.template').init() />
		
		<cfset assertEquals(0, theTemplate.getLevel()) />
	</cffunction>
	
	<!---
		Test that the getMeta function with a http-equiv.
	--->
	<cffunction name="testGetMetaHttpEquiv" access="public" returntype="void" output="false">
		<cfset var theTemplate = createObject('component', 'cf-compendium.inc.resource.structure.template').init() />
		
		<cfset theTemplate.setMeta('refresh', 5) />
		
		<cfset assertEquals('<meta http-equiv="refresh" content="5" />', theTemplate.getMeta()) />
	</cffunction>
	
	<!---
		Test that the getMeta function with a name.
	--->
	<cffunction name="testGetMetaName" access="public" returntype="void" output="false">
		<cfset var theTemplate = createObject('component', 'cf-compendium.inc.resource.structure.template').init() />
		
		<cfset theTemplate.setMeta('description', 'Awesome') />
		
		<cfset assertEquals('<meta name="description" content="Awesome" />', theTemplate.getMeta()) />
	</cffunction>
	
	<!---
		Test that the getPageTitle function works.
	--->
	<cffunction name="testGetPageTitle" access="public" returntype="void" output="false">
		<cfset var theTemplate = createObject('component', 'cf-compendium.inc.resource.structure.template').init() />
		
		<cfset theTemplate.addLevel('Testing') />
		
		<cfset assertEquals('Testing', theTemplate.getPageTitle()) />
	</cffunction>
	
	<!---
		Test that the getPageTitle function doesn't work without a title.
	--->
	<cffunction name="testGetPageTitleFailSansTitle" access="public" returntype="void" output="false">
		<cfset var theTemplate = createObject('component', 'cf-compendium.inc.resource.structure.template').init() />
		
		<cftry>
			<cfset theTemplate.getPageTitle() />
			<cfset fail('Should not be able to getPageTitle without any titles') />
			
			<cfcatch type="mxunit.exception.AssertionFailedError"><cfrethrow /></cfcatch>
			<cfcatch type="any"><!--- Expect to get here ---></cfcatch>
		</cftry>
	</cffunction>
	
	<!---
		Test that the getPageTitle function fails when requesting an invalid level.
	--->
	<cffunction name="testGetPageTitleFailWithInvalidLevel" access="public" returntype="void" output="false">
		<cfset var theTemplate = createObject('component', 'cf-compendium.inc.resource.structure.template').init() />
		
		<cftry>
			<cfset theTemplate.addLevel('Testing') />
			<cfset theTemplate.addLevel('Multiple') />
			<cfset theTemplate.getPageTitle(3) />
			
			<cfset fail('Should not be able to getPageTitle with an invalid level') />
			
			<cfcatch type="mxunit.exception.AssertionFailedError"><cfrethrow /></cfcatch>
			<cfcatch type="any"><!--- Expect to get here ---></cfcatch>
		</cftry>
	</cffunction>
	
	<!---
		Test that the getPageTitle function works when requesting a different level.
	--->
	<cffunction name="testGetPageTitleWithLevel" access="public" returntype="void" output="false">
		<cfset var theTemplate = createObject('component', 'cf-compendium.inc.resource.structure.template').init() />
		
		<cfset theTemplate.addLevel('Testing') />
		<cfset theTemplate.addLevel('Multiple') />
		
		<cfset assertEquals('Testing', theTemplate.getPageTitle(1)) />
	</cffunction>
	
	<!---
		Test that the getStyles function works when you have added a stylesheet.
	--->
	<cffunction name="testGetStyles" access="public" returntype="void" output="false">
		<cfset var style = 'testing.css' />
		<cfset var theTemplate = createObject('component', 'cf-compendium.inc.resource.structure.template').init() />
		
		<cfset theTemplate.addUniqueStyles(style) />
		
		<cfset assertEquals('<link rel="stylesheet" type="text/css" href="' & style & '" />' & chr(10), theTemplate.getStyles()) />
	</cffunction>
	
	<!---
		Test that the getStyles function works when you have not added a stylesheet.
	--->
	<cffunction name="testGetStylesSanScript" access="public" returntype="void" output="false">
		<cfset var theTemplate = createObject('component', 'cf-compendium.inc.resource.structure.template').init() />
		
		<cfset assertEquals('', theTemplate.getStyles()) />
	</cffunction>
	
	<!---
		Test that the hasAttribute function works.
	--->
	<cffunction name="testHasAttributeFalse" access="public" returntype="void" output="false">
		<cfset var theTemplate = createObject('component', 'cf-compendium.inc.resource.structure.template').init() />
		
		<cfset assertFalse(theTemplate.hasAttribute('testing')) />
	</cffunction>
	
	<!---
		Test that the hasAttribute function works.
	--->
	<cffunction name="testHasAttributeTrue" access="public" returntype="void" output="false">
		<cfset var theTemplate = createObject('component', 'cf-compendium.inc.resource.structure.template').init() />
		
		<cfset theTemplate.setAttribute('testing', 'yippee') />
		
		<cfset assertTrue(theTemplate.hasAttribute('testing')) />
	</cffunction>
</cfcomponent>