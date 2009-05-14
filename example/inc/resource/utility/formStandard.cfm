<h1>Form Standard Examples</h1>
<cfset theForm = createObject('component', 'cf-compendium.inc.resource.utility.formStandard').init('test') />

<h2>Example Output</h2>

<!--- Button --->
<cfset element = {
		name = "testButton",
		label = "Button",
		value = "Testing Button"
	} />

<cfset theForm.addElement('button', element) />

<!--- Checkbox --->
<cfset element = {
		name = "testCheckbox",
		label = "Checkbox",
		value = "true"
	} />

<cfset theForm.addElement('checkbox', element) />

<!--- File --->
<cfset element = {
		name = "testFile",
		label = "File"
	} />

<cfset theForm.addElement('file', element) />

<!--- Hidden --->
<cfset element = {
		name = "testHidden",
		label = "Hidden",
		value = "true"
	} />
	
<cfset theForm.addElement('hidden', element) />

<!--- Image --->
<cfset element = {
		name = "testImage",
		label = "Image",
		value = "true"
	} />

<cfset theForm.addElement('image', element) />

<!--- Password --->
<cfset element = {
		name = "testPassword",
		label = "Password",
		value = "passwd"
	} />

<cfset theForm.addElement('password', element) />

<!--- Radio --->
<cfset element = {
		name = "testRadio",
		label = "Radio",
		value = "true"
	} />

<cfset theForm.addElement('radio', element) />

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

<!--- Text --->
<cfset element = {
		name = "testText",
		label = "Text",
		value = "true"
	} />

<cfset theForm.addElement('text', element) />

<!--- Textarea --->
<cfset element = {
		name = "testTextarea",
		label = "Textarea",
		value = "true"
	} />

<cfset theForm.addElement('textarea', element) />

<cfoutput>#theForm.toHTML('/')#</cfoutput>

<h2>the object</h2>

<cfdump var="#theForm#" />