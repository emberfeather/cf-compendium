<cfcomponent extends="mxunit.framework.TestCase" output="false">
	<cfscript>
		public void function setup() {
			variables.i18n = createObject('component', 'cf-compendium.inc.resource.i18n.i18n').init(expandPath('/'));
		}
		
		/**
		 * 
		 */
		public void function testIn_Invalid() {
			var validator = variables.i18n.getValidation('en_US');
			
			try {
				validator.in('testing', 'val', 'is,it,in,here');
				
				fail("Set should have thrown an error. ['val' is not in 'is,it,in,here']");
			} catch(mxunit.exception.AssertionFailedError exception) {
				rethrow();
			} catch(any exception) {
				// expect to get here
			}
		}
		
		/**
		 * 
		 */
		public void function testIn_Valid() {
			var validator = variables.i18n.getValidation('en_US');
			
			try {
				validator.in('testing', 'is', 'is,it,in,here');
			} catch (any exception) {
				fail("Set should not have thrown an error. ['is' is in 'is,it,in,here']");
			}
		}
		
		/**
		 * 
		 */
		public void function testNotIn_Invalid() {
			var validator = variables.i18n.getValidation('en_US');
			
			try {
				validator.notIn('testing', 'val', 'val,is,in,here');
				
				fail("Set should have thrown an error. ['val' is in 'val,is,in,here']");
			} catch (mxunit.exception.AssertionFailedError exception) {
				rethrow();
			} catch (any exception) {
				// expect to get here
			}
		}
		
		/**
		 * 
		 */
		public void function testNotIn_Valid() {
			var validator = variables.i18n.getValidation('en_US');
			
			try {
				validator.notIn('testing', 'waldo', 'val,is,in,here');
			} catch ( any exception ) {
				fail("Set should not have thrown an error. ['waldo' is not in 'val,is,in,here']");
			}
		}
	</cfscript>
</cfcomponent>