<h1>Navigation Examples</h1>

<h2>init(navigationFile)</h2>

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

<h2>locate(theUrl, [user])</h2>

<div>
	<p>
		<cfset theURL = createObject('component', 'cf-compendium.inc.resource.utility.url').init('') />
		
		<cfset currentPage = theObject.locate(theURL) />
	</p>
	
	<p>
		<cfset currentPage.print() />
	</p>
</div>
