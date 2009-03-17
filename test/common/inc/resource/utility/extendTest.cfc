<cfcomponent extends="mxunit.framework.TestCase" output="false">
	<cfset variables.defaults = {
			one = 1,
			two = 2,
			three = 3
		} />
	
	<!---
		When extending a struct the original struct should not be changed.
		<p>
		This test is used to make sure the original struct passed in is not the
		same as the extended returned. (Meaning the original was not modified.) 
	--->
	<cffunction name="testExtendNonMutable" access="public" returntype="void" output="false">
		<cfset var theExtender = createObject('component', 'cf-compendium.inc.resource.utility.extend').init() />
		<cfset var defaults = duplicate(variables.defaults) />
		<cfset var original = { four = 4 } />
		<cfset var extended = theExtender.extend(defaults, original) />
		
		<cfset assertNotSame(extended, original, 'The original struct should not have been changed when extending.') />
	</cffunction>
	
	<!---
		When extending an original any values that do not exist in the default should
		still be kept in the extended version.
		<p>
		This test is supposed to test what happens when you extend a struct that has a value that 
		does not exist in the defaults. It should return with all the defaults plus the original
		that was not in the defaults.
	--->
	<cffunction name="testExtendOriginal" access="public" returntype="void" output="false">
		<cfset var theExtender = createObject('component', 'cf-compendium.inc.resource.utility.extend').init() />
		<cfset var defaults = duplicate(variables.defaults) />
		<cfset var original = { four = 4 } />
		<cfset var extended = theExtender.extend(defaults, original) />
		
		<cfif structCount(extended) NEQ 4>
			<cfset fail('Missing some of the default struct keys.') />
		</cfif>
	</cffunction>
	
	<!---
		When extending an original any values that are in the original and in the defaults the 
		original value should be kept.
		<p>
		This test is supposed to test what happens when you extend a struct that has a value that 
		does exist in the defaults. It should return with all the originals plus the defaults
		that were not in the original.
	--->
	<cffunction name="testExtendOriginalWithDefault" access="public" returntype="void" output="false">
		<cfset var theExtender = createObject('component', 'cf-compendium.inc.resource.utility.extend').init() />
		<cfset var defaults = duplicate(variables.defaults) />
		<cfset var original = { three = 10 } />
		<cfset var extended = theExtender.extend(defaults, original) />
		
		<cfset assertNotEquals(extended.three, 3, 'The default value should have not been used in the extended since it existed in the original') />
	</cffunction>
	
	<!---
		When given without an original set of values it should return the defaults.
	--->
	<cffunction name="testExtendSansOriginal" access="public" returntype="void" output="false">
		<cfset var theExtender = createObject('component', 'cf-compendium.inc.resource.utility.extend').init() />
		<cfset var defaults = duplicate(variables.defaults) />
		<cfset var extended = theExtender.extend(defaults) />
		
		<cfif structCount(extended) NEQ 3>
			<cfset fail('Missing some of the default struct keys.') />
		</cfif>
	</cffunction>
	
	<!---
		When extending a struct the default struct should not be changed.
		<p>
		This test is used to make sure the default struct passed in is not the
		same as the extended returned. (Meaning the defailt was not modified.) 
	--->
	<cffunction name="testExtendSansOriginalNonMutable" access="public" returntype="void" output="false">
		<cfset var theExtender = createObject('component', 'cf-compendium.inc.resource.utility.extend').init() />
		<cfset var defaults = duplicate(variables.defaults) />
		<cfset var extended = theExtender.extend(defaults) />
		
		<cfset assertNotSame(extended, defaults, 'The defaults struct should not have been changed when extending.') />
	</cffunction>
</cfcomponent>