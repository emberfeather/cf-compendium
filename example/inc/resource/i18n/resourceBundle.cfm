<h1>Resource Bundle Example</h1>

<cfset path = '/i18n/inc/resource/i18n/' />
<cfset bundle = 'resourceBundle' />

<h2>English</h2>

<cfset locale = 'en_US' />

<blockquote>
	<cfoutput>
		<code>
			resourceBundle = createObject('component', 'cf-compendium.inc.resource.i18n.resourceBundle').init('#path#', '#bundle#', '#locale#')<br />
			resourceBundle.get()
		</code>
	</cfoutput>
</blockquote>

<cfset resourceBundle = createObject('component', 'cf-compendium.inc.resource.i18n.resourceBundle').init(path, bundle, locale) />

<cfdump var="#resourceBundle.get()#" />

<h2>Pirate</h2>

<cfset locale = 'en_PI' />

<blockquote>
	<cfoutput>
		<code>
			resourceBundle = createObject('component', 'cf-compendium.inc.resource.i18n.resourceBundle').init('#path#', '#bundle#', '#locale#')<br />
			resourceBundle.get()
		</code>
	</cfoutput>
</blockquote>

<cfset resourceBundle = createObject('component', 'cf-compendium.inc.resource.i18n.resourceBundle').init(path, bundle, locale) />

<cfdump var="#resourceBundle.get()#" />

<h2>Thai</h2>

<cfset locale = 'th_TH' />

<blockquote>
	<cfoutput>
		<code>
			resourceBundle = createObject('component', 'cf-compendium.inc.resource.i18n.resourceBundle').init('#path#', '#bundle#', '#locale#')<br />
			resourceBundle.get()
		</code>
	</cfoutput>
</blockquote>

<cfset resourceBundle = createObject('component', 'cf-compendium.inc.resource.i18n.resourceBundle').init(path, bundle, locale) />

<cfdump var="#resourceBundle.get()#" />

<h2>The Object</h2>

<cfdump var="#resourceBundle#" />