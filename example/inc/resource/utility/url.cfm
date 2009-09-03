<h1>URL Examples</h1>

<cfset theURL = createObject('component', 'cf-compendium.inc.resource.utility.url').init('foo=bar&stuff&user=1') />

<h2>Clean</h2>

<p>
	Completely cleans the url instance to have a clean base to work off.
</p>

<blockquote>
	<code>
		theURL.get()
	</code>
</blockquote>

<cfdump var="#theURL.get()#" label="Master URL" />

<blockquote>
	<code>
		theURL.cleanRedirect()<br />
		theURL.getRedirect()
	</code>
</blockquote>

<cfset theURL.cleanRedirect() />

<cfdump var="#theURL.getRedirect()#" label="Redirect URL" />

<h2>Extend</h2>

<p>
	Extends the url instance with defaults if they don't exist.
</p>

<p>
	<em>Compare with Override.</em>
</p>

<blockquote>
	<code>
		theURL.get()
	</code>
</blockquote>

<cfdump var="#theURL.get()#" label="Master URL" />

<blockquote>
	<code>
		theURL.extendExtended('foo=barred&spring=loaded')<br />
		theURL.getExtended()
	</code>
</blockquote>

<cfset theURL.extendExtended('foo=barred&spring=loaded') />

<cfdump var="#theURL.getExtended()#" label="Extended URL" />

<h2>Has</h2>

<p>
	Tests if the url instance exists already.
</p>

<blockquote>
	<code>
		theURL.hasExtended()
	</code>
</blockquote>

<cfdump var="#theURL.hasExtended()#" label="Has Extended URL" />

<blockquote>
	<code>
		theURL.hasIcing()
	</code>
</blockquote>

<cfdump var="#theURL.hasIcing()#" label="Has Icing URL" />

<h2>Override</h2>

<p>
	Overrides the url instance with new values even if they exist.
</p>

<p>
	<em>Compare with Extend.</em>
</p>

<blockquote>
	<code>
		theURL.get()
	</code>
</blockquote>

<cfdump var="#theURL.get()#" label="Master URL" />

<blockquote>
	<code>
		theURL.overrideExtended('foo=barred&spring=loaded')<br />
		theURL.getExtended()
	</code>
</blockquote>

<cfset theURL.extendExtended('foo=barred&spring=loaded') />

<cfdump var="#theURL.getExtended()#" label="Extended URL" />

<h2>Reset</h2>

<p>
	Resets the url instance with new a new querystring.
</p>

<blockquote>
	<code>
		theURL.get()
	</code>
</blockquote>

<cfdump var="#theURL.get()#" label="Master URL" />

<blockquote>
	<code>
		theURL.resetResetted('foo=barred&spring=loaded')
	</code>
</blockquote>

<cfset theURL.resetResetted('foo=barred&spring=loaded') />

<cfdump var="#theURL.getResetted()#" label="Reset URL" />

<h2>Search</h2>

<p>
	Searches the url instance for a value. If the key is not found in the instance it will return a blank string.
</p>

<p>
	<em>Compare to SearchID</em>
</p>

<blockquote>
	<code>
		theURL.search('spring')
	</code>
</blockquote>

<cfdump var="#theURL.search('spring')#" label="Search for 'spring'" />

<blockquote>
	<code>
		theURL.search('foo')
	</code>
</blockquote>

<cfdump var="#theURL.search('foo')#" label="Search for 'foo'" />

<blockquote>
	<code>
		theURL.search('user')
	</code>
</blockquote>

<cfdump var="#theURL.search('user')#" label="Search for 'user'" />

<h2>SearchID</h2>

<p>
	Searches the url instance for a value. If the key is not found in the instance or is not numeric will return a 0.
</p>

<p>
	<em>Compare to Search</em>
</p>

<blockquote>
	<code>
		theURL.searchID('spring')
	</code>
</blockquote>

<cfdump var="#theURL.searchID('spring')#" label="Search for 'spring' ID" />

<blockquote>
	<code>
		theURL.searchID('foo')
	</code>
</blockquote>

<cfdump var="#theURL.searchID('foo')#" label="Search for 'foo' ID" />

<blockquote>
	<code>
		theURL.searchID('user')
	</code>
</blockquote>

<cfdump var="#theURL.searchID('user')#" label="Search for 'user' ID" />

<h2>The Object</h2>

<cfdump var="#theURL#" />