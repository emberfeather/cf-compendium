<h1>Object - A Tests</h1>

<h2>Counts</h2>

<cfset repeatCount = 5 />
<cfset count = 500 />

<p>
	Running createObject: <cfoutput>#repeatCount# sets of #count#</cfoutput>
</p>

<cfflush />

<cfsilent>
	<cfloop from="1" to="#repeatCount#" index="j">
		<!--- Test the speed of creating objects --->
		<cfset profiler.start('createObject') />
		
		<cfloop from="1" to="#count#" index="i">
			<cfset theObject = createObject('component', 'cf-compendium.inc.resource.base.object').init() />
		</cfloop>
		
		<cfset profiler.stop('createObject') />
	</cfloop>
</cfsilent>

<cfset count = 10000 />

<!--- Test the speed of setting on an object --->
<p>
	Running setExisting: <cfoutput>#repeatCount# sets of #count#</cfoutput>
</p>

<cfflush />

<cfset theObject = createObject('component', 'implementation.inc.resource.base.object1').init() />

<cfsilent>
	<cfloop from="1" to="#repeatCount#" index="j">
		<cfset profiler.start('setExisting') />
		
		<cfloop from="1" to="#count#" index="i">
			<cfset theObject.setName('testing') />
		</cfloop>
		
		<cfset profiler.stop('setExisting') />
	</cfloop>
</cfsilent>

<!--- Test the speed of getting on an object --->
<p>
	Running getExisting: <cfoutput>#repeatCount# sets of #count#</cfoutput>
</p>

<cfflush />

<cfset theObject = createObject('component', 'implementation.inc.resource.base.object1').init() />
<cfset theObject.setName('testing') />

<cfsilent>
	<cfloop from="1" to="#repeatCount#" index="j">
		<cfset profiler.start('getExisting') />
		
		<cfloop from="1" to="#count#" index="i">
			<cfset theObject.getName() />
		</cfloop>
		
		<cfset profiler.stop('getExisting') />
	</cfloop>
</cfsilent>

<!--- Test the speed of setting on an object --->
<p>
	Running setNonExisting: <cfoutput>#repeatCount# sets of #count#</cfoutput>
</p>

<cfflush />

<cfset theObject = createObject('component', 'implementation.inc.resource.base.object1').init() />

<cfsilent>
	<cfloop from="1" to="#repeatCount#" index="j">
		<cfset profiler.start('setNonExisting') />
		
		<cfloop from="1" to="#count#" index="i">
			<cfset theObject.setTitle('testing') />
		</cfloop>
		
		<cfset profiler.stop('setNonExisting') />
	</cfloop>
</cfsilent>

<!--- Test the speed of getting on an object --->
<p>
	Running getNonExisting: <cfoutput>#repeatCount# sets of #count#</cfoutput>
</p>

<cfflush />

<cfset theObject = createObject('component', 'implementation.inc.resource.base.object1').init() />
<cfset theObject.setTitle('testing') />

<cfsilent>
	<cfloop from="1" to="#repeatCount#" index="j">
		<cfset profiler.start('getNonExisting') />
		
		<cfloop from="1" to="#count#" index="i">
			<cfset theObject.getTitle() />
		</cfloop>
		
		<cfset profiler.stop('getNonExisting') />
	</cfloop>
</cfsilent>

<!--- Output Results --->
<pre><cfoutput>#htmlCodeFormat(profiler.toHTML())#</cfoutput></pre>
