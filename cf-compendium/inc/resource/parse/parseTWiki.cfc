<!---
	Uses the markdownj library to convert markdown into html.
	
	To use the markdownj library needs to be in your classpath.
--->
<cfcomponent extends="cf-compendium.inc.resource.parse.parse" output="false">
<cfscript>
	public component function init() {
		var language = '';
		
		super.init();
		
		language = createObject('java', 'org.eclipse.mylyn.wikitext.twiki.core.TWikiLanguage').init();
		
		variables.parser = createObject('java', 'org.eclipse.mylyn.wikitext.core.parser.MarkupParser').init(language);
		
		return this;
	}
	
	/**
	 * Convert the given raw source into HTML.
	 */
	/* required raw */
	public string function toHtml( string raw ) {
		var writer = '';
		var builder = '';
		
		// Do some extra work to stop the parser from doing the entire html document.
		writer = createObject('java', 'java.io.StringWriter').init();
		
		builder = createObject('java', 'org.eclipse.mylyn.wikitext.core.parser.builder.HtmlDocumentBuilder').init(writer);
		builder.setEmitAsDocument(false);
		
		variables.parser.setBuilder(builder);
		variables.parser.parse(arguments.raw);
		
		return writer.toString();
	}
</cfscript>
</cfcomponent>
