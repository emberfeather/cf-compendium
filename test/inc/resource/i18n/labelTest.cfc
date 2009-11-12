<cfcomponent extends="mxunit.framework.TestCase" output="false">
	<cffunction name="setup" access="public" returntype="void" output="false">
		<cfset variables.i18n = createObject('component', 'cf-compendium.inc.resource.i18n.i18n').init(expandPath('/i18n/')) />
	</cffunction>
	
	<cffunction name="testGetLabel_WithBundle" access="public" returntype="void" output="false">
		<cfset var label = createObject('component', 'cf-compendium.inc.resource.i18n.label').init(variables.i18n) />
		
		<cfset label.addBundle('/cf-compendium/i18n/inc/resource/structure', 'form') />
		
		<cfset assertEquals('Submit', label.getSubmit()) />
	</cffunction>
	
	<cffunction name="testGetLabel_WithBundleBlankKey" access="public" returntype="void" output="false">
		<cfset var label = createObject('component', 'cf-compendium.inc.resource.i18n.label').init(variables.i18n) />
		
		<cfset label.addBundle('/cf-compendium/i18n/inc/resource/structure', 'form') />
		
		<cfset assertEquals('', label.get('')) />
	</cffunction>
	
	<cffunction name="testGetLabel_WithBundleMissingKey" access="public" returntype="void" output="false">
		<cfset var label = createObject('component', 'cf-compendium.inc.resource.i18n.label').init(variables.i18n) />
		
		<cfset label.addBundle('/cf-compendium/i18n/inc/resource/structure', 'form') />
		
		<cfset assertEquals('N/A', label.getKey()) />
	</cffunction>
	
	<cffunction name="testGetLabel_WithBundleMissingKeyWithDefault" access="public" returntype="void" output="false">
		<cfset var label = createObject('component', 'cf-compendium.inc.resource.i18n.label').init(variables.i18n) />
		
		<cfset label.addBundle('/cf-compendium/i18n/inc/resource/structure', 'form') />
		
		<cfset assertEquals('Nah', label.getKey('Nah')) />
	</cffunction>
	
	<cffunction name="testGetLabel_WithMultipleBundles_ShouldInherit" access="public" returntype="void" output="false">
		<cfset var label = createObject('component', 'cf-compendium.inc.resource.i18n.label').init(variables.i18n) />
		
		<cfset label.addBundle('/cf-compendium/i18n/inc/resource/structure', 'form') />
		<cfset label.addBundle('/i18n/inc/resource/i18n', 'label') />
		
		<cfset assertEquals('cancel', label.getCancel()) />
	</cffunction>
	
	<cffunction name="testGetLabel_WithMultipleBundles_ShouldOverride" access="public" returntype="void" output="false">
		<cfset var label = createObject('component', 'cf-compendium.inc.resource.i18n.label').init(variables.i18n) />
		
		<cfset label.addBundle('/cf-compendium/i18n/inc/resource/structure', 'form') />
		<cfset label.addBundle('/i18n/inc/resource/i18n', 'label') />
		
		<cfset assertEquals('test', label.getSubmit()) />
	</cffunction>
	
	<cffunction name="testGetLabel_WithoutBundles" access="public" returntype="void" output="false">
		<cfset var label = createObject('component', 'cf-compendium.inc.resource.i18n.label').init(variables.i18n) />
		
		<cfset assertEquals('N/A', label.getSubmit()) />
	</cffunction>
</cfcomponent>