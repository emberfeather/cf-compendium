<cfset i18n = createObject('component', 'cf-compendium.inc.resource.i18n.i18n').init(expandPath('/')) />

<h1>Template Examples</h1>

<h2>addScript(value)</h2>

<div>
	<cfset theObject = createObject('component', 'cf-compendium.inc.resource.structure.template').init(i18n) />
	
	<p>
		addScript('coolScript.js')<br />
		<cfset theObject.addScripts('coolScript.js', 'otherCoolScript.js', 'coolScript.js') />
	</p>
	
	<p>
		<cfdump var="#theObject.getScripts()#" />
	</p>
</div>