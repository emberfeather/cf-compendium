<h1>URL Examples</h1>
<cfset theURL = createObject('component', 'cf-compendium.inc.resource.utility.url').init('foo=bar&stuff&user=1') />

<h2>Clean</h2>

<p>
	Completely cleans the url instance to have a clean base to work off.
</p>

<div>
	<p>
		Original URL : 
		<cfoutput>#theURL.get()#</cfoutput>
	</p>
	
	<p>
		cleanRedirect()
		<cfset theURL.cleanRedirect() />
	</p>
	
	<p>
		Redirect URL :
		<cfoutput>#theURL.getRedirect()#</cfoutput>
	</p>
</div>

<h2>Extend</h2>

<p>
	Extends the url instance with defaults if they don't exist.
</p>

<div>
	<p>
		Original URL : 
		<cfoutput>#theURL.get()#</cfoutput>
	</p>
	
	<p>
		extendExtended('foo=barred&spring=loaded')
		<cfset theURL.extendExtended('foo=barred&spring=loaded') />
	</p>
	
	<p>
		New URL :
		<cfoutput>#theURL.getExtended()#</cfoutput>
	</p>
	
	<p>
		Compare with Override.
	</p>
</div>

<h2>Has</h2>

<p>
	Tests if the url instance exists already.
</p>

<div>
	<p>
		Has extended :
		<cfoutput>#theURL.hasExtended()#</cfoutput>
	</p>
	
	<p>
		Has icing :
		<cfoutput>#theURL.hasIcing()#</cfoutput>
	</p>
</div>

<h2>Override</h2>

<p>
	Overrides the url instance with new values even if they exist.
</p>

<div>
	<p>
		Original URL : 
		<cfoutput>#theURL.get()#</cfoutput>
	</p>
	
	<p>
		overrideExtended('foo=barred&spring=loaded')
		<cfset theURL.overrideExtended('foo=barred&spring=loaded') />
	</p>
	
	<p>
		New URL :
		<cfoutput>#theURL.getExtended()#</cfoutput>
	</p>
	
	<p>
		Compare with Extend.
	</p>
</div>

<h2>Reset</h2>

<p>
	Resets the url instance with new a new querystring.
</p>

<div>
	<p>
		resetResetted('foo=barred&spring=loaded')
		<cfset theURL.resetResetted('foo=barred&spring=loaded') />
	</p>
	
	<p>
		Resetted URL :
		<cfoutput>#theURL.getResetted()#</cfoutput>
	</p>
</div>

<h2>Search</h2>

<p>
	Searches the url instance for a value. If the key is not found in the instance it will return a blank string.
</p>

<div>
	<p>
		search('spring') :
		<cfoutput>#theURL.search('spring')#</cfoutput>
	</p>
	
	<p>
		search('foo') :
		<cfoutput>#theURL.search('foo')#</cfoutput>
	</p>
	
	<p>
		search('user') :
		<cfoutput>#theURL.search('user')#</cfoutput>
	</p>
	
	<p>
		Compare to SearchID
	</p>
</div>

<h2>SearchID</h2>

<p>
	Searches the url instance for a value. If the key is not found in the instance or is not numeric will return a 0.
</p>

<div>
	<p>
		searchID('spring') :
		<cfoutput>#theURL.searchID('spring')#</cfoutput>
	</p>
	
	<p>
		searchID('foo') :
		<cfoutput>#theURL.searchID('foo')#</cfoutput>
	</p>
	
	<p>
		searchID('user') :
		<cfoutput>#theURL.searchID('user')#</cfoutput>
	</p>
	
	<p>
		Compare to Search
	</p>
</div>

<h2>the object</h2>

<cfdump var="#theURL#" />