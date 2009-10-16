<cfhtmlhead text="<link rel=""stylesheet"" href=""#pathRoot#cf-compendium/style/datagrid.css"" />">
<cfhtmlhead text="<script type=""text/javascript"" src=""https://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js""></script>">
<cfhtmlhead text="<script type=""text/javascript"" src=""#pathRoot#cf-compendium/script/jquery.datagrid.js""></script>">

<h1>Datagrid Examples</h1>

<blockquote>
	<code>
		theURL = createObject('component', 'cf-compendium.inc.resource.utility.url').init()<br />
		datagrid = createObject('component', 'cf-compendium.inc.resource.structure.datagrid').init(theURL)
	</code>
</blockquote>

<cfset theURL = createObject('component', 'cf-compendium.inc.resource.utility.url').init() />
<cfset datagrid = createObject('component', 'cf-compendium.inc.resource.structure.datagrid').init(theURL) />

<h2>addColumn([options])</h2>

<p>
	Adds a column to be displayed in the dataGrid.
</p>

<blockquote>
	<code>
		datagrid.addColumn({
				derived = 'currentRow'
			})
	</code>
</blockquote>

<cfset datagrid.addColumn({
		derived = 'currentRow'
	}) />

<blockquote>
	<code>
		datagrid.addColumn({
				key = 'FirstName',
				label = 'First Name'
			})
	</code>
</blockquote>

<cfset datagrid.addColumn({
		key = 'FirstName',
		label = 'First Name'
	}) />

<blockquote>
	<code>
		datagrid.addColumn({
				key = 'LastName',
				label = 'Last Name'
			})
	</code>
</blockquote>

<cfset datagrid.addColumn({
		key = 'LastName',
		label = 'Last Name'
	}) />

<blockquote>
	<code>
		datagrid.addColumn({
				aggregate = 'Sum',
				key = 'Value',
				label = 'Sum'
			})
	</code>
</blockquote>

<cfset datagrid.addColumn({
		aggregate = 'Sum',
		key = 'Value',
		label = 'Sum'
	}) />

<blockquote>
	<code>
		datagrid.addColumn({
				aggregate = 'Avg',
				key = 'Value',
				label = 'Avg'
			})
	</code>
</blockquote>

<cfset datagrid.addColumn({
		aggregate = 'Avg',
		key = 'Value',
		label = 'Avg'
	}) />

<blockquote>
	<code>
		datagrid.addColumn({
				aggregate = 'Min',
				key = 'Value',
				label = 'Min'
			})
	</code>
</blockquote>

<cfset datagrid.addColumn({
		aggregate = 'Min',
		key = 'Value',
		label = 'Min'
	}) />

<blockquote>
	<code>
		datagrid.addColumn({
				aggregate = 'Max',
				key = 'Value',
				label = 'Max'
			})
	</code>
</blockquote>

<cfset datagrid.addColumn({
		aggregate = 'Max',
		key = 'Value',
		label = 'Max'
	}) />

<blockquote>
	<code>
		datagrid.addColumn({
				derived = 'sum',
				keys = 'value',
				label = 'Running Sum'
			})
	</code>
</blockquote>

<cfset datagrid.addColumn({
		derived = 'sum',
		keys = 'value',
		label = 'Running Sum'
	}) />

<blockquote>
	<code>
		datagrid.addColumn({
				class = 'phantom',
				key = 'action'
			})
	</code>
</blockquote>

<cfset datagrid.addColumn({
		class = 'phantom align-right',
		key = 'action'
	}) />

<h2>toHTML(data[, options])</h2>

<blockquote>
	<code>
		data = []<br />
		
		from="1" to="2000" index="i"<br />
			person = createObject('component', 'cf-compendium.inc.resource.base.object').init()<br />
			person.setFirstName(( randRange(0,100) GT 50 ? 'John' : 'Jane' ))<br />
			person.setLastName(( randRange(0,100) GT 50 ? 'Card' : 'Trump' ))<br />
			person.setValue(randRange(0,100))<br />
			person.setAction('&lt;a href="#"&gt;Action&lt;/a&gt')<br />
		
		datagrid.toHTML(data)
	</code>
</blockquote>

<cfset data = [] />

<cfloop from="1" to="40" index="i">
	<cfset person = createObject('component', 'cf-compendium.inc.resource.base.object').init() />
	<cfset person.setFirstName(( randRange(0,100) GT 50 ? 'Sam' : 'Jane' )) />
	<cfset person.setLastName(( randRange(0,100) GT 50 ? 'Card' : 'Trump' )) />
	<cfset person.setValue(randRange(0,100)) />
	<cfset person.setAction('<a href="##">Action</a>') />
	
	<cfset arrayAppend(data, person) />
</cfloop>

<cfoutput>#datagrid.toHTML(data)#</cfoutput>

<h2>JavaScript</h2>

<blockquote>
	<code>
		jQuery(function($){
			$('.datagrid').datagrid();
		});
	</code>
</blockquote>

<script type="text/javascript" language="javascript">
	jQuery(function($){
		$('.datagrid').datagrid();
	});
</script>
