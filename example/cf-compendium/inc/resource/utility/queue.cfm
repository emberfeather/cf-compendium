<h1>Queue Examples</h1>
<cfset theQueueer = createObject('component', 'cf-compendium.inc.resource.utility.queue').init() />

<h2>push(item) and pop()</h2>

<p>
	Pushes an item onto the queue.
</p>

<div>
	<p>
		push('value1')
		<cfset theQueueer.push('value1') />
	</p>
	
	<p>
		push('value2')
		<cfset theQueueer.push('value2') />
	</p>
	
	<p>
		push('value3')
		<cfset theQueueer.push('value3') />
	</p>
	
	<p>
		pop() --&gt;
		<cfoutput>#theQueueer.pop()#</cfoutput>
	</p>
	
	<p>
		pop() --&gt;
		<cfoutput>#theQueueer.pop()#</cfoutput>
	</p>
	
	<p>
		pop() --&gt;
		<cfoutput>#theQueueer.pop()#</cfoutput>
	</p>
</div>

<h2>the object</h2>

<cfdump var="#theQueueer#" />