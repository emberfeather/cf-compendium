<h1>Stack Examples</h1>
<cfset theStacker = createObject('component', 'cf-compendium.inc.resource.utility.stack').init() />

<h2>push(item) and pop()</h2>

<p>
	Pushes an item onto the stack.
</p>

<div>
	<p>
		push('value1')
		<cfset theStacker.push('value1') />
	</p>
	
	<p>
		push('value2')
		<cfset theStacker.push('value2') />
	</p>
	
	<p>
		push('value3')
		<cfset theStacker.push('value3') />
	</p>
	
	<p>
		pop() --&gt;
		<cfoutput>#theStacker.pop()#</cfoutput>
	</p>
	
	<p>
		pop() --&gt;
		<cfoutput>#theStacker.pop()#</cfoutput>
	</p>
	
	<p>
		pop() --&gt;
		<cfoutput>#theStacker.pop()#</cfoutput>
	</p>
</div>

<h2>the object</h2>

<cfdump var="#theStacker#" />