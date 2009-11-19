<!--- 
	Unit testing for the cfc parser
--->
<cfcomponent extends="mxunit.framework.TestCase" output="false">
	<cffunction name="testIsComponent_Script_WithComponent_NonLazy" access="public" returntype="void" output="false">
		<cfset var theParser = createObject('component', 'cf-compendium.inc.resource.utility.cfcParse').init(false) />
		
		<cfset assertTrue(theParser.isComponent('/implementation/inc/resource/utility/componentScriptParse01.cfc')) />
	</cffunction>
	
	<cffunction name="testIsComponent_Tag_WithComponent_NonLazy" access="public" returntype="void" output="false">
		<cfset var theParser = createObject('component', 'cf-compendium.inc.resource.utility.cfcParse').init(false) />
		
		<cfset assertTrue(theParser.isComponent('/implementation/inc/resource/utility/componentParse01.cfc')) />
	</cffunction>
	
	<cffunction name="testIsComponent_Script_WithComponent_Lazy" access="public" returntype="void" output="false">
		<cfset var theParser = createObject('component', 'cf-compendium.inc.resource.utility.cfcParse').init(true) />
		
		<cfset assertTrue(theParser.isComponent('/implementation/inc/resource/utility/componentScriptParse01.cfc')) />
	</cffunction>
	
	<cffunction name="testIsComponent_Tag_WithComponent_Lazy" access="public" returntype="void" output="false">
		<cfset var theParser = createObject('component', 'cf-compendium.inc.resource.utility.cfcParse').init(true) />
		
		<cfset assertTrue(theParser.isComponent('/implementation/inc/resource/utility/componentParse01.cfc')) />
	</cffunction>
	
	<cffunction name="testIsComponent_Script_WithInterface_NonLazy" access="public" returntype="void" output="false">
		<cfset var theParser = createObject('component', 'cf-compendium.inc.resource.utility.cfcParse').init(false) />
		
		<cfset assertFalse(theParser.isComponent('/implementation/inc/resource/utility/interfaceScriptParse01.cfc')) />
	</cffunction>
	
	<cffunction name="testIsComponent_Tag_WithInterface_NonLazy" access="public" returntype="void" output="false">
		<cfset var theParser = createObject('component', 'cf-compendium.inc.resource.utility.cfcParse').init(false) />
		
		<cfset assertFalse(theParser.isComponent('/implementation/inc/resource/utility/interfaceParse01.cfc')) />
	</cffunction>
	
	<cffunction name="testIsComponent_Script_WithInterface_Lazy" access="public" returntype="void" output="false">
		<cfset var theParser = createObject('component', 'cf-compendium.inc.resource.utility.cfcParse').init(true) />
		
		<cfset assertTrue(theParser.isComponent('/implementation/inc/resource/utility/interfaceScriptParse01.cfc')) />
	</cffunction>
	
	<cffunction name="testIsComponent_Tag_WithInterface_Lazy" access="public" returntype="void" output="false">
		<cfset var theParser = createObject('component', 'cf-compendium.inc.resource.utility.cfcParse').init(true) />
		
		<cfset assertTrue(theParser.isComponent('/implementation/inc/resource/utility/interfaceParse01.cfc')) />
	</cffunction>
	
	<cffunction name="testIsScript_Script_WithComponent" access="public" returntype="void" output="false">
		<cfset var theParser = createObject('component', 'cf-compendium.inc.resource.utility.cfcParse').init(true) />
		
		<cfset assertTrue(theParser.isScript('/implementation/inc/resource/utility/componentScriptParse01.cfc')) />
	</cffunction>
	
	<cffunction name="testIsScript_Tag_WithComponent" access="public" returntype="void" output="false">
		<cfset var theParser = createObject('component', 'cf-compendium.inc.resource.utility.cfcParse').init(true) />
		
		<cfset assertFalse(theParser.isScript('/implementation/inc/resource/utility/componentParse01.cfc')) />
	</cffunction>
	
	<cffunction name="testIsScript_Script_WithInterface" access="public" returntype="void" output="false">
		<cfset var theParser = createObject('component', 'cf-compendium.inc.resource.utility.cfcParse').init(true) />
		
		<cfset assertTrue(theParser.isScript('/implementation/inc/resource/utility/interfaceScriptParse01.cfc')) />
	</cffunction>
	
	<cffunction name="testIsScript_Tag_WithInterface" access="public" returntype="void" output="false">
		<cfset var theParser = createObject('component', 'cf-compendium.inc.resource.utility.cfcParse').init(true) />
		
		<cfset assertFalse(theParser.isScript('/implementation/inc/resource/utility/interfaceParse01.cfc')) />
	</cffunction>
	
	<cffunction name="testParse_Script_ComponentComment" access="public" returntype="void" output="false">
		<cfset var theParser = createObject('component', 'cf-compendium.inc.resource.utility.cfcParse').init(false) />
		<cfset var parsed = theParser.parse('/implementation/inc/resource/utility/componentScriptParse01.cfc', 'init') />
		
		<cfset assertEquals('Test Component Comment', parsed.comments.description[1]) />
	</cffunction>
	
	<cffunction name="testParse_Tag_ComponentComment" access="public" returntype="void" output="false">
		<cfset var theParser = createObject('component', 'cf-compendium.inc.resource.utility.cfcParse').init(false) />
		<cfset var parsed = theParser.parse('/implementation/inc/resource/utility/componentParse01.cfc', 'init') />
		
		<cfset assertEquals('Test Component Comment', parsed.comments.description[1]) />
	</cffunction>
	
	<cffunction name="testParse_Script_FunctionComment" access="public" returntype="void" output="false">
		<cfset var theParser = createObject('component', 'cf-compendium.inc.resource.utility.cfcParse').init(false) />
		<cfset var parsed = theParser.parse('/implementation/inc/resource/utility/componentScriptParse01.cfc', 'init') />
		
		<cfset assertEquals('Test Function Comment', parsed.methods.constructors[1].comments.description[1]) />
	</cffunction>
	
	<cffunction name="testParse_Tag_FunctionComment" access="public" returntype="void" output="false">
		<cfset var theParser = createObject('component', 'cf-compendium.inc.resource.utility.cfcParse').init(false) />
		<cfset var parsed = theParser.parse('/implementation/inc/resource/utility/componentParse01.cfc', 'init') />
		
		<cfset assertEquals('Test Function Comment', parsed.methods.constructors[1].comments.description[1]) />
	</cffunction>
</cfcomponent>