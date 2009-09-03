<h1>Extend Examples</h1>

<cfset extender = createObject('component', 'cf-compendium.inc.resource.utility.extend').init() />

<h2>extend(defaults, values)</h2>

<p>
	Used to create a new struct from the two given structs.
	If the struct key does not exist in the values struct the default struct value is used.
</p>

<blockquote>
	<code>
		defaults = { test1 = 1, test2 = 2, test3 = 3 }<br />
		values = { test1 = -1, test4 = 4, test5 = 5 }<br />
		extender.extend(defaults, values)
	</code>
</blockquote>

<cfset defaults = { test1 = 1, test2 = 2, test3 = 3 } />
<cfset values = { test1 = -1, test4 = 4, test5 = 5 } />

<cfdump var="#extender.extend(defaults, values)#" label="Extend a Struct" />

<h2>extend(defaults, values, depth)</h2>

<p>
	Used to create a new struct from the two given structs.
	If the struct key does not exist in the values struct the default struct value is used.
	A negative depth with go 'forever'.
	A positive depth with go up to that many levels if it exists.
</p>

<blockquote>
	<code>
		defaults = { test1 = 1, test2 = { test6 = { test8 = 8, test9 = 9 }, test7 = 7, test10 = 10 }, test3 = 3 }<br />
		values = { test1 = -1, test2 = { test6 = -2, test7 = -5 }, test5 = 5 }<br />
		extender.extend(defaults, values, -1)
	</code>
</blockquote>

<cfset defaults = { test1 = 1, test2 = { test6 = { test8 = 8, test9 = 9 }, test7 = 7, test10 = 10 }, test3 = 3 } />
<cfset values = { test1 = -1, test2 = { test6 = {}, test7 = -5 }, test5 = 5 } />

<cfdump var="#extender.extend(defaults, values, -1)#" label="Extend a Struct 'forever'" />

<blockquote>
	<code>
		extender.extend(defaults, values, 1)
	</code>
</blockquote>

<cfdump var="#extender.extend(defaults, values, 1)#" label="Extend a Struct 1 Level" />

<blockquote>
	<code>
		extender.extend(defaults, values, 2)
	</code>
</blockquote>

<cfdump var="#extender.extend(defaults, values, 2)#" label="Extend a Struct 2 Levels" />

<h2>The Object</h2>

<cfdump var="#extender#" />