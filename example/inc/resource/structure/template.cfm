<h1>Template Examples</h1>

<h2>addScript(value)</h2>

<div>
	<cfset theObject = createObject('component', 'cf-compendium.inc.resource.structure.template').init() />
	
	<p>
		addScript('coolScript.js')<br />
		<cfset theObject.addScripts('coolScript.js', 'otherCoolScript.js', 'coolScript.js') />
	</p>
	
	<p>
		<cfdump var="#theObject.getScripts()#" />
	</p>
</div>
