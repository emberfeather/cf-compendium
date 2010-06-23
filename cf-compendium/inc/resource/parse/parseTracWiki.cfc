<cfcomponent extends="cf-compendium.inc.resource.parse.parseWikiText" output="false">
<cfscript>
	public component function init() {
		super.init();
		
		variables.language = createObject('java', 'org.eclipse.mylyn.wikitext.tracwiki.core.TracWikiLanguage', '/cf-compendium/inc/lib/org.eclipse.mylyn.wikitext.tracwiki.core.jar').init();
		
		return this;
	}
</cfscript>
</cfcomponent>
