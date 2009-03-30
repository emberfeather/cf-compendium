<cfcomponent extends="mxunit.framework.TestCase" output="false">
	<!---
		Test the add functionality.
	--->
	<cffunction name="testAdd" access="public" returntype="void" output="false">
		<cfset var i18n = createObject('component', 'cf-compendium.inc.resource.i18n.i18n').init(expandPath('/')) />
		<cfset var theObject = createObject('component', 'cf-compendium.inc.resource.base.object').init(i18n) />
		
		<cfset theObject.addTests('value1') />
		<cfset theObject.addTests('value2') />
		
		<cfset assertEquals(2, arrayLen(theObject.getTests())) />
	</cffunction>
	
	<!---
		Test the add functionality with multiple arguments.
	--->
	<cffunction name="testAddMulti" access="public" returntype="void" output="false">
		<cfset var i18n = createObject('component', 'cf-compendium.inc.resource.i18n.i18n').init(expandPath('/')) />
		<cfset var theObject = createObject('component', 'cf-compendium.inc.resource.base.object').init(i18n) />
		
		<cfset theObject.addTests('value1', 'value2') />
		
		<cfset assertEquals(2, arrayLen(theObject.getTests())) />
	</cffunction>
	
	<!---
		Test the add unique functionality.
	--->
	<cffunction name="testAddUnique" access="public" returntype="void" output="false">
		<cfset var i18n = createObject('component', 'cf-compendium.inc.resource.i18n.i18n').init(expandPath('/')) />
		<cfset var theObject = createObject('component', 'cf-compendium.inc.resource.base.object').init(i18n) />
		
		<cfset theObject.addUniqueTests('value1') />
		<cfset theObject.addUniqueTests('value2') />
		<cfset theObject.addUniqueTests('value2') />
		
		<cfset assertEquals(2, arrayLen(theObject.getTests())) />
	</cffunction>
	
	<!---
		Test the add unique multi functionality.
	--->
	<cffunction name="testAddUniqueMulti" access="public" returntype="void" output="false">
		<cfset var i18n = createObject('component', 'cf-compendium.inc.resource.i18n.i18n').init(expandPath('/')) />
		<cfset var theObject = createObject('component', 'cf-compendium.inc.resource.base.object').init(i18n) />
		
		<cfset theObject.addUniqueTests('value1', 'value2', 'value2') />
		
		<cfset assertEquals(2, arrayLen(theObject.getTests())) />
	</cffunction>
	
	<!---
		Test the get functionality.
	--->
	<cffunction name="testGet" access="public" returntype="void" output="false">
		<cfset var i18n = createObject('component', 'cf-compendium.inc.resource.i18n.i18n').init(expandPath('/')) />
		<cfset var theObject = createObject('component', 'cf-compendium.inc.resource.base.object').init(i18n) />
		
		<cfset theObject.setTest('value') />
		
		<cfset assertEquals('value', theObject.getTest()) />
	</cffunction>
	
	<!---
		Test the get by attribute functionality.
	--->
	<cffunction name="testGetByAttribute" access="public" returntype="void" output="false">
		<cfset var i18n = createObject('component', 'cf-compendium.inc.resource.i18n.i18n').init(expandPath('/')) />
		<cfset var theObject = createObject('component', 'cf-compendium.inc.resource.base.object').init(i18n) />
		
		<cfset theObject.addTests('valve', 'pressure', 'release', 'control', 'flow') />
		
		<cfset assertEquals(3, arrayLen(theObject.getTestsBy('e$'))) />
	</cffunction>
	
	<!---
		Test the get object by attribute functionality.
	--->
	<cffunction name="testGetByAttribute" access="public" returntype="void" output="false">
		<cfset var i18n = createObject('component', 'cf-compendium.inc.resource.i18n.i18n').init(expandPath('/')) />
		<cfset var theObject = createObject('component', 'cf-compendium.inc.resource.base.object').init(i18n) />
		<cfset var theObject1 = createObject('component', 'cf-compendium.inc.resource.base.object').init(i18n) />
		<cfset var theObject2 = createObject('component', 'cf-compendium.inc.resource.base.object').init(i18n) />
		<cfset var theObject3 = createObject('component', 'cf-compendium.inc.resource.base.object').init(i18n) />
		<cfset var theObject4 = createObject('component', 'cf-compendium.inc.resource.base.object').init(i18n) />
		<cfset var theObject5 = createObject('component', 'cf-compendium.inc.resource.base.object').init(i18n) />
		
		<cfset theObject1.setTest('valve') />
		<cfset theObject2.setTest('pressure') />
		<cfset theObject3.setTest('release') />
		<cfset theObject4.setTest('control') />
		<cfset theObject5.setTest('flow') />
		
		<cfset theObject.addTests(theObject1, theObject2, theObject3, theObject4, theObject5) />
		
		<cfset assertEquals(3, arrayLen(theObject.getTestsByTest('e$'))) />
	</cffunction>
	
	<!---
		Test the length functionality.
	--->
	<cffunction name="testLengthArray" access="public" returntype="void" output="false">
		<cfset var i18n = createObject('component', 'cf-compendium.inc.resource.i18n.i18n').init(expandPath('/')) />
		<cfset var theObject = createObject('component', 'cf-compendium.inc.resource.base.object').init(i18n) />
		<cfset var temp = [0, 1, 2, 3] />
		
		<cfset theObject.setTest(temp) />
		
		<cfset assertEquals(4, theObject.lengthTest()) />
	</cffunction>
	
	<!---
		Test the length functionality.
	--->
	<cffunction name="testLengthSimple" access="public" returntype="void" output="false">
		<cfset var i18n = createObject('component', 'cf-compendium.inc.resource.i18n.i18n').init(expandPath('/')) />
		<cfset var theObject = createObject('component', 'cf-compendium.inc.resource.base.object').init(i18n) />
		
		<cfset theObject.setTest('value') />
		
		<cfset assertEquals(5, theObject.lengthTest()) />
	</cffunction>
	
	<!---
		Test the length functionality.
	--->
	<cffunction name="testLengthStruct" access="public" returntype="void" output="false">
		<cfset var i18n = createObject('component', 'cf-compendium.inc.resource.i18n.i18n').init(expandPath('/')) />
		<cfset var theObject = createObject('component', 'cf-compendium.inc.resource.base.object').init(i18n) />
		<cfset var temp = { test= 1, test1 = 2 } />
		
		<cfset theObject.setTest(temp) />
		
		<cfset assertEquals(2, theObject.lengthTest()) />
	</cffunction>
	
	<!---
		Test the properties functionality.
	--->
	<cffunction name="testProperties" access="public" returntype="void" output="false">
		<cfset var i18n = createObject('component', 'cf-compendium.inc.resource.i18n.i18n').init(expandPath('/')) />
		<cfset var theObject = createObject('component', 'implementation.cf-compendium.inc.resource.base.object1').init(i18n) />
		
		<cfset assertEquals('value', theObject.getTest()) />
		<cfset assertEquals('bar', theObject.getFoo()) />
	</cffunction>
	
	<!---
		Test the set functionality.
	--->
	<cffunction name="testSet" access="public" returntype="void" output="false">
		<cfset var i18n = createObject('component', 'cf-compendium.inc.resource.i18n.i18n').init(expandPath('/')) />
		<cfset var theObject = createObject('component', 'cf-compendium.inc.resource.base.object').init(i18n) />
		
		<cfset theObject.setTest('value') />
		
		<cfset assertEquals('value', theObject.getTest()) />
	</cffunction>
</cfcomponent>