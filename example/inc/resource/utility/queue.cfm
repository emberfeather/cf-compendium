<h1>Queue Examples</h1>
<cfset queuer = createObject('component', 'cf-compendium.inc.resource.utility.queue').init() />

<h2>push(item)</h2>

<p>
	Pushes an item onto the queue.
</p>

<blockquote>
	<code>
		queuer.push('value1')<br />
		queuer.push('value2')<br />
		queuer.push('value3')
	</code>
</blockquote>

<cfset queuer.push('value1') />
<cfset queuer.push('value2') />
<cfset queuer.push('value3') />

<h2>pop()</h2>

<p>
	Pops an item off the queue.
</p>

<blockquote>
	<code>
		queuer.pop()
	</code>
</blockquote>

<cfdump var="#queuer.pop()#" label="Pop Item" />

<blockquote>
	<code>
		queuer.pop()
	</code>
</blockquote>

<cfdump var="#queuer.pop()#" label="Pop Item" />

<blockquote>
	<code>
		queuer.pop()
	</code>
</blockquote>

<cfdump var="#queuer.pop()#" label="Pop Item" />

<h2>The Object</h2>

<cfdump var="#queuer#" />