component extends="mxunit.framework.TestCase" {
	public void function setup() {
		variables.theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init('');
	}
	
	/**
	 * Make sure the the option for the url start works
	 */
	public void function testReturnDifferentStart() {
		assertEquals('/myStart/?', theUrl.getTest(true, { start = '/myStart/?' }));
	}
	
	/**
	 * Make sure the the option for the url start works
	 */
	public void function testReturnCustomEq() {
		variables.theUrl.setTest('test', 'true')
		
		assertEquals('?test~true', theUrl.getTest(true, { eqEncodeChar = '~' }));
	}
}
