<h1>Stack Examples</h1>
<cfset stacker = createObject('component', 'cf-compendium.inc.resource.utility.stack').init() />

<h2>push(item)</h2>

<p>
	Pushes an item onto the stack.
</p>

<blockquote>
	<code>
		stacker.push('value1')<br />
		stacker.push('value2')<br />
		stacker.push('value3')
	</code>
</blockquote>

<cfset stacker.push('value1') />
<cfset stacker.push('value2') />
<cfset stacker.push('value3') />

<h2>pop()</h2>

<p>
	Pops an item off the stack.
</p>

<blockquote>
	<code>
		stacker.pop()
	</code>
</blockquote>

<cfdump var="#stacker.pop()#" label="Pop Item" />

<blockquote>
	<code>
		stacker.pop()
	</code>
</blockquote>

<cfdump var="#stacker.pop()#" label="Pop Item" />

<blockquote>
	<code>
		stacker.pop()
	</code>
</blockquote>

<cfdump var="#stacker.pop()#" label="Pop Item" />

<h2>The Object</h2>

<cfdump var="#stacker#" />