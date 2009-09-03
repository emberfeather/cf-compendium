<h1>Contrast Examples</h1>
<cfset contrastor = createObject('component', 'cf-compendium.inc.resource.utility.contrast').init() />

<p>
	Used to contrast two lists, arrays, or structs to determine the similarities and differences.
</p>

<h2>contrast('list', 'list')</h2>

<blockquote>
	<code>
		set1 = 'a,b,c,e'<br />
		set2 = 'c,d,a,f'<br />
		contrastor.contrast(set1, set2)
	</code>
</blockquote>

<cfset set1 = 'a,b,c,e' />
<cfset set2 = 'c,d,a,f' />

<cfdump var="#contrastor.contrast(set1, set2)#" label="Contast Two Lists" />

<h2>contrast(array1, array2)</h2>

<blockquote>
	<code>
		set1 = [ 1, 2, 3, 4, 5 ]<br />
		set2 = [ 0, 2, 4, 6, 8 ]<br />
		contrastor.contrast(set1, set2)
	</code>
</blockquote>

<cfset set1 = [ 1, 2, 3, 4, 5 ] />
<cfset set2 = [ 0, 2, 4, 6, 8 ] />

<cfdump var="#contrastor.contrast(set1, set2)#" label="Contrast Two Arrays" />

<h2>contrast(struct1, struct2)</h2>

<blockquote>
	<code>
		set1 = { a = 1, b = 2, c = 3, e = 5 }<br />
		set2 = { a = 0, c = 2, d = 5 }<br />
		contrastor.contrast(set1, set2)
	</code>
</blockquote>

<cfset set1 = { a = 1, b = 2, c = 3, e = 5 } />
<cfset set2 = { a = 0, c = 2, d = 5 } />

<cfdump var="#contrastor.contrast(set1, set2)#" label="Contrast Two Structs" />

<h2>contrast(array1, struct1)</h2>

<blockquote>
	<code>
		set1 = [ 1, 2, 3, 4, 5 ]<br />
		set2 = { a = 0, c = 2, d = 5 }<br />
		contrastor.contrast(set1, set2)
	</code>
</blockquote>

<cfset set1 = [ 1, 2, 3, 4, 5 ] />
<cfset set2 = { a = 0, c = 2, d = 5 } />

<cfdump var="#contrastor.contrast(set1, set2)#" label="Contrast Array and Struct" />

<h2>contrast('list', 'list', 'delimiter')</h2>

<blockquote>
	<code>
		set1 = 'a|b|c|e'<br />
		set2 = 'c|d|a|f'<br />
		contrastor.contrast(set1, set2, '|')
	</code>
</blockquote>

<cfset set1 = 'a|b|c|e' />
<cfset set2 = 'c|d|a|f' />

<cfdump var="#contrastor.contrast(set1, set2, '|')#" label="Contrast Two Lists With Delimiter" />

<h2>The Object</h2>

<cfdump var="#contrastor#" />