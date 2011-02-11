component extends="mxunit.framework.TestCase" {
	public void function setup() {
		variables.theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init('');
	}
	
	public void function testContainAllKeys() {
		var theContrast = createObject('component', 'cf-compendium.inc.resource.utility.contrast').init();
		var newUrl = '';
		
		variables.theUrl.setTest({
			'aaron': 'awesomer',
			'randy': 'awesome',
			'tj': 'awesomerer'
		});
		
		newUrl = replace(variables.theUrl.getTest(false),'?','&', 'ALL');
		
		assertTrue(theContrast.areEqual('aaron=awesomer&tj=awesomerer&randy=awesome', newUrl, '&'));
	}
	
	public void function testContainAllKeysWithoutExtra() {
		var theContrast = createObject('component', 'cf-compendium.inc.resource.utility.contrast').init();
		var newUrl = '';
		
		variables.theUrl.set('test', {
			'aaron': 'awesomer',
			'randy': 'awesome',
			'tj': 'awesomerer'
		});
		
		newUrl = replace(variables.theUrl.getTest(false),'?','&', 'ALL');
		
		assertTrue(theContrast.areEqual('aaron=awesomer&tj=awesomerer&randy=awesome', newUrl, '&'));
	}
	
	public void function testContainExistingKeys() {
		var theContrast = createObject('component', 'cf-compendium.inc.resource.utility.contrast').init();
		var newUrl = '';
		
		variables.theUrl.setTest('example', 'value');
		
		variables.theUrl.setTest({
			'aaron': 'awesomer',
			'randy': 'awesome',
			'tj': 'awesomerer'
		});
		
		newUrl = replace(variables.theUrl.getTest(false),'?','&', 'ALL');
		
		assertTrue(theContrast.areEqual('example=value&aaron=awesomer&tj=awesomerer&randy=awesome', newUrl, '&'));
	}
	
	public void function testOverwriteExistingKeys() {
		var theContrast = createObject('component', 'cf-compendium.inc.resource.utility.contrast').init();
		var newUrl = '';
		
		variables.theUrl.setTest('randy', 'cool');
		
		variables.theUrl.setTest({
			'aaron': 'awesomer',
			'randy': 'awesome',
			'tj': 'awesomerer'
		});
		
		newUrl = replace(variables.theUrl.getTest(false),'?','&', 'ALL');
		
		assertTrue(theContrast.areEqual('aaron=awesomer&tj=awesomerer&randy=awesome', newUrl, '&'));
	}
}
