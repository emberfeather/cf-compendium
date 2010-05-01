component extends="mxunit.framework.TestCase" {
	/**
	 * Tests that the confirm token works correctly
	 */
	public void function testConfirmToken() {
		var token = '';
		var tokens = createObject('component', 'cf-compendium.inc.resource.security.tokens').init();
		
		token = tokens.getTest();
		
		assertTrue( tokens.confirmTest(token), 'Token given did not confirm correctly' );
	}
	
	/**
	 * Tests that the confirm token fails when there is no token
	 */
	public void function testConfirmToken_SansToken() {
		var tokens = createObject('component', 'cf-compendium.inc.resource.security.tokens').init();
		
		assertFalse( tokens.confirmTest('someVal'), 'Tokens that are not created should return false' );
	}
	
	/**
	 * Tests that the token changes when requesting a reset token
	 */
	public void function testGetToken_Reset() {
		var token1 = '';
		var token2 = '';
		var tokens = createObject('component', 'cf-compendium.inc.resource.security.tokens').init();
		
		token1 = tokens.getTest();
		
		token2 = tokens.getTest( true );
		
		assertNotEquals(token1, token2, 'Tokens should be different when requesting a token with the reset flag');
	}
	
	/**
	 * Tests that the has token works
	 */
	public void function testHasToken() {
		var tokens = createObject('component', 'cf-compendium.inc.resource.security.tokens').init();
		
		tokens.getTest();
		
		assertTrue(tokens.hasTest(), 'The token should exist since it was generated');
	}
	
	/**
	 * Tests that the has token works without a token
	 */
	public void function testHasToken_SansToken() {
		var token1 = '';
		var token2 = '';
		var tokens = createObject('component', 'cf-compendium.inc.resource.security.tokens').init();
		
		assertFalse(tokens.hasTest(), 'The token should not exist since it was not generated');
	}
}
