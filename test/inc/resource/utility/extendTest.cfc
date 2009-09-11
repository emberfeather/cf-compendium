<cfcomponent extends="mxunit.framework.TestCase" output="false">
	<cffunction name="setup" access="public" returntype="void" output="false">
		<cfset variables.extender = createObject('component', 'cf-compendium.inc.resource.utility.extend').init() />
	</cffunction>
	
	<!---
		When extending an original that has keys that sub structs and the defaults have sub
		structs there is an option to recursively extend out the sub struct to 'merge' them.
		<p>
		This test is to determine if the 'infinity' option works with the recursion
	--->
	<cffunction name="testExtendDepthInfinity" access="public" returntype="void" output="false">
		<cfset var defaults = {
				one = 1,
				two = {
					twoOne = 21,
					twoTwo = {
						twoTwoOne = 221
					},
					twoThree = 23
				},
				three = 3
			} />
		<cfset var original = {
				two = {
					twoTwo = {
						twoTwoTwo = 222
					}
				}
			} />
		<cfset var extended = variables.extender.extend(defaults, original, -1) />
		
		<cfif NOT structKeyExists(extended.two.twoTwo, 'twoTwoOne')>
			<cfset fail('The sub struct was not properly extended, ad infinitum') />
		</cfif>
		
		<cfset assertEquals(221, extended.two.twoTwo.twoTwoOne) />
	</cffunction>
	
	<!---
		When extending an original that has keys that sub structs and the defaults have sub
		structs there is an option to recursively extend out the sub struct to 'merge' them.
		<p>
		This test is to determine if the depth level option works with the recursion.
	--->
	<cffunction name="testExtendDepthLimit" access="public" returntype="void" output="false">
		<cfset var defaults = {
				one = 1,
				two = {
					twoOne = 21
				},
				three = 3
			} />
		<cfset var original = {
				two = {
					twoTwo = {
						twoTwoTwo = 222
					}
				}
			} />
		<cfset var extended = variables.extender.extend(defaults, original, 2) />
		
		<cfif NOT structKeyExists(extended.two, 'twoOne')>
			<cfset fail('The sub struct extend failed to extend the depth required.') />
		</cfif>
	</cffunction>
	
	<!---
		When extending an original that has keys that sub structs and the defaults have sub
		structs there is an option to recursively extend out the sub struct to 'merge' them.
		<p>
		This test is to determine if the depth level option works with the recursion but not
		too deep.
	--->
	<cffunction name="testExtendDepthLimitExcess" access="public" returntype="void" output="false">
		<cfset var defaults = {
				one = 1,
				two = {
					twoOne = 21,
					twoTwo = {
						twoTwoOne = 221,
						twoTwoThree = {
							twoTwoThreeOne = 2231
						}
					}
				},
				three = 3
			} />
		<cfset var original = {
				two = {
					twoTwo = {
						twoTwoTwo = 222,
						twoTwoThree = {
							twoTwoThreeTwo = 2232
						}
					}
				}
			} />
		<cfset var extended = variables.extender.extend(defaults, original, 2) />
		
		<cfif structKeyExists(extended.two.twotwo.twoTwoThree, 'twoTwoThreeOne')>
			<cfset fail('The sub struct extend went farther than the determined number of depth levels.') />
		</cfif>
		
		<cfif NOT structKeyExists(extended.two, 'twoOne')>
			<cfset fail('The sub struct extend failed to extend the depth required.') />
		</cfif>
	</cffunction>
	
	<!---
		When extending a struct the original struct should not be changed.
		<p>
		This test is used to make sure the original struct passed in is not the
		same as the extended returned. (Meaning the original was not modified.) 
	--->
	<cffunction name="testExtendNonMutable" access="public" returntype="void" output="false">
		<cfset var defaults = {
				one = 1,
				two = 2,
				three = 3
			} />
		<cfset var original = {
				four = 4
			} />
		<cfset var extended = variables.extender.extend(defaults, original) />
		
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
		<cfset var defaults = {
				one = 1,
				two = 2,
				three = 3
			} />
		<cfset var original = {
				four = 4
			} />
		<cfset var extended = variables.extender.extend(defaults, original) />
		
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
		<cfset var defaults = {
				one = 1,
				two = 2,
				three = 3
			} />
		<cfset var original = {
				three = 10
			} />
		<cfset var extended = variables.extender.extend(defaults, original) />
		
		<cfset assertNotEquals(extended.three, 3, 'The default value should have not been used in the extended since it existed in the original') />
	</cffunction>
	
	<!---
		When given without an original set of values it should return the defaults.
	--->
	<cffunction name="testExtendSansOriginal" access="public" returntype="void" output="false">
		<cfset var defaults = {
				one = 1,
				two = 2,
				three = 3
			} />
		<cfset var extended = variables.extender.extend(defaults) />
		
		<cfif structCount(extended) NEQ 3>
			<cfset fail('Missing some of the default struct keys.') />
		</cfif>
	</cffunction>
	
	<!---
		When extending a struct the default struct should not be changed.
		<p>
		This test is used to make sure the default struct passed in is not the
		same as the extended returned. (Meaning the default was not modified.) 
	--->
	<cffunction name="testExtendSansOriginalNonMutable" access="public" returntype="void" output="false">
		<cfset var defaults = {
				one = 1,
				two = 2,
				three = 3
			} />
		<cfset var extended = variables.extender.extend(defaults) />
		
		<cfset assertNotSame(extended, defaults, 'The default struct should be duplicated when extending.') />
	</cffunction>
</cfcomponent>