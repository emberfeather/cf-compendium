<h1>Paginate Examples</h1>

<cfset theURL = createObject('component', 'cf-compendium.inc.resource.utility.url').init('') />
<cfset filter = createObject('component', 'cf-compendium.inc.resource.utility.filter').init(theURL) />

<h2>addFilter() - No Options</h2>

<div>
	<p>
		addFilter(label, key) --&gt;
		<cfoutput>#filter.addFilter('Test 1', 'test1')#</cfoutput>
	</p>
</div>

<h2>toHTML()</h2>

<div>
	toHTML() --&gt;
	<cfoutput>#filter.toHTML()#</cfoutput>
</div>

<cfset filter = createObject('component', 'cf-compendium.inc.resource.utility.filter').init(theURL) />

<h2>addFilter() - One Option</h2>

<div>
	<p>
		addFilter(label, key, options) --&gt;
		
		<cfset options = createObject('component', 'cf-compendium.inc.resource.utility.options').init() />
		
		<cfloop from="1" to="1" index="i">
			<cfset options.addOption('Option ' & i, 'option' & i) />
		</cfloop>
		
		<cfoutput>#filter.addFilter('Test 1', 'test1', options)#</cfoutput>
	</p>
</div>

<h2>toHTML()</h2>

<div>
	toHTML() --&gt;
	<cfoutput>#filter.toHTML()#</cfoutput>
</div>

<cfset filter = createObject('component', 'cf-compendium.inc.resource.utility.filter').init(theURL) />

<h2>addFilter() - Few Options</h2>

<div>
	<p>
		addFilter(label, key, options) --&gt;
		
		<cfset options = createObject('component', 'cf-compendium.inc.resource.utility.options').init() />
		
		<cfloop from="1" to="3" index="i">
			<cfset options.addOption('Option ' & i, 'option' & i) />
		</cfloop>
		
		<cfoutput>#filter.addFilter('Test 1', 'test1', options)#</cfoutput>
	</p>
</div>

<h2>toHTML()</h2>

<div>
	toHTML() --&gt;
	<cfoutput>#filter.toHTML()#</cfoutput>
</div>

<cfset filter = createObject('component', 'cf-compendium.inc.resource.utility.filter').init(theURL) />

<h2>addFilter() - Many options</h2>

<div>
	<p>
		addFilter(label, key, options) --&gt;
		
		<cfset options = createObject('component', 'cf-compendium.inc.resource.utility.options').init() />
		
		<cfloop from="1" to="10" index="i">
			<cfset options.addOption('Option ' & i, 'option' & i) />
			
			<cfif i MOD 3 EQ 0>
				<cfset options.addGroup('Group ' & i) />
			</cfif>
		</cfloop>
		
		<cfoutput>#filter.addFilter('Test 1', 'test1', options)#</cfoutput>
	</p>
</div>

<h2>toHTML()</h2>

<div>
	toHTML() --&gt;
	<cfoutput>#filter.toHTML()#</cfoutput>
</div>

<h2>the object</h2>

<cfdump var="#filter#" />