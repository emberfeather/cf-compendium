<cfcomponent extends="mxunit.framework.TestCase" output="false">
	<cffunction name="setup" access="public" returntype="void" output="false">
		<cfset variables.theURL = createObject('component', 'cf-compendium.inc.resource.utility.url').init() />
	</cffunction>
	
	<cffunction name="testAddColumn_WithOptions" access="public" returntype="void" output="false">
		<cfset var datagrid = createObject('component', 'cf-compendium.inc.resource.structure.datagrid').init(variables.theURL) />
		
		<cfset datagrid.addColumn({
				label = "First Name"
			}) />
	</cffunction>
	
	<!---
		Test the calculate derived with simple array for the currentRow
	--->
	<cffunction name="testCalculateDerived_WithArray_CurrentRow" access="public" returntype="void" output="false">
		<cfset var datagrid = createObject('component', 'cf-compendium.inc.resource.structure.datagrid').init(variables.theURL) />
		<cfset var data = '' />
		
		<cfset makePublic(datagrid, 'calculateDerived') />
		
		<cfset data = [ 11, 22, 33, 44 ] />
		
		<cfset assertEquals(4, datagrid.calculateDerived({}, 'currentRow', '', data, 4, { startRow = 1 })) />
	</cffunction>
	
	<!---
		Test the calculate derived with simple array for a running sum
	--->
	<cffunction name="testCalculateDerived_WithArray_RunningSum" access="public" returntype="void" output="false">
		<cfset var datagrid = createObject('component', 'cf-compendium.inc.resource.structure.datagrid').init(variables.theURL) />
		<cfset var data = '' />
		
		<cfset makePublic(datagrid, 'calculateDerived') />
		
		<cfset data = [ 11, 22, 33, 44 ] />
		
		<cfset assertEquals(110, datagrid.calculateDerived({'sum-' = 66}, 'sum', '', data, 4, { startRow = 1 })) />
	</cffunction>
	
	<!---
		Test the calculate derived with array of structs for the currentRow
	--->
	<cffunction name="testCalculateDerived_WithArrayObjects_CurrentRow" access="public" returntype="void" output="false">
		<cfset var datagrid = createObject('component', 'cf-compendium.inc.resource.structure.datagrid').init(variables.theURL) />
		<cfset var data = '' />
		<cfset var obj = '' />
		
		<cfset makePublic(datagrid, 'calculateDerived') />
		
		<cfset data = [] />
		
		<cfset obj = createObject('component', 'cf-compendium.inc.resource.base.object').init() />
		<cfset obj.setValue(1) />
		
		<cfset arrayAppend(data, obj) />
		
		<cfset obj = createObject('component', 'cf-compendium.inc.resource.base.object').init() />
		<cfset obj.setValue(2) />
		
		<cfset arrayAppend(data, obj) />
		
		<cfset obj = createObject('component', 'cf-compendium.inc.resource.base.object').init() />
		<cfset obj.setValue(3) />
		
		<cfset arrayAppend(data, obj) />
		
		<cfset obj = createObject('component', 'cf-compendium.inc.resource.base.object').init() />
		<cfset obj.setValue(4) />
		
		<cfset arrayAppend(data, obj) />
		
		<cfset assertEquals(4, datagrid.calculateDerived({}, 'currentRow', 'value', data, 4, { startRow = 1 })) />
	</cffunction>
	
	<!---
		Test the calculate derived with array of structs for a running sum
	--->
	<cffunction name="testCalculateDerived_WithArrayObjects_RunningSum" access="public" returntype="void" output="false">
		<cfset var datagrid = createObject('component', 'cf-compendium.inc.resource.structure.datagrid').init(variables.theURL) />
		<cfset var data = '' />
		
		<cfset makePublic(datagrid, 'calculateDerived') />
		
		<cfset data = [] />
		
		<cfset obj = createObject('component', 'cf-compendium.inc.resource.base.object').init() />
		<cfset obj.setValue(1) />
		
		<cfset arrayAppend(data, obj) />
		
		<cfset obj = createObject('component', 'cf-compendium.inc.resource.base.object').init() />
		<cfset obj.setValue(2) />
		
		<cfset arrayAppend(data, obj) />
		
		<cfset obj = createObject('component', 'cf-compendium.inc.resource.base.object').init() />
		<cfset obj.setValue(3) />
		
		<cfset arrayAppend(data, obj) />
		
		<cfset obj = createObject('component', 'cf-compendium.inc.resource.base.object').init() />
		<cfset obj.setValue(4) />
		
		<cfset arrayAppend(data, obj) />
		
		<cfset assertEquals(10, datagrid.calculateDerived({'sum-value' = 6}, 'sum', 'value', data, 4, { startRow = 1 })) />
	</cffunction>
	
	<!---
		Test the calculate derived with array of structs for the currentRow
	--->
	<cffunction name="testCalculateDerived_WithArrayStructs_CurrentRow" access="public" returntype="void" output="false">
		<cfset var datagrid = createObject('component', 'cf-compendium.inc.resource.structure.datagrid').init(variables.theURL) />
		<cfset var data = '' />
		
		<cfset makePublic(datagrid, 'calculateDerived') />
		
		<cfset data = [] />
		
		<cfset arrayAppend(data, {
				value = 1
			}) />
		
		<cfset arrayAppend(data, {
				value = 2
			}) />
		
		<cfset arrayAppend(data, {
				value = 3
			}) />
		
		<cfset arrayAppend(data, {
				value = 4
			}) />
		
		<cfset assertEquals(4, datagrid.calculateDerived({}, 'currentRow', 'value', data, 4, { startRow = 1 })) />
	</cffunction>
	
	<!---
		Test the calculate derived with array of structs for a running sum
	--->
	<cffunction name="testCalculateDerived_WithArrayStructs_RunningSum" access="public" returntype="void" output="false">
		<cfset var datagrid = createObject('component', 'cf-compendium.inc.resource.structure.datagrid').init(variables.theURL) />
		<cfset var data = '' />
		
		<cfset makePublic(datagrid, 'calculateDerived') />
		
		<cfset data = [] />
		
		<cfset arrayAppend(data, {
				value = 1
			}) />
		
		<cfset arrayAppend(data, {
				value = 2
			}) />
		
		<cfset arrayAppend(data, {
				value = 3
			}) />
		
		<cfset arrayAppend(data, {
				value = 4
			}) />
		
		<cfset assertEquals(10, datagrid.calculateDerived({'sum-value' = 6}, 'sum', 'value', data, 4, { startRow = 1 })) />
	</cffunction>
	
	<!---
		Test the calculate derived with query for the currentRow
	--->
	<cffunction name="testCalculateDerived_WithQuery_CurrentRow" access="public" returntype="void" output="false">
		<cfset var datagrid = createObject('component', 'cf-compendium.inc.resource.structure.datagrid').init(variables.theURL) />
		<cfset var data = '' />
		
		<cfset makePublic(datagrid, 'calculateDerived') />
		
		<cfset data = queryNew('value') />
		
		<cfset queryAddRow(data) />
		<cfset querySetCell(data, 'value', 1) />
		
		<cfset queryAddRow(data) />
		<cfset querySetCell(data, 'value', 2) />
		
		<cfset queryAddRow(data) />
		<cfset querySetCell(data, 'value', 3) />
		
		<cfset queryAddRow(data) />
		<cfset querySetCell(data, 'value', 4) />
		
		<cfset assertEquals(4, datagrid.calculateDerived({}, 'currentRow', 'value', data, 4, { startRow = 1 })) />
	</cffunction>
	
	<!---
		Test the calculate derived with query for a running sum
	--->
	<cffunction name="testCalculateDerived_WithQuery_RunningSum" access="public" returntype="void" output="false">
		<cfset var datagrid = createObject('component', 'cf-compendium.inc.resource.structure.datagrid').init(variables.theURL) />
		<cfset var data = '' />
		
		<cfset makePublic(datagrid, 'calculateDerived') />
		
		<cfset data = queryNew('value') />
		
		<cfset queryAddRow(data) />
		<cfset querySetCell(data, 'value', 1) />
		
		<cfset queryAddRow(data) />
		<cfset querySetCell(data, 'value', 2) />
		
		<cfset queryAddRow(data) />
		<cfset querySetCell(data, 'value', 3) />
		
		<cfset queryAddRow(data) />
		<cfset querySetCell(data, 'value', 4) />
		
		<cfset assertEquals(10, datagrid.calculateDerived({'sum-value' = 6}, 'sum', 'value', data, 4, { startRow = 1 })) />
	</cffunction>
	
	<!---
		Test the formatValue with a date format
	--->
	<cffunction name="testFormatValue_WithDate" access="public" returntype="void" output="false">
		<cfset var datagrid = createObject('component', 'cf-compendium.inc.resource.structure.datagrid').init(variables.theURL) />
		<cfset var value = '' />
		
		<cfset makePublic(datagrid, 'formatValue') />
		
		<cfset value = createDate(2009, 11, 13) />
		
		<cfset assertEquals('13 Nov 2009', datagrid.formatValue({ type = 'date', format = 'd mmm yyyy' }, value)) />
	</cffunction>
	
	<!---
		Test the formatValue with a time format
	--->
	<cffunction name="testFormatValue_WithTime" access="public" returntype="void" output="false">
		<cfset var datagrid = createObject('component', 'cf-compendium.inc.resource.structure.datagrid').init(variables.theURL) />
		<cfset var value = '' />
		
		<cfset makePublic(datagrid, 'formatValue') />
		
		<cfset value = createTime(14, 34, 12) />
		
		<cfset assertEquals('02:34:12 PM', datagrid.formatValue({ type = 'time', format = 'hh:mm:ss tt' }, value)) />
	</cffunction>
</cfcomponent>