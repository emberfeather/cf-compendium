<h1>Navigation Examples</h1>

<h2>init(i18n, navigationFile)</h2>

<div>
	<cfset theObject = createObject('component', 'cf-compendium.inc.resource.structure.navigationJSON').init('/implementation/config/navigation001.json.cfm') />
	
	<p>
		<cfdump var="#theObject.getNavigation()#" />
	</p>
</div>

<h2>applyMask(maskFile)</h2>

<div>
	<cffile action="read" file="#expandPath('/implementation/config/mask001.json.cfm')#" variable="fileContents">
	<blockquote>
		<code>
			<pre><cfoutput>#fileContents#</cfoutput></pre>
		</code>
	</blockquote>
	
	<cfset theObject.applyMask('/implementation/config/mask001.json.cfm') />
	
	<p>
		<cfdump var="#theObject.getNavigation()#" />
	</p>
</div>

<h2>applyMask(maskFile)</h2>

<div>
	<cffile action="read" file="#expandPath('/implementation/config/mask002.json.cfm')#" variable="fileContents">
	<blockquote>
		<code>
			<pre><cfoutput>#fileContents#</cfoutput></pre>
		</code>
	</blockquote>
	
	<cfset theObject.applyMask('/implementation/config/mask002.json.cfm') />
	
	<p>
		<cfdump var="#theObject.getNavigation()#" />
	</p>
</div>

<h2>validate()</h2>

<div>
	<cfset path = expandPath('/example/inc/content') />
	<cfset theObject.validate(path, 'proc,cont') />
	
	Check <cfoutput>#path#</cfoutput> for the automated creation of the structure with 'proc' and 'cont' files.
</div>