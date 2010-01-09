<h1>Object Examples</h1>

<h2>addVariable(value)</h2>

<!--- Reset the object --->
<cfset theObject = createObject('component', 'cf-compendium.inc.resource.base.object').init() />

<blockquote>
	<code>
		addTest('aValue')
	</code>
</blockquote>

<cfset theObject.addTest('aValue') />

<cfset theObject.print() />

<h2>addVariable(value[, value]...)</h2>

<!--- Reset the object --->
<cfset theObject = createObject('component', 'cf-compendium.inc.resource.base.object').init() />

<blockquote>
	<code>
		addTest('someValue', 'anotherValue', 'andAnother')
	</code>
</blockquote>

<cfset theObject.addTest('someValue', 'anotherValue', 'andAnother') />

<cfset theObject.print() />

<h2>addUniqueVariable(value)</h2>

<cfset theObject = createObject('component', 'cf-compendium.inc.resource.base.object').init() />

<blockquote>
	<code>
		addUniqueTests('someValue')
	</code>
</blockquote>

<cfset theObject.addUniqueTests('someValue') />

<blockquote>
	<code>
		addUniqueTests('someValue')
	</code>
</blockquote>

<cfset theObject.addUniqueTests('someValue') />

<cfset theObject.print() />

<h2>addUniqueVariable(value[, value]...)</h2>

<cfset theObject = createObject('component', 'cf-compendium.inc.resource.base.object').init() />
<blockquote>
	<code>
		addUniqueTests('someValue', 'anotherValue', 'andAnother', 'anotherValue')
	</code>
</blockquote>

<cfset theObject.addUniqueTests('someValue', 'anotherValue', 'andAnother', 'anotherValue') />

<cfset theObject.print() />

<h2>getVariable()</h2>

<cfset theObject = createObject('component', 'cf-compendium.inc.resource.base.object').init() />

<blockquote>
	<code>
		setTest('aValue')
	</code>
</blockquote>

<cfset theObject.setTest('aValue') />

<blockquote>
	<code>
		getTest() --&gt; <cfoutput>#theObject.getTest()#</cfoutput>
	</code>
</blockquote>

<cfset theObject.print() />

<h2>getVariablesBy('RegEx')</h2>

<cfset theObject = createObject('component', 'cf-compendium.inc.resource.base.object').init() />

<blockquote>
	<code>
		addTests('aValue', 'anotherValue', 'something', 'things', 'others')
	</code>
</blockquote>

<cfset theObject.addTests('aValue', 'anotherValue', 'something', 'things', 'others') />

<blockquote>
	<code>
		getTestsBy('Val')
	</code>
</blockquote>

<cfdump var="#theObject.getTestsBy('Val')#">
	
<blockquote>
	<code>
		getTestsBy('s$')
	</code>
</blockquote>

<cfdump var="#theObject.getTestsBy('s$')#">

<h2>getObjectsByVariable('RegEx')</h2>

<cfset theObject = createObject('component', 'cf-compendium.inc.resource.base.object').init() />

<blockquote>
	<code>
		theObject1 = createObject('component', 'cf-compendium.inc.resource.base.object').init()<br />
		theObject2 = createObject('component', 'cf-compendium.inc.resource.base.object').init()<br />
		theObject3 = createObject('component', 'cf-compendium.inc.resource.base.object').init()<br />
		theObject4 = createObject('component', 'cf-compendium.inc.resource.base.object').init()<br />
		theObject5 = createObject('component', 'cf-compendium.inc.resource.base.object').init()
	</code>
</blockquote>

<cfset theObject1 = createObject('component', 'cf-compendium.inc.resource.base.object').init() />
<cfset theObject2 = createObject('component', 'cf-compendium.inc.resource.base.object').init() />
<cfset theObject3 = createObject('component', 'cf-compendium.inc.resource.base.object').init() />
<cfset theObject4 = createObject('component', 'cf-compendium.inc.resource.base.object').init() />
<cfset theObject5 = createObject('component', 'cf-compendium.inc.resource.base.object').init() />

<blockquote>
	<code>
		theObject1.setTest('aValue')<br />
		theObject2.setTest('anotherValue')<br />
		theObject3.setTest('something')<br />
		theObject4.setTest('things')<br />
		theObject5.setTest('others')
	</code>
</blockquote>

<cfset theObject1.setTest('aValue') />
<cfset theObject2.setTest('anotherValue') />
<cfset theObject3.setTest('something') />
<cfset theObject4.setTest('things') />
<cfset theObject5.setTest('others') />

<blockquote>
	<code>
		addThings(theObject1, theObject2, theObject3, theObject4, theObject5)
	</code>
</blockquote>

<cfset theObject.addThings(theObject1, theObject2, theObject3, theObject4, theObject5) />

<blockquote>
	<code>
		getThingsByTest('Val')
	</code>
</blockquote>

<cfloop array="#theObject.getThingsByTest('Val')#" index="i">
	<cfset i.print() />
</cfloop>
	
<blockquote>
	<code>
		getThingsByTest('s$')
	</code>
</blockquote>

<cfloop array="#theObject.getThingsByTest('s$')#" index="i">
	<cfset i.print() />
</cfloop>

<h2>get__keyList()</h2>

<cfset theObject = createObject('component', 'cf-compendium.inc.resource.base.object').init() />

<blockquote>
	<code>
		setTest('aValue')
	</code>
</blockquote>

<cfset theObject.setTest('aValue') />

<blockquote>
	<code>
		setName('something')
	</code>
</blockquote>

<cfset theObject.setName('something') />

<blockquote>
	<code>
		get__keyList() --&gt; <cfoutput>#theObject.get__keyList()#</cfoutput>
	</code>
</blockquote>

<h2>get__*()</h2>

<p>Generally used to get meta information about the object by using the <code>__</code> prefix, such as <code>__name</code>, <code>__fullname</code>, or <code>__extends</code>.</p>

<cfset theObject = createObject('component', 'cf-compendium.inc.resource.base.object').init() />

<blockquote>
	<code>
		get__name() --&gt; <cfoutput>#theObject.get__name()#</cfoutput>
	</code>
</blockquote>

<blockquote>
	<code>
		get__fullname() --&gt; <cfoutput>#theObject.get__fullname()#</cfoutput>
	</code>
</blockquote>

<blockquote>
	<code>
		get__extends().fullname --&gt; <cfoutput>#theObject.get__extends().fullname#</cfoutput>
	</code>
</blockquote>

<p>Or just the <code>__</code> prefix to retrieve the complete meta information struct.</p>

<blockquote>
	<code>
		get__() --&gt; 
		<cfdump var="#theObject.get__()#" expand="false" />
	</code>
</blockquote>

<h2>Properties</h2>

<cfset object = createObject('component', 'implementation.inc.resource.base.object1').init() />

<p>
	Properties can be defined in the init of the object and have a default value.
</p>

<blockquote>
	<code>
		object = createObject('component', 'implementation.inc.resource.base.object1').init()
	</code>
</blockquote>

<cfset object.print() />

<h2>setVariable()</h2>

<cfset theObject = createObject('component', 'cf-compendium.inc.resource.base.object').init() />

<blockquote>
	<code>
		setTest('aValue')
	</code>
</blockquote>

<cfset theObject.setTest('aValue') />

<h2>The Object</h2>

<cfdump var="#theObject#" />
