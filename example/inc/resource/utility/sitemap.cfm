<h1>Sitemap Examples</h1>
<cfset theSitemap = createObject('component', 'cf-compendium.inc.resource.utility.sitemap').init() />

<h2>addUrl('loc', options)</h2>

<div>
	<p>
		addUrl('http://google.com')
		<cfoutput>#theSitemap.addUrl('http://google.com')#</cfoutput>
	</p>
	
	<p>
		options = { priority = '0.5' }
		<cfset options = { priority = '0.5' } />
	</p>
		
	<p>
		addUrl('http://google.com', options)
		<cfoutput>#theSitemap.addUrl('http://google.com', options)#</cfoutput>
	</p>
</div>

<h2>saveSitemap('domainDirectory', 'sitemapDirectory', 'sitemapFilename')</h2>

<div>
	<p>
		saveSitemap('http://domain.com', expandPath('./'))
		<cfset theSitemap.saveSitemap('http://domain.com', expandPath('./')) />
	</p>
</div>

<h2>saveSitemapIndex('domainDirectory', 'sitemapDirectory', 'sitemapFilename')</h2>

<div>
	<p>
		saveSitemapIndex('http://domain.com', expandPath('./'))
		<cfset theSitemap.saveSitemapIndex('http://domain.com', expandPath('./')) />
	</p>
</div>

<h2>Example Files</h2>

See the <a href="sitemap.xml">example sitemap</a> and the <a href="sitemap_index.xml">example sitemap index</a>.

<h2>the object</h2>

<cfdump var="#theSitemap#" />