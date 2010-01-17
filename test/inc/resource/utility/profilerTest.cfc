<!---
	Test for the functionality associated with the profiler.
	<p>
	These tests help to keep the accuracy of our code profiling.
--->
<cfcomponent extends="mxunit.framework.TestCase" output="false">
	<cfscript>
		/**
		 * Tests what happens when you get a ticker that has not been started.
		 */
		public void function testGetSansStart() {
			var profiler = createObject('component', 'cf-compendium.inc.resource.utility.profiler').init(true);
			
			try {
				profiler.getTicker('someTicker');
				
				fail('Should not be able to get a ticker that has not stopped.');
			} catch(mxunit.exception.AssertionFailedError exception) {
				rethrow();
			} catch(any exception) {
				// Expect to get here
			}
		}
		
		/**
		 * Tests what happens when you stop a ticker that was never started
		 */
		public void function testStopSansStart() {
			var profiler = createObject('component', 'cf-compendium.inc.resource.utility.profiler').init(true);
			
			try {
				profiler.stop('someTicker');
				
				fail('Should not be able to stop a ticker you never started.');
			} catch(mxunit.exception.AssertionFailedError exception) {
				rethrow();
			} catch(any exception) {
				// Expect to get here
			}
		}
		
		/**
		 * Tests what happens when you stop a ticker that has already stopped
		 */
		public void function testStopExisting() {
			var profiler = createObject('component', 'cf-compendium.inc.resource.utility.profiler').init(true);
			
			try {
				profiler.start('someTicker');
				profiler.stop('someTicker');
				profiler.stop('someTicker');
				
				fail('Should not be able to stop a ticker you already stopped.');
			} catch(mxunit.exception.AssertionFailedError exception) {
				rethrow();
			} catch(any exception) {
				// Expect to get here
			}
		}
	</cfscript>
</cfcomponent>