<!--- 
	Unit testing for the cfc parser
--->
<cfcomponent extends="mxunit.framework.TestCase" output="false">
	<cfscript>
		/**
		 * 
		 */
		public void function testIsComponent_Script_WithComponent_NonLazy() {
			var theParser = createObject('component', 'cf-compendium.inc.resource.utility.cfcParse').init(false);
			
			assertTrue(theParser.isComponent('/implementation/inc/resource/utility/componentScriptParse01.cfc'));
		}
		
		/**
		 * 
		 */
		public void function testIsComponent_Tag_WithComponent_NonLazy() {
			var theParser = createObject('component', 'cf-compendium.inc.resource.utility.cfcParse').init(false);
			
			assertTrue(theParser.isComponent('/implementation/inc/resource/utility/componentParse01.cfc'));
		}
		
		/**
		 * 
		 */
		public void function testIsComponent_Script_WithComponent_Lazy() {
			var theParser = createObject('component', 'cf-compendium.inc.resource.utility.cfcParse').init(true);
			
			assertTrue(theParser.isComponent('/implementation/inc/resource/utility/componentScriptParse01.cfc'));
		}
		
		/**
		 * 
		 */
		public void function testIsComponent_Tag_WithComponent_Lazy() {
			var theParser = createObject('component', 'cf-compendium.inc.resource.utility.cfcParse').init(true);
			
			assertTrue(theParser.isComponent('/implementation/inc/resource/utility/componentParse01.cfc'));
		}
		
		/**
		 * 
		 */
		public void function testIsComponent_Script_WithInterface_NonLazy() {
			var theParser = createObject('component', 'cf-compendium.inc.resource.utility.cfcParse').init(false);
			
			assertFalse(theParser.isComponent('/implementation/inc/resource/utility/interfaceScriptParse01.cfc'));
		}
		
		/**
		 * 
		 */
		public void function testIsComponent_Tag_WithInterface_NonLazy() {
			var theParser = createObject('component', 'cf-compendium.inc.resource.utility.cfcParse').init(false);
			
			assertFalse(theParser.isComponent('/implementation/inc/resource/utility/interfaceParse01.cfc'));
		}
		
		/**
		 * 
		 */
		public void function testIsComponent_Script_WithInterface_Lazy() {
			var theParser = createObject('component', 'cf-compendium.inc.resource.utility.cfcParse').init(true);
			
			assertTrue(theParser.isComponent('/implementation/inc/resource/utility/interfaceScriptParse01.cfc'));
		}
		
		/**
		 * 
		 */
		public void function testIsComponent_Tag_WithInterface_Lazy() {
			var theParser = createObject('component', 'cf-compendium.inc.resource.utility.cfcParse').init(true);
			
			assertTrue(theParser.isComponent('/implementation/inc/resource/utility/interfaceParse01.cfc'));
		}
		
		/**
		 * 
		 */
		public void function testIsScript_Script_WithComponent() {
			var theParser = createObject('component', 'cf-compendium.inc.resource.utility.cfcParse').init(true);
			
			assertTrue(theParser.isScript('/implementation/inc/resource/utility/componentScriptParse01.cfc'));
		}
		
		/**
		 * 
		 */
		public void function testIsScript_Tag_WithComponent() {
			var theParser = createObject('component', 'cf-compendium.inc.resource.utility.cfcParse').init(true);
			
			assertFalse(theParser.isScript('/implementation/inc/resource/utility/componentParse01.cfc'));
		}
		
		/**
		 * 
		 */
		public void function testIsScript_Script_WithInterface() {
			var theParser = createObject('component', 'cf-compendium.inc.resource.utility.cfcParse').init(true);
			
			assertTrue(theParser.isScript('/implementation/inc/resource/utility/interfaceScriptParse01.cfc'));
		}
		
		/**
		 * 
		 */
		public void function testIsScript_Tag_WithInterface() {
			var theParser = createObject('component', 'cf-compendium.inc.resource.utility.cfcParse').init(true);
			
			assertFalse(theParser.isScript('/implementation/inc/resource/utility/interfaceParse01.cfc'));
		}
		
		/**
		 * 
		 */
		public void function testParse_Script_ComponentComment() {
			var theParser = createObject('component', 'cf-compendium.inc.resource.utility.cfcParse').init(false);
			var parsed = theParser.parse('/implementation/inc/resource/utility/componentScriptParse01.cfc', 'init');
			
			assertEquals('Test Component Comment', parsed.comments.description[1]);
		}
		
		/**
		 * 
		 */
		public void function testParse_Script_FunctionComment() {
			var theParser = createObject('component', 'cf-compendium.inc.resource.utility.cfcParse').init(false);
			var parsed = theParser.parse('/implementation/inc/resource/utility/componentScriptParse01.cfc', 'init');
			
			assertEquals('Test Function Comment', parsed.methods.constructors[1].comments.description[1]);
		}
		
		/**
		 * 
		 */
		public void function testParse_Script_FunctionComment2() {
			var theParser = createObject('component', 'cf-compendium.inc.resource.utility.cfcParse').init(false);
			var parsed = theParser.parse('/implementation/inc/resource/utility/componentScriptParse01.cfc', 'init');
			
			assertEquals('Test Function 2 Comment', parsed.methods.functions[1].comments.description[1]);
		}
		
		/**
		 * 
		 */
		public void function testParse_Tag_ComponentComment() {
			var theParser = createObject('component', 'cf-compendium.inc.resource.utility.cfcParse').init(false);
			var parsed = theParser.parse('/implementation/inc/resource/utility/componentParse01.cfc', 'init');
			
			assertEquals('Test Component Comment', parsed.comments.description[1]);
		}
		
		/**
		 * 
		 */
		public void function testParse_Tag_FunctionComment() {
			var theParser = createObject('component', 'cf-compendium.inc.resource.utility.cfcParse').init(false);
			var parsed = theParser.parse('/implementation/inc/resource/utility/componentParse01.cfc', 'init');
			
			assertEquals('Test Function Comment', parsed.methods.constructors[1].comments.description[1]);
		}
		
		/**
		 * 
		 */
		public void function testParse_Tag_FunctionComment2() {
			var theParser = createObject('component', 'cf-compendium.inc.resource.utility.cfcParse').init(false);
			var parsed = theParser.parse('/implementation/inc/resource/utility/componentParse01.cfc', 'init');
			
			assertEquals('Test Function 2 Comment', parsed.methods.functions[1].comments.description[1]);
		}
	</cfscript>
</cfcomponent>