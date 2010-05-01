component extends="mxunit.framework.TestCase" {
	/**
	 * 
	 */
	public void function setup() {
		variables.base62 = createObject('component', 'cf-compendium.inc.resource.utility.base62').init();
	}
	
	/**
	 * 
	 */
	public void function testBase62ToValue_With2bI() {
		var base = '2bI';
		
		assertEquals(10000, variables.base62.base62ToValue(base), 'Incorrectly converted #base# to value');
	}
	
	/**
	 * 
	 */
	public void function testBase62ToValue_With8M0kX() {
		var base = '8M0kX';
		
		assertEquals(123456789, variables.base62.base62ToValue(base), 'Incorrectly converted #base# to value');
	}
	
	/**
	 * 
	 */
	public void function testBase62ToValue_WithG8() {
		var base = 'G8';
		
		assertEquals(1000, variables.base62.base62ToValue(base), 'Incorrectly converted #base# to value');
	}
	
	/**
	 * 
	 */
	public void function testValueToBase62_With1000() {
		var value = 1000;
		
		assertEquals('G8', variables.base62.valueToBase62(1000), 'Incorrectly converted #value# to base62');
	}
	
	/**
	 * 
	 */
	public void function testValueToBase62_With10000() {
		var value = 10000;
		
		assertEquals('2bI', variables.base62.valueToBase62(value), 'Incorrectly converted #value# to base62');
	}
	
	/**
	 * 
	 */
	public void function testValueToBase62_With123456789() {
		var value = 123456789;
		
		assertEquals('8M0kX', variables.base62.valueToBase62(value), 'Incorrectly converted #value# to base62');
	}
}
