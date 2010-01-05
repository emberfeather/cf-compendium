<cfcomponent extends="mxunit.framework.TestCase" output="false">
	<cfscript>
		/**
		 * Test the init function without a time offset given.
		 */
		public void function testInitSansTimeOffset() {
			var theSitemap = '';
			
			try {
				theSitemap = createObject('component', 'cf-compendium.inc.resource.utility.sitemap').init();
			} catch(any exception) {
				fail('Creating a sitemap object without a time zone designator should work.');
			}
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
			
			try {
				theSitemap.init('+1:00');
				
				fail('Should not be a valid time offset');
			} catch(mxunit.exception.AssertionFailedError exception) {
				rethrow();
			} catch(any exception) {
				// Expect to get here
			}
		}
		
		/**
		 * Test the init function with an invalid time offset given.
		 */
		public void function testInitWithInvalidTimeOffset2() {
			var theSitemap = createObject('component', 'cf-compendium.inc.resource.utility.sitemap');
			
			try {
				theSitemap.init('-21:00');
				
				fail('Should not be a valid time offset');
			} catch (mxunit.exception.AssertionFailedError exception) {
				rethrow();
			} catch (any exception) {
				// Expect to get here
			}
		}
		
		/**
		 * Test the addUrl function with an invalid last modification date.
		 */
		public void function testAddUrlWithInvalidLastModification() {
			var theSitemap = createObject('component', 'cf-compendium.inc.resource.utility.sitemap').init();
			var options = {};
			
			try {
				options.lastMod = 'Yo';
				
				theSitemap.addUrl('http://google.com', options);
				
				fail('Should not be a valid last modification date');
			} catch(mxunit.exception.AssertionFailedError exception) {
				rethrow();
			} catch(any exception) {
				// Expect to get here
			}
		}
		
		/**
		 * Test the addUrl function with an invalid change frequency.
		 */
		public void function testAddUrlWithInvalidChangeFrequency() {
			var theSitemap = createObject('component', 'cf-compendium.inc.resource.utility.sitemap').init();
			var options = {};
			
			try {
				options.changeFreq = 'whenever';
				
				theSitemap.addUrl('http://google.com', options);
				
				fail('Should not be a valid change frequency');
			} catch(mxunit.exception.AssertionFailedError exception) {
				rethrow();
			} catch(any exception) {
				// Expect to get here
			}
		}
		
		/**
		 * Test the addUrl function with an invalid priority.
		 */
		public void function testAddUrlWithInvalidPriority1() {
			var theSitemap = createObject('component', 'cf-compendium.inc.resource.utility.sitemap').init();
			var options = {};
			
			try {
				options.priority = -1;
				
				theSitemap.addUrl('http://google.com', options);
				
				fail('Should not be a valid priority');
			} catch(mxunit.exception.AssertionFailedError exception) {
				rethrow;
			} catch(any exception) {
				// Expect to get here
			}
		}
		
		/**
		 * Test the addUrl function with an invalid priority.
		 */
		public void function testAddUrlWithInvalidPriority2() {
			var theSitemap = createObject('component', 'cf-compendium.inc.resource.utility.sitemap').init();
			var options = {};
			
			try {
				options.priority = 2;
				
				theSitemap.addUrl('http://google.com', options);
				
				fail('Should not be a valid priority');
			} catch(mxunit.exception.AssertionFailedError exception) {
				rethrow();
			} catch(any exception) {
				// Expect to get here
			}
		}
	</cfscript>
</cfcomponent>