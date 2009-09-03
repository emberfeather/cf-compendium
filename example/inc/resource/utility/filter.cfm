<h1>Filter Examples</h1>

<cfset theURL = createObject('component', 'cf-compendium.inc.resource.utility.url').init('') />
<cfset filter = createObject('component', 'cf-compendium.inc.resource.utility.filter').init(theURL) />

<h2>addFilter() - No Options</h2>

<blockquote>
	<code>
		filter.addFilter('Test 1', 'test1')
	</code>
</blockquote>

<cfset filter.addFilter('Test 1', 'test1') />

<cfoutput>#filter.toHTML()#</cfoutput>

<h2>addFilter() - One Option</h2>

<cfset filter = createObject('component', 'cf-compendium.inc.resource.utility.filter').init(theURL) />

<blockquote>
	<code>
		options = createObject('component', 'cf-compendium.inc.resource.utility.options').init()<br />
		options.addOption('Option 1', 'option1')<br />
		filter.addFilter('Test 1', 'test1', options)
	</code>
</blockquote>

<cfset options = createObject('component', 'cf-compendium.inc.resource.utility.options').init() />

<cfset options.addOption('Option 1', 'option1') />

<cfset filter.addFilter('Test 1', 'test1', options) />

<cfoutput>#filter.toHTML()#</cfoutput>

<h2>addFilter() - Few Options</h2>

<cfset filter = createObject('component', 'cf-compendium.inc.resource.utility.filter').init(theURL) />

<blockquote>
	<code>
		options = createObject('component', 'cf-compendium.inc.resource.utility.options').init()<br />
		options.addOption('Option 1', 'option1')<br />
		options.addOption('Option 2', 'option2')<br />
		options.addOption('Option 3', 'option3')<br />
		filter.addFilter('Test 1', 'test1', options)
	</code>
</blockquote>

<cfset options = createObject('component', 'cf-compendium.inc.resource.utility.options').init() />

<cfset options.addOption('Option 1', 'option1') />
<cfset options.addOption('Option 2', 'option2') />
<cfset options.addOption('Option 3', 'option3') />

<cfset filter.addFilter('Test 1', 'test1', options) />

<cfoutput>#filter.toHTML()#</cfoutput>

<h2>addFilter() - Many options</h2>

<cfset filter = createObject('component', 'cf-compendium.inc.resource.utility.filter').init(theURL) />

<blockquote>
	<code>
		options = createObject('component', 'cf-compendium.inc.resource.utility.options').init()<br />
		options.addOption('Option 1', 'option1')<br />
		options.addOption('Option 2', 'option2')<br />
		options.addOption('Option 3', 'option3')<br />
		options.addOption('Option 4', 'option4')<br />
		options.addOption('Option 5', 'option5')<br />
		options.addOption('Option 6', 'option6')<br />
		options.addOption('Option 7', 'option7')<br />
		options.addOption('Option 8', 'option8')<br />
		options.addOption('Option 9', 'option9')<br />
		filter.addFilter('Test 1', 'test1', options)
	</code>
</blockquote>

<cfset options = createObject('component', 'cf-compendium.inc.resource.utility.options').init() />

<cfset options.addOption('Option 1', 'option1') />
<cfset options.addOption('Option 2', 'option2') />
<cfset options.addOption('Option 3', 'option3') />
<cfset options.addOption('Option 4', 'option4') />
<cfset options.addOption('Option 5', 'option5') />
<cfset options.addOption('Option 6', 'option6') />
<cfset options.addOption('Option 7', 'option7') />
<cfset options.addOption('Option 8', 'option8') />
<cfset options.addOption('Option 9', 'option9') />

<cfset filter.addFilter('Test 1', 'test1', options) />

<cfoutput>#filter.toHTML()#</cfoutput>

<h2>The Object</h2>

<cfdump var="#filter#" />