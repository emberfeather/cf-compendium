<h1>Sitemap Examples</h1>
<cfset sitemap = createObject('component', 'cf-compendium.inc.resource.utility.sitemap').init() />

<h2>addUrl('loc')</h2>

<blockquote>
	<code>
		sitemap.addUrl('http://google.com')
	</code>
</blockquote>

<cfset sitemap.addUrl('http://google.com') />

<h2>addUrl('loc', options)</h2>

<blockquote>
	<code>
		options = { priority = '0.5' }<br />
		sitemap.addUrl('http://google.com', options)
	</code>
</blockquote>

<cfset options = { priority = '0.5' } />
<cfset sitemap.addUrl('http://google.com', options) />

<h2>saveSitemap('domainDirectory', 'sitemapDirectory', 'sitemapFilename')</h2>

<blockquote>
	<code>
		sitemap.saveSitemap('http://domain.com', expandPath('./'))
	</code>
</blockquote>

<cfset sitemap.saveSitemap('http://domain.com', expandPath('./')) />

<h2>saveSitemapIndex('domainDirectory', 'sitemapDirectory', 'sitemapFilename')</h2>

<blockquote>
	<code>
		sitemap.saveSitemapIndex('http://domain.com', expandPath('./'))
	</code>
</blockquote>

<cfset sitemap.saveSitemapIndex('http://domain.com', expandPath('./')) />

<h2>Example Files</h2>

<p>
	See the <a href="sitemap.xml">example sitemap</a> and the <a href="sitemap_index.xml">example sitemap index</a>.
</p>

<h2>The Object</h2>

<cfdump var="#sitemap#" />