<cfhtmlhead text="<link rel=""stylesheet"" href=""#pathRoot#cf-compendium/style/datagrid.css"" />">
<cfhtmlhead text="<script type=""text/javascript"" src=""https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js""></script>">
<cfhtmlhead text="<script type=""text/javascript"" src=""#pathRoot#cf-compendium/script/jquery.datagrid.js""></script>">

<h1>Datagrid Examples</h1>

<blockquote>
	<code>
		theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init('')<br />
		i18n = createObject('component', 'cf-compendium.inc.resource.i18n.i18n').init( expandPath('/i18n/') )<br />
		datagrid = createObject('component', 'cf-compendium.inc.resource.structure.datagrid').init(i18n)
	</code>
</blockquote>

<cfset theUrl = createObject('component', 'cf-compendium.inc.resource.utility.url').init('') />
<cfset i18n = createObject('component', 'cf-compendium.inc.resource.i18n.i18n').init(expandPath('/i18n/')) />
<cfset datagrid = createObject('component', 'cf-compendium.inc.resource.structure.datagrid').init(i18n) />

<h2>addBundle(path, name)</h2>

<p>
	Adds an i18n bundle for label translation.
</p>

<blockquote>
	<code>
		datagrid.addBundle('inc/resource/structure', 'datagrid')
	</code>
</blockquote>

<cfset datagrid.addBundle('inc/resource/structure', 'datagrid') />

<h2>addColumn([options])</h2>

<p>
	Adds a column to be displayed in the dataGrid.
</p>

<p>
	Structs can be nested.
</p>


<blockquote>
	<code>
		datagrid.addColumn({
			key = 'address.line1',
			label = 'address.line1'
		})
	</code>
</blockquote>

<cfset datagrid.addColumn({
	key = 'address.line1',
	label = 'address.line1'
}) />

<blockquote>
	<code>
		datagrid.addColumn({
			key = 'address.city',
			label = 'address.city'
		})
	</code>
</blockquote>

<cfset datagrid.addColumn({
	key = 'address.city',
	label = 'address.city'
}) />

<blockquote>
	<code>
		datagrid.addColumn({
			key = 'address.state',
			label = 'address.state'
		})
	</code>
</blockquote>

<cfset datagrid.addColumn({
	key = 'address.state',
	label = 'address.state'
}) />

<h2>toHTML(data[, options])</h2>

<blockquote>
	<code>
		data = [
			{
				address = {
					line1 = '1243 Sycamore',
					city = 'Farmington',
					state = 'Utah'
				}
			},
			{
				address = {
					line1 = '89 E Bell Dr',
					city = 'Las Vegas',
					state = 'Arizona'
				}
			},
			{
				address = {
					line1 = '552 E 200 N',
					city = 'San Diego',
					state = 'California'
				}
			}
		]<br />
		
		datagrid.toHTML(data, {
			numPerPage = 2000,
			theUrl = theUrl
		})
	</code>
</blockquote>

<cfset data = [
	{
		address = {
			line1 = '1243 Sycamore',
			city = 'Farmington',
			state = 'Utah'
		}
	},
	{
		address = {
			line1 = '89 E Bell Dr',
			city = 'Las Vegas',
			state = 'Arizona'
		}
	},
	{
		address = {
			line1 = '552 E 200 N',
			city = 'San Diego',
			state = 'California'
		}
	}
] />

<cfoutput>#datagrid.toHTML(data, {
	numPerPage = 2000,
	theUrl = theUrl
})#</cfoutput>

<h2>JavaScript</h2>

<blockquote>
	<code>
		jQuery(function($){
			$('.datagrid').datagrid();
		});
	</code>
</blockquote>

<script type="text/javascript" language="javascript">
	jQuery(function($){
		$('.datagrid').datagrid();
	});
</script>
