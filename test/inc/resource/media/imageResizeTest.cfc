<cfcomponent extends="mxunit.framework.TestCase" output="false">
	<cfscript>
		/**
		 * Test the calculateMaxFit with a 4x3 ratio original image and using a 1x1 resolution ratio.
		 */
		public void function testCalculateMaxFit4x3with1x1() {
			var theObject = createObject('component', 'cf-compendium.inc.resource.media.imageResize').init();
			var resolutions = [
					{
						width = 1000,
						height = 1000
					}
				];
			var result = '';
			
			result = theObject.calculateMaxFit(4000, 3000, resolutions);
			
			assertEquals(3000, result[resolutions[1].ratio].width);
			assertEquals(3000, result[resolutions[1].ratio].height);
		}
		
		/**
		 * Test the calculateMaxFit with a 4x3 ratio original image and using a 1x5 resolution ratio.
		 */
		public void function testCalculateMaxFit4x3with1x5() {
			var theObject = createObject('component', 'cf-compendium.inc.resource.media.imageResize').init();
			var resolutions = [
					{
						width = 100,
						height = 500
					}
				];
			var result = '';
			
			result = theObject.calculateMaxFit(4000, 3000, resolutions);
			
			assertEquals(600, result[resolutions[1].ratio].width);
			assertEquals(3000, result[resolutions[1].ratio].height);
		}
		
		/**
		 * Test the calculateMaxFit with a 4x3 ratio original image and using a 1x10 resolution ratio.
		 */
		public void function testCalculateMaxFit4x3with1x10() {
			var theObject = createObject('component', 'cf-compendium.inc.resource.media.imageResize').init();
			var resolutions = [
					{
						width = 100,
						height = 1000
					}
				];
			var result = '';
			
			result = theObject.calculateMaxFit(4000, 3000, resolutions);
			
			assertEquals(300, result[resolutions[1].ratio].width);
			assertEquals(3000, result[resolutions[1].ratio].height);
		}
		
		/**
		 * Test the calculateMaxFit with a 4x3 ratio original image and using a 5x1 resolution ratio.
		 */
		public void function testCalculateMaxFit4x3with5x1() {
			var theObject = createObject('component', 'cf-compendium.inc.resource.media.imageResize').init();
			var resolutions = [
					{
						width = 500,
						height = 100
					}
				];
			var result = '';
			
			result = theObject.calculateMaxFit(4000, 3000, resolutions);
			
			assertEquals(4000, result[resolutions[1].ratio].width);
			assertEquals(800, result[resolutions[1].ratio].height);
		}
		
		/**
		 * Test the calculateMaxFit with a 4x3 ratio original image and using a 10x1 resolution ratio.
		 */
		public void function testCalculateMaxFit4x3with10x1() {
			var theObject = createObject('component', 'cf-compendium.inc.resource.media.imageResize').init();
			var resolutions = [
					{
						width = 1000,
						height = 100
					}
				];
			var result = '';
			
			result = theObject.calculateMaxFit(4000, 3000, resolutions);
			
			assertEquals(4000, result[resolutions[1].ratio].width);
			assertEquals(400, result[resolutions[1].ratio].height);
		}
		
		/**
		 * Test the calculateMaxFit with a 3x4 ratio original image and using a 1x1 resolution ratio.
		 */
		public void function testCalculateMaxFit3x4with1x1() {
			var theObject = createObject('component', 'cf-compendium.inc.resource.media.imageResize').init();
			var resolutions = [
					{
						width = 1000,
						height = 1000
					}
				];
			var result = '';
			
			result = theObject.calculateMaxFit(3000, 4000, resolutions);
			
			assertEquals(3000, result[resolutions[1].ratio].width);
			assertEquals(3000, result[resolutions[1].ratio].height);
		}
		
		/**
		 * Test the calculateMaxFit with a 3x4 ratio original image and using a 1x5 resolution ratio.
		 */
		public void function testCalculateMaxFit3x4with1x5() {
			var theObject = createObject('component', 'cf-compendium.inc.resource.media.imageResize').init();
			var resolutions = [
					{
						width = 100,
						height = 500
					}
				];
			var result = '';
			
			result = theObject.calculateMaxFit(3000, 4000, resolutions);
			
			assertEquals(800, result[resolutions[1].ratio].width);
			assertEquals(4000, result[resolutions[1].ratio].height);
		}
		
		/**
		 * Test the calculateMaxFit with a 3x4 ratio original image and using a 1x10 resolution ratio.
		 */
		public void function testCalculateMaxFit3x4with10x10() {
			var theObject = createObject('component', 'cf-compendium.inc.resource.media.imageResize').init();
			var resolutions = [
					{
						width = 100,
						height = 1000
					}
				];
			var result = '';
			
			result = theObject.calculateMaxFit(3000, 4000, resolutions);
			
			assertEquals(400, result[resolutions[1].ratio].width);
			assertEquals(4000, result[resolutions[1].ratio].height);
		}
		
		/**
		 * Test the calculateMaxFit with a 3x4 ratio original image and using a 5x1 resolution ratio.
		 */
		public void function testCalculateMaxFit3x4with5x1() {
			var theObject = createObject('component', 'cf-compendium.inc.resource.media.imageResize').init();
			var resolutions = [
					{
						width = 500,
						height = 100
					}
				];
			var result = '';
			
			result = theObject.calculateMaxFit(3000, 4000, resolutions);
			
			assertEquals(3000, result[resolutions[1].ratio].width);
			assertEquals(600, result[resolutions[1].ratio].height);
		}
		
		/**
		 * Test the calculateMaxFit with a 3x4 ratio original image and using a 10x1 resolution ratio.
		 */
		public void function testCalculateMaxFit3x4with10x1() {
			var theObject = createObject('component', 'cf-compendium.inc.resource.media.imageResize').init();
			var resolutions = [
					{
						width = 1000,
						height = 100
					}
				];
			var result = '';
			
			result = theObject.calculateMaxFit(3000, 4000, resolutions);
			
			assertEquals(3000, result[resolutions[1].ratio].width);
			assertEquals(300, result[resolutions[1].ratio].height);
		}
	</cfscript>
</cfcomponent>