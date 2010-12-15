component extends="mxunit.framework.TestCase" {
	public void function setup() {
		variables.cleanData = createObject('component', 'cf-compendium.inc.resource.utility.cleanData').init();
	}
	
	public void function testPhone_withLetters_withCharacters() {
		assertEquals('TESTME1234', variables.cleanData.phone('TEST-ME-1234'));
	}
	
	public void function testPhone_withSpecialCharacters() {
		assertEquals('0987654321', variables.cleanData.phone('098-765(4321)'));
	}
	
	public void function testPhone_withWhitespace() {
		assertEquals('1234567890', variables.cleanData.phone('	123 456   7890'));
	}
}
