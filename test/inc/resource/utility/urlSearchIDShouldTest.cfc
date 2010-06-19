component extends="mxunit.framework.TestCase" {
	public void function setup() {
		variables.theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url');
	}
	
	public void function testReturnValueWithMultipleValues() {
		variables.theUrl.init('ef=cool&pid=101');
		
		assertEquals(101, theUrl.searchID('pid'));
	}
	
	public void function testReturnZeroWithNonNumeric() {
		variables.theUrl.init('foo=bar');
		
		assertEquals('bar', theUrl.search('foo'));
	}
	
	public void function testReturnZeroWithoutValue() {
		variables.theUrl.init('');
		
		assertEquals(0, theUrl.searchID('foo'));
	}
	
	public void function testWithLocationReturnsValue() {
		variables.theUrl.init('ef=cool&pid=101');
		
		variables.theUrl.setMyLocation('pid', 200);
		
		assertEquals(200, theUrl.searchIDMyLocation('pid'));
	}
}
