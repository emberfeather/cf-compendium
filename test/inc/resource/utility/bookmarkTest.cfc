<cfcomponent extends="mxunit.framework.TestCase" output="false">
	<cfscript>
		/**
		 * 
		 */
		public void function testGet() {
			var theBookmark = createObject('component', 'cf-compendium.inc.resource.utility.bookmark').init();
			
			theBookmark.set('testAction', 1);
			
			assertEquals(theBookmark.get('testAction'), 1, 'Get Function returned incorrect value.');
		}
		
		/**
		 * 
		 */
		public void function testGet_Initialize() {
			var theBookmark = createObject('component', 'cf-compendium.inc.resource.utility.bookmark').init();
			
			assertEquals(theBookmark.get('testAction'), 1, 'Get Function returned incorrect value.');
		}
		
		/**
		 * 
		 */
		public void function testSet() {
			var theBookmark = createObject('component', 'cf-compendium.inc.resource.utility.bookmark').init();
			
			theBookmark.set('testAction', 4);
			
			assertEquals(theBookmark.get('testAction'), 4, 'Set Function set an incorrect value.');
		}
		
		/**
		 * 
		 */
		public void function testSet_Negative() {
			var theBookmark = createObject('component', 'cf-compendium.inc.resource.utility.bookmark').init();
			
			try {
				theBookmark.set('testAction', -1);
				
				fail("Set should have thrown an error. [negative value]");
			} catch(mxunit.exception.AssertionFailedError exception) {
				rethrow();
			} catch(any exception) {
				// expect to get here
			}
		}
		
		/**
		 * 
		 */
		public void function testSet_Large() {
			var theBookmark = createObject('component', 'cf-compendium.inc.resource.utility.bookmark').init();
			
			try {
				theBookmark.set('testAction', 100);
				
				fail("Set should have thrown an error. [value is too big]");
			} catch(mxunit.exception.AssertionFailedError exception) {
				rethrow();
			} catch(any exception) {
				// expect to get here
			}
		}
		
		/**
		 * 
		 */
		public void function testNext() {
			var theBookmark = createObject('component', 'cf-compendium.inc.resource.utility.bookmark').init();
			
			theBookmark.set('testAction', 3);
			theBookmark.next('testAction');
			
			assertEquals(theBookmark.get('testAction'), 4, 'Next Function returned an incorrect value.');
		}
		
		/**
		 * 
		 */
		public void function testPrev() {
			var theBookmark = createObject('component', 'cf-compendium.inc.resource.utility.bookmark').init();
			
			theBookmark.set('testAction', 3);
			theBookmark.prev('testAction');
			
			assertEquals(theBookmark.get('testAction'), 2, 'Prev Function returned an incorrect value.');
		}
		
		/**
		 * 
		 */
		public void function testReset() {
			var theBookmark = createObject('component', 'cf-compendium.inc.resource.utility.bookmark').init();
			
			theBookmark.set('testAction', 4);
			theBookmark.reset('testAction');
			
			assertEquals(theBookmark.get('testAction'), 1, 'Prev Function returned an incorrect value.');
		}
	</cfscript>
</cfcomponent>