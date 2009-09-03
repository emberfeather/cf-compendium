<h1>Paginate Examples</h1>

<blockquote>
	<code>
		paginator = createObject('component', 'cf-compendium.inc.resource.utility.paginate').init(1200, 25, 5)
	</code>
</blockquote>

<cfset paginator = createObject('component', 'cf-compendium.inc.resource.utility.paginate').init(1200, 25, 5) />

<h2>getTotal()</h2>

<blockquote>
	<code>
		paginator.getTotal()
	</code>
</blockquote>

<cfdump var="#paginator.getTotal()#" label="Total" />

<h2>getNumPerPage()</h2>

<blockquote>
	<code>
		paginator.getNumPerPage()
	</code>
</blockquote>

<cfdump var="#paginator.getNumPerPage()#" label="Number Per Page" />

<h2>getPage()</h2>

<blockquote>
	<code>
		paginator.getPage()
	</code>
</blockquote>

<cfdump var="#paginator.getPage()#" label="Current Page" />

<h2>getStartRow()</h2>

<blockquote>
	<code>
		paginator.getStartRow()
	</code>
</blockquote>

<cfdump var="#paginator.getStartRow()#" label="Start Row" />

<h2>getEndRow()</h2>

<blockquote>
	<code>
		paginator.getEndRow()
	</code>
</blockquote>

<cfdump var="#paginator.getEndRow()#" label="End Row" />

<h2>getPrevious()</h2>

<blockquote>
	<code>
		paginator.getPrevious()
	</code>
</blockquote>

<cfdump var="#paginator.getPrevious()#" label="Previous Page" />

<h2>getNext()</h2>

<blockquote>
	<code>
		paginator.getNext()
	</code>
</blockquote>

<cfdump var="#paginator.getNext()#" label="Next Page" />

<h2>hasPrevious()</h2>

<blockquote>
	<code>
		paginator.hasPrevious()
	</code>
</blockquote>

<cfdump var="#paginator.hasPrevious()#" label="Has Previous Page" />

<h2>hasNext()</h2>

<blockquote>
	<code>
		paginator.hasNext()
	</code>
</blockquote>

<cfdump var="#paginator.hasNext()#" label="Has Next Page" />

<h2>getFirst()</h2>

<blockquote>
	<code>
		paginator.getFirst()
	</code>
</blockquote>

<cfdump var="#paginator.getFirst()#" label="Get First Page" />

<h2>getLast()</h2>

<blockquote>
	<code>
		paginator.getLast()
	</code>
</blockquote>

<cfdump var="#paginator.getLast()#" label="Get Last Page" />

<h2>toHTML()</h2>

<cfset theURL = createObject('component', 'cf-compendium.inc.resource.utility.url').init() />

<blockquote>
	<code>
		paginator.toHTML()
	</code>
</blockquote>

<cfoutput>#paginator.toHTML(theURL)#</cfoutput>

<h2>The Object</h2>

<cfdump var="#paginator#" />