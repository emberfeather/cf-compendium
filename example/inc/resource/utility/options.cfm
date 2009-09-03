<h1>Option Examples</h1>
<cfset options = createObject('component', 'cf-compendium.inc.resource.utility.options').init() />

<h2>addOption(title, value)</h2>

<blockquote>
	<code>
		options.addOption('Title 1', 'Value 1')
	</code>
</blockquote>

<cfset options.addOption('Title 1', 'Value 1') />

<h2>addGroup(group)</h2>

<blockquote>
	<code>
		options.addGroup('Group 1')
	</code>
</blockquote>

<cfset options.addGroup('Group 1') />

<h2>length()</h2>

<blockquote>
	<code>
		options.length()
	</code>
</blockquote>

<cfdump var="#options.length()#" label="Options Length" />

<h2>get()</h2>

<blockquote>
	<code>
		options.get()
	</code>
</blockquote>

<cfdump var="#options.get()#" label="Options" />

<h2>The Object</h2>

<cfdump var="#options#" />