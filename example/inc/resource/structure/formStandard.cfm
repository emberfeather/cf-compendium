<h1>Form Standard Examples</h1>
<cfset theForm = createObject('component', 'cf-compendium.inc.resource.structure.formStandard').init('test') />

<h2>Button</h2>

<blockquote>
	<code>
		theForm.addElement('button', {
				name = "testButton",
				label = "Button",
				value = "Testing Button"
			})
	</code>
</blockquote>

<!--- Button --->
<cfset theForm.addElement('button', {
		name = "testButton",
		label = "Button",
		value = "Testing Button"
	}) />

<h2>Checkbox</h2>

<blockquote>
	<code>
		theForm.addElement('checkbox', {
				name = "testCheckbox",
				label = "Checkbox",
				value = "true"
			})
	</code>
</blockquote>

<!--- Checkbox --->
<cfset theForm.addElement('checkbox', {
		name = "testCheckbox",
		label = "Checkbox",
		value = "true"
	}) />

<h2>File</h2>

<blockquote>
	<code>
		theForm.addElement('file', {
				name = "testFile",
				label = "File"
			})
	</code>
</blockquote>

<!--- File --->
<cfset theForm.addElement('file', {
		name = "testFile",
		label = "File"
	}) />

<h2>Hidden</h2>

<blockquote>
	<code>
		theForm.addElement('hidden', {
				name = "testHidden",
				label = "Hidden",
				value = "true"
			})
	</code>
</blockquote>

<!--- Hidden --->
<cfset theForm.addElement('hidden', {
		name = "testHidden",
		label = "Hidden",
		value = "true"
	}) />

<h2>Image</h2>

<blockquote>
	<code>
		theForm.addElement('image', {
				name = "testImage",
				label = "Image",
				value = "true"
			})
	</code>
</blockquote>

<!--- Image --->
<cfset theForm.addElement('image', {
		name = "testImage",
		label = "Image",
		value = "true"
	}) />

<h2>Password</h2>

<blockquote>
	<code>
		theForm.addElement('password', {
				name = "testPassword",
				label = "Password",
				value = "passwd"
			})
	</code>
</blockquote>

<!--- Password --->
<cfset theForm.addElement('password', {
		name = "testPassword",
		label = "Password",
		value = "passwd"
	}) />

<h2>Radio</h2>

<blockquote>
	<code>
		theForm.addElement('radio', {
				name = "testRadio",
				label = "Radio",
				value = "true"
			})
	</code>
</blockquote>

<!--- Radio --->
<cfset theForm.addElement('radio', {
		name = "testRadio",
		label = "Radio",
		value = "true"
	}) />

<h2>Select</h2>

<blockquote>
	<code>
		element = {
				name = "testSelect",
				label = "Select",
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
		label = "Select",
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
				label = "Text",
				value = "true"
			})
	</code>
</blockquote>

<!--- Text --->
<cfset theForm.addElement('text', {
		name = "testText",
		label = "Text",
		value = "true"
	}) />

<h2>Textarea</h2>

<blockquote>
	<code>
		theForm.addElement('textarea', {
				name = "testTextarea",
				label = "Textarea",
				value = "true"
			})
	</code>
</blockquote>

<!--- Textarea --->
<cfset theForm.addElement('textarea', {
		name = "testTextarea",
		label = "Textarea",
		value = "true"
	}) />

<h2>Example Output</h2>

<cfoutput>#theForm.toHTML('/')#</cfoutput>

<h2>The Object</h2>

<cfdump var="#theForm#" />