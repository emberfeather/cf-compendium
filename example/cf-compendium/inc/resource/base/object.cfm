<h1>Object Examples</h1>

<h2>addAttribute(value)</h2>

<div>
	<cfset theObject = createObject('component', 'cf-compendium.inc.resource.base.object').init() />
	
	<p>
		addTest('aValue')<br />
		<cfset theObject.addTest('aValue') />
	</p>
	
	<p>
		<cfset theObject.print() />
	</p>
</div>

<h2>addAttribute(value, [, value]...)</h2>

<div>
	<cfset theObject = createObject('component', 'cf-compendium.inc.resource.base.object').init() />
	
	<p>
		addTest('someValue', 'anotherValue', 'andAnother')<br />
		<cfset theObject.addTest('someValue', 'anotherValue', 'andAnother') />
	</p>
	
	<p>
		<cfset theObject.print() />
	</p>
</div>

<h2>addUniqueAttribute(value)</h2>

<div>
	<cfset theObject = createObject('component', 'cf-compendium.inc.resource.base.object').init() />
	
	<p>
		addUniqueTests('someValue')<br />
		<cfset theObject.addUniqueTests('someValue') />
	</p>
	
	<p>
		addUniqueTests('someValue')<br />
		<cfset theObject.addUniqueTests('someValue') />
	</p>
	
	<p>
		<cfset theObject.print() />
	</p>
</div>

<h2>addUniqueAttribute(value, [, value]...)</h2>

<div>
	<cfset theObject = createObject('component', 'cf-compendium.inc.resource.base.object').init() />
	
	<p>
		addUniqueTests('someValue', 'anotherValue', 'andAnother', 'anotherValue')<br />
		<cfset theObject.addUniqueTests('someValue', 'anotherValue', 'andAnother', 'anotherValue') />
	</p>
	
	<p>
		<cfset theObject.print() />
	</p>
</div>

<h2>getAttribute()</h2>

<div>
	<cfset theObject = createObject('component', 'cf-compendium.inc.resource.base.object').init() />
	
	<p>
		setTest('aValue')<br />
		<cfset theObject.setTest('aValue') />
	</p>
	
	<p>
		getTest() --&gt; <cfoutput>#theObject.getTest()#</cfoutput><br />
	</p>
	
	<p>
		<cfset theObject.print() />
	</p>
</div>

<h2>getAttributesBy('RegEx')</h2>

<div>
	<cfset theObject = createObject('component', 'cf-compendium.inc.resource.base.object').init() />
	
	<p>
		addTests('aValue', 'anotherValue', 'something', 'things', 'others')<br />
		<cfset theObject.addTests('aValue', 'anotherValue', 'something', 'things', 'others') />
	</p>
	
	<p>
		getTestsBy('Val')<br />
		<cfdump var="#theObject.getTestsBy('Val')#">
	</p>
	
	<p>
		getTestsBy('s$')<br />
		<cfdump var="#theObject.getTestsBy('s$')#">
	</p>
</div>

<h2>getObjectsByAttribute('RegEx')</h2>

<div>
	<cfset theObject = createObject('component', 'cf-compendium.inc.resource.base.object').init() />
	
	<p>
		theObject1 = createObject('component', 'cf-compendium.inc.resource.base.object').init()<br />
		theObject2 = createObject('component', 'cf-compendium.inc.resource.base.object').init()<br />
		theObject3 = createObject('component', 'cf-compendium.inc.resource.base.object').init()<br />
		theObject4 = createObject('component', 'cf-compendium.inc.resource.base.object').init()<br />
		theObject5 = createObject('component', 'cf-compendium.inc.resource.base.object').init()<br />
		<cfset theObject1 = createObject('component', 'cf-compendium.inc.resource.base.object').init() />
		<cfset theObject2 = createObject('component', 'cf-compendium.inc.resource.base.object').init() />
		<cfset theObject3 = createObject('component', 'cf-compendium.inc.resource.base.object').init() />
		<cfset theObject4 = createObject('component', 'cf-compendium.inc.resource.base.object').init() />
		<cfset theObject5 = createObject('component', 'cf-compendium.inc.resource.base.object').init() />
	</p>
	
	<p>
		theObject1.setTest('aValue')<br />
		theObject2.setTest('anotherValue')<br />
		theObject3.setTest('something')<br />
		theObject4.setTest('things')<br />
		theObject5.setTest('others')<br />
		<cfset theObject1.setTest('aValue') />
		<cfset theObject2.setTest('anotherValue') />
		<cfset theObject3.setTest('something') />
		<cfset theObject4.setTest('things') />
		<cfset theObject5.setTest('others') />
	</p>
	
	<p>
		addThings(theObject1, theObject2, theObject3, theObject4, theObject5)<br />
		<cfset theObject.addThings(theObject1, theObject2, theObject3, theObject4, theObject5) />
	</p>
	
	<p>
		getThingsByTest('Val')<br />
		<cfloop array="#theObject.getThingsByTest('Val')#" index="i">
			<cfset i.print() />
		</cfloop>
	</p>
	
	<p>
		getThingsByTest('s$')<br />
		<cfloop array="#theObject.getThingsByTest('s$')#" index="i">
			<cfset i.print() />
		</cfloop>
	</p>
</div>

<h2>getAttributeList()</h2>

<div>
	<cfset theObject = createObject('component', 'cf-compendium.inc.resource.base.object').init() />
	
	<p>
		setTest('aValue')<br />
		<cfset theObject.setTest('aValue') />
	</p>
	
	<p>
		setName('something')<br />
		<cfset theObject.setName('something') />
	</p>
	
	<p>
		getAttributeList() --&gt;
		<cfoutput>#theObject.getAttributeList()#</cfoutput>
	</p>
</div>

<h2>setAttribute()</h2>

<div>
	<cfset theObject = createObject('component', 'cf-compendium.inc.resource.base.object').init() />
	
	<p>
		setTest('aValue')<br />
		<cfset theObject.setTest('aValue') />
	</p>
	
	<p>
		<cfset theObject.print() />
	</p>
</div>