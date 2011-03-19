component extends="mxunit.framework.TestCase" {
	public void function setup() {
		var bundle = '';
		var format = '';
		
		variables.i18n = createObject('component', 'cf-compendium.inc.resource.i18n.i18n').init(expandPath('/'));
		variables.formatter = createObject('component', 'cf-compendium.inc.resource.format.format').init(variables.i18n, 'en_US');
	}
}
