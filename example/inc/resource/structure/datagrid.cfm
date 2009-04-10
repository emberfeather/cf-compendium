<cfset i18n = createObject('component', 'cf-compendium.inc.resource.i18n.i18n').init(expandPath('/')) />

<h1>Datagrid Examples</h1>

<div>
	<cfset theObject = createObject('component', 'cf-compendium.inc.resource.structure.datagrid').init(i18n) />
	
	<p>
		<cfoutput>#theObject.toHTML#</cfoutput>
	</p>
</div>