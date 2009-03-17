<h1>Message Format Example</h1>

<cfset theMessageFormatter = createObject('component', 'cf-compendium.inc.resource.i18n.messageFormat').init() />

<cfset message = 'On {1,date,full} at {1,time,medium}, I left {2} for the {3}. I took {4,number,currency} with me. Rounded number: {4,number,integer}' />
<cfset replacement1 = now() />
<cfset replacement2 = 'the shade' />
<cfset replacement3 = 'donut shoppe' />
<cfset replacement4 = 10003.28 />

<h2>Message Information</h2>

<h3>Message</h3>

<cfoutput>#message#</cfoutput>

<h3>Replacement 1</h3>

<cfoutput>#replacement1#</cfoutput>

<h3>Replacement 2</h3>

<cfoutput>#replacement2#</cfoutput>

<h3>Replacement 3</h3>

<cfoutput>#replacement3#</cfoutput>

<h3>Replacement 4</h3>

<cfoutput>#replacement4#</cfoutput>

<h2>English</h2>

<cfset locale = 'en_US' />
<cfset theMessageFormatter.init(locale) />

<h3>Formatted Message</h3>

<cfoutput>#theMessageFormatter.format(message, replacement1, replacement2, replacement3, replacement4)#</cfoutput>

<h2>English (UK)</h2>

<cfset locale = 'en_UK' />
<cfset theMessageFormatter.init(locale) />

<h3>Formatted Message</h3>

<cfoutput>#theMessageFormatter.format(message, replacement1, replacement2, replacement3, replacement4)#</cfoutput>

<h2>Japenese</h2>

<cfset locale = 'jp_JP' />
<cfset theMessageFormatter.init(locale) />

<h3>Formatted Message</h3>

<cfoutput>#theMessageFormatter.format(message, replacement1, replacement2, replacement3, replacement4)#</cfoutput>

<h2>Thai</h2>

<cfset locale = 'th' />
<cfset theMessageFormatter.init(locale) />

<h3>Formatted Message</h3>

<cfoutput>#theMessageFormatter.format(message, replacement1, replacement2, replacement3, replacement4)#</cfoutput>

<h2>Albanian</h2>

<cfset locale = 'sq' />
<cfset theMessageFormatter.init(locale) />

<h3>Formatted Message</h3>

<cfoutput>#theMessageFormatter.format(message, replacement1, replacement2, replacement3, replacement4)#</cfoutput>

<h2>Tibetan</h2>

<cfset locale = 'bo' />
<cfset theMessageFormatter.init(locale) />

<h3>Formatted Message</h3>

<cfoutput>#theMessageFormatter.format(message, replacement1, replacement2, replacement3, replacement4)#</cfoutput>

<h2>Dutch</h2>

<cfset locale = 'nl' />
<cfset theMessageFormatter.init(locale) />

<h3>Formatted Message</h3>

<cfoutput>#theMessageFormatter.format(message, replacement1, replacement2, replacement3, replacement4)#</cfoutput>

<h2>French</h2>

<cfset locale = 'fr' />
<cfset theMessageFormatter.init(locale) />

<h3>Formatted Message</h3>

<cfoutput>#theMessageFormatter.format(message, replacement1, replacement2, replacement3, replacement4)#</cfoutput>

<h2>German</h2>

<cfset locale = 'de' />
<cfset theMessageFormatter.init(locale) />

<h3>Formatted Message</h3>

<cfoutput>#theMessageFormatter.format(message, replacement1, replacement2, replacement3, replacement4)#</cfoutput>

<h2>Yiddish</h2>

<cfset locale = 'yi' />
<cfset theMessageFormatter.init(locale) />

<h3>Formatted Message</h3>

<cfoutput>#theMessageFormatter.format(message, replacement1, replacement2, replacement3, replacement4)#</cfoutput>

<h2>the object</h2>

<cfdump var="#theMessageFormatter#" />