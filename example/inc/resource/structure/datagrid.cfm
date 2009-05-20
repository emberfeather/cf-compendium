<h1>Datagrid Examples</h1>

<cfset theObject = createObject('component', 'cf-compendium.inc.resource.structure.datagrid').init() />

<h2>addColumn('columnName'[, 'options'])</h2>

<p>
	Adds a column to be displayed in the dataGrid. 
</p>

<div>
	<cfset options = {
			label = "First Name"
		} />
	
	options = { label = "First Name" }<br/>
	addColumn('Name', options) --&gt;
	<cfoutput>#theObject.addColumn('Name', options)#</cfoutput>
</div>

<div>
	
	<cfset data = [
			{
				name = "John Doe"
			},
			{
				name = "Jane Doe"
			},
			{
				name = "Bobby Joe"
			}
		] />
	
	<p>
		<cfoutput>#theObject.toHTML(data)#</cfoutput>
	</p>
</div>