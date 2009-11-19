<!--- 
	Unit testing for the cfc parser
--->
<cfcomponent extends="mxunit.framework.TestCase" output="false">
	<cffunction name="testParse_ComponentComment" access="public" returntype="void" output="false">
		<cfset var theParser = createObject('component', 'cf-compendium.inc.resource.utility.cfcParse').init(false) />
		<cfset var parsed = theParser.parse('componentParse01.cfc', '/implementation/inc/resource/utility/', 'init') />
		
		<cfset assertEquals('Test Component Comment', parsed.comments.description[1]) />
	</cffunction>
	
	<cffunction name="testParse_FunctionComment" access="public" returntype="void" output="false">
		<cfset var theParser = createObject('component', 'cf-compendium.inc.resource.utility.cfcParse').init(false) />
		<cfset var parsed = theParser.parse('componentParse01.cfc', '/implementation/inc/resource/utility/', 'init') />
		
		<cfset assertEquals('Test Function Comment', parsed.methods.constructors[1].comments.description[1]) />
	</cffunction>
	
	<cffunction name="testIsComponent_FileSansTrailingSlash" access="public" returntype="void" output="false">
		<cfset var theParser = createObject('component', 'cf-compendium.inc.resource.utility.cfcParse').init(false) />
		
		<cftry>
			<cfset theParser.isComponent('componentParse01.cfc', '/implementation/inc/resource/utility') />
			
			<cfcatch type="any">
				<cfset fail('Should be able to correct a missing trailing slash') />
			</cfcatch>
		</cftry>
	</cffunction>
	
	<cffunction name="testIsComponent_WithComponentNonLazy" access="public" returntype="void" output="false">
		<cfset var theParser = createObject('component', 'cf-compendium.inc.resource.utility.cfcParse').init(false) />
		
		<cfset assertTrue(theParser.isComponent('componentParse01.cfc', '/implementation/inc/resource/utility/')) />
	</cffunction>
	
	<cffunction name="testIsComponent_WithComponentLazy" access="public" returntype="void" output="false">
		<cfset var theParser = createObject('component', 'cf-compendium.inc.resource.utility.cfcParse').init(true) />
		
		<cfset assertTrue(theParser.isComponent('componentParse01.cfc', '/implementation/inc/resource/utility/')) />
	</cffunction>
	
	<cffunction name="testIsComponent_WithInterfaceNonLazy" access="public" returntype="void" output="false">
		<cfset var theParser = createObject('component', 'cf-compendium.inc.resource.utility.cfcParse').init(false) />
		
		<cfset assertFalse(theParser.isComponent('interfaceParse01.cfc', '/implementation/inc/resource/utility/')) />
	</cffunction>
	
	<cffunction name="testIsComponent_WithInterfaceLazy" access="public" returntype="void" output="false">
		<cfset var theParser = createObject('component', 'cf-compendium.inc.resource.utility.cfcParse').init(true) />
		
		<cfset assertTrue(theParser.isComponent('interfaceParse01.cfc', '/implementation/inc/resource/utility/')) />
	</cffunction>
</cfcomponent>