component extends="mxunit.framework.TestCase" {
	public void function setup() {
		variables.theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url');
	}
	
	/**
	 * Using an empty struct should work fine.
	 */
	public void function testWorkWithEmptyString() {
		variables.theUrl.init('');
		
		assertEquals('?', theUrl.get());
	}
	
	/**
	 * Using an empty struct should work fine.
	 */
	public void function testWorkWithEmptyStruct() {
		variables.theUrl.init({});
		
		assertEquals('?', theUrl.get());
	}
}
