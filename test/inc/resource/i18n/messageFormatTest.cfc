<cfcomponent extends="mxunit.framework.TestCase" output="false">
	<cffunction name="testFormat" access="public" returntype="void" output="false">
		<cfset var formatter = createObject('component', 'cf-compendium.inc.resource.i18n.messageFormat').init('en_US') />
		<cfset var formattedMessage = '' />
		<cfset var message = 'On {1,date,full} at {1,time,medium}, I left {2} for the {3}. I took {4,number,currency} with me. Rounded number: {4,number,integer}' />
		<cfset var replacement1 = createDateTime(2009, 10, 1, 13, 42, 12) />
		<cfset var replacement2 = 'the shade' />
		<cfset var replacement3 = 'donut shoppe' />
		<cfset var replacement4 = 10003.28 />
		
		<cfset formattedMessage = formatter.format(message, replacement1, replacement2, replacement3, replacement4) />
		
		<cfset assertEquals('On Thursday, October 1, 2009 at 1:42:12 PM, I left the shade for the donut shoppe. I took $10,003.28 with me. Rounded number: 10,003', formattedMessage) />
	</cffunction>
</cfcomponent>