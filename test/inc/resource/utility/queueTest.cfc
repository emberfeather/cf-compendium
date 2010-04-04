<cfcomponent extends="mxunit.framework.TestCase" output="false">
	<cfscript>
		/**
		 * Test the Empty functions
		 */
		public void function testEmpty() {
			var theQueue = createObject('component', 'cf-compendium.inc.resource.utility.queue').init();
			
			theQueue.push('test1');
			theQueue.push('test2');
			theQueue.push('test3');
			
			theQueue.empty();
			
			assertEquals(0, theQueue.length());
		}
		
		/**
		 * Test the isEmpty function for true
		 */
		public void function testIsEmptyTrue() {
			var theQueue = createObject('component', 'cf-compendium.inc.resource.utility.queue').init();
			
			assertTrue(theQueue.isEmpty());
		}
		
		/**
		 * Test the isEmpty function for false
		 */
		public void function testIsEmptyFalse() {
			var theQueue = createObject('component', 'cf-compendium.inc.resource.utility.queue').init();
			
			theQueue.push('test');
			
			assertFalse(theQueue.isEmpty());
		}
		
		/**
		 * Tests the length function with no values
		 */
		public void function testLengthEmpty() {
			var theQueue = createObject('component', 'cf-compendium.inc.resource.utility.queue').init();
			
			assertEquals(0, theQueue.length());
		}
		
		/**
		 * Tests the length function with multiple values
		 */
		public void function testLengthMultiple() {
			var theQueue = createObject('component', 'cf-compendium.inc.resource.utility.queue').init();
			
			theQueue.push('test1');
			theQueue.push('test2');
			theQueue.push('test3');
			theQueue.push('test4');
			
			assertEquals(4, theQueue.length());
		}
		
		/**
		 * Tests the pop function
		 */
		public void function testPop() {
			var theQueue = createObject('component', 'cf-compendium.inc.resource.utility.queue').init();
			
			theQueue.push('test');
			
			assertEquals('test', theQueue.pop());
		}
		
		/**
		 * Tests the pop function with an empty queue
		 */
		public void function testPopFailOnEmpty() {
			var theQueue = createObject('component', 'cf-compendium.inc.resource.utility.queue').init();
			
			expectException('any', 'Should not be able to pop off an empty queue');
			
			theQueue.pop();
		}
		
		/**
		 * Tests the pop function with multiple values
		 */
		public void function testPopMultiple() {
			var theQueue = createObject('component', 'cf-compendium.inc.resource.utility.queue').init();
			
			theQueue.push('test1');
			theQueue.push('test2');
			theQueue.push('test3');
			theQueue.push('test4');
			
			assertEquals('test1', theQueue.pop());
			assertEquals('test2', theQueue.pop());
			assertEquals('test3', theQueue.pop());
			assertEquals('test4', theQueue.pop());
		}
		
		/**
		 * Tests the push function
		 */
		public void function testPush() {
			var theQueue = createObject('component', 'cf-compendium.inc.resource.utility.queue').init();
			
			theQueue.push('test');
			
			assertFalse(theQueue.isEmpty());
		}
	</cfscript>
</cfcomponent>