<cfcomponent extends="mxunit.framework.TestCase" output="false">
	<!---
		Tests that the confirm token works correctly
	--->
	<cffunction name="testConfirmToken" access="public" returntype="void" output="false">
		<cfset var token = '' />
		<cfset var tokens = createObject('component', 'cf-compendium.inc.resource.security.tokens').init() />
		
		<cfset token = tokens.getTest() />
		
		<cfset assertTrue( tokens.confirmTest(token), 'Token given did not confirm correctly' ) />
	</cffunction>
	
	<!---
		Tests that the confirm token fails when there is no token
	--->
	<cffunction name="testConfirmTokenSansToken" access="public" returntype="void" output="false">
		<cfset var tokens = createObject('component', 'cf-compendium.inc.resource.security.tokens').init() />
		
		<cfset assertFalse( tokens.confirmTest('someVal'), 'Tokens that are not created should return false' ) />
	</cffunction>
	
	<!---
		Tests that the token changes when requesting a reset token
	--->
	<cffunction name="testGetTokenReset" access="public" returntype="void" output="false">
		<cfset var token1 = '' />
		<cfset var token2 = '' />
		<cfset var tokens = createObject('component', 'cf-compendium.inc.resource.security.tokens').init() />
		
		<cfset token1 = tokens.getTest() />
		
		<cfset token2 = tokens.getTest( true ) />
		
		<cfset assertNotEquals(token1, token2, 'Tokens should be different when requesting a token with the reset flag') />
	</cffunction>
	
	<!---
		Tests that the has token works
	--->
	<cffunction name="testHasToken" access="public" returntype="void" output="false">
		<cfset var tokens = createObject('component', 'cf-compendium.inc.resource.security.tokens').init() />
		
		<cfset tokens.getTest() />
		
		<cfset assertTrue(tokens.hasTest(), 'The token should exist since it was generated') />
	</cffunction>
	
	<!---
		Tests that the has token works
	--->
	<cffunction name="testHasTokenSansToken" access="public" returntype="void" output="false">
		<cfset var token1 = '' />
		<cfset var token2 = '' />
		<cfset var tokens = createObject('component', 'cf-compendium.inc.resource.security.tokens').init() />
		
		<cfset assertFalse(tokens.hasTest(), 'The token should not exist since it was not generated') />
	</cffunction>
</cfcomponent>