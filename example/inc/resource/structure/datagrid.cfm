<h1>Datagrid Examples</h1>

<div>
	<cfset theObject = createObject('component', 'cf-compendium.inc.resource.structure.datagrid').init() />
	
	<p>
		<cfoutput>#theObject.toHTML#</cfoutput>
	</p>
</div>