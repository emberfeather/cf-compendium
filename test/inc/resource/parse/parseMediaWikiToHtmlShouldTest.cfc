component extends="mxunit.framework.TestCase" {
	public function setup() {
		variables.parser = createObject('component', 'cf-compendium.inc.resource.parse.parseMediaWiki').init();
	}
	
	/**
	 * Test the ability to convert a title
	 */
	public void function testReturnHtmlFromSimpleHeader() {
		assertEquals('<h1 id="testing">Testing</h1>', trim(variables.parser.toHtml('= Testing =')));
	}
}
