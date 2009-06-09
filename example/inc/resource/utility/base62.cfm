<h1>Base 62 Examples</h1>
<cfset base62 = createObject('component', 'cf-compendium.inc.resource.utility.base62').init() />

<h2>valueToBase62( number )</h2>

<p>
	Will convert a number to a base 62 string.
</p>

<div>
	<cfset value = 123456789 />
	<cfset base = base62.valueToBase62(value) />
	<cfoutput>valueToBase62(#value#) --&gt; #base#</cfoutput>
</div>

<h2>Base62ToValue( string )</h2>

<p>
	Will convert a base 62 string (a-zA-Z0-9) to a value.
</p>

<div>
	<cfset value = base62.base62ToValue(base) />
	<cfoutput>base62ToValue('#base#') --&gt; #value#</cfoutput>
</div>

<h2>the object</h2>
<cfdump var="#base62#" />