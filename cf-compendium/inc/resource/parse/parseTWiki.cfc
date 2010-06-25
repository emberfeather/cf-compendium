<cfcomponent extends="cf-compendium.inc.resource.parse.parseWikiText" output="false">
<cfscript>
	public component function init() {
		super.init();
		
		variables.language = createObject('java', 'org.eclipse.mylyn.wikitext.twiki.core.TWikiLanguage', '/cf-compendium/inc/lib/org.eclipse.mylyn.wikitext.core.jar,/cf-compendium/inc/lib/org.eclipse.mylyn.wikitext.twiki.core.jar').init();
		
		return this;
	}
</cfscript>
</cfcomponent>
