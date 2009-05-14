<h1>Form Object Examples</h1>
<cfset i18n = createObject('component', 'cf-compendium.inc.resource.i18n.i18n').init(expandPath('/i18n/')) />

<h2>English</h2>

<cfset theForm = createObject('component', 'cf-compendium.inc.resource.utility.formStandard').init('test') />
<cfset validatedObj = createObject('component', 'implementation.inc.resource.base.objectWithValidation').init(i18n) />
<cfset validatedObj.setFirstName('Tester') />

<!--- Create the form from the object --->
<cfset theForm.fromObject(validatedObj) />

<cfoutput>#theForm.toHTML('/')#</cfoutput>

<h2>Pirate</h2>

<cfset theForm = createObject('component', 'cf-compendium.inc.resource.utility.formStandard').init('test') />
<cfset validatedObj = createObject('component', 'implementation.inc.resource.base.objectWithValidation').init(i18n, 'en_PI') />
<cfset validatedObj.setFirstName('Tester') />

<!--- Create the form from the object --->
<cfset theForm.fromObject(validatedObj) />

<cfoutput>#theForm.toHTML('/')#</cfoutput>