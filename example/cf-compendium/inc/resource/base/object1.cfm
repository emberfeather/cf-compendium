<cfset i18n = createObject('component', 'cf-compendium.inc.resource.i18n.i18n').init(expandPath('/')) />
<cfset object = createObject('component', 'implementation.cf-compendium.inc.resource.base.object1').init(i18n) />

<h1>Object Examples</h1>

<h2>Properties</h2>

<cfset object.print() />

<h2>Struct</h2>

<h3>Deserialize</h3>

<cfset example = { test = 'struct', foo = 'balloon' } />

<cfset object.deserialize(example) />
<cfset object.print() />

<h3>Serialize</h3>

<cfdump var="#object.serialize('struct')#" />

<h2>Query</h2>

<h3>Deserialize</h3>

<cfset example = queryNew('test,foo,bubble', 'varchar,varchar,varchar') />

<cfset queryAddRow(example, 1) />
<cfset querySetCell(example, 'test', 'query') />
<cfset querySetCell(example, 'foo', 'turnip') />
<cfset querySetCell(example, 'bubble', 'gum') />

<cfset queryAddRow(example, 1) />
<cfset querySetCell(example, 'test', 'query') />
<cfset querySetCell(example, 'foo', 'turnip') />
<cfset querySetCell(example, 'bubble', 'popping') />

<cfset object.deserialize(example) />
<cfset object.print() />

<h3>Serialize</h3>

<!---
<cfdump var="#object.serialize('query')#" />
--->

<h2>XML</h2>

<h3>Deserialize</h3>

<cfsavecontent variable="example">
<example test="xml" foo="walrus">
    <bubble>go</bubble>
    <bubble>pop</bubble>
</example>
</cfsavecontent>

<cfset example = xmlParse(example) />

<cfset object.deserialize(example) />
<cfset object.print() />

<h3>Serialize</h3>

<cfdump var="#object.serialize('xml')#" />

<h2>JSON</h2>

<h3>Deserialize</h3>

<cfset example = '{"test":"me","foo":"kung","bubble":["ka","boom"]}' />
<cfset object.deserialize(example) />
<cfset object.print() />

<h3>Serialize</h3>

<cfdump var="#object.serialize('json')#" />