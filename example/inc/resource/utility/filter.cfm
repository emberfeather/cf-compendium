<h1>Filter Examples</h1>

<blockquote>
	<code>
		i18n = createObject('component', 'cf-compendium.inc.resource.i18n.i18n').init( expandPath('/i18n/') )<br />
		filter = createObject('component', 'cf-compendium.inc.resource.utility.filter').init(i18n)<br />
		theURL = createObject('component', 'cf-compendium.inc.resource.utility.url').init('')
	</code>
</blockquote>

<cfset i18n = createObject('component', 'cf-compendium.inc.resource.i18n.i18n').init(expandPath('/i18n/')) />
<cfset filter = createObject('component', 'cf-compendium.inc.resource.utility.filter').init(i18n) />
<cfset theURL = createObject('component', 'cf-compendium.inc.resource.utility.url').init('') />

<h2>addBundle(path, name)</h2>

<p>
	Adds an i18n bundle for label translation.
</p>

<blockquote>
	<code>
		filter.addBundle('inc/resource/utility', 'filter')
	</code>
</blockquote>

<cfset filter.addBundle('inc/resource/utility', 'filter') />

<h2>addFilter() - No Options</h2>

<blockquote>
	<code>
		filter.addFilter('test1')
	</code>
</blockquote>

<cfset filter.addFilter('test1') />

<cfoutput>#filter.toHTML(theURL)#</cfoutput>

<h2>addFilter() - One Option</h2>

<cfset filter = createObject('component', 'cf-compendium.inc.resource.utility.filter').init(i18n) />
<cfset filter.addBundle('inc/resource/utility', 'filter') />

<blockquote>
	<code>
		options = createObject('component', 'cf-compendium.inc.resource.utility.options').init()<br />
		options.addOption('Option 1', 'option1')<br />
		filter.addFilter('test1', options)
	</code>
</blockquote>

<cfset options = createObject('component', 'cf-compendium.inc.resource.utility.options').init() />

<cfset options.addOption('Option 1', 'option1') />

<cfset filter.addFilter('test1', options) />

<cfoutput>#filter.toHTML(theURL)#</cfoutput>

<h2>addFilter() - Few Options</h2>

<cfset filter = createObject('component', 'cf-compendium.inc.resource.utility.filter').init(i18n) />
<cfset filter.addBundle('inc/resource/utility', 'filter') />

<blockquote>
	<code>
		options = createObject('component', 'cf-compendium.inc.resource.utility.options').init()<br />
		options.addOption('Option 1', 'option1')<br />
		options.addOption('Option 2', 'option2')<br />
		options.addOption('Option 3', 'option3')<br />
		filter.addFilter('test1', options)
	</code>
</blockquote>

<cfset options = createObject('component', 'cf-compendium.inc.resource.utility.options').init() />

<cfset options.addOption('Option 1', 'option1') />
<cfset options.addOption('Option 2', 'option2') />
<cfset options.addOption('Option 3', 'option3') />

<cfset filter.addFilter('test1', options) />

<cfoutput>#filter.toHTML(theURL)#</cfoutput>

<h2>addFilter() - Many options</h2>

<cfset filter = createObject('component', 'cf-compendium.inc.resource.utility.filter').init(i18n) />
<cfset filter.addBundle('inc/resource/utility', 'filter') />

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
		filter.addFilter('test1', options)
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

<cfset filter.addFilter('test1', options) />

<cfoutput>#filter.toHTML(theURL)#</cfoutput>

<h2>The Object</h2>

<cfdump var="#filter#" />