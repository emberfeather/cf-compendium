component extends="mxunit.framework.TestCase" {
	public void function setup() {
		variables.theStack = createObject('component', 'cf-compendium.inc.resource.utility.stack').init();
	}
	
	/**
	 * Test the Empty functions
	 */
	public void function testEmpty() {
		variables.theStack.push('test1');
		variables.theStack.push('test2');
		variables.theStack.push('test3');
		
		variables.theStack.empty();
		
		assertEquals(0, variables.theStack.length());
	}
	
	/**
	 * Test the isEmpty function for true
	 */
	public void function testIsEmptyTrue() {
		assertTrue(variables.theStack.isEmpty());
	}
	
	/**
	 * Test the isEmpty function for false
	 */
	public void function testIsEmptyFalse() {
		variables.theStack.push('test');
		
		assertFalse(variables.theStack.isEmpty());
	}
	
	/**
	 * Tests the length function with no values
	 */
	public void function testLengthEmpty() {
		assertEquals(0, variables.theStack.length());
	}
	
	/**
	 * Tests the length function with multiple values
	 */
	public void function testLengthMultiple() {
		variables.theStack.push('test1');
		variables.theStack.push('test2');
		variables.theStack.push('test3');
		variables.theStack.push('test4');
		
		assertEquals(4, variables.theStack.length());
	}
	
	/**
	 * Tests the pop function
	 */
	public void function testPop() {
		variables.theStack.push('test');
		
		assertEquals('test', variables.theStack.pop());
	}
	
	/**
	 * Tests the pop function with an empty stack
	 */
	public void function testPopFailOnEmpty() {
		expectException('any', 'Should not be able to pop off an empty stack');
		
		variables.theStack.pop();
	}
	
	/**
	 * Tests the pop function with multiple values
	 */
	public void function testPopMultiple() {
		variables.theStack.push('test1');
		variables.theStack.push('test2');
		variables.theStack.push('test3');
		variables.theStack.push('test4');
		
		assertEquals('test4', variables.theStack.pop());
		assertEquals('test3', variables.theStack.pop());
		assertEquals('test2', variables.theStack.pop());
		assertEquals('test1', variables.theStack.pop());
	}
	
	/**
	 * Tests the push function
	 */
	public void function testPush() {
		variables.theStack.push('test');
		
		assertFalse(variables.theStack.isEmpty());
	}
}
