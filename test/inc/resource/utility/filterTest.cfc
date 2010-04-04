<cfcomponent extends="mxunit.framework.TestCase" output="false">
	<cfscript>
		/**
		 * 
		 */
		public void function setup() {
			variables.i18n = createObject('component', 'cf-compendium.inc.resource.i18n.i18n').init(expandPath('/i18n/'));
		}
		
		/**
		 * Test the addBreak with valid arguments
		 */
		public void function testAddBreak() {
			var filter = createObject('component', 'cf-compendium.inc.resource.utility.filter').init(variables.i18n);
			
			filter.addBreak();
		}
		
		/**
		 * Test the addFilter with complete arguments
		 */
		public void function testAddFilter() {
			var filter = createObject('component', 'cf-compendium.inc.resource.utility.filter').init(variables.i18n);
			var options = createObject('component', 'cf-compendium.inc.resource.utility.options').init();
			
			filter.addFilter('test1', options);
		}
		
		/**
		 * Test the addFilter with a blank key
		 */
		public void function testAddFilter_SansKey() {
			var filter = createObject('component', 'cf-compendium.inc.resource.utility.filter').init(variables.i18n);
			
			expectException('any', 'Should not be able to add a filter without a key.');
			
			filter.addFilter('');
		}
		
		/**
		 * Test the addFilter without options
		 */
		public void function testAddFilter_SansOptions() {
			var filter = createObject('component', 'cf-compendium.inc.resource.utility.filter').init(variables.i18n);
			
			filter.addFilter('test1');
		}
		
		/**
		 * Test the length
		 */
		public void function testLength() {
			var filter = createObject('component', 'cf-compendium.inc.resource.utility.filter').init(variables.i18n);
			
			filter.addFilter('test1');
			filter.addFilter('test2');
			filter.addFilter('test3');
			
			assertEquals(3, filter.length());
		}
		
		/**
		 * Test calling the to HTML with valid filters. Just to make sure it runs.
		 */
		public void function testToHTML() {
			var filter = createObject('component', 'cf-compendium.inc.resource.utility.filter').init(variables.i18n);
			var theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init('');
			
			filter.addFilter('test1');
			
			// Should be able to generate HTML
			filter.toHTML(theUrl);
		}
		
		/**
		 * Test calling the to HTML without adding any filters
		 */
		public void function testToHTML_SansItems() {
			var filter = createObject('component', 'cf-compendium.inc.resource.utility.filter').init(variables.i18n);
			var theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init('');
			
			expectException('any', 'Should not be able to generate HTML if the filter has no items.');
			
			filter.toHTML(theUrl);
		}
	</cfscript>
</cfcomponent>