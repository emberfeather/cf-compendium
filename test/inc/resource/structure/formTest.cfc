<cfcomponent extends="mxunit.framework.TestCase" output="false">
	<cfscript>
		public void function setup() {
			variables.i18n = createObject('component', 'cf-compendium.inc.resource.i18n.i18n').init(expandPath('/i18n/'));
		}
		
		/**
		 * Tests to ensure that the form throws an error if requested without an action.
		 */
		public void function testShowFormSansAction() {
			var theForm = createObject('component', 'cf-compendium.inc.resource.structure.formStandard').init('test', variables.i18n);
			
			<!--- Hidden --->
			theForm.addElement('hidden', {
					name = "testHidden",
					label = "Hidden",
					value = "true"
				});
			
			try {
				theForm.toHTML();
				
				fail("toHTML should have thrown an error. [no action given]");
			} catch (mxunit.exception.AssertionFailedError exception) {
				rethrow();
			} catch (any exception) {
				// expect to get here
			}
		}
		
		/**
		 * Tests to ensure that the form throws an error if requested without any elements added.
		 */
		public void function testShowFormSansElement() {
			var theForm = createObject('component', 'cf-compendium.inc.resource.structure.formStandard').init('test', variables.i18n);
			
			try {
				theForm.toHTML('/');
				
				fail('toHTML should have thrown an error. [no elements to show]');
			} catch (mxunit.exception.AssertionFailedError exception) {
				rethrow();
			} catch (any exception) {
				// expect to get here
			}
		}
	</cfscript>
</cfcomponent>