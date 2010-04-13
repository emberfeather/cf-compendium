<cfcomponent extends="cf-compendium.inc.resource.base.base" output="false">
<cfscript>
	public component function init() {
		super.init();
		
		return this;
	}
	
	/* required raw */
	public string function toHtml( string raw ) {
		throw('notImplemented', 'The toHtml is not implemented', 'The toHtml functionality is not implemented for this parser');
	}
	
	/* required raw */
	public any function toPdf( string raw ) {
		throw('notImplemented', 'The toPdf is not implemented', 'The toPdf functionality is not implemented for this parser');
	}
</cfscript>
</cfcomponent>
