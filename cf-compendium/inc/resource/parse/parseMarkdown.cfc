<!---
	Uses the markdownj library to convert markdown into html.
	
	To use the markdownj library needs to be in your classpath.
	
	@see http://markdownj.org/
--->
<cfcomponent extends="cf-compendium.inc.resource.parse.parse" output="false">
<cfscript>
	public component function init() {
		super.init();
		
		variables.parser = createObject('java', 'com.petebevin.markdown.MarkdownProcessor').init();
		
		return this;
	}
	
	/**
	 * Converst the given raw source into HTML.
	 */
	/* required raw */
	public string function toHtml( string raw ) {
		return variables.parser.markdown(raw);
	}
</cfscript>
</cfcomponent>
