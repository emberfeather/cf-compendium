component extends="mxunit.framework.TestCase" {
	public void function setup() {
		variables.theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url');
	}
	
	public void function testReturnEmptyWithoutValue() {
		variables.theUrl.init('');
		
		assertEquals('', theUrl.search('foo'));
	}
	
	public void function testReturnValueWithValue() {
		variables.theUrl.init('foo=bar');
		
		assertEquals('bar', theUrl.search('foo'));
	}
	
	public void function testReturnValueWithDottedValue() {
		variables.theUrl.init('foo.u=bar');
		
		assertEquals('bar', theUrl.search('foo.u'));
	}
	
	public void function testWithLocationReturnsValue() {
		variables.theURL.init('ef=cool');
		
		theUrl.setMyLocation('ef', 'smart');
		
		assertEquals("smart", theUrl.searchMyLocation('ef'));
	}
}
