<cfcomponent extends="mxunit.framework.TestCase" output="false">
	<cfscript>
		public function setup() {
			variables.parser = createObject('component', 'cf-compendium.inc.resource.parse.parseConfluence').init();
		}
		
		/**
		 * Test the ability to convert a title
		 */
		public void function testReturnHtmlFromSimpleHeader() {
			assertEquals('<h1 id="Testing">Testing</h1>', trim(variables.parser.toHtml('h1. Testing')));
		}
	</cfscript>
</cfcomponent>
