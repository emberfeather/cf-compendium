component extends="mxunit.framework.TestCase" {
	/**
	 * 
	 */
	public void function testLength() {
		var options = createObject('component', 'cf-compendium.inc.resource.utility.options').init();
		
		options.addOption('Test 1', 'Test1');
		options.addOption('Test 2', 'Test2');
		options.addOption('Test 3', 'Test3');
		
		assertEquals(3, options.length());
	}
	
	/**
	 * 
	 */
	public void function testLengthWithGroup() {
		var options = createObject('component', 'cf-compendium.inc.resource.utility.options').init();
		
		options.addOption('Test 1', 'Test1');
		options.addOption('Test 2', 'Test2');
		options.addOption('Test 3', 'Test3');
		
		options.addGroup('Group 1');
		
		options.addOption('Test 4', 'Test4');
		options.addOption('Test 5', 'Test5');
		options.addOption('Test 6', 'Test6');
		
		assertEquals(6, options.length());
	}
}
