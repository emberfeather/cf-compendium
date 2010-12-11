<h1>Object Examples</h1>

<cfset objectSerial = createObject('component', 'cf-compendium.inc.resource.storage.objectSerial').init() />

<blockquote>
	<code>
		objectSerial = createObject('component', 'cf-compendium.inc.resource.storage.objectSerial').init()
	</code>
</blockquote>

<h2>Struct</h2>

<h3>Deserialize</h3>

<blockquote>
	<code>
		example = { '__fullname' = 'implementation.inc.resource.base.object1', test' = 'struct', 'foo' = 'balloon' }<br />
		object = objectSerial.deserialize(input = example, isTrustedSource = true)
	</code>
</blockquote>

<cfset example = { '__fullname' = 'implementation.inc.resource.base.object1', 'test' = 'struct', 'foo' = 'balloon' } />
<cfset object = objectSerial.deserialize(input = example, isTrustedSource = true) />

<cfdump var="#object#" expand="false" />

<cfset object.print() />

<h3>Serialize</h3>

<blockquote>
	<code>
		objectSerial.serialize(object, 'struct')
	</code>
</blockquote>

<cfdump var="#objectSerial.serialize(object, 'struct')#" />

<h2>Query</h2>

<h3>Deserialize</h3>

<blockquote>
	<code>
		example = queryNew('__fullname,test,foo,bubble', 'varchar,varchar,varchar,varchar')<br /><br />
		queryAddRow(example, 1)<br />
		querySetCell(example, '__fullname', 'implementation.inc.resource.base.object1')<br />
		querySetCell(example, 'test', 'query')<br />
		querySetCell(example, 'foo', 'turnip')<br />
		querySetCell(example, 'bubble', 'gum')<br />
		queryAddRow(example, 1)<br />
		querySetCell(example, '__fullname', 'implementation.inc.resource.base.object1')<br />
		querySetCell(example, 'test', 'query')<br />
		querySetCell(example, 'foo', 'turnip')<br />
		querySetCell(example, 'bubble', 'popping')<br /><br />
		object = objectSerial.deserialize(input = example, isTrustedSource = true)
	</code>
</blockquote>

<cfset example = queryNew('__fullname,test,foo,bubble', 'varchar,varchar,varchar,varchar') />

<cfset queryAddRow(example, 1) />
<cfset querySetCell(example, '__fullname', 'implementation.inc.resource.base.object1') />
<cfset querySetCell(example, 'test', 'query') />
<cfset querySetCell(example, 'foo', 'turnip') />
<cfset querySetCell(example, 'bubble', 'gum') />
<cfset queryAddRow(example, 1) />
<cfset querySetCell(example, '__fullname', 'implementation.inc.resource.base.object1') />
<cfset querySetCell(example, 'test', 'query') />
<cfset querySetCell(example, 'foo', 'turnip') />
<cfset querySetCell(example, 'bubble', 'popping') />

<cfset object = objectSerial.deserialize(input = example, isTrustedSource = true) />

<cfdump var="#object#" expand="false" />

<cfset object.print() />

<h3>Serialize</h3>

<em>Not implemented yet...</em>

<!---
<cfdump var="#objectSerial.serialize(object, 'query')#" />
--->

<h2>JSON</h2>

<h3>Deserialize</h3>

<cfset example = '{"__fullname": "implementation.inc.resource.base.object1", "test":"me","foo":"kung","bubble":["ka","boom"]}' />

<blockquote>
	<code>
		<cfoutput>example = '#example#'</cfoutput><br />
		object = objectSerial.deserialize(input = example, isTrustedSource = true)
	</code>
</blockquote>

<cfset object = objectSerial.deserialize(input = example, isTrustedSource = true) />

<cfdump var="#object#" expand="false" />

<cfset object.print() />

<h3>Serialize</h3>

<blockquote>
	<code>
		objectSerial.serialize(object, 'json')
	</code>
</blockquote>

<cfdump var="#objectSerial.serialize(object, 'json')#" />
