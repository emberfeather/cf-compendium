component extends="mxunit.framework.TestCase" {
	public void function setup() {
		variables.extender = createObject('component', 'cf-compendium.inc.resource.utility.extend').init();
	}
	
	/**
	 * When extending an original that has keys that sub structs and the defaults have sub
	 * structs there is an option to recursively extend out the sub struct to 'merge' them.
	 * <p>
	 * This test is to determine if the 'infinity' option works with the recursion
	 */
	public void function testExtendDepthInfinity() {
		var defaults = {
				one = 1,
				two = {
					twoOne = 21,
					twoTwo = {
						twoTwoOne = 221
					},
					twoThree = 23
				},
				three = 3
			};
		var original = {
				two = {
					twoTwo = {
						twoTwoTwo = 222
					}
				}
			};
		var extended = variables.extender.extend(defaults, original, -1);
		
		if (not structKeyExists(extended.two.twoTwo, 'twoTwoOne')) {
			fail('The sub struct was not properly extended, ad infinitum');
		}
		
		assertEquals(221, extended.two.twoTwo.twoTwoOne);
	}
	
	/**
	 * When extending an original that has keys that sub structs and the defaults have sub
	 * structs there is an option to recursively extend out the sub struct to 'merge' them.
	 * <p>
	 * This test is to determine if the depth level option works with the recursion.
	 */
	public void function testExtendDepthLimit() {
		var defaults = {
				one = 1,
				two = {
					twoOne = 21
				},
				three = 3
			};
		var original = {
				two = {
					twoTwo = {
						twoTwoTwo = 222
					}
				}
			};
		var extended = variables.extender.extend(defaults, original, 2);
		
		if (not structKeyExists(extended.two, 'twoOne')) {
			fail('The sub struct extend failed to extend the depth required.');
		}
	}
	
	/**
	 * When extending an original that has keys that sub structs and the defaults have sub
	 * structs there is an option to recursively extend out the sub struct to 'merge' them.
	 * <p>
	 * This test is to determine if the depth level option works with the recursion but not
	 * too deep.
	 */
	public void function testExtendDepthLimitExcess() {
		var defaults = {
				one = 1,
				two = {
					twoOne = 21,
					twoTwo = {
						twoTwoOne = 221,
						twoTwoThree = {
							twoTwoThreeOne = 2231
						}
					}
				},
				three = 3
			};
		var original = {
				two = {
					twoTwo = {
						twoTwoTwo = 222,
						twoTwoThree = {
							twoTwoThreeTwo = 2232
						}
					}
				}
			};
		var extended = variables.extender.extend(defaults, original, 2);
		
		if (structKeyExists(extended.two.twotwo.twoTwoThree, 'twoTwoThreeOne')) {
			fail('The sub struct extend went farther than the determined number of depth levels.');
		}
		
		if (not structKeyExists(extended.two, 'twoOne')) {
			fail('The sub struct extend failed to extend the depth required.');
		}
	}
	
	/**
	 * When extending a struct the original struct should not be changed.
	 * <p>
	 * This test is used to make sure the original struct passed in is not the
	 * same as the extended returned. (Meaning the original was not modified.)
	 */
	public void function testExtendNonMutable() {
		var defaults = {
				one = 1,
				two = 2,
				three = 3
			};
		var original = {
				four = 4
			};
		var extended = variables.extender.extend(defaults, original);
		
		assertNotSame(extended, original, 'The original struct should not have been changed when extending.');
	}
	
	/**
	 * When extending an original any values that do not exist in the default should
	 * still be kept in the extended version.
	 * <p>
	 * This test is supposed to test what happens when you extend a struct that has a value that 
	 * does not exist in the defaults. It should return with all the defaults plus the original
	 * that was not in the defaults.
	 */
	public void function testExtendOriginal() {
		var defaults = {
				one = 1,
				two = 2,
				three = 3
			};
		var original = {
				four = 4
			};
		var extended = variables.extender.extend(defaults, original);
		
		assertEquals(4, structCount(extended), 'Missing some of the default struct keys.');
	}
	
	/**
	 * When extending an original any values that are in the original and in the defaults the 
	 * original value should be kept.
	 * <p>
	 * This test is supposed to test what happens when you extend a struct that has a value that 
	 * does exist in the defaults. It should return with all the originals plus the defaults
	 * that were not in the original.
	 */
	public void function testExtendOriginalWithDefault() {
		var defaults = {
				one = 1,
				two = 2,
				three = 3
			};
		var original = {
				three = 10
			};
		var extended = variables.extender.extend(defaults, original);
		
		assertNotEquals(extended.three, 3, 'The default value should have not been used in the extended since it existed in the original');
	}
	
	/**
	 * When given without an original set of values it should return the defaults.
	 */
	public void function testExtendSansOriginal() {
		var defaults = {
				one = 1,
				two = 2,
				three = 3
			};
		var extended = variables.extender.extend(defaults);
		
		assertEquals(3, structCount(extended), 'Missing some of the default struct keys.');
	}
	
	/**
	 * When extending a struct the default struct should not be changed.
	 * <p>
	 * This test is used to make sure the default struct passed in is not the
	 * same as the extended returned. (Meaning the default was not modified.)
	 */
	public void function testExtendSansOriginalNonMutable() {
		var defaults = {
				one = 1,
				two = 2,
				three = 3
			};
		var extended = variables.extender.extend(defaults);
		
		assertNotSame(extended, defaults, 'The default struct should be duplicated when extending.');
	}
}
