<cfcomponent extends="cf-compendium.inc.resource.parse.parseWikiText" output="false">
<cfscript>
	public component function init() {
		super.init();
		
		variables.language = createObject('java', 'org.eclipse.mylyn.wikitext.textile.core.TextileLanguage').init();
		
		return this;
	}
</cfscript>
</cfcomponent>
