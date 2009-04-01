<cfcomponent extends="mxunit.framework.TestCase" output="false">
	<!--- Test returning a cleaned (empty) url given a full one --->
	<cffunction name="testCleanUrl" access="public" returntype="void" output="false">
		<cfset var theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init('randy=dabomb') />
		
		<!--- test cleaning an instance of the master --->
		<cfset theUrl.clean('redirect')>
		<cfset assertEquals('?', theUrl.get('redirect'))>
		
		<!--- test cleaning the master --->
		<cfset theUrl.clean()>
		<cfset assertEquals('?', theUrl.get())>
		
	</cffunction>


	<!--- test extending a url  --->
	<cffunction name="testExtend" access="public" returnType="void" output="false">
		<cfset var theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init() />
		<cfset var theContrast = createObject('component', 'cf-compendium.inc.resource.utility.contrast').init() />
		
		<cfset theUrl.setLocation('brandNewLocation', 'sarah=awesome') />
		
		<cfset theUrl.extend('brandNewLocation', 'sarah=new&tj=awesome') />
		
		<cfset assertTrue(theContrast.areEqual('sarah=awesome&tj=awesome', replaceList(theUrl.get('brandNewLocation', false),'?','&'), '&'))>
		
	</cffunction>
	
	<!---
		test getting the getting location
	--->
	
	<cffunction name="testGetLocation" access="public" returntype="void" output="false">
		<cfset var theURL = createObject('component', 'cf-compendium.inc.resource.utility.url').init() />
		<cfset theURL.setLocation('mylocation', 'ef=cool')>
		<cfset assertEquals('?ef=cool', theURL.get('mylocation'))>		
	</cffunction>

	<!--- want to test getting back the correct url given a url --->
	<cffunction name="testGetMaster" access="public" returntype="void" output="false">
		<cfset var theURL = createObject('component', 'cf-compendium.inc.resource.utility.url').init('ef=cool') />
		
		<cfset assertEquals('?ef=cool', theURL.get()) />
	</cffunction>

	<!---
		Test getLocation for existence of named location
	--->
	<cffunction name="testIsLocationTrue" access="public" returntype="void" output="false">
		<cfset var theURL = createObject('component', 'cf-compendium.inc.resource.utility.url').init('ef=cool') />
		<cfset theURL.setLocation('mylocation')>
		<cfset assertTrue(theURL.isLocation('mylocation')) />
	</cffunction>
	
	<!---
		Test getLocation for FALSE existence of named location
	--->
	<cffunction name="testIsLocationFalse" access="public" returntype="void" output="false">
		<cfset var theURL = createObject('component', 'cf-compendium.inc.resource.utility.url').init('ef=cool') />
		<cfset assertFalse(theURL.isLocation('mylocation')) />
	</cffunction>
	
	<!---
		Test getLocation for existence of master location
	--->
	<cffunction name="testIsLocationMaster" access="public" returntype="void" output="false">
		<cfset var theURL = createObject('component', 'cf-compendium.inc.resource.utility.url').init('ef=cool') />
		
		<cfset assertTrue(theURL.isLocation('')) />
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
		
		<cfset theUrl.setLocation('brandNewLocation', 'sarah=awesome') />
		
		<cfset theUrl.override('brandNewLocation', 'sarah=new&tj=awesome') />
		
		<cfset newUrl = replace(theUrl.get('brandNewLocation', false),'?','&', 'ALL') />
		
		<cfset assertTrue(theContrast.areEqual('sarah=new&tj=awesome', newUrl, '&'))>
	</cffunction>

	<!---
		Test parseQueryString. Should return a struct given a correctly formatted query string
	--->
	
	<cffunction name="testParseQueryString" access="public" returntype="void" output="false">
		<cfset var theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init() />
		<cfset var theQueryString = "happy=sad&fun=boring&awesome=lame" />
		<cfset var result = theUrl.parseQueryString(theQueryString) />
		
		<cfset assertTrue(structKeyExists(result, "happy")) />
		<cfset assertTrue(result["happy"] IS "sad") />
		<cfset assertTrue(structKeyExists(result, "fun")) />
		<cfset assertTrue(result["fun"] IS "boring") />
		<cfset assertTrue(structKeyExists(result, "awesome")) />
		<cfset assertTrue(result["awesome"] IS "lame") />
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
		<cfset var theQueryString =  ""/>
		
		<cfset assertTrue(structIsEmpty(theUrl.parseQueryString(theQueryString)))>	
	</cffunction>
	
		<!---
		Test the search function for fail
	--->

	<cffunction name="testSearchFail" access="public" returntype="void" output="false">
		<cfset var theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init('ef=cool') />
		<cfset var locationName = "" />
		<cfset var searchString = "boo" />
		
		<cfset assertEquals("", theUrl.search(locationName, searchString)) />
		
	</cffunction>
	
	<!---
		Test the search function without giving a location
	--->
	
	<cffunction name="testSearchNoLocation" access="public" returntype="void" output="false">
		<cfset var theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init('ef=cool') />
		<cfset var locationName = "" />
		<cfset var searchString = "ef" />
		
		<cfset assertEquals("cool", theUrl.search(locationName, searchString)) />
		
	</cffunction>
		<!---
		Test the search function giving a location
	--->
	
	<cffunction name="testSearchWithLocation" access="public" returntype="void" output="false">
		<cfset var theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init('ef=cool') />
		<cfset var locationName = "myLocation" />
		<cfset var myQueryString = "randy=smart" />
		<cfset var searchString = "randy" />	
		
		<cfset theUrl.setLocation(locationName, myQueryString) />
		
		<cfset assertEquals("smart", theUrl.search(locationName, searchString)) />
		
	</cffunction>
	
	<!---
		Test the searchID function 
	--->
	
	<cffunction name="testSearchID" access="public" returnType="void" output="false">
		<cfset var theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init('ef=cool&pid=101') />
		
		<cfset assertEquals('101', theUrl.searchID('', 'pid')) />
		
	</cffunction>
	
	<!---
		Test the searchID function for FAIL
	--->
	
	<cffunction name="testSearchIDFail" access="public" returnType="void" output="false">
		<cfset var theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init('ef=cool&pid=101') />
		
		<cfset assertNotEquals('101', theUrl.searchID('', 'ef')) />
		
	</cffunction>
	
	<!---
		Test the searchID function with location
	--->
	
	<cffunction name="testSearchIDWithLocation" access="public" returnType="void" output="false">
		<cfset var theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init('ef=cool&pid=101') />
		<cfset var myQueryString =  "pid=200&randy=spiffy"/>
		<cfset var myLocation = "theLocation" />
		
		<cfset theUrl.setLocation(myLocation, myQueryString) />
		<cfset assertEquals('200', theUrl.searchID(myLocation, 'pid')) />
		
	</cffunction>
	
	<!---
		Test the setLocation function with a blank location string and a blank query string
	--->
	
	<cffunction name="testSetLocationBlankLocationBlankQuery" access="public" returntype="void" output="false">
		<cfset var theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init() />
		<cfset var strQueryString =  ""/>
		<cfset var strLocation = "" />
		
		<cfset theUrl.setLocation(strLocation, strQueryString) />
		
		<cfset assertEquals("?#strQueryString#", theUrl.get(strLocation))>	
		
	</cffunction>
	
	<!---
		Test the setLocation function with a blank location string and a query string
	--->
	
	<cffunction name="testSetLocationBlankLocationWithQuery" access="public" returntype="void" output="false">
		<cfset var theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init() />
		<cfset var strQueryString =  "randy=cool"/>
		<cfset var strLocation = "" />
		
		<cfset theUrl.setLocation(strLocation, strQueryString) />
		
		<cfset assertEquals(theUrl.get(strLocation), "?#strQueryString#")>	
	</cffunction>
	
	<!---
		Test the setLocation function with a location string and a blank query string
	--->
	
	<cffunction name="testSetLocationWithLocationBlankQuery" access="public" returntype="void" output="false">
		<cfset var theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init() />
		<cfset var strQueryString =  ""/>
		<cfset var strLocation = "myLocation" />
		
		<cfset theUrl.setLocation(strLocation, strQueryString) />
		
		<cfset assertEquals(theUrl.get(strLocation), "?#strQueryString#")>
	</cffunction>
	
	<!---
		Test the setLocation function with a location string and a query string
	--->
	
	<cffunction name="testSetLocationWithLocationWithQuery" access="public" returntype="void" output="false">
		<cfset var theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init() />
		<cfset var strQueryString =  "randy=cool"/>
		<cfset var strLocation = "myLocation" />
		
		<cfset theUrl.setLocation(strLocation, strQueryString) />
		
		<cfset assertEquals(theUrl.get(strLocation), "?#strQueryString#")>
	</cffunction>
</cfcomponent>