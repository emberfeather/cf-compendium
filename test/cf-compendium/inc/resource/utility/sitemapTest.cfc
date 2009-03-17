<cfcomponent extends="mxunit.framework.TestCase" output="false">
	<!---
		Test the init function without a time offset given.
	--->
	<cffunction name="testInitSansTimeOffset" access="public" returntype="void" output="false">
		<cfset var theSitemap = '' />
		
		<cftry>
			<cfset theSitemap = createObject('component', 'cf-compendium.inc.resource.utility.sitemap').init() />
			
			<cfcatch type="any">
				<cfset fail('Creating a sitemap object without a time zone designator should work.') />
			</cfcatch>
		</cftry>
	</cffunction>
	
	<!---
		Test the init function with a valid time offset given using UTC.
	--->
	<cffunction name="testInitWithValidTimeOffsetUTC" access="public" returntype="void" output="false">
		<cfset var theSitemap = '' />
		
		<cftry>
			<cfset theSitemap = createObject('component', 'cf-compendium.inc.resource.utility.sitemap').init('Z') />
			
			<cfcatch type="any">
				<cfset fail('Creating a sitemap object without a time zone designator should work.') />
			</cfcatch>
		</cftry>
	</cffunction>
	
	<!---
		Test the init function with a valid time offset given using UTC.
	--->
	<cffunction name="testInitWithValidTimeOffsetNegative" access="public" returntype="void" output="false">
		<cfset var theSitemap = '' />
		
		<cftry>
			<cfset theSitemap = createObject('component', 'cf-compendium.inc.resource.utility.sitemap').init('-02:00') />
			
			<cfcatch type="any">
				<cfset fail('Creating a sitemap object without a time zone designator should work.') />
			</cfcatch>
		</cftry>
	</cffunction>
	
	<!---
		Test the init function with a valid positive time offset.
	--->
	<cffunction name="testInitWithValidTimeOffsetPositive" access="public" returntype="void" output="false">
		<cfset var theSitemap = '' />
		
		<cftry>
			<cfset theSitemap = createObject('component', 'cf-compendium.inc.resource.utility.sitemap').init('+10:00') />
			
			<cfcatch type="any">
				<cfset fail('Creating a sitemap object without a time zone designator should work.') />
			</cfcatch>
		</cftry>
	</cffunction>
	
	<!---
		Test the init function with an invalid time offset given.
	--->
	<cffunction name="testInitWithInvalidTimeOffset1" access="public" returntype="void" output="false">
		<cfset var theSitemap = '' />
		
		<cftry>
			<cfset theSitemap = createObject('component', 'cf-compendium.inc.resource.utility.sitemap').init('+1:00') />
			<cfset fail('Should not be a valid time offset') />
			
			<cfcatch type="mxunit.exception.AssertionFailedError"><cfrethrow /></cfcatch>
			<cfcatch type="any"><!--- Expect to get here ---></cfcatch>
		</cftry>
	</cffunction>
	
	<!---
		Test the init function with an invalid time offset given.
	--->
	<cffunction name="testInitWithInvalidTimeOffset2" access="public" returntype="void" output="false">
		<cfset var theSitemap = '' />
		
		<cftry>
			<cfset theSitemap = createObject('component', 'cf-compendium.inc.resource.utility.sitemap').init('-21:00') />
			<cfset fail('Should not be a valid time offset') />
			
			<cfcatch type="mxunit.exception.AssertionFailedError"><cfrethrow /></cfcatch>
			<cfcatch type="any"><!--- Expect to get here ---></cfcatch>
		</cftry>
	</cffunction>
	
	<!---
		Test the addUrl function with an invalid last modification date.
	--->
	<cffunction name="testAddUrlWithInvalidLastModification" access="public" returntype="void" output="false">
		<cfset var theSitemap = createObject('component', 'cf-compendium.inc.resource.utility.sitemap').init() />
		<cfset var options = {} />
		
		<cftry>
			<cfset options.lastMod = 'Yo' />
			
			<cfset theSitemap.addUrl('http://google.com', options) />
			
			<cfset fail('Should not be a valid last modification date') />
			
			<cfcatch type="mxunit.exception.AssertionFailedError"><cfrethrow /></cfcatch>
			<cfcatch type="any"><!--- Expect to get here ---></cfcatch>
		</cftry>
	</cffunction>
	
	<!---
		Test the addUrl function with an invalid change frequency.
	--->
	<cffunction name="testAddUrlWithInvalidChangeFrequency" access="public" returntype="void" output="false">
		<cfset var theSitemap = createObject('component', 'cf-compendium.inc.resource.utility.sitemap').init() />
		<cfset var options = {} />
		
		<cftry>
			<cfset options.changeFreq = 'whenever' />
			
			<cfset theSitemap.addUrl('http://google.com', options) />
			
			<cfset fail('Should not be a valid change frequency') />
			
			<cfcatch type="mxunit.exception.AssertionFailedError"><cfrethrow /></cfcatch>
			<cfcatch type="any"><!--- Expect to get here ---></cfcatch>
		</cftry>
	</cffunction>
	
	<!---
		Test the addUrl function with an invalid priority.
	--->
	<cffunction name="testAddUrlWithInvalidPriority1" access="public" returntype="void" output="false">
		<cfset var theSitemap = createObject('component', 'cf-compendium.inc.resource.utility.sitemap').init() />
		<cfset var options = {} />
		
		<cftry>
			<cfset options.priority = -1 />
			
			<cfset theSitemap.addUrl('http://google.com', options) />
			
			<cfset fail('Should not be a valid priority') />
			
			<cfcatch type="mxunit.exception.AssertionFailedError"><cfrethrow /></cfcatch>
			<cfcatch type="any"><!--- Expect to get here ---></cfcatch>
		</cftry>
	</cffunction>
	
	<!---
		Test the addUrl function with an invalid priority.
	--->
	<cffunction name="testAddUrlWithInvalidPriority2" access="public" returntype="void" output="false">
		<cfset var theSitemap = createObject('component', 'cf-compendium.inc.resource.utility.sitemap').init() />
		<cfset var options = {} />
		
		<cftry>
			<cfset options.priority = 2 />
			
			<cfset theSitemap.addUrl('http://google.com', options) />
			
			<cfset fail('Should not be a valid priority') />
			
			<cfcatch type="mxunit.exception.AssertionFailedError"><cfrethrow /></cfcatch>
			<cfcatch type="any"><!--- Expect to get here ---></cfcatch>
		</cftry>
	</cffunction>
</cfcomponent>