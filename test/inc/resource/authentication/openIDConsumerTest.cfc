component extends="mxunit.framework.TestCase" {
	/**
	 * Tests whether the identity url can be found if the content attribute is first
	 */
	public void function testFindIdentifierRelFirst() {
		var openIDConsumer = createObject('component', 'cf-compendium.inc.resource.authentication.openIDConsumer').init();
		var tag = '';
		
		makePublic(openIDConsumer, 'findIdentifier');
		
		tag = '<link rel="openID" href="http://example.com/">';
		
		assertEquals('http://example.com/', openIDConsumer.findIdentifier(tag, 'openID'));
	}
	
	/**
	 * Tests whether the identity url can be found if the http-equiv attribute is first
	 */
	public void function testFindIdentifierHrefFirst() {
		var openIDConsumer = createObject('component', 'cf-compendium.inc.resource.authentication.openIDConsumer').init();
		var tag = '';
		
		makePublic(openIDConsumer, 'findIdentifier');
		
		tag = '<link href="http://example.com/" rel="openID">';
		
		assertEquals('http://example.com/', openIDConsumer.findIdentifier(tag, 'openID'));
	}
	
	/**
	 * Test that the identifier normalization is done correctly.
	 * 
	 * @see http://openid.net/specs/openid-authentication-2_0.html#normalization_example
	 */
	public void function testNormalizeIdentifier() {
		var openIDConsumer = createObject('component', 'cf-compendium.inc.resource.authentication.openIDConsumer').init();
		
		makePublic(openIDConsumer, 'normalizeIdentifier');
		
		assertEquals('http://example.com/', openIDConsumer.normalizeIdentifier('example.com'));
		assertEquals('http://example.com/', openIDConsumer.normalizeIdentifier('http://example.com'));
		assertEquals('https://example.com/', openIDConsumer.normalizeIdentifier('https://example.com/'));
		assertEquals('http://example.com/user', openIDConsumer.normalizeIdentifier('http://example.com/user'));
		assertEquals('http://example.com/user/', openIDConsumer.normalizeIdentifier('http://example.com/user/'));
		assertEquals('http://example.com/', openIDConsumer.normalizeIdentifier('http://example.com/'));
		assertEquals('=example', openIDConsumer.normalizeIdentifier('=example'));
		assertEquals('=example', openIDConsumer.normalizeIdentifier('xri://=example'));
	}
}
