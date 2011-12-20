component extends="mxunit.framework.TestCase" {
	public void function setup() {
		variables.composite = createObject('component', 'cf-compendium.inc.resource.base.composite').init();
	}
	
	public void function testFailWithoutHandler() {
		expectException('any');
		
		variables.composite.testFunction();
	}
	
	public void function testMultipleHandlers_multipleAdd() {
		local.handler1 = createObject('component', 'test.fixture.inc.resource.base.composite.handler1').init();
		local.handler2 = createObject('component', 'test.fixture.inc.resource.base.composite.handler2').init();
		
		variables.composite._addHandler(local.handler1);
		variables.composite._addHandler(local.handler2);
		
		assertEquals('handler2-testing2', variables.composite.testing2());
	}
	
	public void function testMultipleHandlers_singleAdd() {
		local.handler1 = createObject('component', 'test.fixture.inc.resource.base.composite.handler1').init();
		local.handler2 = createObject('component', 'test.fixture.inc.resource.base.composite.handler2').init();
		
		variables.composite._addHandler(local.handler1, local.handler2);
		
		assertEquals('handler2-testing2', variables.composite.testing2());
	}
	
	public void function testSingleHandler() {
		local.handler1 = createObject('component', 'test.fixture.inc.resource.base.composite.handler1').init();
		
		variables.composite._addHandler(local.handler1);
		
		assertEquals('handler1-testing1', variables.composite.testing1());
	}
}
