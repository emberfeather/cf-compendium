<cfhtmlhead text="<link rel=""stylesheet"" href=""#pathRoot#cf-compendium/style/datagrid.css"" />">
<cfhtmlhead text="<script type=""text/javascript"" src=""https://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js""></script>">
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

<h2>addI18NBundle(path, name)</h2>

<p>
	Adds an i18n bundle for label translation.
</p>

<blockquote>
	<code>
		datagrid.addI18NBundle('inc/resource/structure', 'datagrid')
	</code>
</blockquote>

<cfset datagrid.addI18NBundle('inc/resource/structure', 'datagrid') />

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
				class = 'phantom align-right'
			})
	</code>
</blockquote>

<cfset datagrid.addColumn({
		class = 'phantom align-right'
	}) />

<h2>toHTML(data[, options])</h2>

<blockquote>
	<code>
		data = [
				{
					firstname = "John",
					lastName= "Doe"
				},
				{
					firstname = "Jane",
					lastName="Doe"
				},
				{
					firstname = "Bobby",
					lastName="Joe"
				}
			]<br />
		
		datagrid.toHTML(data, {
				numPerPage = 2000
			})
	</code>
</blockquote>

<cfset data = [
		{
			firstname = "John",
			lastName= "Doe"
		},
		{
			firstname = "Jane",
			lastName="Doe"
		},
		{
			firstname = "Bobby",
			lastName="Joe"
		}
	] />

<cfoutput>#datagrid.toHTML(data, {
		numPerPage = 2000
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
