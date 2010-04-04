<cfcomponent extends="mxunit.framework.TestCase" output="false">
	<cfscript>
		public function setup() {
			variables.cache = createObject('component', 'cf-compendium.inc.resource.storage.cache').init();
		}
		
		/**
		 * Test the ability to put into the cache
		 */
		public void function testGet_withString() {
			variables.cache.put('testing', 'caching');
			
			assertEquals('caching', variables.cache.get('testing'));
		}
		
		public void function tearDown() {
			variables.cache.clear();
		}
	</cfscript>
</cfcomponent>
