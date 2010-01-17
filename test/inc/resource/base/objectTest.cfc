<cfcomponent extends="mxunit.framework.TestCase" output="false">
	<cfscript>
		/**
		 * Test the add functionality.
		 */
		public void function testAdd() {
			var theObject = createObject('component', 'cf-compendium.inc.resource.base.object').init();
			
			theObject.addTests('value1');
			theObject.addTests('value2');
			
			assertEquals(2, arrayLen(theObject.getTests()));
		}
		
		/**
		 * Test the add functionality with multiple arguments.
		 */
		public void function testAddMulti() {
			var theObject = createObject('component', 'cf-compendium.inc.resource.base.object').init();
			
			theObject.addTests('value1', 'value2');
			
			assertEquals(2, arrayLen(theObject.getTests()));
		}
		
		/**
		 * Test the add unique functionality.
		 */
		public void function testAddUnique() {
			var theObject = createObject('component', 'cf-compendium.inc.resource.base.object').init();
			
			theObject.addUniqueTests('value1');
			theObject.addUniqueTests('value2');
			theObject.addUniqueTests('value2');
			
			assertEquals(2, arrayLen(theObject.getTests()));
		}
		
		/**
		 * Test the add unique multi functionality.
		 */
		public void function testAddUniqueMulti() {
			var theObject = createObject('component', 'cf-compendium.inc.resource.base.object').init();
			
			theObject.addUniqueTests('value1', 'value2', 'value2');
			
			assertEquals(2, arrayLen(theObject.getTests()));
		}
		
		/**
		 * Test the get functionality.
		 */
		public void function testGet() {
			var theObject = createObject('component', 'cf-compendium.inc.resource.base.object').init();
			
			theObject.setTest('value');
			
			assertEquals('value', theObject.getTest());
		}
		
		/**
		 * Test the get by attribute functionality.
		 */
		public void function testGetBy() {
			var theObject = createObject('component', 'cf-compendium.inc.resource.base.object').init();
			
			theObject.addTests('valve', 'pressure', 'release', 'control', 'flow');
			
			assertEquals(3, arrayLen(theObject.getTestsBy('e$')));
		}
		
		/**
		 * Test the get object by attribute functionality.
		 */
		public void function testGetByAttribute() {
			var theObject = createObject('component', 'cf-compendium.inc.resource.base.object').init();
			var theObject1 = createObject('component', 'cf-compendium.inc.resource.base.object').init();
			var theObject2 = createObject('component', 'cf-compendium.inc.resource.base.object').init();
			var theObject3 = createObject('component', 'cf-compendium.inc.resource.base.object').init();
			var theObject4 = createObject('component', 'cf-compendium.inc.resource.base.object').init();
			var theObject5 = createObject('component', 'cf-compendium.inc.resource.base.object').init();
			
			theObject1.setTest('valve');
			theObject2.setTest('pressure');
			theObject3.setTest('release');
			theObject4.setTest('control');
			theObject5.setTest('flow');
			
			theObject.addTests(theObject1, theObject2, theObject3, theObject4, theObject5);
			
			assertEquals(3, arrayLen(theObject.getTestsByTest('e$')));
		}
		
		/**
		 * Test the get key list functionality.
		 */
		public void function testGetKeyList() {
			var theObject = createObject('component', 'cf-compendium.inc.resource.base.object').init();
			
			theObject.setTest('value');
			
			theObject.addAttribute('testing');
			theObject.addAttribute('again');
			theObject.addAttribute('for');
			theObject.addAttribute('bugs');
			
			theObject.setTester('value');
			
			assertEquals(3, listLen(theObject.get__KeyList()));
		}
		
		/**
		 * Test the length functionality.
		 */
		public void function testLengthArray() {
			var theObject = createObject('component', 'cf-compendium.inc.resource.base.object').init();
			var temp = [0, 1, 2, 3];
			
			theObject.setTest(temp);
			
			assertEquals(4, theObject.lengthTest());
		}
		
		/**
		 * Test the length functionality.
		 */
		public void function testLengthSimple() {
			var theObject = createObject('component', 'cf-compendium.inc.resource.base.object').init();
			
			theObject.setTest('value');
			
			assertEquals(5, theObject.lengthTest());
		}
		
		/**
		 * Test the length functionality.
		 */
		public void function testLengthStruct() {
			var theObject = createObject('component', 'cf-compendium.inc.resource.base.object').init();
			var temp = { test= 1, test1 = 2 };
			
			theObject.setTest(temp);
			
			assertEquals(2, theObject.lengthTest());
		}
		
		/**
		 * Test the properties functionality.
		 */
		public void function testProperties_simple() {
			var theObject = createObject('component', 'implementation.inc.resource.base.object1').init();
			
			assertEquals('value', theObject.getTest());
			assertEquals('bar', theObject.getFoo());
		}
		
		/**
		 * Test the properties functionality with nested complex elements.
		 */
		public void function testProperties_complex() {
			var theObject = createObject('component', 'implementation.inc.resource.base.object1').init();
			
			assertEquals('gum', theObject.getBubble()[1]);
			assertEquals('raboof', theObject.getFoobar().barfoo);
		}
		
		/**
		 * Test the set functionality.
		 */
		public void function testSet() {
			var theObject = createObject('component', 'cf-compendium.inc.resource.base.object').init();
			
			theObject.setTest('value');
			
			assertEquals('value', theObject.getTest());
		}
	</cfscript>
</cfcomponent>