<h1>Form Standard Examples</h1>

<blockquote>
	<code>
		i18n = createObject('component', 'cf-compendium.inc.resource.i18n.i18n').init( expandPath('/i18n/') )<br />
		theForm = createObject('component', 'cf-compendium.inc.resource.structure.formStandard').init('test', i18n, 'en_US')
	</code>
</blockquote>

<cfset i18n = createObject('component', 'cf-compendium.inc.resource.i18n.i18n').init(expandPath('/i18n/')) />
<cfset theForm = createObject('component', 'cf-compendium.inc.resource.structure.formStandard').init('test', i18n, 'en_US') />

<h2>addBundle(path, name)</h2>

<p>
	Adds an i18n bundle for label translation.
</p>

<blockquote>
	<code>
		theForm.addBundle('inc/resource/structure', 'form')
	</code>
</blockquote>

<cfset theForm.addBundle('inc/resource/structure', 'form') />

<h2>Button</h2>

<blockquote>
	<code>
		theForm.addElement('button', {
				name = "testButton",
				label = "button",
				value = "Testing Button"
			})
	</code>
</blockquote>

<!--- Button --->
<cfset theForm.addElement('button', {
		name = "testButton",
		label = "button",
		value = "Testing Button"
	}) />

<h2>Checkbox</h2>

<blockquote>
	<code>
		theForm.addElement('checkbox', {
				name = "testCheckbox",
				label = "checkbox",
				value = "true"
			})
	</code>
</blockquote>

<!--- Checkbox --->
<cfset theForm.addElement('checkbox', {
		name = "testCheckbox",
		label = "checkbox",
		value = "true"
	}) />

<h2>File</h2>

<blockquote>
	<code>
		theForm.addElement('file', {
				name = "testFile",
				label = "file"
			})
	</code>
</blockquote>

<!--- File --->
<cfset theForm.addElement('file', {
		name = "testFile",
		label = "file"
	}) />

<h2>Hidden</h2>

<blockquote>
	<code>
		theForm.addElement('hidden', {
				name = "testHidden",
				value = "true"
			})
	</code>
</blockquote>

<!--- Hidden --->
<cfset theForm.addElement('hidden', {
		name = "testHidden",
		value = "true"
	}) />

<h2>Image</h2>

<blockquote>
	<code>
		theForm.addElement('image', {
				name = "testImage",
				label = "image",
				value = "true"
			})
	</code>
</blockquote>

<!--- Image --->
<cfset theForm.addElement('image', {
		name = "testImage",
		label = "image",
		value = "true"
	}) />

<h2>Password</h2>

<blockquote>
	<code>
		theForm.addElement('password', {
				name = "testPassword",
				label = "password",
				value = "passwd"
			})
	</code>
</blockquote>

<!--- Password --->
<cfset theForm.addElement('password', {
		name = "testPassword",
		label = "password",
		value = "passwd"
	}) />

<h2>Radio</h2>

<blockquote>
	<code>
		theForm.addElement('radio', {
				name = "testRadio",
				label = "radio",
				value = "true"
			})
	</code>
</blockquote>

<!--- Radio --->
<cfset theForm.addElement('radio', {
		name = "testRadio",
		label = "radio",
		value = "true"
	}) />

<h2>Select</h2>

<blockquote>
	<code>
		element = {
				name = "testSelect",
				label = "select",
				options = createObject('component', 'cf-compendium.inc.resource.utility.options').init()
			}<br />
		
		element.options.addOption('Title 1', 'Value 1')<br />
		element.options.addOption('Title 2', 'Value 2')<br />
		element.options.addOption('Title 3', 'Value 3')<br />
		element.options.addOption('Title 4', 'Value 4')<br />
		
		theForm.addElement('select', element)
	</code>
</blockquote>

<!--- Select --->
<cfset element = {
		name = "testSelect",
		label = "select",
		options = createObject('component', 'cf-compendium.inc.resource.utility.options').init()
	} />

<cfset element.options.addOption('Title 1', 'Value 1') />
<cfset element.options.addOption('Title 2', 'Value 2') />
<cfset element.options.addOption('Title 3', 'Value 3') />
<cfset element.options.addOption('Title 4', 'Value 4') />

<cfset theForm.addElement('select', element) />

<h2>Text</h2>

<blockquote>
	<code>
		theForm.addElement('text', {
				name = "testText",
				label = "text",
				value = "true"
			})
	</code>
</blockquote>

<!--- Text --->
<cfset theForm.addElement('text', {
		name = "testText",
		label = "text",
		value = "true"
	}) />

<h2>Textarea</h2>

<blockquote>
	<code>
		theForm.addElement('textarea', {
				name = "testTextarea",
				label = "textarea",
				value = "true"
			})
	</code>
</blockquote>

<!--- Textarea --->
<cfset theForm.addElement('textarea', {
		name = "testTextarea",
		label = "textarea",
		value = "true"
	}) />

<h2>Example Output</h2>

<cfoutput>#theForm.toHTML('/')#</cfoutput>

<h2>The Object</h2>

<cfdump var="#theForm#" />