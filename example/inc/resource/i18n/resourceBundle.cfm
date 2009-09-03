<h1>Resource Bundle Example</h1>

<cfset path = expandPath('/i18n/inc/resource/i18n/') />
<cfset bundle = 'resourceBundle' />

<cfset theResourceBundle = createObject('component', 'cf-compendium.inc.resource.i18n.resourceBundle') />

<h2>English</h2>

<cfset locale = 'en_US' />

<blockquote>
	<cfoutput>
		<code>
			theResourceBundle.init('#path#', '#bundle#', '#locale#')<br />
			theResourceBundle.get()
		</code>
	</cfoutput>
</blockquote>

<cfset theResourceBundle.init(path, bundle, locale) />

<cfdump var="#theResourceBundle.get()#" />

<h2>Pirate</h2>

<cfset locale = 'en_PI' />

<blockquote>
	<cfoutput>
		<code>
			theResourceBundle.init('#path#', '#bundle#', '#locale#')<br />
			theResourceBundle.get()
		</code>
	</cfoutput>
</blockquote>

<cfset theResourceBundle.init(path, bundle, locale) />

<cfdump var="#theResourceBundle.get()#" />

<h2>Thai</h2>

<cfset locale = 'th_TH' />

<blockquote>
	<cfoutput>
		<code>
			theResourceBundle.init('#path#', '#bundle#', '#locale#')<br />
			theResourceBundle.get()
		</code>
	</cfoutput>
</blockquote>

<cfset theResourceBundle.init(path, bundle, locale) />

<cfdump var="#theResourceBundle.get()#" />

<h2>The Object</h2>

<cfdump var="#theResourceBundle#" />