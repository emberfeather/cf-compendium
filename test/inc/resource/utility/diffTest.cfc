component extends="mxunit.framework.TestCase" {
	public void function setup() {
		variables.diff = createObject('component', 'cf-compendium.inc.resource.utility.diff').init();
	}
	
	/**
	 * With duplicate values there should be nothing in the diff
	 **/
	public void function testDiffWithNestedStructsWithEqualValues() {
		local.original = { test1: 'true', test2: { test3: 'true' } };
		local.current = { test1: 'true', test2: { test3: 'true' } };
		
		local.result = variables.diff.diff(original, current);
		
		assertTrue(structIsEmpty(local.result.old));
		assertTrue(structIsEmpty(local.result.new));
	}
	
	/**
	 * With modified values the old key will hold the original value
	 * and new key will hold the new values
	 **/
	public void function testDiffWithNestedStructsWithModifiedValues() {
		local.original = { test1: 'true', test2: { test3: 'testOld' } };
		local.current = { test1: 'true', test2: { test3: 'testNew' } };
		
		local.result = variables.diff.diff(original, current);
		
		assertEquals('testOld', local.result.old.test2.test3);
		assertEquals('testNew', local.result.new.test2.test3);
	}
	
	/**
	 * With new values the new key will hold the new values
	 **/
	public void function testDiffWithNestedStructsWithNewValues() {
		local.original = { test1: 'true', test2: {} };
		local.current = { test1: 'true', test2: { test3: 'testNew' } };
		
		local.result = variables.diff.diff(original, current);
		
		assertTrue(structIsEmpty(local.result.old.test2));
		assertEquals('testNew', local.result.new.test2.test3);
	}
	
	/**
	 * With removed values the old key will hold the original value
	 **/
	public void function testDiffWithNestedStructsWithRemovedValues() {
		local.original = { test1: 'true', test2: { test3: 'testOld' } };
		local.current = { test1: 'true', test2: {} };
		
		local.result = variables.diff.diff(original, current);
		
		assertEquals('testOld', local.result.old.test2.test3);
		assertTrue(structIsEmpty(local.result.new.test2));
	}
	
	/**
	 * With duplicate values there should be nothing in the diff
	 **/
	public void function testDiffWithStructsWithEqualValues() {
		local.original = { test1: 'true' };
		local.current = { test1: 'true' };
		
		local.result = variables.diff.diff(original, current);
		
		assertTrue(structIsEmpty(local.result.old));
		assertTrue(structIsEmpty(local.result.new));
	}
	
	/**
	 * With modified values the old key will hold the original value
	 * and new key will hold the new values
	 **/
	public void function testDiffWithStructsWithModifiedValues() {
		local.original = { test1: 'testOld' };
		local.current = { test1: 'testNew' };
		
		local.result = variables.diff.diff(original, current);
		
		assertEquals('testOld', local.result.old.test1);
		assertEquals('testNew', local.result.new.test1);
	}
	
	/**
	 * With new values the new key will hold the new values
	 **/
	public void function testDiffWithStructsWithNewValues() {
		local.original = {};
		local.current = { test1: 'testNew' };
		
		local.result = variables.diff.diff(original, current);
		
		assertTrue(structIsEmpty(local.result.old));
		assertEquals('testNew', local.result.new.test1);
	}
	
	/**
	 * With duplicate values there should be nothing in the diff
	 **/
	public void function testDiffWithStructsWithNoValues() {
		local.original = {};
		local.current = {};
		
		local.result = variables.diff.diff(original, current);
		
		// With duplicate values there should be nothing in the diff
		assertTrue(structIsEmpty(local.result.old));
		assertTrue(structIsEmpty(local.result.new));
	}
	
	/**
	 * With removed values the old key will hold the original value
	 **/
	public void function testDiffWithStructsWithRemovedValues() {
		local.original = { test1: 'testOld' };
		local.current = {};
		
		local.result = variables.diff.diff(original, current);
		
		assertEquals('testOld', local.result.old.test1);
		assertTrue(structIsEmpty(local.result.new));
	}
}
