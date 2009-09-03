<h1>Base 62 Examples</h1>
<cfset base62 = createObject('component', 'cf-compendium.inc.resource.utility.base62').init() />

<h2>valueToBase62( number )</h2>

<p>
	Will convert a number to a base 62 string.
</p>

<cfset value = 2637482 />

<blockquote>
	<code>
		base62.valueToBase62(<cfoutput>#value#</cfoutput>)
	</code>
</blockquote>

<cfset base = base62.valueToBase62(value) />

<cfdump var="#base#" label="valueToBase62" />

<h2>base62ToValue( string )</h2>

<p>
	Will convert a base 62 string (a-zA-Z0-9) to a value.
</p>

<blockquote>
	<code>
		base62.valueToBase62(<cfoutput>#base#</cfoutput>)
	</code>
</blockquote>

<cfset value = base62.base62ToValue(base) />

<cfdump var="#value#" label="base62ToBValue" />

<h2>Base 62 Characters</h2>

<div class="prefix_1 grid_2 alpha">
	<cfloop from="0" to="61" index="i">
		<cfif i EQ 16 OR i EQ 32>
			</div>
			<div class="grid_2">
		<cfelseif i EQ 48>
			</div>
			<div class="grid_2 omega">
		</cfif>
		
		<cfoutput>
			<strong>#i#</strong> : #base62.valueToBase62(i)#<br />
		</cfoutput>
	</cfloop>
</div>

<div class="clear"><!-- clear --></div>

<h2>The Object</h2>

<cfdump var="#base62#" />