<cfcomponent extends="mxunit.framework.TestCase" output="false">
	<cfscript>
		/**
		 * Test adding an anchor by setting it to a value.
		 */
		public void function testAnchorUrl() {
			var theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init('');
			
			// set an anchor
			theUrl.anchorRedirect('top');
			
			assertEquals('?##top', theUrl.getRedirect());
		}
		
		/**
		 * Test removing an anchor by setting it to a blank string.
		 */
		public void function testAnchorUrl_RemoveAnchor_Blank() {
			var theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init('');
			
			// set an anchor value to remove
			theUrl.anchorRedirect('top');
			
			// test removing an anchor on an instance
			theUrl.anchorRedirect('');
			
			assertEquals('?', theUrl.getRedirect());
		}
		
		/**
		 * Test removing an anchor by not passing a new value.
		 */
		public void function testAnchorUrl_RemoveAnchor_sansArgument() {
			var theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init('');
			
			// set an anchor value to remove
			theUrl.anchorRedirect('top');
			
			// test removing an anchor on an instance
			theUrl.anchorRedirect();
			
			assertEquals('?', theUrl.getRedirect());
		}
		
		/**
		 * Test removing an anchor that was never set.
		 */
		public void function testAnchorUrl_RemoveAnchor_sansAnchor() {
			var theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init('');
			
			// test removing an anchor on an instance
			theUrl.anchorRedirect();
			
			assertEquals('?', theUrl.getRedirect());
		}
		
		/**
		 * Test returning a cleaned (empty) url given a full one
		 */
		public void function testCleanUrl() {
			var theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init('randy=dabomb');
			
			// test cleaning an instance
			theUrl.cleanRedirect();
			
			assertEquals('?', theUrl.getRedirect());
		}
		
		/**
		 * Test returning a cleaned (empty) url given a full one
		 */
		public void function testCleanUrl_Master() {
			var theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init('randy=dabomb');
			
			// test cleaning the master
			theUrl.clean();
			
			assertEquals('?', theUrl.get());
		}
		
		/**
		 * Test cloning an existing URL
		 */
		public void function testCloneUrl_shouldMatch() {
			var theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init('');
			
			theUrl.setTesting('test', 'something');
			
			// test cleaning an instance
			theUrl.cloneRedirect('testing');
			
			assertEquals('?test=something', theUrl.getRedirect());
		}
		
		/**
		 * Test cloning the master
		 */
		public void function testCloneUrl_withMaster_shouldMatch() {
			var theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init('test=something');
			
			// test cleaning an instance
			theUrl.cloneRedirect();
			
			assertEquals('?test=something', theUrl.getRedirect());
		}
		
		/**
		 * Test extending a url
		 */
		public void function testExtend() {
			var theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init();
			var theContrast = createObject('component', 'cf-compendium.inc.resource.utility.contrast').init();
			var newUrl = '';
			
			theUrl.setBrandNewLocation('sarah', 'awesome');
			
			theUrl.extendBrandNewLocation('sarah=new&tj=awesome');
			
			newUrl = replace(theUrl.getBrandNewLocation(false),'?','&', 'ALL');
			
			assertTrue(theContrast.areEqual('sarah=awesome&tj=awesome', newUrl, '&'));
		}
		
		/**
		 * Test getting the getting location
		 */
		public void function testGet() {
			var theURL = createObject('component', 'cf-compendium.inc.resource.utility.url').init();
			
			theURL.setMylocation('ef', 'cool');
			
			assertEquals('?ef=cool', theURL.getMyLocation());
		}
		
		/**
		 * Want to test getting back the correct url given a url
		 */
		public void function testGetMaster() {
			var theURL = createObject('component', 'cf-compendium.inc.resource.utility.url').init('ef=cool');
			
			assertEquals('?ef=cool', theURL.get());
		}
		
		/**
		 * Test getLocation for existence of named location
		 */
		public void function testHasLocationTrue() {
			var theURL = createObject('component', 'cf-compendium.inc.resource.utility.url').init('ef=cool');
			
			theURL.setMyLocation('test', 'true');
			
			assertTrue(theURL.hasMylocation());
		}
		
		/**
		 * Test getLocation for FALSE existence of named location
		 */
		public void function testHasLocationFalse() {
			var theURL = createObject('component', 'cf-compendium.inc.resource.utility.url').init('ef=cool');
			
			assertFalse(theURL.hasMyLocation());
		}
		
		/**
		 * Test getLocation for existence of master location
		 */
		public void function testHasLocationMaster() {
			var theURL = createObject('component', 'cf-compendium.inc.resource.utility.url').init('ef=cool');
			
			assertTrue(theURL.has());
		}
		
		/**
		 * Test overriding a url
		 * 
		 * Override is similar to extend, except that it will override any of the already existing parameters in the URL,
		 * where extend will only append non existing parameters
		 * 
		 * EX:
		 * 
		 *   XXXXX    (original values)
		 *  +   OOOO  (new values)
		 *  ----------
		 *   XXXOOOO  
		 */
		public void function testOverride() {
			var theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init();
			var theContrast = createObject('component', 'cf-compendium.inc.resource.utility.contrast').init();
			var newUrl = '';
			
			theUrl.setBrandNewLocation('sarah', 'awesome');
			
			theUrl.overrideBrandNewLocation('sarah=new&tj=awesome');
			
			newUrl = replace(theUrl.getBrandNewLocation(false),'?','&', 'ALL');
			
			assertTrue(theContrast.areEqual('sarah=new&tj=awesome', newUrl, '&'));
		}
		
		/**
		 * Test parseQueryString. Should return a struct given a correctly formatted query string
		 */
		public void function testParseQueryString() {
			var theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init();
			var theQueryString = "happy=sad&fun=boring&awesome=lame";
			var result = theUrl.parseQueryString(theQueryString);
			
			assertTrue(structKeyExists(result, "happy"));
			assertTrue(result["happy"] eq "sad");
			
			assertTrue(structKeyExists(result, "fun"));
			assertTrue(result["fun"] eq "boring");
			
			assertTrue(structKeyExists(result, "awesome"));
			assertTrue(result["awesome"] eq "lame");
		}
		
		/**
		 * Test parseQueryString. Should return a struct given a correctly formatted query string
		 */
		public void function testParseQueryStringWithQuestion() {
			var theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init();
			var theQueryString = "?happy=sad";
			var result = theUrl.parseQueryString(theQueryString);
			
			assertFalse(structKeyExists(result, "?happy"));
		}
		
		/**
		 * Test parseQueryStringWithBlank. Should return a struct given a correctly formatted query string
		 */
		public void function testParseQueryStringWithBlank() {
			var theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init();
			var theQueryString =  "";
			
			assertTrue(structIsEmpty(theUrl.parseQueryString(theQueryString)));
		}
		
		/**
		 * Test queryKeyList returns the correct list of tokens
		 */
		public void function testQueryKeyList() {
			var theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init();
			
			theURL.set('test1', '1');
			theURL.set('test2', '2');
			theURL.set('test3', '3');
			theURL.set('test4', '4');
			
			assertEquals('test1,test2,test3,test4', listSort( theURL.querystringKeyList(), 'text' ) );
		}
		
		/**
		 * Test the search function for fail
		 */
		public void function testSearchFail() {
			var theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init('ef=cool');
			var locationName = "";
			var searchString = "boo";
			
			assertEquals("", theUrl.searchLocationName(searchString));
		}
		
		/**
		 * Test the search function without giving a location
		 */
		public void function testSearchMaster() {
			var theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init('ef=cool');
			var locationName = "";
			var searchString = "ef";
			
			assertEquals("cool", theUrl.search(searchString));
		}
		
		/**
		 * Test the search function giving a location
		 */
		public void function testSearchWithLocation() {
			var theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init('ef=cool');
			var searchString = "randy";	
			
			theUrl.setMyLocation('randy', 'smart');
			
			assertEquals("smart", theUrl.searchMyLocation(searchString));
		}
		
		/**
		 * Test the searchID function 
		 */
		public void function testSearchID() {
			var theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init('ef=cool&pid=101');
			
			assertEquals(101, theUrl.searchID('pid'));
		}
		
		/**
		 * Test the searchID function for FAIL
		 */
		public void function testSearchIDFail() {
			var theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init('ef=cool&pid=101');
			
			assertEquals(0, theUrl.searchID('ef'));
		}
		
		/**
		 * Test the searchID function with location
		 */
		public void function testSearchIDWithLocation() {
			var theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init('ef=cool&pid=101');
			var myQueryString =  "pid=200&randy=spiffy";
			var myLocation = "theLocation";
			
			theUrl.setMyLocation('pid', 200);
			
			assertEquals(200, theUrl.searchIDMyLocation('pid'));
		}
		
		/**
		 * Test the setLocation function with a blank location string and a blank query string
		 */
		public void function testResetMasterBlankQuery() {
			var theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init();
			
			theUrl.reset('');
			
			assertEquals("?", theUrl.get());
		}
		
		/**
		 * Test the setLocation function with a blank location string and a query string
		 */
		public void function testResetMasterWithQuery() {
			var theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init();
			var strQueryString =  "randy=cool";
			
			theUrl.reset(strQueryString);
			
			assertEquals("?" & strQueryString, theUrl.get());
		}
		
		/**
		 * Test the setLocation function with a location string and a blank query string
		 */
		public void function testResetLocationBlankQuery() {
			var theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init();
			var strQueryString =  "";
			
			theUrl.resetMyLocation(strQueryString);
			
			assertEquals("?" & strQueryString, theUrl.getMyLocation());
		}
		
		/**
		 * Test the setLocation function with a location string and a query string
		 */
		public void function testResetLocationWithLocationWithQuery() {
			var theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init();
			var strQueryString =  "randy=cool";
			
			theUrl.resetMyLocation(strQueryString);
			
			assertEquals("?" & strQueryString, theUrl.getMyLocation());
		}
	</cfscript>
</cfcomponent>