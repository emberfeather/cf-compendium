component extends="mxunit.framework.TestCase" {
	public void function setup() {
		variables.source = {};
		
		variables.source.A = {
			A1: 101,
			A2: 1112
		};
		
		variables.source.B = createObject('component', 'cf-compendium.inc.resource.base.object').init();
		variables.source.B.setB1(25486);
		variables.source.B.setB2(54813);
		
		variables.source.C = {
			C1: createObject('component', 'cf-compendium.inc.resource.base.object').init(),
			C2: createObject('component', 'cf-compendium.inc.resource.base.object').init()
		}
		variables.source.C.C1.setC1a(8461);
		variables.source.C.C2.setC2a(67461);
		
		variables.source.D = createObject('component', 'cf-compendium.inc.resource.base.object').init();
		variables.source.D.setD1({ D1a: 98983 });
		variables.source.D.setD2({ D2a: 15484 });
		
		variables.introspect = createObject('component', 'cf-compendium.inc.resource.utility.introspect').init(variables.source);
	}
	
	public void function testReturnBlankOnMissingNestedObjectStruct() {
		assertEquals('', variables.introspect.get('B.B1.Foo'));
		assertEquals('', variables.introspect.get('B.B2.Foo.Bar'));
	}
	
	public void function testReturnBlankOnMissingNestedStructObject() {
		assertEquals('', variables.introspect.get('A.A1.Foo'));
		assertEquals('', variables.introspect.get('A.A2.Foo.Bar'));
	}
	
	public void function testReturnBlankOnMissingSimpleObject() {
		assertEquals('', variables.introspect.get('B.Foo'));
		assertEquals('', variables.introspect.get('B.Foo.Bar'));
	}
	
	public void function testReturnBlankOnMissingSimpleStruct() {
		assertEquals('', variables.introspect.get('A.Foo'));
		assertEquals('', variables.introspect.get('A.Foo.Bar'));
	}
	
	public void function testReturnNestedObjectStructValue() {
		assertEquals(variables.source.D.getD1().D1a, variables.introspect.get('D.D1.D1a'));
		assertEquals(variables.source.D.getD2().D2a, variables.introspect.get('D.D2.D2a'));
	}
	
	public void function testReturnNestedStructObjectValue() {
		assertEquals(variables.source.C.C1.getC1a(), variables.introspect.get('C.C1.C1a'));
		assertEquals(variables.source.C.C2.getC2a(), variables.introspect.get('C.C2.C2a'));
	}
	
	public void function testReturnSimpleObjectValue() {
		assertEquals(variables.source.B.getB1(), variables.introspect.get('B.B1'));
		assertEquals(variables.source.B.getB2(), variables.introspect.get('B.B2'));
	}
	
	public void function testReturnSimpleStructValue() {
		assertEquals(variables.source.A.A1, variables.introspect.get('A.A1'));
		assertEquals(variables.source.A.A2, variables.introspect.get('A.A2'));
	}
}
