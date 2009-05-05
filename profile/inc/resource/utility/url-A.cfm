<h1>URL - A Tests</h1>

<cfset theProfiler = createObject('component', 'cf-compendium.inc.resource.utility.profiler').init(true) />

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
		<cfset theProfiler.start('createObject') />
		
		<cfloop from="1" to="#count#" index="i">
			<cfset theObject = createObject('component', 'cf-compendium.inc.resource.utility.url').init() />
		</cfloop>
		
		<cfset theProfiler.stop('createObject') />
	</cfloop>
</cfsilent>

<cfset count = 10000 />

<!--- Test the speed of setting on an instance --->
<p>
	Running set: <cfoutput>#repeatCount# sets of #count#</cfoutput>
</p>

<cfflush />

<cfset theObject = createObject('component', 'cf-compendium.inc.resource.utility.url').init() />

<cfsilent>
	<cfloop from="1" to="#repeatCount#" index="j">
		<cfset theProfiler.start('set') />
		
		<cfloop from="1" to="#count#" index="i">
			<cfset theObject.setName('testing', 'aValue') />
		</cfloop>
		
		<cfset theProfiler.stop('set') />
	</cfloop>
</cfsilent>

<!--- Test the speed of getting on an object --->
<p>
	Running get: <cfoutput>#repeatCount# sets of #count#</cfoutput>
</p>

<cfflush />

<cfset theObject = createObject('component', 'cf-compendium.inc.resource.utility.url').init() />
<cfset theObject.setName('testing', 'aValue') />

<cfsilent>
	<cfloop from="1" to="#repeatCount#" index="j">
		<cfset theProfiler.start('get') />
		
		<cfloop from="1" to="#count#" index="i">
			<cfset theObject.getName() />
		</cfloop>
		
		<cfset theProfiler.stop('get') />
	</cfloop>
</cfsilent>

<!--- Output Results --->
<cfoutput>#theProfiler.toHTML()#</cfoutput>