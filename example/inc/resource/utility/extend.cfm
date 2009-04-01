<h1>Extend Examples</h1>
<cfset theExtender = createObject('component', 'cf-compendium.inc.resource.utility.extend').init() />

<h2>extend(defaultsStruct, valuesStruct)</h2>

<p>
	Used to create a new struct from the two given structs.
	If the struct key does not exist in the values struct the default struct value is used.
</p>

<div>
	<cfset defaultsStruct = { test1 = 1, test2 = 2, test3 = 3 } />
	<cfset valuesStruct = { test1 = -1, test4 = 4, test5 = 5 } />
	
	<p>
		defaultsStruct:
		<cfdump var="#defaultsStruct#" />
	</p>
	
	<p>
		valuesStruct:
		<cfdump var="#valuesStruct#" />
	</p>
	
	<p>
		extend(defaults, values) --&gt;
		<cfdump var="#theExtender.extend(defaultsStruct, valuesStruct)#" />
	</p>
</div>

<h2>the object</h2>

<cfdump var="#theExtender#" />