<cfhtmlhead text="<link rel=""stylesheet"" href=""/cf-compendium/style/datagridDiv.css"" />">

<h1>Datagrid Examples</h1>

<blockquote>
	<code>
		datagrid = createObject('component', 'algid.inc.resource.structure.datagridDiv').init()
	</code>
</blockquote>

<cfset datagrid = createObject('component', 'cf-compendium.inc.resource.structure.datagridDiv').init() />

<h2>addColumn(columnName [, options])</h2>

<p>
	Adds a column to be displayed in the dataGrid.
</p>

<blockquote>
	<code>
		datagrid.addColumn('FirstName', {
				label = 'First Name',
				class = 'name'
			})
	</code>
</blockquote>

<cfset datagrid.addColumn('FirstName', {
		label = 'First Name',
		class = 'name'
	}) />

<blockquote>
	<code>
		datagrid.addColumn('LastName', {
				label = "Last Name"
			})
	</code>
</blockquote>

<cfset datagrid.addColumn('LastName', {
		label = "Last Name"
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

<h2>The Object</h2>

<cfdump var="#datagrid#" />