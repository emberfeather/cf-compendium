<cfcomponent extends="mxunit.framework.TestCase" output="false">
	<cfscript>
		/**
		 * 
		 */
		public void function testGetKeys() {
			var resourceBundle = createObject('component', 'cf-compendium.inc.resource.i18n.resourceBundle').init('/i18n/inc/resource/i18n/', 'resourceBundle', 'en_US');
			var keyList = '';
			
			keyList = arrayToList(resourceBundle.getKeys());
			
			assertEquals('Cancel,Go', listSort(keyList, 'text'));
		}
		
		/**
		 * Tests if the bundle returns correctly when a key exists
		 */
		public void function testHasKey() {
			var resourceBundle = createObject('component', 'cf-compendium.inc.resource.i18n.resourceBundle').init('/i18n/inc/resource/i18n/', 'resourceBundle', 'en_US');
			
			assertTrue(resourceBundle.hasKey('Cancel'));
		}
		
		/**
		 * Tests if the bundle returns correctly when a key does not exists
		 */
		public void function testHasKeyFalse() {
			var resourceBundle = createObject('component', 'cf-compendium.inc.resource.i18n.resourceBundle').init('/i18n/inc/resource/i18n/', 'resourceBundle', 'en_US');
			
			assertFalse(resourceBundle.hasKey('Popcorn'));
		}
	</cfscript>
</cfcomponent>