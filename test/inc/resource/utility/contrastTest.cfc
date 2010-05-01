component extends="mxunit.framework.TestCase" {
	/**
	 * 
	 */
	public void function setup() {
		variables.contrastor = createObject('component', 'cf-compendium.inc.resource.utility.contrast').init();
	}
	
	/**
	 * Tests to see if two elements DO not contain the same values pairs regardless of order of elements
	 */
	public void function testAreEqualFalse() {
		var set1 = '';
		var set2 = '';
		
		// Lists
		set1 = 'four,five,six';
		set2 = 'three,one,two';
		
		assertFalse(variables.contrastor.areEqual(set1, set2));
		
		// Arrays
		set1 = [4,5,6,7];
		set2 = [3,1,2];
		
		assertFalse(variables.contrastor.areEqual(set1, set2));
		
		// Structs
		set1 = { test8 = 0, test3 = 0, test1 = 0 };
		set2 = { test1 = 0, test2 = 0, test3 = 0 };
		
		assertFalse(variables.contrastor.areEqual(set1, set2));
	}
	
	/**
	 * Tests to see if two elements contain the same values pairs regardless of order of elements
	 */
	public void function testAreEqualTrue() {
		var set1 = '';
		var set2 = '';
		
		// Lists
		set1 = 'one,two,three';
		set2 = 'three,one,two';
		
		assertTrue(variables.contrastor.areEqual(set1, set2));
		
		// Arrays
		set1 = [1,2,3];
		set2 = [3,1,2];
		
		assertTrue(variables.contrastor.areEqual(set1, set2));
		
		// Structs
		set1 = { test2 = 0, test3 = 0, test1 = 0 };
		set2 = { test1 = 0, test2 = 0, test3 = 0 };
		
		assertTrue(variables.contrastor.areEqual(set1, set2));
	}
	
	/**
	 * Tests to see if two elements DO not contain the same values pairs regardless of order of elements
	 * for a set
	 */
	public void function testAreEqualSetFalse() {
		var set1 = '';
		var set2 = '';
		var set3 = '';
		
		// Lists
		set1 = 'four,five,six';
		set2 = 'three,one,two';
		set3 = 'seven, eight, nine';
		
		assertFalse(variables.contrastor.areEqualSet(set1, set2, set3));
		
		// Arrays
		set1 = [4,5,6,7];
		set2 = [3,1,2];
		set3 = [9];
		
		assertFalse(variables.contrastor.areEqualSet(set1, set2, set3));
		
		// Structs
		set1 = { test8 = 0, test3 = 0, test1 = 0 };
		set2 = { test1 = 0, test2 = 0, test3 = 0 };
		set3 = { test9 = 0, test11 = 0, test10 = 0 };
		
		assertFalse(variables.contrastor.areEqualSet(set1, set2, set3));
	}
	
	/**
	 * Tests to see if two elements contain the same values pairs regardless of order of elements
	 * for a set
	 */
	public void function testAreEqualSetTrue() {
		var set1 = '';
		var set2 = '';
		var set3 = '';
		
		// Lists
		set1 = 'one,two,three';
		set2 = 'three,one,two';
		set3 = 'two,three,one';
		
		assertTrue(variables.contrastor.areEqualSet(set1, set2, set3));
		
		// Arrays
		set1 = [1,2,3];
		set2 = [3,1,2];
		set3 = [2,3,1];
		
		assertTrue(variables.contrastor.areEqualSet(set1, set2, set3));
		
		// Structs
		set1 = { test2 = 0, test3 = 0, test1 = 0 };
		set2 = { test1 = 0, test2 = 0, test3 = 0 };
		set3 = { test3 = 0, test1 = 0, test2 = 0 };
		
		assertTrue(variables.contrastor.areEqualSet(set1, set2, set3));
	}
	
	/**
	 * Tests to see if the contrast will fail if given two different types
	 * that it will fail. With the exception of array and list collusion.
	 */
	public void function testContrastFailWithTypeMismatch() {
		var set1 = '';
		var set2 = '';
		
		expectException('any', 'Should not be able to contrast the two given types');
		
		set1 = queryNew('something,also,here');
		set2 = 'cannot,be,done';
		
		variables.contrastor.contrast(set1, set2);
	}
	
	/**
	 * Tests the contrast with same types
	 */
	public void function testContrast() {
		var set1 = '';
		var set2 = '';
		
		// Lists
		set1 = 'testing,this,here';
		set2 = 'can,be,done';
		
		variables.contrastor.contrast(set1, set2);
		
		// Arrays
		set1 = [1,2,3];
		set2 = [4,2,5];
		
		variables.contrastor.contrast(set1, set2);
		
		// Structs
		set1 = { test4 = 0, test2 = 0, test0 = 0 };
		set2 = { test1 = 0, test2 = 0, test3 = 0 };
		
		variables.contrastor.contrast(set1, set2);
	}
	
	/**
	 * Tests the contrast with different types
	 */
	public void function testContrast_WithTypeMismatch() {
		var set1 = '';
		var set2 = '';
		
		// Array and List
		set1 = [1,2,3];
		set2 = 'can,be,done';
		
		variables.contrastor.contrast(set1, set2);
		
		// List and Array
		set1 = 'can,be,done';
		set2 = [1,2,3];
		
		variables.contrastor.contrast(set1, set2);
		
		// Struct and List
		set1 = { test1 = 0, test2 = 0, test3 = 0 };
		set2 = 'can,be,done';
		
		variables.contrastor.contrast(set1, set2);
		
		// List and Struct
		set1 = 'can,be,done';
		set2 = { test1 = 0, test2 = 0, test3 = 0 };
		
		variables.contrastor.contrast(set1, set2);
		
		// Struct and Array
		set1 = { test1 = 0, test2 = 0, test3 = 0 };
		set2 = [4,3,5];
		
		variables.contrastor.contrast(set1, set2);
		
		// Array and Struct
		set1 = [4,3,5];
		set2 = { test1 = 0, test2 = 0, test3 = 0 };
		
		variables.contrastor.contrast(set1, set2);
	}
	
	/**
	 * Tests the contrast with same types and a custom delimiter
	 */
	public void function testContrastWithDelimiter() {
		var set1 = '';
		var set2 = '';
		
		// Lists
		set1 = 'testing|this|here';
		set2 = 'can|be|done';
		
		variables.contrastor.contrast(set1, set2, '|');
		
		// Arrays
		set1 = [1,2,3];
		set2 = [4,2,5];
		
		variables.contrastor.contrast(set1, set2, '|');
		
		// Structs
		set1 = { test4 = 0, test2 = 0, test0 = 0 };
		set2 = { test1 = 0, test2 = 0, test3 = 0 };
		
		variables.contrastor.contrast(set1, set2, '|');
	}
}
