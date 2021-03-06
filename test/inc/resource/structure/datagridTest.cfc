component extends="mxunit.framework.TestCase" {
	public void function setup() {
		variables.i18n = createObject('component', 'cf-compendium.inc.resource.i18n.i18n').init(expandPath('/i18n/'));
	}
	
	public void function testAddColumn_WithOptions() {
		var datagrid = createObject('component', 'cf-compendium.inc.resource.structure.datagrid').init(variables.i18n);
		
		datagrid.addColumn({
				label = "First Name"
			});
	}
	
	/**
	 * Test the calculate derived with simple array for the currentRow
	 */
	public void function testCalculateDerived_WithArray_CurrentRow() {
		var datagrid = createObject('component', 'cf-compendium.inc.resource.structure.datagrid').init(variables.i18n);
		var data = '';
		
		makePublic(datagrid, 'calculateDerived');
		
		data = [ 11, 22, 33, 44 ];
		
		assertEquals(4, datagrid.calculateDerived({}, 'currentRow', '', data, 4, { startRow = 1 }));
	}
	
	/**
	 * Test the calculate derived with simple array for a running sum
	 */
	public void function testCalculateDerived_WithArray_RunningSum() {
		var datagrid = createObject('component', 'cf-compendium.inc.resource.structure.datagrid').init(variables.i18n);
		var data = '';
		
		makePublic(datagrid, 'calculateDerived');
		
		data = [ 11, 22, 33, 44 ];
		
		assertEquals(110, datagrid.calculateDerived({'sum-' = 66}, 'sum', '', data, 4, { startRow = 1 }));
	}
	
	/**
	 * Test the calculate derived with array of structs for the currentRow
	 */
	public void function testCalculateDerived_WithArrayObjects_CurrentRow() {
		var datagrid = createObject('component', 'cf-compendium.inc.resource.structure.datagrid').init(variables.i18n);
		var data = '';
		var obj = '';
		
		makePublic(datagrid, 'calculateDerived');
		
		data = [];
		
		obj = createObject('component', 'cf-compendium.inc.resource.base.object').init();
		obj.setValue(1);
		
		arrayAppend(data, obj);
		
		obj = createObject('component', 'cf-compendium.inc.resource.base.object').init();
		obj.setValue(2);
		
		arrayAppend(data, obj);
		
		obj = createObject('component', 'cf-compendium.inc.resource.base.object').init();
		obj.setValue(3);
		
		arrayAppend(data, obj);
		
		obj = createObject('component', 'cf-compendium.inc.resource.base.object').init();
		obj.setValue(4);
		
		arrayAppend(data, obj);
		
		assertEquals(4, datagrid.calculateDerived({}, 'currentRow', 'value', data, 4, { startRow = 1 }));
	}
	
	/**
	 * Test the calculate derived with array of structs for a running sum
	 */
	public void function testCalculateDerived_WithArrayObjects_RunningSum() {
		var datagrid = createObject('component', 'cf-compendium.inc.resource.structure.datagrid').init(variables.i18n);
		var data = '';
		
		makePublic(datagrid, 'calculateDerived');
		
		data = [];
		
		obj = createObject('component', 'cf-compendium.inc.resource.base.object').init();
		obj.setValue(1);
		
		arrayAppend(data, obj);
		
		obj = createObject('component', 'cf-compendium.inc.resource.base.object').init();
		obj.setValue(2);
		
		arrayAppend(data, obj);
		
		obj = createObject('component', 'cf-compendium.inc.resource.base.object').init();
		obj.setValue(3);
		
		arrayAppend(data, obj);
		
		obj = createObject('component', 'cf-compendium.inc.resource.base.object').init();
		obj.setValue(4);
		
		arrayAppend(data, obj);
		
		assertEquals(10, datagrid.calculateDerived({'sum-value' = 6}, 'sum', 'value', data, 4, { startRow = 1 }));
	}
	
	/**
	 * Test the calculate derived with array of structs for the currentRow
	 */
	public void function testCalculateDerived_WithArrayStructs_CurrentRow() {
		var datagrid = createObject('component', 'cf-compendium.inc.resource.structure.datagrid').init(variables.i18n);
		var data = '';
		
		makePublic(datagrid, 'calculateDerived');
		
		data = [];
		
		arrayAppend(data, {
				value = 1
			});
		
		arrayAppend(data, {
				value = 2
			});
		
		arrayAppend(data, {
				value = 3
			});
		
		arrayAppend(data, {
				value = 4
			});
		
		assertEquals(4, datagrid.calculateDerived({}, 'currentRow', 'value', data, 4, { startRow = 1 }));
	}
	
	/**
	 * Test the calculate derived with array of structs for a running sum
	 */
	public void function testCalculateDerived_WithArrayStructs_RunningSum() {
		var datagrid = createObject('component', 'cf-compendium.inc.resource.structure.datagrid').init(variables.i18n);
		var data = '';
		
		makePublic(datagrid, 'calculateDerived');
		
		data = [];
		
		arrayAppend(data, {
				value = 1
			});
		
		arrayAppend(data, {
				value = 2
			});
		
		arrayAppend(data, {
				value = 3
			});
		
		arrayAppend(data, {
				value = 4
			});
		
		assertEquals(10, datagrid.calculateDerived({'sum-value' = 6}, 'sum', 'value', data, 4, { startRow = 1 }));
	}
	
	/**
	 * Test the calculate derived with query for the currentRow
	 */
	public void function testCalculateDerived_WithQuery_CurrentRow() {
		var datagrid = createObject('component', 'cf-compendium.inc.resource.structure.datagrid').init(variables.i18n);
		var data = '';
		
		makePublic(datagrid, 'calculateDerived');
		
		data = queryNew('value');
		
		queryAddRow(data);
		querySetCell(data, 'value', 1);
		
		queryAddRow(data);
		querySetCell(data, 'value', 2);
		
		queryAddRow(data);
		querySetCell(data, 'value', 3);
		
		queryAddRow(data);
		querySetCell(data, 'value', 4);
		
		assertEquals(4, datagrid.calculateDerived({}, 'currentRow', 'value', data, 4, { startRow = 1 }));
	}
	
	/**
	 * Test the calculate derived with query for a running sum
	 */
	public void function testCalculateDerived_WithQuery_RunningSum() {
		var datagrid = createObject('component', 'cf-compendium.inc.resource.structure.datagrid').init(variables.i18n);
		var data = '';
		
		makePublic(datagrid, 'calculateDerived');
		
		data = queryNew('value');
		
		queryAddRow(data);
		querySetCell(data, 'value', 1);
		
		queryAddRow(data);
		querySetCell(data, 'value', 2);
		
		queryAddRow(data);
		querySetCell(data, 'value', 3);
		
		queryAddRow(data);
		querySetCell(data, 'value', 4);
		
		assertEquals(10, datagrid.calculateDerived({'sum-value' = 6}, 'sum', 'value', data, 4, { startRow = 1 }));
	}
}
