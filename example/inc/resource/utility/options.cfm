<h1>Option Examples</h1>
<cfset options = createObject('component', 'cf-compendium.inc.resource.utility.options').init() />

<h2>addOption()</h2>

<div>
	<p>
		addOption('title', 'value') --&gt;
		<cfoutput>#options.addOption('Title 1', 'Value 1')#</cfoutput>
	</p>
</div>

<h2>addGroup()</h2>

<div>
	<p>
		addGroup('label') --&gt;
		<cfoutput>#options.addGroup('Group 1')#</cfoutput>
	</p>
</div>

<h2>length()</h2>

<div>
	<p>
		length() --&gt;
		<cfoutput>#options.length()#</cfoutput>
	</p>
</div>

<h2>get()</h2>

<div>
	<p>
		get() --&gt;
		<cfdump var="#options.get()#" />
	</p>
</div>

<h2>the object</h2>

<cfdump var="#options#" />