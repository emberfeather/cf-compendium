component extends="mxunit.framework.TestCase" {
	public void function setup() {
		variables.equivalentor = createObject('component', 'cf-compendium.inc.resource.utility.equivalent').init();
	}
	
	public void function testReturnFalseWithDifferentArrayLengths() {
		var set1 = '';
		var set2 = '';
		
		// Structs
		set1 = [
			1,
			2,
			3
		];
		set2 = [
			1,
			2
		];
		
		assertFalse(variables.equivalentor.areEquivalent(set1, set2), 'Should be false if the array length is different');
	}
	
	public void function testReturnTrueWithSameValues() {
		var set1 = '';
		var set2 = '';
		
		// Structs
		set1 = [
			1,
			2
		];
		set2 = [
			1,
			2
		];
		
		assertTrue(variables.equivalentor.areEquivalent(set1, set2), 'Should be true if the arrays hold the same values');
	}
	
	public void function testReturnTrueWithEmptySets() {
		var set1 = '';
		var set2 = '';
		
		// Structs
		set1 = [
		];
		set2 = [
		];
		
		assertTrue(variables.equivalentor.areEquivalent(set1, set2), 'Should be true if the arrays are blank');
	}
}
