component extends="mxunit.framework.TestCase" {
	public void function setup() {
		variables.hmac = createObject('component', 'cf-compendium.inc.resource.security.hmac').init();
	}
	
	public void function testGetSignature_HmacMD5() {
		assertEquals('99CBA0CB7FF7B3210913C250FB9824A6', variables.hmac.getSignatureAsBase64('A little something to sign?', 'testingAKey', 'hmacMD5'));
	}
	
	public void function testGetSignature_HmacSHA1() {
		assertEquals('710F25E62C61CA594865E615A62248865FD74852', variables.hmac.getSignatureAsBase64('A little something to sign?', 'testingAKey', 'hmacSHA1'));
	}
	
	public void function testGetSignature_HmacSHA256() {
		assertEquals('BAF12C00DB4303ADB1BEEE0C9A093BE72B68E3A21130B9F1916223FC103437C0', variables.hmac.getSignatureAsBase64('A little something to sign?', 'testingAKey', 'hmacSHA256'));
	}
	
	public void function testGetSignature_HmacSHA384() {
		assertEquals('88DE472BF3D995830097CD1A35745B29BC8DDB3DEBB863F589F7BDD705A38007C13C72CBEEF6569CB68ADDC81DFF9D0F', variables.hmac.getSignatureAsBase64('A little something to sign?', 'testingAKey', 'hmacSHA384'));
	}
	
	public void function testGetSignature_HmacSHA512() {
		assertEquals('F8ADAAFFE65772FD585BF443F7C19BBBC63933396025C259942CD05FD4805C86BEC6E0044C2E8C6144DC19B4AC469219D1F304BF8B2305096E47411504BDD622', variables.hmac.getSignatureAsBase64('A little something to sign?', 'testingAKey', 'hmacSHA512'));
	}
}
