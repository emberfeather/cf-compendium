<h1>Message Format Example</h1>

<cfset theMessageFormatter = createObject('component', 'cf-compendium.inc.resource.i18n.messageFormat').init() />


<h2>Message Information</h2>

<h3>Message</h3>

<cfset message = 'On {1,date,full} at {1,time,medium}, I left {2} for the {3}. I took {4,number,currency} with me. Rounded number: {4,number,integer}' />
<blockquote>
	<code>
		message = '<cfoutput>#message#</cfoutput>'
	</code>
</blockquote>

<h3>Replacements</h3>

<blockquote>
	<code>
		replacement1 = now()<br />
		replacement2 = 'the shade'<br />
		replacement3 = 'donut shoppe'<br />
		replacement4 = 10003.28
	</code>
</blockquote>

<cfset replacement1 = now() />
<cfset replacement2 = 'the shade' />
<cfset replacement3 = 'donut shoppe' />
<cfset replacement4 = 10003.28 />

<h2>English</h2>

<cfset locale = 'en_US' />

<blockquote>
	<code>
		theMessageFormatter.init('<cfoutput>#locale#</cfoutput>')<br />
		theMessageFormatter.format(message, replacement1, replacement2, replacement3, replacement4)
	</code>
</blockquote>

<cfset theMessageFormatter.init(locale) />

<blockquote>
	<cfoutput>#theMessageFormatter.format(message, replacement1, replacement2, replacement3, replacement4)#</cfoutput>
</blockquote>

<h2>English (UK)</h2>

<cfset locale = 'en_UK' />

<blockquote>
	<code>
		theMessageFormatter.init('<cfoutput>#locale#</cfoutput>')<br />
		theMessageFormatter.format(message, replacement1, replacement2, replacement3, replacement4)
	</code>
</blockquote>

<cfset theMessageFormatter.init(locale) />

<blockquote>
	<cfoutput>#theMessageFormatter.format(message, replacement1, replacement2, replacement3, replacement4)#</cfoutput>
</blockquote>

<h2>Japenese</h2>

<cfset locale = 'jp_JP' />

<blockquote>
	<code>
		theMessageFormatter.init('<cfoutput>#locale#</cfoutput>')<br />
		theMessageFormatter.format(message, replacement1, replacement2, replacement3, replacement4)
	</code>
</blockquote>

<cfset theMessageFormatter.init(locale) />

<blockquote>
	<cfoutput>#theMessageFormatter.format(message, replacement1, replacement2, replacement3, replacement4)#</cfoutput>
</blockquote>

<h2>Thai</h2>

<cfset locale = 'th' />

<blockquote>
	<code>
		theMessageFormatter.init('<cfoutput>#locale#</cfoutput>')<br />
		theMessageFormatter.format(message, replacement1, replacement2, replacement3, replacement4)
	</code>
</blockquote>

<cfset theMessageFormatter.init(locale) />

<blockquote>
	<cfoutput>#theMessageFormatter.format(message, replacement1, replacement2, replacement3, replacement4)#</cfoutput>
</blockquote>

<h2>Albanian</h2>

<cfset locale = 'sq' />

<blockquote>
	<code>
		theMessageFormatter.init('<cfoutput>#locale#</cfoutput>')<br />
		theMessageFormatter.format(message, replacement1, replacement2, replacement3, replacement4)
	</code>
</blockquote>

<cfset theMessageFormatter.init(locale) />

<blockquote>
	<cfoutput>#theMessageFormatter.format(message, replacement1, replacement2, replacement3, replacement4)#</cfoutput>
</blockquote>

<h2>Tibetan</h2>

<cfset locale = 'bo' />

<blockquote>
	<code>
		theMessageFormatter.init('<cfoutput>#locale#</cfoutput>')<br />
		theMessageFormatter.format(message, replacement1, replacement2, replacement3, replacement4)
	</code>
</blockquote>

<cfset theMessageFormatter.init(locale) />

<blockquote>
	<cfoutput>#theMessageFormatter.format(message, replacement1, replacement2, replacement3, replacement4)#</cfoutput>
</blockquote>

<h2>Dutch</h2>

<cfset locale = 'nl' />

<blockquote>
	<code>
		theMessageFormatter.init('<cfoutput>#locale#</cfoutput>')<br />
		theMessageFormatter.format(message, replacement1, replacement2, replacement3, replacement4)
	</code>
</blockquote>

<cfset theMessageFormatter.init(locale) />

<blockquote>
	<cfoutput>#theMessageFormatter.format(message, replacement1, replacement2, replacement3, replacement4)#</cfoutput>
</blockquote>

<h2>French</h2>

<cfset locale = 'fr' />

<blockquote>
	<code>
		theMessageFormatter.init('<cfoutput>#locale#</cfoutput>')<br />
		theMessageFormatter.format(message, replacement1, replacement2, replacement3, replacement4)
	</code>
</blockquote>

<cfset theMessageFormatter.init(locale) />

<blockquote>
	<cfoutput>#theMessageFormatter.format(message, replacement1, replacement2, replacement3, replacement4)#</cfoutput>
</blockquote>

<h2>German</h2>

<cfset locale = 'de' />

<blockquote>
	<code>
		theMessageFormatter.init('<cfoutput>#locale#</cfoutput>')<br />
		theMessageFormatter.format(message, replacement1, replacement2, replacement3, replacement4)
	</code>
</blockquote>

<cfset theMessageFormatter.init(locale) />

<blockquote>
	<cfoutput>#theMessageFormatter.format(message, replacement1, replacement2, replacement3, replacement4)#</cfoutput>
</blockquote>

<h2>Yiddish</h2>

<cfset locale = 'yi' />

<blockquote>
	<code>
		theMessageFormatter.init('<cfoutput>#locale#</cfoutput>')<br />
		theMessageFormatter.format(message, replacement1, replacement2, replacement3, replacement4)
	</code>
</blockquote>

<cfset theMessageFormatter.init(locale) />

<blockquote>
	<cfoutput>#theMessageFormatter.format(message, replacement1, replacement2, replacement3, replacement4)#</cfoutput>
</blockquote>

<h2>The Object</h2>

<cfdump var="#theMessageFormatter#" />
