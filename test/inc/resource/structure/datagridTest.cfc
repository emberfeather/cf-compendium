<cfcomponent extends="mxunit.framework.TestCase" output="false">
	<cffunction name="testAddColumnWithOptions" access="public" returntype="void" output="false">
		<cfset var theURL = createObject('component', 'cf-compendium.inc.resource.utility.url').init() />
		<cfset var datagrid = createObject('component', 'cf-compendium.inc.resource.structure.datagrid').init(theURL) />
		
		<cfset datagrid.addColumn({
				label = "First Name"
			}) />
	</cffunction>
	
	<!---
		Test the calculate derived with simple array for the currentRow
	--->
	<cffunction name="testCalculateDerivedArrayCurrentRow" access="public" returntype="void" output="false">
		<cfset var theURL = createObject('component', 'cf-compendium.inc.resource.utility.url').init() />
		<cfset var datagrid = createObject('component', 'cf-compendium.inc.resource.structure.datagrid').init(theURL) />
		<cfset var data = '' />
		
		<cfset makePublic(datagrid, 'calculateDerived') />
		
		<cfset data = [ 11, 22, 33, 44 ] />
		
		<cfset assertEquals(4, datagrid.calculateDerived({}, 'currentRow', '', data, 4)) />
	</cffunction>
	
	<!---
		Test the calculate derived with simple array for a running sum
	--->
	<cffunction name="testCalculateDerivedArrayRunningSum" access="public" returntype="void" output="false">
		<cfset var theURL = createObject('component', 'cf-compendium.inc.resource.utility.url').init() />
		<cfset var datagrid = createObject('component', 'cf-compendium.inc.resource.structure.datagrid').init(theURL) />
		<cfset var data = '' />
		
		<cfset makePublic(datagrid, 'calculateDerived') />
		
		<cfset data = [ 11, 22, 33, 44 ] />
		
		<cfset assertEquals(110, datagrid.calculateDerived({'sum-' = 66}, 'sum', '', data, 4)) />
	</cffunction>
	
	<!---
		Test the calculate derived with array of structs for the currentRow
	--->
	<cffunction name="testCalculateDerivedArrayObjectsCurrentRow" access="public" returntype="void" output="false">
		<cfset var theURL = createObject('component', 'cf-compendium.inc.resource.utility.url').init() />
		<cfset var datagrid = createObject('component', 'cf-compendium.inc.resource.structure.datagrid').init(theURL) />
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
		
		<cfset assertEquals(4, datagrid.calculateDerived({}, 'currentRow', 'value', data, 4)) />
	</cffunction>
	
	<!---
		Test the calculate derived with array of structs for a running sum
	--->
	<cffunction name="testCalculateDerivedArrayObjectsRunningSum" access="public" returntype="void" output="false">
		<cfset var theURL = createObject('component', 'cf-compendium.inc.resource.utility.url').init() />
		<cfset var datagrid = createObject('component', 'cf-compendium.inc.resource.structure.datagrid').init(theURL) />
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
		
		<cfset assertEquals(10, datagrid.calculateDerived({'sum-value' = 6}, 'sum', 'value', data, 4)) />
	</cffunction>
	
	<!---
		Test the calculate derived with array of structs for the currentRow
	--->
	<cffunction name="testCalculateDerivedArrayStructsCurrentRow" access="public" returntype="void" output="false">
		<cfset var theURL = createObject('component', 'cf-compendium.inc.resource.utility.url').init() />
		<cfset var datagrid = createObject('component', 'cf-compendium.inc.resource.structure.datagrid').init(theURL) />
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
		
		<cfset assertEquals(4, datagrid.calculateDerived({}, 'currentRow', 'value', data, 4)) />
	</cffunction>
	
	<!---
		Test the calculate derived with array of structs for a running sum
	--->
	<cffunction name="testCalculateDerivedArrayStructsRunningSum" access="public" returntype="void" output="false">
		<cfset var theURL = createObject('component', 'cf-compendium.inc.resource.utility.url').init() />
		<cfset var datagrid = createObject('component', 'cf-compendium.inc.resource.structure.datagrid').init(theURL) />
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
		
		<cfset assertEquals(10, datagrid.calculateDerived({'sum-value' = 6}, 'sum', 'value', data, 4)) />
	</cffunction>
	
	<!---
		Test the calculate derived with query for the currentRow
	--->
	<cffunction name="testCalculateDerivedQueryCurrentRow" access="public" returntype="void" output="false">
		<cfset var theURL = createObject('component', 'cf-compendium.inc.resource.utility.url').init() />
		<cfset var datagrid = createObject('component', 'cf-compendium.inc.resource.structure.datagrid').init(theURL) />
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
		
		<cfset assertEquals(4, datagrid.calculateDerived({}, 'currentRow', 'value', data, 4)) />
	</cffunction>
	
	<!---
		Test the calculate derived with query for a running sum
	--->
	<cffunction name="testCalculateDerivedQueryRunningSum" access="public" returntype="void" output="false">
		<cfset var theURL = createObject('component', 'cf-compendium.inc.resource.utility.url').init() />
		<cfset var datagrid = createObject('component', 'cf-compendium.inc.resource.structure.datagrid').init(theURL) />
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
		
		<cfset assertEquals(10, datagrid.calculateDerived({'sum-value' = 6}, 'sum', 'value', data, 4)) />
	</cffunction>
</cfcomponent>