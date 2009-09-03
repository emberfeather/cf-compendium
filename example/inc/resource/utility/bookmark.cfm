<h1>Bookmark Examples</h1>
<cfset bookmark = createObject('component', 'cf-compendium.inc.resource.utility.bookmark').init() />

<h2>getLocation()</h2>

<p>
	Will return the current bookmark numeric value for the specified location. If no location has been set, <code>get</code> will create the location and initialize the value to 1
</p>

<blockquote>
	<code>
		bookmark.getLocation1()
	</code>
</blockquote>

<cfdump var="#bookmark.getLocation1()#" label="Location1" />

<h2>setLocation('value')</h2>

<p>
	Setting a bookmark will set the value for the specified location to the value you provide.
</p>

<p>
	Will throw errors on negative values and on values greater than 99
</p>

<blockquote>
	<code>
		getLocation1()
	</code>
</blockquote>

<cfdump var="#bookmark.getLocation1()#" label="Location1" />

<blockquote>
	<code>
		bookmark.setLocation1(5)<br />
		getLocation1()
	</code>
</blockquote>

<cfset bookmark.setLocation1(5) />

<cfdump var="#bookmark.getLocation1()#" label="Location1" />

<h2>nextLocation1()</h2>

<p>
	Will increment the value of the current bookmark.
</p>

<p>
	Will throw error if the next value is greater than 99.
</p>

<blockquote>
	<code>
		getLocation1()
	</code>
</blockquote>

<cfdump var="#bookmark.getLocation1()#" label="Location1" />

<blockquote>
	<code>
		bookmark.nextLocation1()<br />
		getLocation1()
	</code>
</blockquote>

<cfset bookmark.nextLocation1() />

<cfdump var="#bookmark.getLocation1()#" label="Location1" />

<h2>prevLocation()</h2>

<p>
	Will decrement the value of the current bookmark.
</p>
<p>
	Will throw error if the prev value is less than 1.
</p>

<blockquote>
	<code>
		getLocation1()
	</code>
</blockquote>

<cfdump var="#bookmark.getLocation1()#" label="Location1" />

<blockquote>
	<code>
		bookmark.prevLocation1()<br />
		getLocation1()
	</code>
</blockquote>

<cfset bookmark.prevLocation1() />

<cfdump var="#bookmark.getLocation1()#" label="Location1" />

<h2>reset('location')</h2>

<p>
	Will reset the value of the specified location back to 1.
</p>


<blockquote>
	<code>
		getLocation1()
	</code>
</blockquote>

<cfdump var="#bookmark.getLocation1()#" label="Location1" />

<blockquote>
	<code>
		bookmark.resetLocation1()<br />
		getLocation1()
	</code>
</blockquote>

<cfset bookmark.resetLocation1() />

<cfdump var="#bookmark.getLocation1()#" label="Location1" />

<h2>The Object</h2>

<cfdump var="#bookmark#" />