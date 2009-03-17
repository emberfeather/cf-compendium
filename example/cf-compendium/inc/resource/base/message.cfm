<h1>Message Examples</h1>
<cfset theMessage = createObject('component', 'cf-compendium.inc.resource.base.message').init() />

<h2>add('message')</h2>

<p>
	Used to add a message.
</p>

<div>
	<cfset theMessage.add('testing') />
	add('testing')<br />
	
	<cfset theMessage.add('testing again') />
	add('testing again')<br />
	
	messages:
	<cfdump var="#theMessage.get()#" />
</div>

<h2>get()</h2>

<p>
	Used to get the messages.
</p>

<div>
	get()<br />
	
	messages:
	<cfdump var="#theMessage.get()#" />
</div>

<h2>length()</h2>

<p>
	Used to get the number of messages.
</p>

<div>
	Number of messages: <cfoutput>#theMessage.length()#</cfoutput>
</div>

<h2>reset()</h2>

<p>
	Used to reset previous messages.
</p>

<cfset theMessage.reset('testing a set') />

<div>
	reset()<br />
	messages:
	<cfdump var="#theMessage.get()#" />
</div>

<h2>set('message')</h2>

<p>
	Used to clear previous messages and set a new message to the object.
</p>

<div>
	<cfset theMessage.set('testing a set') />
	set('testing a set')<br />
	
	messages:
	<cfdump var="#theMessage.get()#" />
</div>

<h2>the object</h2>

<cfdump var="#theMessage#" />