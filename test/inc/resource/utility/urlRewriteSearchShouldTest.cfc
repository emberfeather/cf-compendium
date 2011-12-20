component extends="mxunit.framework.TestCase" {
	public void function setup() {
		variables.theUrl = createObject('component', 'cf-compendium.inc.resource.utility.urlRewrite').init();
	}
	
	public void function testRemoveTrailingSlashOnBase() {
		variables.theUrl.setALocation('_base', '/total/coolness/');
		
		assertEquals('/total/coolness', variables.theUrl.searchALocation('_base'));
	}
}
