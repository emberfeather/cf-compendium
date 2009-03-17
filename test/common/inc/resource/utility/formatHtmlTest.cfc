<cfcomponent extends="mxunit.framework.TestCase" output="false">
	<!---
		Test the conversion of apostrophe
	--->
	<cffunction name="testCleanTypeApostropheS" access="public" returntype="void" output="false">
		<cfset var theFormatter = createObject('component', 'cf-compendium.inc.resource.utility.formatHtml').init() />
		<cfset var testString = 'Hello World&apos;s' />
		
		<cfset assertEquals('Hello World''s', theFormatter.cleanType(testString)) />
	</cffunction>
	
	<!---
		Test the conversion of ellipsis
	--->
	<cffunction name="testCleanTypeEllipsis" access="public" returntype="void" output="false">
		<cfset var theFormatter = createObject('component', 'cf-compendium.inc.resource.utility.formatHtml').init() />
		<cfset var testString = 'Hello World&##8230;' />
		
		<cfset assertEquals('Hello World...', theFormatter.cleanType(testString)) />
	</cffunction>
	
	<!---
		Test the conversion of ellipsis
	--->
	<cffunction name="testCleanTypeEllipsisMiddle" access="public" returntype="void" output="false">
		<cfset var theFormatter = createObject('component', 'cf-compendium.inc.resource.utility.formatHtml').init() />
		<cfset var testString = 'Hello World&##8230;How are you?' />
		
		<cfset assertEquals('Hello World...How are you?', theFormatter.cleanType(testString)) />
	</cffunction>
	
	<!---
		Test the conversion of en dash
	--->
	<cffunction name="testCleanTypeEmDash" access="public" returntype="void" output="false">
		<cfset var theFormatter = createObject('component', 'cf-compendium.inc.resource.utility.formatHtml').init() />
		<cfset var testString = 'Hello World&##8212;How are you?' />
		
		<cfset assertEquals('Hello World---How are you?', theFormatter.cleanType(testString)) />
	</cffunction>
	
	<!---
		Test the conversion of en dash
	--->
	<cffunction name="testCleanTypeEnDash" access="public" returntype="void" output="false">
		<cfset var theFormatter = createObject('component', 'cf-compendium.inc.resource.utility.formatHtml').init() />
		<cfset var testString = 'Hello World&##8211;How are you?' />
		
		<cfset assertEquals('Hello World--How are you?', theFormatter.cleanType(testString)) />
	</cffunction>
	
	<!---
		Test the conversion of double quotes
	--->
	<cffunction name="testCleanTypeQuotesDouble" access="public" returntype="void" output="false">
		<cfset var theFormatter = createObject('component', 'cf-compendium.inc.resource.utility.formatHtml').init() />
		<cfset var testString = '&##8220;Hello World&##8221;' />
		
		<cfset assertEquals('"Hello World"', theFormatter.cleanType(testString)) />
	</cffunction>
	
	<!---
		Test the conversion of single quotes
	--->
	<cffunction name="testCleanTypeQuotesSingle" access="public" returntype="void" output="false">
		<cfset var theFormatter = createObject('component', 'cf-compendium.inc.resource.utility.formatHtml').init() />
		<cfset var testString = "&##8216;Hello World&##8217;" />
		
		<cfset assertEquals('''Hello World''', theFormatter.cleanType(testString)) />
	</cffunction>
	
	<!---
		Test the conversion of apostrophe
	--->
	<cffunction name="testCleanTypeSApostrophe" access="public" returntype="void" output="false">
		<cfset var theFormatter = createObject('component', 'cf-compendium.inc.resource.utility.formatHtml').init() />
		<cfset var testString = 'Hello Worlds&apos;' />
		
		<cfset assertEquals('Hello Worlds''', theFormatter.cleanType(testString)) />
	</cffunction>
	
	<!---
		Test the conversion of apostrophe
	--->
	<cffunction name="testCorrectTypeApostropheS" access="public" returntype="void" output="false">
		<cfset var theFormatter = createObject('component', 'cf-compendium.inc.resource.utility.formatHtml').init() />
		<cfset var testString = 'Hello World''s' />
		
		<cfset assertEquals('Hello World&apos;s', theFormatter.correctType(testString)) />
	</cffunction>
	
	<!---
		Test the conversion of backticked strings
	--->
	<cffunction name="testCorrectTypeBackticks" access="public" returntype="void" output="false">
		<cfset var theFormatter = createObject('component', 'cf-compendium.inc.resource.utility.formatHtml').init() />
		<cfset var testString = "``Hello World''" />
		
		<cfset assertEquals('&##8216;Hello World&##8217;', theFormatter.correctType(testString)) />
	</cffunction>
	
	<!---
		Test the non-conversion in code tags
	--->
	<cffunction name="testCorrectTypeCodeTag" access="public" returntype="void" output="false">
		<cfset var theFormatter = createObject('component', 'cf-compendium.inc.resource.utility.formatHtml').init() />
		<cfset var testString = "<code>'Hello'</code>" />
		
		<cfset assertEquals('<code>''Hello''</code>', theFormatter.correctType(testString)) />
	</cffunction>
	
	<!---
		Test the conversion of ellipsis
	--->
	<cffunction name="testCorrectTypeEllipsis" access="public" returntype="void" output="false">
		<cfset var theFormatter = createObject('component', 'cf-compendium.inc.resource.utility.formatHtml').init() />
		<cfset var testString = 'Hello World...' />
		
		<cfset assertEquals('Hello World&##8230;', theFormatter.correctType(testString)) />
	</cffunction>
	
	<!---
		Test the conversion of ellipsis
	--->
	<cffunction name="testCorrectTypeEllipsisMiddle" access="public" returntype="void" output="false">
		<cfset var theFormatter = createObject('component', 'cf-compendium.inc.resource.utility.formatHtml').init() />
		<cfset var testString = 'Hello World...How are you?' />
		
		<cfset assertEquals('Hello World&##8230;How are you?', theFormatter.correctType(testString)) />
	</cffunction>
	
	<!---
		Test the conversion of en dash
	--->
	<cffunction name="testCorrectTypeEmDash" access="public" returntype="void" output="false">
		<cfset var theFormatter = createObject('component', 'cf-compendium.inc.resource.utility.formatHtml').init() />
		<cfset var testString = 'Hello World---How are you?' />
		
		<cfset assertEquals('Hello World&##8212;How are you?', theFormatter.correctType(testString)) />
	</cffunction>
	
	<!---
		Test the conversion of en dash
	--->
	<cffunction name="testCorrectTypeEnDash" access="public" returntype="void" output="false">
		<cfset var theFormatter = createObject('component', 'cf-compendium.inc.resource.utility.formatHtml').init() />
		<cfset var testString = 'Hello World--How are you?' />
		
		<cfset assertEquals('Hello World&##8211;How are you?', theFormatter.correctType(testString)) />
	</cffunction>
	
	<!---
		Test the non-conversion in kbd tags
	--->
	<cffunction name="testCorrectTypeKbdTag" access="public" returntype="void" output="false">
		<cfset var theFormatter = createObject('component', 'cf-compendium.inc.resource.utility.formatHtml').init() />
		<cfset var testString = "<kbd>'Hello'</kbd>" />
		
		<cfset assertEquals('<kbd>''Hello''</kbd>', theFormatter.correctType(testString)) />
	</cffunction>
	
	<!---
		Test the non-conversion in pre tags
	--->
	<cffunction name="testCorrectTypePreTag" access="public" returntype="void" output="false">
		<cfset var theFormatter = createObject('component', 'cf-compendium.inc.resource.utility.formatHtml').init() />
		<cfset var testString = "<pre>'Hello'</pre>" />
		
		<cfset assertEquals('<pre>''Hello''</pre>', theFormatter.correctType(testString)) />
	</cffunction>
	
	<!---
		Test the conversion of double quotes
	--->
	<cffunction name="testCorrectTypeQuotesDouble" access="public" returntype="void" output="false">
		<cfset var theFormatter = createObject('component', 'cf-compendium.inc.resource.utility.formatHtml').init() />
		<cfset var testString = '"Hello World"' />
		
		<cfset assertEquals('&##8220;Hello World&##8221;', theFormatter.correctType(testString)) />
	</cffunction>
	
	<!---
		Test the conversion of single quotes with an already converted first single quote
	--->
	<cffunction name="testCorrectTypeQuotesDoubleMixedOpening" access="public" returntype="void" output="false">
		<cfset var theFormatter = createObject('component', 'cf-compendium.inc.resource.utility.formatHtml').init() />
		<cfset var testString = '&##8220;Hello World"' />
		
		<cfset assertEquals('&##8220;Hello World&##8221;', theFormatter.correctType(testString)) />
	</cffunction>
	
	<!---
		Test the conversion of single quotes with an already converted last single quote
	--->
	<cffunction name="testCorrectTypeQuotesDoubleMixedClosing" access="public" returntype="void" output="false">
		<cfset var theFormatter = createObject('component', 'cf-compendium.inc.resource.utility.formatHtml').init() />
		<cfset var testString = '"Hello World&##8221;' />
		
		<cfset assertEquals('&##8220;Hello World&##8221;', theFormatter.correctType(testString)) />
	</cffunction>
	
	<!---
		Test the conversion of single quotes with an already converted last single quote between two single quotes
	--->
	<cffunction name="testCorrectTypeQuotesDoubleMixedMiddleOpening" access="public" returntype="void" output="false">
		<cfset var theFormatter = createObject('component', 'cf-compendium.inc.resource.utility.formatHtml').init() />
		<cfset var testString = '"Hello World" &##8220;Hello World"' />
		
		<cfset assertEquals('&##8220;Hello World&##8221; &##8220;Hello World&##8221;', theFormatter.correctType(testString)) />
	</cffunction>
	
	<!---
		Test the conversion of single quotes with an already converted last single quote between two single quotes
	--->
	<cffunction name="testCorrectTypeQuotesDoubleMixedMiddleClosing" access="public" returntype="void" output="false">
		<cfset var theFormatter = createObject('component', 'cf-compendium.inc.resource.utility.formatHtml').init() />
		<cfset var testString = '"Hello World&##8221; "Hello World"' />
		
		<cfset assertEquals('&##8220;Hello World&##8221; &##8220;Hello World&##8221;', theFormatter.correctType(testString)) />
	</cffunction>
	
	<!---
		Test the conversion of single quotes
	--->
	<cffunction name="testCorrectTypeQuotesSingle" access="public" returntype="void" output="false">
		<cfset var theFormatter = createObject('component', 'cf-compendium.inc.resource.utility.formatHtml').init() />
		<cfset var testString = "'Hello World'" />
		
		<cfset assertEquals('&##8216;Hello World&##8217;', theFormatter.correctType(testString)) />
	</cffunction>
	
	<!---
		Test the conversion of single quotes with an already converted first single quote
	--->
	<cffunction name="testCorrectTypeQuotesSingleMixedOpening" access="public" returntype="void" output="false">
		<cfset var theFormatter = createObject('component', 'cf-compendium.inc.resource.utility.formatHtml').init() />
		<cfset var testString = "&##8216;Hello World'" />
		
		<cfset assertEquals('&##8216;Hello World&##8217;', theFormatter.correctType(testString)) />
	</cffunction>
	
	<!---
		Test the conversion of single quotes with an already converted last single quote
	--->
	<cffunction name="testCorrectTypeQuotesSingleMixedClosing" access="public" returntype="void" output="false">
		<cfset var theFormatter = createObject('component', 'cf-compendium.inc.resource.utility.formatHtml').init() />
		<cfset var testString = "'Hello World&##8217;" />
		
		<cfset assertEquals('&##8216;Hello World&##8217;', theFormatter.correctType(testString)) />
	</cffunction>
	
	<!---
		Test the conversion of single quotes with an already converted last single quote between two single quotes
	--->
	<cffunction name="testCorrectTypeQuotesSingleMixedMiddleOpening" access="public" returntype="void" output="false">
		<cfset var theFormatter = createObject('component', 'cf-compendium.inc.resource.utility.formatHtml').init() />
		<cfset var testString = "'Hello World' &##8216;Hello World'" />
		
		<cfset assertEquals('&##8216;Hello World&##8217; &##8216;Hello World&##8217;', theFormatter.correctType(testString)) />
	</cffunction>
	
	<!---
		Test the conversion of single quotes with an already converted last single quote between two single quotes
	--->
	<cffunction name="testCorrectTypeQuotesSingleMixedMiddleClosing" access="public" returntype="void" output="false">
		<cfset var theFormatter = createObject('component', 'cf-compendium.inc.resource.utility.formatHtml').init() />
		<cfset var testString = "'Hello World&##8217; 'Hello World'" />
		
		<cfset assertEquals('&##8216;Hello World&##8217; &##8216;Hello World&##8217;', theFormatter.correctType(testString)) />
	</cffunction>
	
	<!---
		Test the conversion of apostrophe
	--->
	<cffunction name="testCorrectTypeSApostrophe" access="public" returntype="void" output="false">
		<cfset var theFormatter = createObject('component', 'cf-compendium.inc.resource.utility.formatHtml').init() />
		<cfset var testString = 'Hello Worlds''' />
		
		<cfset assertEquals('Hello Worlds&apos;', theFormatter.correctType(testString)) />
	</cffunction>
	
	<!---
		Test the non-conversion in script tags
	--->
	<cffunction name="testCorrectTypeScriptTag" access="public" returntype="void" output="false">
		<cfset var theFormatter = createObject('component', 'cf-compendium.inc.resource.utility.formatHtml').init() />
		<cfset var testString = "<script>'Hello'</script>" />
		
		<cfset assertEquals('<script>''Hello''</script>', theFormatter.correctType(testString)) />
	</cffunction>
</cfcomponent>