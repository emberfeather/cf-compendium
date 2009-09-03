<h1>HTML Formatter</h1>

<cfset formatter = createObject('component', 'cf-compendium.inc.resource.utility.formatHtml').init() />

<h2>correctType(html)</h2>

<p>
	Used to convert ", ', --, ---, and ... to the correct html entities
</p>

<blockquote>
	<code>
		testString = 'Hello friend "unknown", I didn''t -- ahh...'<br />
		corrected = formatter.correctType(testString)
	</code>
</blockquote>

<cfset testString = 'Hello friend "unknown", I didn''t -- ahh...' />

<cfset corrected = formatter.correctType(testString) />

<cfdump var="#corrected#" label="corrected" />

<h2>cleanType(html)</h2>

<p>
	Used to convert ", ', --, ---, and ... back from html entities
</p>

<blockquote>
	<code>
		testString = 'Hello friend &#8220;unknown&#8221;, I didn&apos;t &#8211; ahh&#8230;'<br />
		cleaned = formatter.correctType(testString)
	</code>
</blockquote>

<cfset testString = 'Hello friend &##8220;unknown&##8221;, I didn&apos;t &##8211; ahh&##8230;' />

<cfset cleaned = formatter.cleanType(testString) />

<cfdump var="#cleaned#" label="cleaned" />
