component extends="mxunit.framework.TestCase" {
	public void function setup() {
		variables.equivalentor = createObject('component', 'cf-compendium.inc.resource.utility.equivalent').init();
	}
	
	public void function testReturnFalseWithDifferentStructureAndDifferentValues() {
		var set1 = '';
		var set2 = '';
		
		// Structs
		set1 = {
			test0 = 2,
			test2 = 1
		};
		set2 = {
			test1 = 1,
			test2 = 2
		};
		
		assertFalse(variables.equivalentor.areEquivalent(set1, set2), 'Should be false if the structure is different');
	}
	
	public void function testReturnFalseWithSameStructureAndDifferentValues() {
		var set1 = '';
		var set2 = '';
		
		// Structs
		set1 = {
			test1 = 2,
			test2 = 1
		};
		set2 = {
			test1 = 1,
			test2 = 2
		};
		
		assertFalse(variables.equivalentor.areEquivalent(set1, set2), 'Should be false if the structure is the same but the values are different');
	}
	
	public void function testReturnTrueWithSameStructureAndSameValues() {
		var set1 = '';
		var set2 = '';
		
		// Structs
		set1 = {
			test1 = 1,
			test2 = 2
		};
		set2 = {
			test1 = 1,
			test2 = 2
		};
		
		assertTrue(variables.equivalentor.areEquivalent(set1, set2), 'Should be true when the structure and values are the same');
	}
	
	public void function testReturnTrueWithEmptySets() {
		var set1 = '';
		var set2 = '';
		
		// Structs
		set1 = {};
		set2 = {};
		
		assertTrue(variables.equivalentor.areEquivalent(set1, set2), 'Should be true when the structures are both blank');
	}
}
