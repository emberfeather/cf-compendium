<h1>Resource Bundle Example</h1>

<cfset path = expandPath('/i18n/inc/resource/i18n/') />
<cfset bundle = 'resourceBundle' />
<cfset locale = 'en_US' />

<cfset theResourceBundle = createObject('component', 'cf-compendium.inc.resource.i18n.resourceBundle') />

<h2>English</h2>

<cfset theResourceBundle.init(path, bundle, locale) />

<h3>Bundle Values</h3>

<!--- Get the entire bundle --->
<cfdump var="#theResourceBundle.get()#" />

<h2>Pirate</h2>

<!--- Change the locale --->
<cfset locale = 'en_PI' />

<cfset theResourceBundle.init(path, bundle, locale) />

<h3>Bundle Values</h3>

<!--- Get the entire bundle --->
<cfdump var="#theResourceBundle.get()#" />

<h2>Thai</h2>

<!--- Change the locale --->
<cfset locale = 'th_TH' />

<cfset theResourceBundle.init(path, bundle, locale) />

<h3>Bundle Values</h3>

<!--- Get the entire bundle --->
<cfdump var="#theResourceBundle.get()#" />

<h2>the object</h2>

<cfdump var="#theResourceBundle#" />