component extends="mxunit.framework.TestCase" {
	/**
	 * Test the Empty functions
	 */
	public void function testEmpty() {
		var theStack = createObject('component', 'cf-compendium.inc.resource.utility.stack').init();
		
		theStack.push('test1');
		theStack.push('test2');
		theStack.push('test3');
		
		theStack.empty();
		
		assertEquals(0, theStack.length());
	}
	
	/**
	 * Test the isEmpty function for true
	 */
	public void function testIsEmptyTrue() {
		var theStack = createObject('component', 'cf-compendium.inc.resource.utility.stack').init();
		
		assertTrue(theStack.isEmpty());
	}
	
	/**
	 * Test the isEmpty function for false
	 */
	public void function testIsEmptyFalse() {
		var theStack = createObject('component', 'cf-compendium.inc.resource.utility.stack').init();
		
		theStack.push('test');
		
		assertFalse(theStack.isEmpty());
	}
	
	/**
	 * Tests the length function with no values
	 */
	public void function testLengthEmpty() {
		var theStack = createObject('component', 'cf-compendium.inc.resource.utility.stack').init();
		
		assertEquals(0, theStack.length());
	}
	
	/**
	 * Tests the length function with multiple values
	 */
	public void function testLengthMultiple() {
		var theStack = createObject('component', 'cf-compendium.inc.resource.utility.stack').init();
		
		theStack.push('test1');
		theStack.push('test2');
		theStack.push('test3');
		theStack.push('test4');
		
		assertEquals(4, theStack.length());
	}
	
	/**
	 * Tests the pop function
	 */
	public void function testPop() {
		var theStack = createObject('component', 'cf-compendium.inc.resource.utility.stack').init();
		
		theStack.push('test');
		
		assertEquals('test', theStack.pop());
	}
	
	/**
	 * Tests the pop function with an empty stack
	 */
	public void function testPopFailOnEmpty() {
		var theStack = createObject('component', 'cf-compendium.inc.resource.utility.stack').init();
		
		expectException('any', 'Should not be able to pop off an empty stack');
		
		theStack.pop();
	}
	
	/**
	 * Tests the pop function with multiple values
	 */
	public void function testPopMultiple() {
		var theStack = createObject('component', 'cf-compendium.inc.resource.utility.stack').init();
		
		theStack.push('test1');
		theStack.push('test2');
		theStack.push('test3');
		theStack.push('test4');
		
		assertEquals('test4', theStack.pop());
		assertEquals('test3', theStack.pop());
		assertEquals('test2', theStack.pop());
		assertEquals('test1', theStack.pop());
	}
	
	/**
	 * Tests the push function
	 */
	public void function testPush() {
		var theStack = createObject('component', 'cf-compendium.inc.resource.utility.stack').init();
		
		theStack.push('test');
		
		assertFalse(theStack.isEmpty());
	}
}
