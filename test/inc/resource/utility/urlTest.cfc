<cfcomponent extends="mxunit.framework.TestCase" output="false">
	<!---
		Test returning a cleaned (empty) url given a full one
	--->
	<cffunction name="testCleanUrl" access="public" returntype="void" output="false">
		<cfset var theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init('randy=dabomb') />
		
		<!--- test cleaning an instance --->
		<cfset theUrl.cleanRedirect() />
		
		<cfset assertEquals('?', theUrl.getRedirect()) />
	</cffunction>
	
	<!---
		Test returning a cleaned (empty) url given a full one
	--->
	<cffunction name="testCleanUrlMaster" access="public" returntype="void" output="false">
		<cfset var theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init('randy=dabomb') />
		
		<!--- test cleaning the master --->
		<cfset theUrl.clean() />
		
		<cfset assertEquals('?', theUrl.get()) />
	</cffunction>

	<!---
		Test extending a url
	--->
	<cffunction name="testExtend" access="public" returnType="void" output="false">
		<cfset var theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init() />
		<cfset var theContrast = createObject('component', 'cf-compendium.inc.resource.utility.contrast').init() />
		<cfset var newUrl = '' />
		
		<cfset theUrl.setBrandNewLocation('sarah', 'awesome') />
		
		<cfset theUrl.extendBrandNewLocation('sarah=new&tj=awesome') />
		
		<cfset newUrl = replace(theUrl.getBrandNewLocation(false),'?','&', 'ALL') />
		
		<cfset assertTrue(theContrast.areEqual('sarah=awesome&tj=awesome', newUrl, '&')) />
	</cffunction>
	
	<!---
		test getting the getting location
	--->
	<cffunction name="testGet" access="public" returntype="void" output="false">
		<cfset var theURL = createObject('component', 'cf-compendium.inc.resource.utility.url').init() />
		
		<cfset theURL.setMylocation('ef', 'cool')>
		
		<cfset assertEquals('?ef=cool', theURL.getMyLocation())>
	</cffunction>

	<!---
		want to test getting back the correct url given a url
	--->
	<cffunction name="testGetMaster" access="public" returntype="void" output="false">
		<cfset var theURL = createObject('component', 'cf-compendium.inc.resource.utility.url').init('ef=cool') />
		
		<cfset assertEquals('?ef=cool', theURL.get()) />
	</cffunction>

	<!---
		Test getLocation for existence of named location
	--->
	<cffunction name="testHasLocationTrue" access="public" returntype="void" output="false">
		<cfset var theURL = createObject('component', 'cf-compendium.inc.resource.utility.url').init('ef=cool') />
		
		<cfset theURL.setMyLocation('test', 'true') />
		
		<cfset assertTrue(theURL.hasMylocation()) />
	</cffunction>
	
	<!---
		Test getLocation for FALSE existence of named location
	--->
	<cffunction name="testHasLocationFalse" access="public" returntype="void" output="false">
		<cfset var theURL = createObject('component', 'cf-compendium.inc.resource.utility.url').init('ef=cool') />
		
		<cfset assertFalse(theURL.hasMyLocation()) />
	</cffunction>
	
	<!---
		Test getLocation for existence of master location
	--->
	<cffunction name="testHasLocationMaster" access="public" returntype="void" output="false">
		<cfset var theURL = createObject('component', 'cf-compendium.inc.resource.utility.url').init('ef=cool') />
		
		<cfset assertTrue(theURL.has()) />
	</cffunction>

	<!--- 
		Test overriding a url
		
		Override is similar to extend, except that it will override any of the already existing parameters in the URL,
		where extend will only append non existing parameters
		
		EX:
		
		  XXXXX    (original values)
		 +   OOOO  (new values)
		 ----------
		  XXXOOOO  
	--->
	<cffunction name="testOverride" access="public" returnType="void" output="false">
		<cfset var theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init() />
		<cfset var theContrast = createObject('component', 'cf-compendium.inc.resource.utility.contrast').init() />
		<cfset var newUrl = '' />
		
		<cfset theUrl.setBrandNewLocation('sarah', 'awesome') />
		
		<cfset theUrl.overrideBrandNewLocation('sarah=new&tj=awesome') />
		
		<cfset newUrl = replace(theUrl.getBrandNewLocation(false),'?','&', 'ALL') />
		
		<cfset assertTrue(theContrast.areEqual('sarah=new&tj=awesome', newUrl, '&')) />
	</cffunction>

	<!---
		Test parseQueryString. Should return a struct given a correctly formatted query string
	--->
	<cffunction name="testParseQueryString" access="public" returntype="void" output="false">
		<cfset var theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init() />
		<cfset var theQueryString = "happy=sad&fun=boring&awesome=lame" />
		<cfset var result = theUrl.parseQueryString(theQueryString) />
		
		<cfset assertTrue(structKeyExists(result, "happy")) />
		<cfset assertTrue(result["happy"] EQ "sad") />
		
		<cfset assertTrue(structKeyExists(result, "fun")) />
		<cfset assertTrue(result["fun"] EQ "boring") />
		
		<cfset assertTrue(structKeyExists(result, "awesome")) />
		<cfset assertTrue(result["awesome"] EQ "lame") />
	</cffunction>
	
	<!---
		Test parseQueryString. Should return a struct given a correctly formatted query string
	--->
	<cffunction name="testParseQueryStringWithQuestion" access="public" returntype="void" output="false">
		<cfset var theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init() />
		<cfset var theQueryString = "?happy=sad" />
		<cfset var result = theUrl.parseQueryString(theQueryString) />
		
		<cfset assertFalse(structKeyExists(result, "?happy")) />
	</cffunction>
	
	<!---
		Test parseQueryStringWithBlank. Should return a struct given a correctly formatted query string
	--->
	<cffunction name="testParseQueryStringWithBlank" access="public" returntype="void" output="false">
		<cfset var theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init() />
		<cfset var theQueryString =  "" />
		
		<cfset assertTrue(structIsEmpty(theUrl.parseQueryString(theQueryString))) />
	</cffunction>
	
	<!---
		Test the search function for fail
	--->
	<cffunction name="testSearchFail" access="public" returntype="void" output="false">
		<cfset var theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init('ef=cool') />
		<cfset var locationName = "" />
		<cfset var searchString = "boo" />
		
		<cfset assertEquals("", theUrl.searchLocationName(searchString)) />
	</cffunction>
	
	<!---
		Test the search function without giving a location
	--->
	<cffunction name="testSearchMaster" access="public" returntype="void" output="false">
		<cfset var theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init('ef=cool') />
		<cfset var locationName = "" />
		<cfset var searchString = "ef" />
		
		<cfset assertEquals("cool", theUrl.search(searchString)) />
	</cffunction>
	
	<!---
		Test the search function giving a location
	--->
	<cffunction name="testSearchWithLocation" access="public" returntype="void" output="false">
		<cfset var theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init('ef=cool') />
		<cfset var searchString = "randy" />	
		
		<cfset theUrl.setMyLocation('randy', 'smart') />
		
		<cfset assertEquals("smart", theUrl.searchMyLocation(searchString)) />
	</cffunction>
	
	<!---
		Test the searchID function 
	--->
	<cffunction name="testSearchID" access="public" returnType="void" output="false">
		<cfset var theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init('ef=cool&pid=101') />
		
		<cfset assertEquals(101, theUrl.searchID('pid')) />
	</cffunction>
	
	<!---
		Test the searchID function for FAIL
	--->
	<cffunction name="testSearchIDFail" access="public" returnType="void" output="false">
		<cfset var theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init('ef=cool&pid=101') />
		
		<cfset assertEquals(0, theUrl.searchID('ef')) />
	</cffunction>
	
	<!---
		Test the searchID function with location
	--->
	<cffunction name="testSearchIDWithLocation" access="public" returnType="void" output="false">
		<cfset var theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init('ef=cool&pid=101') />
		<cfset var myQueryString =  "pid=200&randy=spiffy"/>
		<cfset var myLocation = "theLocation" />
		
		<cfset theUrl.setMyLocation('pid', 200) />
		
		<cfset assertEquals(200, theUrl.searchIDMyLocation('pid')) />
	</cffunction>
	
	<!---
		Test the setLocation function with a blank location string and a blank query string
	--->
	<cffunction name="testResetMasterBlankQuery" access="public" returntype="void" output="false">
		<cfset var theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init() />
		
		<cfset theUrl.reset('') />
		
		<cfset assertEquals("?", theUrl.get()) />
	</cffunction>
	
	<!---
		Test the setLocation function with a blank location string and a query string
	--->
	<cffunction name="testResetMasterWithQuery" access="public" returntype="void" output="false">
		<cfset var theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init() />
		<cfset var strQueryString =  "randy=cool"/>
		
		<cfset theUrl.reset(strQueryString) />
		
		<cfset assertEquals("?" & strQueryString, theUrl.get()) >
	</cffunction>
	
	<!---
		Test the setLocation function with a location string and a blank query string
	--->
	<cffunction name="testResetLocationBlankQuery" access="public" returntype="void" output="false">
		<cfset var theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init() />
		<cfset var strQueryString =  ""/>
		
		<cfset theUrl.resetMyLocation(strQueryString) />
		
		<cfset assertEquals("?" & strQueryString, theUrl.getMyLocation()) />
	</cffunction>
	
	<!---
		Test the setLocation function with a location string and a query string
	--->
	<cffunction name="testResetLocationWithLocationWithQuery" access="public" returntype="void" output="false">
		<cfset var theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init() />
		<cfset var strQueryString =  "randy=cool"/>
		
		<cfset theUrl.resetMyLocation(strQueryString) />
		
		<cfset assertEquals("?" & strQueryString, theUrl.getMyLocation()) />
	</cffunction>
</cfcomponent>