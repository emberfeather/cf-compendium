<h1>URL Examples</h1>

<cfset theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init('foo=bar&stuff&user=1') />

<h2>Clean</h2>

<p>
	Completely cleans the url instance to have a clean base to work off.
</p>

<blockquote>
	<code>
		theUrl.get()
	</code>
</blockquote>

<cfdump var="#theUrl.get()#" label="Master URL" />

<blockquote>
	<code>
		theUrl.cleanRedirect()<br />
		theUrl.getRedirect()
	</code>
</blockquote>

<cfset theUrl.cleanRedirect() />

<cfdump var="#theUrl.getRedirect()#" label="Redirect URL" />

<h2>Extend</h2>

<p>
	Extends the url instance with defaults if they don't exist.
</p>

<p>
	<em>Compare with Override.</em>
</p>

<blockquote>
	<code>
		theUrl.get()
	</code>
</blockquote>

<cfdump var="#theUrl.get()#" label="Master URL" />

<blockquote>
	<code>
		theUrl.extendExtended('foo=barred&spring=loaded')<br />
		theUrl.getExtended()
	</code>
</blockquote>

<cfset theUrl.extendExtended('foo=barred&spring=loaded') />

<cfdump var="#theUrl.getExtended()#" label="Extended URL" />

<h2>Has</h2>

<p>
	Tests if the url instance exists already.
</p>

<blockquote>
	<code>
		theUrl.hasExtended()
	</code>
</blockquote>

<cfdump var="#theUrl.hasExtended()#" label="Has Extended URL" />

<blockquote>
	<code>
		theUrl.hasIcing()
	</code>
</blockquote>

<cfdump var="#theUrl.hasIcing()#" label="Has Icing URL" />

<h2>Override</h2>

<p>
	Overrides the url instance with new values even if they exist.
</p>

<p>
	<em>Compare with Extend.</em>
</p>

<blockquote>
	<code>
		theUrl.get()
	</code>
</blockquote>

<cfdump var="#theUrl.get()#" label="Master URL" />

<blockquote>
	<code>
		theUrl.overrideExtended('foo=barred&spring=loaded')<br />
		theUrl.getExtended()
	</code>
</blockquote>

<cfset theUrl.extendExtended('foo=barred&spring=loaded') />

<cfdump var="#theUrl.getExtended()#" label="Extended URL" />

<h2>Reset</h2>

<p>
	Resets the url instance with new a new querystring.
</p>

<blockquote>
	<code>
		theUrl.get()
	</code>
</blockquote>

<cfdump var="#theUrl.get()#" label="Master URL" />

<blockquote>
	<code>
		theUrl.resetResetted('foo=barred&spring=loaded')
	</code>
</blockquote>

<cfset theUrl.resetResetted('foo=barred&spring=loaded') />

<cfdump var="#theUrl.getResetted()#" label="Reset URL" />

<h2>Search</h2>

<p>
	Searches the url instance for a value. If the key is not found in the instance it will return a blank string.
</p>

<p>
	<em>Compare to SearchID</em>
</p>

<blockquote>
	<code>
		theUrl.search('spring')
	</code>
</blockquote>

<cfdump var="#theUrl.search('spring')#" label="Search for 'spring'" />

<blockquote>
	<code>
		theUrl.search('foo')
	</code>
</blockquote>

<cfdump var="#theUrl.search('foo')#" label="Search for 'foo'" />

<blockquote>
	<code>
		theUrl.search('user')
	</code>
</blockquote>

<cfdump var="#theUrl.search('user')#" label="Search for 'user'" />

<h2>SearchID</h2>

<p>
	Searches the url instance for a value. If the key is not found in the instance or is not numeric will return a 0.
</p>

<p>
	<em>Compare to Search</em>
</p>

<blockquote>
	<code>
		theUrl.searchID('spring')
	</code>
</blockquote>

<cfdump var="#theUrl.searchID('spring')#" label="Search for 'spring' ID" />

<blockquote>
	<code>
		theUrl.searchID('foo')
	</code>
</blockquote>

<cfdump var="#theUrl.searchID('foo')#" label="Search for 'foo' ID" />

<blockquote>
	<code>
		theUrl.searchID('user')
	</code>
</blockquote>

<cfdump var="#theUrl.searchID('user')#" label="Search for 'user' ID" />

<h2>The Object</h2>

<cfdump var="#theUrl#" />