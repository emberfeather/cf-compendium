<h1>Bookmark Examples</h1>
<cfset theBookmark = createObject('component', 'cf-compendium.inc.resource.utility.bookmark').init() />

<h2>get('location')</h2>

<p>
	Will return the current bookmark numeric value for the specified location. If no location has been set, <code>get</code> will create the location and initialize the value to 1
</p>

<div>
	<cfoutput>get('location1') --&gt; #theBookmark.get('location1')#</cfoutput>
</div>

<h2>set('location', 'value')</h2>

<p>
	Setting a bookmark will set the value for the specified location to the value you provide.
</p>
<p>
	Will throw errors on negative values and on values greater than 99
</p>

<div>
	<cfoutput>
		get('location1') --&gt; #theBookmark.get('location1')#<br /> 
		<cfset theBookmark.set('location1', 5) />
		set('location1', 5)<br /> 
		get('location1') --&gt; #theBookmark.get('location1')#
	</cfoutput>
</div>

<h2>next('location')</h2>
<p>
	Will increment the value of the current bookmark.
</p>
<p>
	Will throw error if the next value is greater than 99.
</p>

<div>
	<cfoutput>
		get('location1') --&gt; #theBookmark.get('location1')#<br /> 
		<cfset theBookmark.next('location1') />
		next('location1')<br /> 
		get('location1') --&gt; #theBookmark.get('location1')#
	</cfoutput>
</div>

<h2>prev('location')</h2>

<p>
	Will decrement the value of the current bookmark.
</p>
<p>
	Will throw error if the prev value is less than 1.
</p>

<div>
	<cfoutput>
		get('location1') --&gt; #theBookmark.get('location1')#<br /> 
		<cfset theBookmark.prev('location1') />
		prev('location1')<br /> 
		get('location1') --&gt; #theBookmark.get('location1')#
	</cfoutput>
</div>

<h2>reset('location')</h2>

<p>
	Will reset the value of the specified location back to 1.
</p>

<div>
	<cfoutput>
		get('location1') --&gt; #theBookmark.get('location1')#<br /> 
		<cfset theBookmark.reset('location1') />
		reset('location1')<br /> 
		get('location1') --&gt; #theBookmark.get('location1')#
	</cfoutput>
</div>

<h2>the object</h2>
<cfdump var="#theBookmark#" />