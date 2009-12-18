<cfcomponent output="false">
	<cfset this.name = 'cf-compendium' />
	<cfset this.applicationTimeout = createTimeSpan(2, 0, 0, 0) />
	<cfset this.clientManagement = false />
	<cfset this.sessionManagement = false />
	
	<cfset this.mappings['/root'] = getDirectoryFromPath( getCurrentTemplatePath() ) />
	<cfset this.mappings['/cf-compendium'] = this.mappings['/root'] & 'cf-compendium' />
	<cfset this.mappings['/example'] = this.mappings['/root'] & 'example' />
	<cfset this.mappings['/i18n'] = this.mappings['/root'] & 'i18n' />
	<cfset this.mappings['/implementation'] = this.mappings['/root'] & 'implementation' />
	<cfset this.mappings['/mxunit'] = this.mappings['/root'] & 'mxunit' />
	<cfset this.mappings['/profile'] = this.mappings['/root'] & 'profile' />
	<cfset this.mappings['/test'] = this.mappings['/root'] & 'test' />
</cfcomponent>