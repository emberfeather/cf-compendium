<cfhtmlhead text="<link rel=""stylesheet"" href=""#pathRoot#cf-compendium/style/datagrid.css"" />">
<cfhtmlhead text="<script type=""text/javascript"" src=""https://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js""></script>">
<cfhtmlhead text="<script type=""text/javascript"" src=""#pathRoot#cf-compendium/script/jquery.datagrid.js""></script>">

<h1>Datagrid Examples</h1>

<blockquote>
	<code>
		theURL = createObject('component', 'cf-compendium.inc.resource.utility.url').init('')<br />
		i18n = createObject('component', 'cf-compendium.inc.resource.i18n.i18n').init( expandPath('/i18n/') )<br />
		datagrid = createObject('component', 'cf-compendium.inc.resource.structure.datagrid').init(i18n)
	</code>
</blockquote>

<cfset theURL = createObject('component', 'cf-compendium.inc.resource.utility.url').init('') />
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
	Links can use a data key name as the value to use the value from the data.
</p>

<blockquote>
	<code>
		datagrid.addColumn({
				key = 'FirstName',
				label = 'firstName',
				link = {
					'userID' = 'userID'
				}
			})
	</code>
</blockquote>

<cfset datagrid.addColumn({
		key = 'FirstName',
		label = 'firstName',
		link = {
			'userID' = 'userID'
		}
	}) />

<p>
	Links can use hard-coded values if the the value is not the key in the data.
</p>

<blockquote>
	<code>
		datagrid.addColumn({
				key = 'LastName',
				label = 'lastName',
				link = {
					'lastName' = 'Martian'
				}
			})
	</code>
</blockquote>

<cfset datagrid.addColumn({
		key = 'LastName',
		label = 'lastName',
		link = {
			'lastName' = 'Martian'
		}
	}) />

<p>
	Links can have multiple keys changed each row.
</p>

<blockquote>
	<code>
		datagrid.addColumn({
				class = 'phantom align-right',
				value = 'action',
				link = {
					'userID' = 'userID',
					'action' = 'action'
				}
			})
	</code>
</blockquote>

<cfset datagrid.addColumn({
		class = 'phantom align-right',
		value = 'action',
		link = {
			'userID' = 'userID',
			'action' = 'action'
		}
	}) />

<p>
	Can also have multiple links with labels from the i18n or columns as the values
	with multiple keys changes each row.
</p>

<p>
	Links are able to also have classes associated with them.
</p>

<blockquote>
	<code>
		datagrid.addColumn({
				class = 'phantom align-right',
				value = [
					'delete',
					'edit'
				],
				link = [
					{
						'userID' = 'userID',
						'action' = 'delete'
					},
					{
						'userID' = 'userID',
						'action' = 'edit'
					}
				],
				linkClass = [
					'delete',
					''
				]
			})
	</code>
</blockquote>

<cfset datagrid.addColumn({
		class = 'phantom align-right',
		value = [
			'delete',
			'edit'
		],
		link = [
			{
				'userID' = 'userID',
				'action' = 'delete'
			},
			{
				'userID' = 'userID',
				'action' = 'edit'
			}
		],
		linkClass = [
			'delete',
			''
		]
	}) />

<h2>toHTML(data[, options])</h2>

<blockquote>
	<code>
		data = [
				{
					userID = 1,
					firstname = "John",
					lastName= "Doe"
				},
				{
					userID = 2,
					firstname = "Jane",
					lastName="Doe"
				},
				{
					userID = 3,
					firstname = "Bobby",
					lastName="Joe"
				}
			]<br />
		
		datagrid.toHTML(data, {
				numPerPage = 2000,
				theURL = theURL
			})
	</code>
</blockquote>

<cfset data = [
		{
			userID = 1,
			firstname = "John",
			lastName= "Doe"
		},
		{
			userID = 2,
			firstname = "Jane",
			lastName="Doe"
		},
		{
			userID = 3,
			firstname = "Bobby",
			lastName="Joe"
		}
	] />

<cfoutput>#datagrid.toHTML(data, {
		numPerPage = 2000,
		theURL = theURL
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
