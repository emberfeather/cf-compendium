<h1>Contrast Examples</h1>
<cfset theContrast = createObject('component', 'cf-compendium.inc.resource.utility.contrast').init() />

<p>
	Used to contrast two lists, arrays, or structs to determine the similarities and differences.
</p>

<h2>contrast('list', 'list')</h2>

<cfset set1 = 'a,b,c,e' />
<cfset set2 = 'c,d,a,f' />

<div>
	<cfoutput>contrast('#set1#', '#set2#') --&gt;</cfoutput>
	<cfdump var="#theContrast.contrast(set1, set2)#" />
</div>

<h2>contrast(array1, array2)</h2>

<cfset set1 = [ 1, 2, 3, 4, 5 ] />
<cfset set2 = [ 0, 2, 4, 6, 8 ] />

<div>
	array1:
		<cfdump var="#set1#" />
		
	array2:
		<cfdump var="#set2#" />
	
	<cfoutput>contrast(array1, array2) --&gt;</cfoutput>
	<cfdump var="#theContrast.contrast(set1, set2)#" />
</div>

<h2>contrast(struct1, struct2)</h2>

<cfset set1 = { a = 1, b = 2, c = 3, e = 5 } />
<cfset set2 = { a = 0, c = 2, d = 5 } />

<div>
	struct1:
		<cfdump var="#set1#" />
	
	struct2:
		<cfdump var="#set2#" />
	
	<cfoutput>contrast(struct1, struct2) --&gt;</cfoutput>
	<cfdump var="#theContrast.contrast(set1, set2)#" />
</div>

<h2>contrast(array1, struct1)</h2>

<cfset set1 = [ 1, 2, 3, 4, 5 ] />
<cfset set2 = { a = 0, c = 2, d = 5 } />

<div>
	array1:
		<cfdump var="#set1#" />
		
	struct1:
		<cfdump var="#set2#" />
	
	<cfoutput>contrast(array1, struct1) --&gt;</cfoutput>
	<cfdump var="#theContrast.contrast(set1, set2)#" />
</div>

<h2>contrast('list', 'list', 'delimiter')</h2>

<cfset set1 = 'a|b|c|e' />
<cfset set2 = 'c|d|a|f' />

<div>
	<cfoutput>contrast('#set1#', '#set2#', '|') --&gt;</cfoutput>
	<cfdump var="#theContrast.contrast(set1, set2, '|')#" />
</div>

<h2>the object</h2>

<cfdump var="#theContrast#" />