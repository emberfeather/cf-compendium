component extends="mxunit.framework.TestCase" {
	public void function setup() {
		variables.theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init();
	}
	
	/**
	 * Test adding an anchor by setting it to a value.
	 */
	public void function testAnchorUrl() {
		// set an anchor
		variables.theUrl.anchorRedirect('top');
		
		assertEquals('?##top', variables.theUrl.getRedirect());
	}
	
	/**
	 * Test removing an anchor by setting it to a blank string.
	 */
	public void function testAnchorUrl_RemoveAnchor_Blank() {
		// set an anchor value to remove
		variables.theUrl.anchorRedirect('top');
		
		// test removing an anchor on an instance
		variables.theUrl.anchorRedirect('');
		
		assertEquals('?', variables.theUrl.getRedirect());
	}
	
	/**
	 * Test removing an anchor by not passing a new value.
	 */
	public void function testAnchorUrl_RemoveAnchor_sansArgument() {
		// set an anchor value to remove
		variables.theUrl.anchorRedirect('top');
		
		// test removing an anchor on an instance
		variables.theUrl.anchorRedirect();
		
		assertEquals('?', variables.theUrl.getRedirect());
	}
	
	/**
	 * Test removing an anchor that was never set.
	 */
	public void function testAnchorUrl_RemoveAnchor_sansAnchor() {
		// test removing an anchor on an instance
		variables.theUrl.anchorRedirect();
		
		assertEquals('?', variables.theUrl.getRedirect());
	}
	
	/**
	 * Test returning a cleaned (empty) url given a full one
	 */
	public void function testCleanUrl() {
		variables.theUrl.init('randy=dabomb');
		
		// test cleaning an instance
		variables.theUrl.cleanRedirect();
		
		assertEquals('?', variables.theUrl.getRedirect());
	}
	
	/**
	 * Test returning a cleaned (empty) url given a full one
	 */
	public void function testCleanUrl_Master() {
		variables.theUrl.init('randy=dabomb');
		
		// test cleaning the master
		variables.theUrl.clean();
		
		assertEquals('?', variables.theUrl.get());
	}
	
	/**
	 * Test cloning an existing URL
	 */
	public void function testCloneUrl_shouldMatch() {
		variables.theUrl.setTesting('test', 'something');
		
		// test cleaning an instance
		variables.theUrl.cloneRedirect('testing');
		
		assertEquals('?test=something', variables.theUrl.getRedirect());
	}
	
	/**
	 * Test cloning the master
	 */
	public void function testCloneUrl_withMaster_shouldMatch() {
		variables.theUrl.init('test=something');
		
		// test cleaning an instance
		variables.theUrl.cloneRedirect();
		
		assertEquals('?test=something', variables.theUrl.getRedirect());
	}
	
	/**
	 * Test extending a url
	 */
	public void function testExtend() {
		var theContrast = createObject('component', 'cf-compendium.inc.resource.utility.contrast').init();
		var newUrl = '';
		
		variables.theUrl.setBrandNewLocation('sarah', 'awesome');
		
		variables.theUrl.extendBrandNewLocation('sarah=new&tj=awesome');
		
		newUrl = replace(variables.theUrl.getBrandNewLocation(false),'?','&', 'ALL');
		
		assertTrue(theContrast.areEqual('sarah=awesome&tj=awesome', newUrl, '&'));
	}
	
	/**
	 * Test getting the getting location
	 */
	public void function testGet() {
		
		variables.theUrl.setMylocation('ef', 'cool');
		
		assertEquals('?ef=cool', variables.theUrl.getMyLocation());
	}
	
	/**
	 * Want to test getting back the correct url given a url
	 */
	public void function testGetMaster() {
		variables.theUrl.init('ef=cool');
		
		assertEquals('?ef=cool', variables.theUrl.get());
	}
	
	/**
	 * Test getLocation for existence of named location
	 */
	public void function testHasLocationTrue() {
		variables.theUrl.init('ef=cool');
		
		variables.theUrl.setMyLocation('test', 'true');
		
		assertTrue(variables.theUrl.hasMylocation());
	}
	
	/**
	 * Test getLocation for FALSE existence of named location
	 */
	public void function testHasLocationFalse() {
		variables.theUrl.init('ef=cool');
		
		assertFalse(variables.theUrl.hasMyLocation());
	}
	
	/**
	 * Test getLocation for existence of master location
	 */
	public void function testHasLocationMaster() {
		variables.theUrl.init('ef=cool');
		
		assertTrue(variables.theUrl.has());
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
		var theContrast = createObject('component', 'cf-compendium.inc.resource.utility.contrast').init();
		var newUrl = '';
		
		variables.theUrl.setBrandNewLocation('sarah', 'awesome');
		
		variables.theUrl.overrideBrandNewLocation('sarah=new&tj=awesome');
		
		newUrl = replace(variables.theUrl.getBrandNewLocation(false),'?','&', 'ALL');
		
		assertTrue(theContrast.areEqual('sarah=new&tj=awesome', newUrl, '&'));
	}
	
	/**
	 * Test parseQueryString. Should return a struct given a correctly formatted query string
	 */
	public void function testParseQueryString() {
		var theQueryString = "happy=sad&fun=boring&awesome=lame";
		var result = variables.theUrl.parseQueryString(theQueryString);
		
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
		var theQueryString = "?happy=sad";
		var result = variables.theUrl.parseQueryString(theQueryString);
		
		assertFalse(structKeyExists(result, "?happy"));
	}
	
	/**
	 * Test parseQueryStringWithBlank. Should return a struct given a correctly formatted query string
	 */
	public void function testParseQueryStringWithBlank() {
		var theQueryString =  "";
		
		assertTrue(structIsEmpty(variables.theUrl.parseQueryString(theQueryString)));
	}
	
	/**
	 * Test queryKeyList returns the correct list of tokens
	 */
	public void function testQueryKeyList() {
		
		variables.theUrl.set('test1', '1');
		variables.theUrl.set('test2', '2');
		variables.theUrl.set('test3', '3');
		variables.theUrl.set('test4', '4');
		
		assertEquals('test1,test2,test3,test4', listSort( variables.theUrl.querystringKeyList(), 'text' ) );
	}
	
	/**
	 * Test the setLocation function with a blank location string and a blank query string
	 */
	public void function testResetMasterBlankQuery() {
		
		variables.theUrl.reset('');
		
		assertEquals("?", variables.theUrl.get());
	}
	
	/**
	 * Test the setLocation function with a blank location string and a query string
	 */
	public void function testResetMasterWithQuery() {
		var strQueryString =  "randy=cool";
		
		variables.theUrl.reset(strQueryString);
		
		assertEquals("?" & strQueryString, variables.theUrl.get());
	}
	
	/**
	 * Test the setLocation function with a location string and a blank query string
	 */
	public void function testResetLocationBlankQuery() {
		var strQueryString =  "";
		
		variables.theUrl.resetMyLocation(strQueryString);
		
		assertEquals("?" & strQueryString, variables.theUrl.getMyLocation());
	}
	
	/**
	 * Test the setLocation function with a location string and a query string
	 */
	public void function testResetLocationWithLocationWithQuery() {
		var strQueryString =  "randy=cool";
		
		variables.theUrl.resetMyLocation(strQueryString);
		
		assertEquals("?" & strQueryString, variables.theUrl.getMyLocation());
	}
}
