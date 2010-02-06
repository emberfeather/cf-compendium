<cfhtmlhead text="<link rel=""stylesheet"" href=""#pathRoot#cf-compendium/style/datagrid.css"" />">
<cfhtmlhead text="<script type=""text/javascript"" src=""https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js""></script>">
<cfhtmlhead text="<script type=""text/javascript"" src=""#pathRoot#cf-compendium/script/jquery.datagrid.js""></script>">

<h1>Datagrid Examples</h1>

<blockquote>
	<code>
		i18n = createObject('component', 'cf-compendium.inc.resource.i18n.i18n').init( expandPath('/i18n/') )<br />
		datagrid = createObject('component', 'cf-compendium.inc.resource.structure.datagrid').init(i18n)
	</code>
</blockquote>

<cfset i18n = createObject('component', 'cf-compendium.inc.resource.i18n.i18n').init(expandPath('/i18n/')) />
<cfset datagrid = createObject('component', 'cf-compendium.inc.resource.structure.datagrid').init(i18n) />

<h2>addBundle(path, name)</h2>

<p>
	Adds an i18n bundle for label translation.
</p>

<blockquote>
	<code>
		datagrid.addBundle('inc/resource/structure', 'datagrid')
	</code>
</blockquote>

<cfset datagrid.addBundle('inc/resource/structure', 'datagrid') />

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
				label = 'firstName'
			})
	</code>
</blockquote>

<cfset datagrid.addColumn({
		key = 'FirstName',
		label = 'firstName'
	}) />

<blockquote>
	<code>
		datagrid.addColumn({
				key = 'LastName',
				label = 'lastName'
			})
	</code>
</blockquote>

<cfset datagrid.addColumn({
		key = 'LastName',
		label = 'lastName'
	}) />

<blockquote>
	<code>
		datagrid.addColumn({
				aggregate = 'Sum',
				key = 'Value',
				label = 'sum'
			})
	</code>
</blockquote>

<cfset datagrid.addColumn({
		aggregate = 'Sum',
		key = 'Value',
		label = 'sum'
	}) />

<blockquote>
	<code>
		datagrid.addColumn({
				aggregate = 'Avg',
				key = 'Value',
				label = 'avg'
			})
	</code>
</blockquote>

<cfset datagrid.addColumn({
		aggregate = 'Avg',
		key = 'Value',
		label = 'avg'
	}) />

<blockquote>
	<code>
		datagrid.addColumn({
				aggregate = 'Min',
				key = 'Value',
				label = 'min'
			})
	</code>
</blockquote>

<cfset datagrid.addColumn({
		aggregate = 'Min',
		key = 'Value',
		label = 'min'
	}) />

<blockquote>
	<code>
		datagrid.addColumn({
				aggregate = 'Max',
				key = 'Value',
				label = 'max'
			})
	</code>
</blockquote>

<cfset datagrid.addColumn({
		aggregate = 'Max',
		key = 'value',
		label = 'max'
	}) />

<blockquote>
	<code>
		datagrid.addColumn({
				derived = 'sum',
				key = 'value',
				label = 'runningSum'
			})
	</code>
</blockquote>

<cfset datagrid.addColumn({
		derived = 'sum',
		key = 'value',
		label = 'runningSum'
	}) />

<p>
	A value can be given as a key from the i18n labels.
</p>

<blockquote>
	<code>
		datagrid.addColumn({
				class = 'phantom align-right',
				value = 'action'
			})
	</code>
</blockquote>

<cfset datagrid.addColumn({
		class = 'phantom align-right',
		value = 'action'
	}) />

<h2>toHTML(data[, options])</h2>

<blockquote>
	<code>
		data = []<br />
		
		from="1" to="40" index="i"<br />
			person = createObject('component', 'cf-compendium.inc.resource.base.object').init()<br />
			person.setFirstName(( randRange(0,100) gt 50 ? 'John' : 'Jane' ))<br />
			person.setLastName(( randRange(0,100) gt 50 ? 'Card' : 'Trump' ))<br />
			person.setValue(randRange(0,100))<br />
		
		datagrid.toHTML(data, {
				numPerPage = 40
			})
	</code>
</blockquote>

<cfset data = [] />

<cfloop from="1" to="40" index="i">
	<cfset person = createObject('component', 'cf-compendium.inc.resource.base.object').init() />
	<cfset person.setFirstName(( randRange(0,100) gt 50 ? 'Sam' : 'Jane' )) />
	<cfset person.setLastName(( randRange(0,100) gt 50 ? 'Card' : 'Trump' )) />
	<cfset person.setValue(randRange(0,100)) />
	<cfset person.setAction('Action') />
	
	<cfset arrayAppend(data, person) />
</cfloop>

<cfoutput>#datagrid.toHTML(data, {
		numPerPage = 40
	})#</cfoutput>

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
