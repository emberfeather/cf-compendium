component extends="mxunit.framework.TestCase" {
	public void function beforeTests() {
		variables.i18n = createObject('component', 'cf-compendium.inc.resource.i18n.i18n').init(expandPath('/i18n/'));
		variables.objects = {};
		variables.structs = {
			complex: {
				bar: 'none',
				foo: {
					bar: true,
					sheet: false,
					length: 2
				},
				toad: [
					'stool',
					'pond',
					'stand'
				],
				turnedOn: createDate(2011, 11, 21)
			},
			simple: {
				banana: 'bread',
				expires: createDate(2010, 2, 5),
				isMoldy: true
			}
		};
		
		variables.objects.complex = createObject('component', 'cf-compendium.inc.resource.base.object').init();
		
		variables.objects.complex.setBar('none');
		
		local.foo = createObject('component', 'cf-compendium.inc.resource.base.object').init();
		local.foo.setBar(true);
		local.foo.setSheet(false);
		local.foo.setLength(2);
		
		variables.objects.complex.setFoo(local.foo);
		
		local.toad = createObject('component', 'cf-compendium.inc.resource.base.object').init();
		local.toad.setBar(true);
		local.toad.setSheet(false);
		local.toad.setLength(2);
		
		variables.objects.complex.setToad( [
			'stool',
			'pond',
			'stand'
		] );
		
		variables.objects.complex.setTurnedOn( createDate(2011, 11, 21) );
		
		variables.objects.simple = createObject('component', 'cf-compendium.inc.resource.base.object').init();
		
		variables.objects.simple.setBanana('bread');
		variables.objects.simple.setExpires(createDate(2010, 2, 5));
		variables.objects.simple.setIsMoldy(true);
	}
	
	public void function testDetail_object_blankOnMissing_withComplex() {
		local.detail = createObject('component', 'cf-compendium.inc.resource.structure.detail').init(variables.i18n, variables.objects.complex);
		
		assertEquals('', local.detail.get('test.test'));
	}
	
	public void function testDetail_object_blankOnMissing_withEmpty() {
		local.detail = createObject('component', 'cf-compendium.inc.resource.structure.detail').init(variables.i18n, {});
		
		assertEquals('', local.detail.get('test'));
	}
	
	public void function testDetail_object_blankOnMissing_withSimple() {
		local.detail = createObject('component', 'cf-compendium.inc.resource.structure.detail').init(variables.i18n, variables.objects.simple);
		
		assertEquals('', local.detail.get('test'));
	}
	
	public void function testDetail_object_value_withComplex() {
		local.detail = createObject('component', 'cf-compendium.inc.resource.structure.detail').init(variables.i18n, variables.objects.complex);
		
		assertEquals(true, local.detail.get('foo.bar'));
	}
	
	public void function testDetail_object_value_withSimple() {
		local.detail = createObject('component', 'cf-compendium.inc.resource.structure.detail').init(variables.i18n, variables.objects.simple);
		
		assertEquals('bread', local.detail.get('banana'));
	}
	
	public void function testDetail_struct_blankOnMissing_withComplex() {
		local.detail = createObject('component', 'cf-compendium.inc.resource.structure.detail').init(variables.i18n, variables.structs.complex);
		
		assertEquals('', local.detail.get('test.test'));
	}
	
	public void function testDetail_struct_blankOnMissing_withEmpty() {
		local.detail = createObject('component', 'cf-compendium.inc.resource.structure.detail').init(variables.i18n, {});
		
		assertEquals('', local.detail.get('test'));
	}
	
	public void function testDetail_struct_blankOnMissing_withSimple() {
		local.detail = createObject('component', 'cf-compendium.inc.resource.structure.detail').init(variables.i18n, variables.structs.simple);
		
		assertEquals('', local.detail.get('test'));
	}
	
	public void function testDetail_struct_value_withComplex() {
		local.detail = createObject('component', 'cf-compendium.inc.resource.structure.detail').init(variables.i18n, variables.structs.complex);
		
		assertEquals(true, local.detail.get('foo.bar'));
	}
	
	public void function testDetail_struct_value_withSimple() {
		local.detail = createObject('component', 'cf-compendium.inc.resource.structure.detail').init(variables.i18n, variables.structs.simple);
		
		assertEquals('bread', local.detail.get('banana'));
	}
}
