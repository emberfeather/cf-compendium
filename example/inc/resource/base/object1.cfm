<h1>Object Examples</h1>

<h2>Properties</h2>

<cfset object = createObject('component', 'implementation.inc.resource.base.object1').init() />

<p>
	Properties are defined in the init of the object and have a default value.
</p>

<cfset object.print() />

<h2>Struct</h2>

<cfset object = createObject('component', 'implementation.inc.resource.base.object1').init() />

<h3>Deserialize</h3>

<blockquote>
	<code>
		example = { test = 'struct', foo = 'balloon' }
	</code>
</blockquote>

<cfset example = { test = 'struct', foo = 'balloon' } />

<blockquote>
	<code>
		object.deserialize(example)
	</code>
</blockquote>

<cfset object.deserialize(example) />

<cfset object.print() />

<h3>Serialize</h3>

<blockquote>
	<code>
		object.serialize('struct')
	</code>
</blockquote>

<cfdump var="#object.serialize('struct')#" />

<h2>Query</h2>

<cfset object = createObject('component', 'implementation.inc.resource.base.object1').init() />

<h3>Deserialize</h3>

<blockquote>
	<code>
		example = queryNew('test,foo,bubble', 'varchar,varchar,varchar')
	</code>
</blockquote>

<cfset example = queryNew('test,foo,bubble', 'varchar,varchar,varchar') />

<blockquote>
	<code>
		queryAddRow(example, 1)<br />
		querySetCell(example, 'test', 'query')<br />
		querySetCell(example, 'foo', 'turnip')<br />
		querySetCell(example, 'bubble', 'gum')
	</code>
</blockquote>

<cfset queryAddRow(example, 1) />
<cfset querySetCell(example, 'test', 'query') />
<cfset querySetCell(example, 'foo', 'turnip') />
<cfset querySetCell(example, 'bubble', 'gum') />

<blockquote>
	<code>
		queryAddRow(example, 1)<br />
		querySetCell(example, 'test', 'query')<br />
		querySetCell(example, 'foo', 'turnip')<br />
		querySetCell(example, 'bubble', 'popping')
	</code>
</blockquote>

<cfset queryAddRow(example, 1) />
<cfset querySetCell(example, 'test', 'query') />
<cfset querySetCell(example, 'foo', 'turnip') />
<cfset querySetCell(example, 'bubble', 'popping') />

<blockquote>
	<code>
		object.deserialize(example)
	</code>
</blockquote>

<cfset object.deserialize(example) />

<cfset object.print() />

<h3>Serialize</h3>

<em>Not implemented yet...</em>

<!---
<cfdump var="#object.serialize('query')#" />
--->

<h2>XML</h2>

<cfset object = createObject('component', 'implementation.inc.resource.base.object1').init() />

<h3>Deserialize</h3>

<cfsavecontent variable="example">
	<example test="xml" foo="walrus">
		<bubble>go</bubble>
		<bubble>pop</bubble>
	</example>
</cfsavecontent>

<blockquote>
	<code>
		example = 
		<cfoutput>#htmlCodeFormat(example)#</cfoutput>
	</code>
</blockquote>

<blockquote>
	<code>
		example = xmlParse(example)<br />
		object.deserialize(example)
	</code>
</blockquote>

<cfset example = xmlParse(example) />
<cfset object.deserialize(example) />

<cfset object.print() />

<h3>Serialize</h3>

<blockquote>
	<code>
		object.serialize('xml')
	</code>
</blockquote>

<cfdump var="#object.serialize('xml')#" />

<h2>JSON</h2>

<cfset object = createObject('component', 'implementation.inc.resource.base.object1').init() />

<h3>Deserialize</h3>

<cfset example = '{"test":"me","foo":"kung","bubble":["ka","boom"]}' />

<blockquote>
	<code>
		<cfoutput>example = '#example#'</cfoutput>
	</code>
</blockquote>

<blockquote>
	<code>
		object.deserialize(example)
	</code>
</blockquote>

<cfset object.deserialize(example) />

<cfset object.print() />

<h3>Serialize</h3>

<blockquote>
	<code>
		object.serialize('json')
	</code>
</blockquote>

<cfdump var="#object.serialize('json')#" />