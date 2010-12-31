component extends="cf-compendium.inc.resource.utility.url" {
	public component function init(any masterBase = '', struct options = {}) {
		if(!structKeyExists(arguments.options, 'rewriteBase') || arguments.options.rewriteBase eq '') {
			arguments.options['rewriteBase'] = '_base';
		}
		
		super.init(argumentCollection = arguments);
		
		return this;
	}
	
	private string function get( string locationName = '', boolean useEncoded = true, struct options = {} ) {
		var keys = '';
		var locate = '';
		var location = findLocation(arguments.locationName);
		
		// Extend the options
		arguments.options = variables.extend.extend(variables.urlOptions, arguments.options);
		
		arguments.options.keys = structKeyList(location);
		
		locate = listFindNoCase(arguments.options.keys, arguments.options.rewriteBase);
		
		// If we found the rewrite base key in the location trigger the rewrite functionality
		if(locate) {
			if(len(arguments.options.start) && right(arguments.options.start, 1) == '/') {
				arguments.options.start = right(arguments.options.start, len(arguments.options.start) - 1);
			}
			
			if( left(location[arguments.options.rewriteBase], 1) != '/' ) {
				location[arguments.options.rewriteBase] = '/' & location[arguments.options.rewriteBase];
			}
			
			arguments.options.start &= location[arguments.options.rewriteBase];
			
			arguments.options.keys = listDeleteAt(arguments.options.keys, locate);
		}
		
		return super.get(argumentCollection = arguments);
	}
}
