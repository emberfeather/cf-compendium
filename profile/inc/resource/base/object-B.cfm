<h1>Object - B Tests</h1>

<cfset theProfiler = createObject('component', 'cf-compendium.inc.resource.utility.profiler').init(true) />

<h2>Counts</h2>

<cfset repeatCount = 5 />
<cfset count = 1000 />

<p>
	Running add: <cfoutput>#repeatCount# sets of #count#</cfoutput>
</p>

<cfflush />

<cfsilent>
	<cfset theObject = createObject('component', 'cf-compendium.inc.resource.base.object').init() />
	
	<cfloop from="1" to="#repeatCount#" index="j">
		<!--- Test the speed of creating objects --->
		<cfset theProfiler.start('add') />
		
		<cfloop from="1" to="#count#" index="i">
			<cfset theObject.addText('testing') />
		</cfloop>
		
		<cfset theProfiler.stop('add') />
	</cfloop>
</cfsilent>

<p>
	Running add(value x10): <cfoutput>#repeatCount# sets of #count#</cfoutput>
</p>

<cfflush />

<cfsilent>
	<cfset theObject = createObject('component', 'cf-compendium.inc.resource.base.object').init() />
	
	<cfloop from="1" to="#repeatCount#" index="j">
		<!--- Test the speed of creating objects --->
		<cfset theProfiler.start('addMulti') />
		
		<cfloop from="1" to="#count#" index="i">
			<cfset theObject.addText('testing', 'testing', 'testing', 'testing', 'testing', 'testing', 'testing', 'testing', 'testing', 'testing') />
		</cfloop>
		
		<cfset theProfiler.stop('addMulti') />
	</cfloop>
</cfsilent>

<p>
	Running addUnique: <cfoutput>#repeatCount# sets of #count#</cfoutput>
</p>

<cfflush />

<cfsilent>
	<cfset theObject = createObject('component', 'cf-compendium.inc.resource.base.object').init() />
	
	<cfloop from="1" to="#repeatCount#" index="j">
		<!--- Test the speed of creating objects --->
		<cfset theProfiler.start('addUnique') />
		
		<cfloop from="1" to="#count#" index="i">
			<cfset theObject.addUniqueText('testing') />
		</cfloop>
		
		<cfset theProfiler.stop('addUnique') />
	</cfloop>
</cfsilent>

<p>
	Running addUnique(value x10): <cfoutput>#repeatCount# sets of #count#</cfoutput>
</p>

<cfflush />

<cfsilent>
	<cfset theObject = createObject('component', 'cf-compendium.inc.resource.base.object').init() />
	
	<cfloop from="1" to="#repeatCount#" index="j">
		<!--- Test the speed of creating objects --->
		<cfset theProfiler.start('addUniqueMulti') />
		
		<cfloop from="1" to="#count#" index="i">
			<cfset theObject.addUniqueText('testing', 'testing', 'testing', 'testing', 'testing', 'testing', 'testing', 'testing', 'testing', 'testing') />
		</cfloop>
		
		<cfset theProfiler.stop('addUniqueMulti') />
	</cfloop>
</cfsilent>

<cfset count = 200 />

<p>
	Running getAttributesBy: <cfoutput>#repeatCount# sets of #count#</cfoutput>
</p>

<cfflush />

<cfsilent>
	<cfset theObject = createObject('component', 'cf-compendium.inc.resource.base.object').init() />
	
	<!--- Add something to search for --->
	<cfloop from="1" to="50" index="i">
		<cfset theObject.addText('testing', 'an', 'algorithm', 'that', 'searches', 'by', 'using', 'a', 'regular', 'expression') />
	</cfloop>
	
	<cfloop from="1" to="#repeatCount#" index="j">
		<!--- Test the speed of creating objects --->
		<cfset theProfiler.start('getAttributesBy') />
		
		<cfloop from="1" to="#count#" index="i">
			<cfset theObject.getTextBy('testing') />
		</cfloop>
		
		<cfset theProfiler.stop('getAttributesBy') />
	</cfloop>
</cfsilent>

<!--- Output Results --->
<cfoutput>#theProfiler.toHTML()#</cfoutput>