component extends="mxunit.framework.TestCase" {
	public void function setup() {
		variables.theUrl = createObject('component', 'cf-compendium.inc.resource.utility.urlRewrite').init();
	}
	
	public void function testWithBase() {
		variables.theUrl.setALocation('chicken', 'awesome');
		variables.theUrl.setALocation('_base', '/total/coolness');
		
		assertEquals('/total/coolness?chicken=awesome', variables.theUrl.getALocation());
	}
	
	public void function testWithBaseOnly() {
		variables.theUrl.setALocation('_base', '/total/coolness');
		
		assertEquals('/total/coolness?', variables.theUrl.getALocation());
	}
	
	public void function testWithBaseTrailingSlash() {
		variables.theUrl.setALocation('chicken', 'awesome');
		variables.theUrl.setALocation('_base', '/total/coolness/');
		
		assertEquals('/total/coolness/?chicken=awesome', variables.theUrl.getALocation());
	}
	
	/**
	 * Test a custom base variable
	 */
	public void function testWithCustomBase() {
		variables.theUrl.setALocation('chicken', 'awesome');
		
		variables.theUrl.setALocation('_test', '/tastes')
		
		assertEquals('/tastes?chicken=awesome', variables.theUrl.getALocation(false, { rewriteBase = '_test' }));
	}
	
	public void function testWithoutBaseValue() {
		variables.theUrl.setALocation('chicken', 'awesome');
		
		assertEquals('?chicken=awesome', variables.theUrl.getALocation());
	}
	
	public void function testWithCleanStart() {
		variables.theUrl.cleanALocation();
		variables.theUrl.setALocation('beef', 'super');
		variables.theUrl.setALocation('_base', '/total/coolness');
		
		assertEquals('/admin/total/coolness?beef=super', variables.theUrl.getALocation(false, { start = '/admin' }));
	}
	
	public void function testWithStart() {
		variables.theUrl.setALocation('chicken', 'awesome');
		variables.theUrl.setALocation('_base', '/total/coolness');
		
		assertEquals('/admin/total/coolness?chicken=awesome', variables.theUrl.getALocation(false, { start = '/admin' }));
	}
	
	public void function testWithStartTrailingSlash() {
		variables.theUrl.setALocation('chicken', 'awesome');
		variables.theUrl.setALocation('_base', '/total/coolness');
		
		assertEquals('/admin/total/coolness?chicken=awesome', variables.theUrl.getALocation(false, { start = '/admin/' }));
	}
}
