<h1>Form Standard Examples</h1>
<cfset theForm = createObject('component', 'cf-compendium.inc.resource.utility.formStandard').init('test') />

<h2>Button</h2>

<blockquote>
	<code>
		element = {
				name = "testButton",
				label = "Button",
				value = "Testing Button"
			}<br />
		
		theForm.addElement('button', element)
	</code>
</blockquote>

<!--- Button --->
<cfset element = {
		name = "testButton",
		label = "Button",
		value = "Testing Button"
	} />

<cfset theForm.addElement('button', element) />

<h2>Checkbox</h2>

<blockquote>
	<code>
		element = {
				name = "testCheckbox",
				label = "Checkbox",
				value = "true"
			}<br />
		
		theForm.addElement('checkbox', element)
	</code>
</blockquote>

<!--- Checkbox --->
<cfset element = {
		name = "testCheckbox",
		label = "Checkbox",
		value = "true"
	} />

<cfset theForm.addElement('checkbox', element) />

<h2>File</h2>

<blockquote>
	<code>
		element = {
				name = "testFile",
				label = "File"
			}<br />
		
		theForm.addElement('file', element)
	</code>
</blockquote>

<!--- File --->
<cfset element = {
		name = "testFile",
		label = "File"
	} />

<cfset theForm.addElement('file', element) />

<h2>Hidden</h2>

<blockquote>
	<code>
		element = {
				name = "testHidden",
				label = "Hidden",
				value = "true"
			}<br />
		
		theForm.addElement('hidden', element)
	</code>
</blockquote>

<!--- Hidden --->
<cfset element = {
		name = "testHidden",
		label = "Hidden",
		value = "true"
	} />
	
<cfset theForm.addElement('hidden', element) />

<h2>Image</h2>

<blockquote>
	<code>
		element = {
				name = "testImage",
				label = "Image",
				value = "true"
			}<br />
		
		theForm.addElement('image', element)
	</code>
</blockquote>

<!--- Image --->
<cfset element = {
		name = "testImage",
		label = "Image",
		value = "true"
	} />

<cfset theForm.addElement('image', element) />

<h2>Password</h2>

<blockquote>
	<code>
		element = {
				name = "testPassword",
				label = "Password",
				value = "passwd"
			}<br />
		
		theForm.addElement('password', element)
	</code>
</blockquote>

<!--- Password --->
<cfset element = {
		name = "testPassword",
		label = "Password",
		value = "passwd"
	} />

<cfset theForm.addElement('password', element) />

<h2>Radio</h2>

<blockquote>
	<code>
		element = {
				name = "testRadio",
				label = "Radio",
				value = "true"
			}<br />
		
		theForm.addElement('radio', element)
	</code>
</blockquote>

<!--- Radio --->
<cfset element = {
		name = "testRadio",
		label = "Radio",
		value = "true"
	} />

<cfset theForm.addElement('radio', element) />

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
		element = {
				name = "testText",
				label = "Text",
				value = "true"
			}<br />
		
		theForm.addElement('text', element)
	</code>
</blockquote>

<!--- Text --->
<cfset element = {
		name = "testText",
		label = "Text",
		value = "true"
	} />

<cfset theForm.addElement('text', element) />

<h2>Textarea</h2>

<blockquote>
	<code>
		element = {
				name = "testTextarea",
				label = "Textarea",
				value = "true"
			}<br />
		
		theForm.addElement('textarea', element)
	</code>
</blockquote>

<!--- Textarea --->
<cfset element = {
		name = "testTextarea",
		label = "Textarea",
		value = "true"
	} />

<cfset theForm.addElement('textarea', element) />

<h2>Example Output</h2>

<cfoutput>#theForm.toHTML('/')#</cfoutput>

<h2>The Object</h2>

<cfdump var="#theForm#" />