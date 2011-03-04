<!---
	Used to generate sitemaps for search engines.
	
	@link http://sitemaps.org
	@link http://www.w3.org/TR/notE-datetime
--->
<cfcomponent output="false">
	<!---
		Uses the given time zone designator in the time calculations.
		<p>
		Default time zone designator is UTC 
	--->
	<cffunction name="init" access="public" returntype="any" output="false">
		<cfargument name="timeZoneDesignator" type="string" default="Z" />
		
		<cfset variables.timeZoneDesignator = arguments.timeZoneDesignator />
		
		<cfset variables.urls = [] />
		<cfset variables.sitemaps = [] />
		<cfset variables.sitemapIndexes = [] />
		
		<cfset variables.keys = {} />
		
		<cfset variables.lastUpdate = '' />
		
		<!--- Create an extender --->
		<cfset variables.extender = createObject('component', 'cf-compendium.inc.resource.utility.extend').init() />
		
		<!--- Check that the time offset is in a valid format --->
		<cfif not reFind('^(Z|[-+]{1}[01][0-9]:00)$', variables.timeZoneDesignator)>
			<cfthrow message="Invalid time offset" detail="The W3C Datetime offset must be in the format +hh:mm or -hh:mm." />
		</cfif>
		
		<cfreturn this />
	</cffunction>
	
	<!---
		Certain search engines (such as Yahoo!) require that you provide a 
		developer key to ping their service.
	--->
	<cffunction name="addKey" access="public" returntype="void" output="false">
		<cfargument name="key" type="string" required="true" />
		<cfargument name="value" type="string" required="true" />
		
		<cfset variables.keys[arguments.key] = arguments.value />
	</cffunction>
	
	<!---
		Used to add a url to the sitemap
	--->
	<cffunction name="addUrl" access="public" returntype="void" output="false">
		<cfargument name="loc" type="string" required="true" />
		<cfargument name="options" type="struct" default="#{}#" />
		
		<cfset var defaults = { lastMod = '', changeFreq = '', priority = '' } />
		<cfset var urlElement = '' />
		
		<!--- extend the options --->
		<cfset urlElement = variables.extender.extend(defaults, arguments.options) />
		
		<!--- Set the location --->
		<cfset urlElement.loc = XMLFormat(trim(arguments.loc)) />
		
		<!--- Check for a modified date --->
		<cfif urlElement.lastMod neq ''>
			<!--- Check if it was given an invalid date --->
			<cfif not isDate(urlElement.lastMod)>
				<cfthrow message="Invalid last modification date" detail="The value '#urlElement.lastMod#' is not a valid date." />
			</cfif>
			
			<!--- Check if this is the latest url --->
			<cfif variables.lastUpdate eq '' or urlElement.lastMod gt variables.lastUpdate>
				<cfset variables.lastUpdate = urlElement.lastMod />
			</cfif>
		</cfif>
		
		<!--- Check if the last modified is one of the valid options for the change frequency --->
		<cfif urlElement.changeFreq neq '' and not listFindNoCase('always,hourly,daily,weekly,monthly,yearly,never', urlElement.changeFreq)>
			<cfthrow message="Invalid change frequency" detail="The value '#urlElement.changeFreq#' is not a valid frequency." />
		</cfif>
		
		<!--- Check if the priority is one of the valid options --->
		<cfif urlElement.priority neq '' and ( urlElement.priority gt 1 or urlElement.priority lt 0 )>
			<cfthrow message="Invalid priority" detail="The priority (#urlElement.priority#) is not a valid priority. Priority need to be between 0 and 1." />
		</cfif>
		
		<!--- Add it to the current urls --->
		<cfset arrayAppend(variables.urls, urlElement) />
	</cffunction>
	
	<!---
		Created the xml markup for the sitemap
	--->
	<cffunction name="createSitemap" access="public" returntype="string" output="false">
		<cfset var sitemap = '' />
		<cfset var i = '' />
		
		<cfset sitemap = '<?xml version="1.0" encoding="UTF-8"?>' />
		<cfset sitemap &= chr(10) & '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">' />
		
		<cfloop array="#variables.urls#" index="i">
			<cfset sitemap &= chr(10) & '	<url>' />
			
			<cfset sitemap &= chr(10) & '		<loc>' & i.loc & '</loc>' />
			
			<cfif i.lastMod neq ''>
				<!--- Complete date plus hours, minutes and seconds: --->
				<!--- YYYY-MM-DDThh:mm:ssTZD (eg 1997-07-16T19:20:30+01:00) --->
				<cfset sitemap &= chr(10) & '		<lastmod>' & dateFormat(i.lastMod, 'yyyy-mm-dd') & 'T' & timeFormat(i.lastMod, 'HH:mm:ss') & variables.timeZoneDesignator & '</lastmod>' />
			</cfif>
			
			<cfif i.changeFreq neq ''>
				<!--- always, hourly, daily, weekly, monthly, yearly, never  --->
				<cfset sitemap &= chr(10) & '		<changefreq>' & i.changeFreq & '</changefreq>' />
			</cfif>
			
			<cfif i.priority neq ''>
				<cfset sitemap &= chr(10) & '		<priority>' & i.priority & '</priority>' />
			</cfif>
			
			<cfset sitemap &= chr(10) & '	</url>' />
		</cfloop>
		
		<cfset sitemap &= chr(10) & '</urlset>' />
		
		<cfreturn sitemap />
	</cffunction>
	
	<!--- Creates the xml markup for the sitemap index --->
	<cffunction name="createSitemapIndex" access="private" returntype="string" output="false">
		<cfset var sitemapIndex = '' />
		<cfset var i = '' />
		
		<cfset sitemapIndex = '<?xml version="1.0" encoding="UTF-8"?>' />
		<cfset sitemapIndex &= chr(10) & '<sitemapindex xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">' />
		
		<cfloop array="#variables.sitemaps#" index="i">
			<cfset sitemapIndex &= chr(10) & '	<sitemap>' />
			
			<cfset sitemapIndex &= chr(10) & '		<loc>' & i.loc & '</loc>' />
			
			<cfif i.lastMod neq ''>
				<!--- Complete date plus hours, minutes and seconds: --->
				<!--- YYYY-MM-DDThh:mm:ssTZD (eg 1997-07-16T19:20:30+01:00) --->
				<cfset sitemapIndex &= chr(10) & '		<lastmod>' & dateFormat(i.lastMod, 'yyyy-mm-dd') & 'T' & timeFormat(i.lastMod, 'HH:mm:ss') & variables.timeZoneDesignator & '</lastmod>' />
			</cfif>
			
			<cfset sitemapIndex &= chr(10) & '	</sitemap>' />
		</cfloop>
		
		<cfset sitemapIndex &= chr(10) & '</sitemapindex>' />
		
		<cfreturn sitemapIndex />
	</cffunction>
	
	<!---
		Normalizes the directory path given
	--->
	<cffunction name="normalize" access="private" returntype="string" output="false">
		<cfargument name="path" type="string" required="true" />
		
		<!--- Check for trailing slash --->
		<cfif right(arguments.path, 1) neq '/'>
			<cfset arguments.path &= '/' />
		</cfif>
		
		<cfreturn arguments.path />
	</cffunction>
	
	<!---
		Used to send out the pings to alert search engines that the sitemaps 
		have been updated.
	--->
	<cffunction name="ping" access="public" returntype="void" output="false">
		<cfset var i = '' />
		<cfset var result = '' />
		
		<cfloop array="#variables.sitemapIndexes#" index="i">
			<cfset pingEngines(i) />
		</cfloop>
		
		<cfloop array="#variables.sitemaps#" index="i">
			<cfset pingEngines(i.loc) />
		</cfloop>
	</cffunction>
	
	<!---
		Pings the different engines informing them of the change to the given sitemap.
	--->
	<cffunction name="pingEngines" access="private" returntype="void" output="false">
		<cfargument name="sitemapURL" type="string" required="true" />
		
		<cfset var result = '' />
		
		<!--- Google --->
		<cfhttp url="http://www.google.com/webmasters/sitemaps/ping?sitemap=#arguments.sitemapURL#" result="result" />
		
		<cfif not find(result.statusCode, '200')>
			<cfthrow message="Failed to ping Google" detail="Google returned a #result.statusCode# code when trying to ping with #arguments.sitemapURL#" />
		</cfif>
		
		<!--- Ask --->
		<cfhttp url="http://submissions.ask.com/ping?sitemap=#arguments.sitemapURL#" result="result" />
		
		<cfif not find(result.statusCode, '200')>
			<cfthrow message="Failed to ping Ask" detail="Ask returned a #result.statusCode# code when trying to ping with #arguments.sitemapURL#" />
		</cfif>
		
		<!--- Microsoft --->
		<cfhttp url="http://webmaster.live.com/ping.aspx?siteMap=#arguments.sitemapURL#" result="result" />
		
		<cfif not find(result.statusCode, '200')>
			<cfthrow message="Failed to ping Microsoft" detail="Microsoft returned a #result.statusCode# code when trying to ping with #arguments.sitemapURL#" />
		</cfif>
		
		<!--- Yahoo! --->
		<cfif structKeyExists(variables.keys, 'yahoo')>
			<cfhttp url="http://search.yahooapis.com/SiteExplorerService/V1/updateNotification?appid=#variables.keys.yahoo#&url=#arguments.sitemapURL#" result="result" />
			
			<cfif not find(result.statusCode, '200')>
				<cfthrow message="Failed to ping Yahoo!" detail="Yahoo! returned a #result.statusCode# code when trying to ping with #arguments.sitemapURL#" />
			</cfif>
		</cfif>
	</cffunction>
	
	<!---
		Generates and saves the sitemap to a file. Also flags to be pinged.
	--->
	<cffunction name="saveSitemap" access="public" returntype="void" output="false">
		<cfargument name="sitemapDirectory" type="string" required="true" />
		<cfargument name="sitemapFilename" type="string" default="sitemap.xml" />
		<cfargument name="domainDirectory" type="string" default="" />
		
		<cfset var sitemap = '' />
		<cfset var sitemapXml = '' />
		
		<!--- Generate the sitemap XML --->
		<cfset sitemapXml = createSitemap() />
		
		<!--- Check for trailing slash --->
		<cfset arguments.sitemapDirectory = normalize(arguments.sitemapDirectory) />
		
		<!--- Create the sitemap file --->
		<cffile action="write" file="#arguments.sitemapDirectory##arguments.sitemapFilename#" output="#sitemapXml#" />
		
		<!--- Add to the list of sitemaps for pinging --->
		<cfif len(arguments.domainDirectory)>
			<!--- Check for trailing slash --->
			<cfset arguments.domainDirectory = normalize(arguments.domainDirectory) />
			
			<!--- Add to the array of sitemaps --->
			<cfset sitemap = { loc = XMLFormat(arguments.domainDirectory & arguments.sitemapFilename), lastMod = variables.lastUpdate } />
			<cfset arrayAppend(variables.sitemaps, sitemap) />
		</cfif>
		
		<!--- Clear out the sitemap variables --->
		<cfset variables.urls = [] />
		<cfset variables.lastUpdate = '' />
	</cffunction>
	
	<!---
		Generates and saves the sitemap index to a file. Also flags to be pinged.
	--->
	<cffunction name="saveSitemapIndex" access="public" returntype="void" output="false">
		<cfargument name="sitemapDirectory" type="string" required="true" />
		<cfargument name="sitemapFilename" type="string" default="sitemap_index.xml" />
		<cfargument name="domainDirectory" type="string" default="" />
		
		<cfset var sitemapIndexXml = '' />
		
		<!--- Generate the sitemap XML --->
		<cfset sitemapIndexXml = createSitemapIndex() />
		
		<!--- Check for trailing slash --->
		<cfset arguments.sitemapDirectory = normalize(arguments.sitemapDirectory) />
		
		<!--- Create the sitemap file --->
		<cffile action="write" file="#arguments.sitemapDirectory##arguments.sitemapFilename#" output="#sitemapIndexXml#" />
		
		<!--- Add to the list of sitemap indexes for pinging --->
		<cfif len(arguments.domainDirectory)>
			<!--- Check for trailing slash --->
			<cfset arguments.domainDirectory = normalize(arguments.domainDirectory) />
			
			<!--- Add to the array of sitemaps --->
			<cfset arrayAppend(variables.sitemapIndexes, XMLFormat(arguments.domainDirectory & arguments.sitemapFilename)) />
		</cfif>
		
		<!--- Clear out the sitemap variables --->
		<cfset variables.sitemaps = [] />
	</cffunction>
</cfcomponent>