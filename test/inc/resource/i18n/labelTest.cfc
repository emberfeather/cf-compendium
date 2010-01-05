<cfcomponent extends="mxunit.framework.TestCase" output="false">
	<cfscript>
		/**
		 * 
		 */
		public void function setup() {
			variables.i18n = createObject('component', 'cf-compendium.inc.resource.i18n.i18n').init(expandPath('/i18n/'));
		}
		
		/**
		 * 
		 */
		public void function testGetLabel_WithBundle() {
			var label = createObject('component', 'cf-compendium.inc.resource.i18n.label').init(variables.i18n);
			
			label.addBundle('/cf-compendium/i18n/inc/resource/structure', 'form');
			
			assertEquals('Submit', label.getSubmit());
		}
		
		/**
		 * 
		 */
		public void function testGetLabel_WithBundleBlankKey() {
			var label = createObject('component', 'cf-compendium.inc.resource.i18n.label').init(variables.i18n);
			
			label.addBundle('/cf-compendium/i18n/inc/resource/structure', 'form');
			
			assertEquals('', label.get(''));
		}
		
		/**
		 * 
		 */
		public void function testGetLabel_WithBundleMissingKey() {
			var label = createObject('component', 'cf-compendium.inc.resource.i18n.label').init(variables.i18n);
			
			label.addBundle('/cf-compendium/i18n/inc/resource/structure', 'form');
			
			assertEquals('N/A', label.getKey());
		}
		
		/**
		 * 
		 */
		public void function testGetLabel_WithBundleMissingKeyWithDefault() {
			var label = createObject('component', 'cf-compendium.inc.resource.i18n.label').init(variables.i18n);
			
			label.addBundle('/cf-compendium/i18n/inc/resource/structure', 'form');
			
			assertEquals('Nah', label.getKey('Nah'));
		}
		
		/**
		 * 
		 */
		public void function testGetLabel_WithMultipleBundles_ShouldInherit() {
			var label = createObject('component', 'cf-compendium.inc.resource.i18n.label').init(variables.i18n);
			
			label.addBundle('/cf-compendium/i18n/inc/resource/structure', 'form');
			label.addBundle('/i18n/inc/resource/i18n', 'label');
			
			assertEquals('cancel', label.getCancel());
		}
		
		/**
		 * 
		 */
		public void function testGetLabel_WithMultipleBundles_ShouldOverride() {
			var label = createObject('component', 'cf-compendium.inc.resource.i18n.label').init(variables.i18n);
			
			label.addBundle('/cf-compendium/i18n/inc/resource/structure', 'form');
			label.addBundle('/i18n/inc/resource/i18n', 'label');
			
			assertEquals('test', label.getSubmit());
		}
		
		/**
		 * 
		 */
		public void function testGetLabel_WithoutBundles() {
			var label = createObject('component', 'cf-compendium.inc.resource.i18n.label').init(variables.i18n);
			
			assertEquals('N/A', label.getSubmit());
		}
	</cfscript>
</cfcomponent>