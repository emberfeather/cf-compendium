<cfhtmlhead text="<link rel=""stylesheet"" href=""#pathRoot#cf-compendium/style/datagrid.css"" />">
<cfhtmlhead text="<script type=""text/javascript"" src=""https://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js""></script>">
<cfhtmlhead text="<script type=""text/javascript"" src=""#pathRoot#cf-compendium/script/jquery.datagrid.js""></script>">

<h1>Datagrid Examples</h1>

<blockquote>
	<code>
		datagrid = createObject('component', 'algid.inc.resource.structure.datagrid').init()
	</code>
</blockquote>

<cfset datagrid = createObject('component', 'cf-compendium.inc.resource.structure.datagrid').init() />

<h2>addColumn(columnName [, options])</h2>

<p>
	Adds a column to be displayed in the dataGrid.
</p>

<blockquote>
	<code>
		datagrid.addColumn('FirstName', {
				label = 'First Name'
			})
	</code>
</blockquote>

<cfset datagrid.addColumn('FirstName', {
		label = 'First Name'
	}) />

<blockquote>
	<code>
		datagrid.addColumn('LastName', {
				label = 'Last Name'
			})
	</code>
</blockquote>

<cfset datagrid.addColumn('LastName', {
		label = 'Last Name'
	}) />

<h2>toHTML(data[, options])</h2>

<blockquote>
	<code>
		data = [
				{
					firstname = "John", lastName= "Doe"
				},
				{
					firstname = "Jane", lastName="Doe"
				},
				{
					firstname = "Bobby", lastName="Joe"
				}
			]<br />
		
		datagrid.toHTML(data)
	</code>
</blockquote>

<cfset data = [
		{
			firstname = "John", lastName= "Doe"
		},
		{
			firstname = "Jane", lastName="Doe"
		},
		{
			firstname = "Bobby", lastName="Joe"
		}
	] />

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

<h2>The Object</h2>

<cfdump var="#datagrid#" />