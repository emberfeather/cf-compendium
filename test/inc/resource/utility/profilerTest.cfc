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
			
			expectException('any', 'Should not be able to get a ticker that has not stopped.');
			
			profiler.getTicker('someTicker');
		}
		
		/**
		 * Tests what happens when you stop a ticker that was never started
		 */
		public void function testStopSansStart() {
			var profiler = createObject('component', 'cf-compendium.inc.resource.utility.profiler').init(true);
			
			expectException('any', 'Should not be able to stop a ticker you never started.');
			
			profiler.stop('someTicker');
		}
		
		/**
		 * Tests what happens when you stop a ticker that has already stopped
		 */
		public void function testStopExisting() {
			var profiler = createObject('component', 'cf-compendium.inc.resource.utility.profiler').init(true);
			
			expectException('any', 'Should not be able to stop a ticker you already stopped.');
			
			profiler.start('someTicker');
			profiler.stop('someTicker');
			profiler.stop('someTicker');
		}
	</cfscript>
</cfcomponent>