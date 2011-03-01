<h1>Diff Examples</h1>
<cfset diff = createObject('component', 'cf-compendium.inc.resource.utility.diff').init() />

<p>
	Used to diff two lists, arrays, or structs to determine the similarities and differences.
</p>

<h2>diff('list', 'list')</h2>

<blockquote>
	<code>
		set1 = 'a,b,c,e'<br />
		set2 = 'c,d,a,f'<br />
		diff.diff(set1, set2)
	</code>
</blockquote>

<cfset set1 = 'a,b,c,e' />
<cfset set2 = 'c,d,a,f' />

<cfdump var="#diff.diff(set1, set2)#" label="Contast Two Lists" />

<h2>diff(array1, array2)</h2>

<blockquote>
	<code>
		set1 = [ 1, 2, 3, 4, 5 ]<br />
		set2 = [ 0, 2, 4, 6, 8 ]<br />
		diff.diff(set1, set2)
	</code>
</blockquote>

<cfset set1 = [ 1, 2, 3, 4, 5 ] />
<cfset set2 = [ 0, 2, 4, 6, 8 ] />

<cfdump var="#diff.diff(set1, set2)#" label="Diff Two Arrays" />

<h2>diff(struct1, struct2)</h2>

<blockquote>
	<code>
		set1 = { a = 1, b = 2, c = 3, e = 5 }<br />
		set2 = { a = 0, c = 2, d = 5 }<br />
		diff.diff(set1, set2)
	</code>
</blockquote>

<cfset set1 = { a = 1, b = 2, c = 3, e = 5 } />
<cfset set2 = { a = 0, c = 2, d = 5 } />

<cfdump var="#diff.diff(set1, set2)#" label="Diff Two Structs" />

<h2>diff(array1, struct1)</h2>

<blockquote>
	<code>
		set1 = [ 1, 2, 3, 4, 5 ]<br />
		set2 = { a = 0, c = 2, d = 5 }<br />
		diff.diff(set1, set2)
	</code>
</blockquote>

<cfset set1 = [ 1, 2, 3, 4, 5 ] />
<cfset set2 = { a = 0, c = 2, d = 5 } />

<cfdump var="#diff.diff(set1, set2)#" label="Diff Array and Struct" />

<h2>toHtml(diffResults)</h2>

<blockquote>
	<code>
		set1 = { a = 1, b = 2, c = { aa = 3, cc = 5 } }<br />
		set2 = { a = 0, b = 2, c = { aa = 1, bb = 3 } }<br />
		diff.toHtml(diff.diff(set1, set2))
	</code>
</blockquote>

<cfset set1 = { a = 1, b = 2, c = { aa = 3, cc = 5 } } />
<cfset set2 = { a = 0, b = 2, c = { aa = 1, bb = 3 } } />

<cfoutput>#diff.toHtml(diff.diff(set1, set2))#</cfoutput>

<h2>The Object</h2>

<cfdump var="#diff#" />