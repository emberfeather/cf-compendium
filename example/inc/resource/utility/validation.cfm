<h1>Validation Examples</h1>

<cfset i18n = createObject('component', 'cf-compendium.inc.resource.i18n.i18n').init(expandPath('/i18n/')) />

<p>
	Testing the validation on an object in multiple languages
</p>

<h2>English</h2>

<cfset validatedObj = createObject('component', 'implementation.inc.resource.base.objectWithValidation').init(i18n) />

<div>
	<p>
		setFirstName('') --&gt;
		
		<cftry>
			<cfset validatedObj.setFirstName('') />
			
			<cfcatch type="validation">
				<cfdump var="#cfcatch.message#" />
			</cfcatch>
		</cftry>
	</p>
</div>

<h2>Pirate</h2>

<cfset validatedObj = createObject('component', 'implementation.inc.resource.base.objectWithValidation').init(i18n, 'en_PI') />

<div>
	<p>
		setFirstName('') --&gt;
		
		<cftry>
			<cfset validatedObj.setFirstName('') />
			
			<cfcatch type="validation">
				<cfdump var="#cfcatch.message#" />
			</cfcatch>
		</cftry>
	</p>
</div>