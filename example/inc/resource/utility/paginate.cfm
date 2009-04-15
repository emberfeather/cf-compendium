<h1>Paginate Examples</h1>
<cfset thePaginator = createObject('component', 'cf-compendium.inc.resource.utility.paginate').init(1200, 25, 5) />

<h2>getTotal()</h2>

<div>
	<p>
		getTotal() --&gt;
		<cfoutput>#thePaginator.getTotal()#</cfoutput>
	</p>
</div>

<h2>getNumPerPage()</h2>

<div>
	<p>
		getNumPerPage() --&gt;
		<cfoutput>#thePaginator.getNumPerPage()#</cfoutput>
	</p>
</div>

<h2>getPage()</h2>

<div>
	<p>
		getPage() --&gt;
		<cfoutput>#thePaginator.getPage()#</cfoutput>
	</p>
</div>

<h2>getStartRow()</h2>

<div>
	<p>
		getStartRow() --&gt;
		<cfoutput>#thePaginator.getStartRow()#</cfoutput>
	</p>
</div>

<h2>getEndRow()</h2>

<div>
	<p>
		getEndRow() --&gt;
		<cfoutput>#thePaginator.getEndRow()#</cfoutput>
	</p>
</div>

<h2>getPrevious()</h2>

<div>
	<p>
		getPrevious() --&gt;
		<cfoutput>#thePaginator.getPrevious()#</cfoutput>
	</p>
</div>

<h2>getNext()</h2>

<div>
	<p>
		getNext() --&gt;
		<cfoutput>#thePaginator.getNext()#</cfoutput>
	</p>
</div>

<h2>hasPrevious()</h2>

<div>
	<p>
		hasPrevious() --&gt;
		<cfoutput>#thePaginator.hasPrevious()#</cfoutput>
	</p>
</div>

<h2>hasNext()</h2>

<div>
	<p>
		hasNext() --&gt;
		<cfoutput>#thePaginator.hasNext()#</cfoutput>
	</p>
</div>

<h2>getFirst()</h2>

<div>
	<p>
		getFirst() --&gt;
		<cfoutput>#thePaginator.getFirst()#</cfoutput>
	</p>
</div>

<h2>getLast()</h2>

<div>
	<p>
		getLast() --&gt;
		<cfoutput>#thePaginator.getLast()#</cfoutput>
	</p>
</div>

<h2>toHTML()</h2>

<cfset theURL = createObject('component', 'cf-compendium.inc.resource.utility.url').init() />

<div>
	toHTML() --&gt;
	<cfoutput>#thePaginator.toHTML(theURL)#</cfoutput>
</div>

<h2>the object</h2>

<cfdump var="#thePaginator#" />