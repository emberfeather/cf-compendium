component extends="mxunit.framework.TestCase" {
	/**
	 * Test the init function without a time offset given.
	 */
	public void function testInitSansTimeOffset() {
		var theSitemap = '';
		
		theSitemap = createObject('component', 'cf-compendium.inc.resource.utility.sitemap').init();
	}
	
	/**
	 * Test the init function with a valid time offset given using UTC.
	 */
	public void function testInitWithValidTimeOffsetUTC() {
		var theSitemap = '';
		
		theSitemap = createObject('component', 'cf-compendium.inc.resource.utility.sitemap').init('Z');
	}
	
	/**
	 * Test the init function with a valid time offset given using UTC.
	 */
	public void function testInitWithValidTimeOffsetNegative() {
		var theSitemap = '';
		
		theSitemap = createObject('component', 'cf-compendium.inc.resource.utility.sitemap').init('-02:00');
	}
	
	/**
	 * Test the init function with a valid positive time offset.
	 */
	public void function testInitWithValidTimeOffsetPositive() {
		var theSitemap = '';
		
		theSitemap = createObject('component', 'cf-compendium.inc.resource.utility.sitemap').init('+10:00');
	}
	
	/**
	 * Test the init function with an invalid time offset given.
	 */
	public void function testInitWithInvalidTimeOffset1() {
		var theSitemap = createObject('component', 'cf-compendium.inc.resource.utility.sitemap');
		
		expectException('any', 'Should not be a valid time offset');
		
		theSitemap.init('+1:00');
	}
	
	/**
	 * Test the init function with an invalid time offset given.
	 */
	public void function testInitWithInvalidTimeOffset2() {
		var theSitemap = createObject('component', 'cf-compendium.inc.resource.utility.sitemap');
		
		expectException('any', 'Should not be a valid time offset');
		
		theSitemap.init('-21:00');
	}
	
	/**
	 * Test the addUrl function with an invalid last modification date.
	 */
	public void function testAddUrlWithInvalidLastModification() {
		var theSitemap = createObject('component', 'cf-compendium.inc.resource.utility.sitemap').init();
		var options = {};
		
		expectException('any', 'Should not be a valid last modification date');
		
		options.lastMod = 'Yo';
		
		theSitemap.addUrl('http://google.com', options);
	}
	
	/**
	 * Test the addUrl function with an invalid change frequency.
	 */
	public void function testAddUrlWithInvalidChangeFrequency() {
		var theSitemap = createObject('component', 'cf-compendium.inc.resource.utility.sitemap').init();
		var options = {};
		
		expectException('any', 'Should not be a valid change frequency');
		
		options.changeFreq = 'whenever';
		
		theSitemap.addUrl('http://google.com', options);
	}
	
	/**
	 * Test the addUrl function with an invalid priority.
	 */
	public void function testAddUrlWithInvalidPriority1() {
		var theSitemap = createObject('component', 'cf-compendium.inc.resource.utility.sitemap').init();
		var options = {};
		
		expectException('any', 'Should not be a valid priority');
		
		options.priority = -1;
		
		theSitemap.addUrl('http://google.com', options);
	}
	
	/**
	 * Test the addUrl function with an invalid priority.
	 */
	public void function testAddUrlWithInvalidPriority2() {
		var theSitemap = createObject('component', 'cf-compendium.inc.resource.utility.sitemap').init();
		var options = {};
		
		expectException('any', 'Should not be a valid priority');
		
		options.priority = 2;
		
		theSitemap.addUrl('http://google.com', options);
	}
}
