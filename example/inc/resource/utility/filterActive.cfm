<h1>Active Filter Examples</h1>

<blockquote>
	<code>
		i18n = createObject('component', 'cf-compendium.inc.resource.i18n.i18n').init( expandPath('/i18n/') )<br />
		filterActive = createObject('component', 'cf-compendium.inc.resource.utility.filterActive').init(i18n)<br />
		theURL = createObject('component', 'cf-compendium.inc.resource.utility.url').init('test1=here&test2=out')
	</code>
</blockquote>

<cfset i18n = createObject('component', 'cf-compendium.inc.resource.i18n.i18n').init(expandPath('/i18n/')) />
<cfset filterActive = createObject('component', 'cf-compendium.inc.resource.utility.filterActive').init(i18n) />
<cfset theURL = createObject('component', 'cf-compendium.inc.resource.utility.url').init('test1=here&test2=out') />

<h2>addBundle(path, name)</h2>

<p>
	Adds an i18n bundle for label translation.
</p>

<blockquote>
	<code>
		filterActive.addBundle('inc/resource/utility', 'filter')
	</code>
</blockquote>

<cfset filterActive.addBundle('inc/resource/utility', 'filter') />

<h2>toHTML( filter, theURL[, keys] )</h2>

<p>
	Uses the filter (URL object, or a struct) to craft the HTML for showing 
	all the active filters and links to remove them.
</p>

<blockquote>
	<code>
		filterActive.toHTML(theURL, theURL, 'test1,test2,test3')
	</code>
</blockquote>

<cfoutput>#filterActive.toHTML(theURL, theURL, 'test1,test2,test3')#</cfoutput>

<blockquote>
	<code>
		filterActive.toHTML({
			test1 = 'here',
			test2 = 'out',
			test3 = 'else'
		}, theURL, 'test1,test2')
	</code>
</blockquote>

<cfoutput>#filterActive.toHTML({
		test1 = 'here',
		test2 = 'out',
		test3 = 'else'
	}, theURL, 'test1,test2')#</cfoutput>

<h2>The Object</h2>

<cfdump var="#filterActive#" />