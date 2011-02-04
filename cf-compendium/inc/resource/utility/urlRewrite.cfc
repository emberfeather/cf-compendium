component extends="cf-compendium.inc.resource.utility.url" {
	public component function init(any masterBase = '', struct options = {}) {
		if(!structKeyExists(arguments.options, 'rewriteBase') || arguments.options.rewriteBase eq '') {
			arguments.options['rewriteBase'] = '_base';
		}
		
		super.init(argumentCollection = arguments);
		
		return this;
	}
	
	public string function __get( string locationName = '', boolean useEncoded = true, struct options = {} ) {
		var keys = '';
		var locate = '';
		var currentLocation = __findLocation(arguments.locationName);
		
		// Extend the options
		arguments.options = variables.extend.extend(variables.urlOptions, arguments.options);
		
		arguments.options.keys = querystringKeyList(arguments.locationName);
		
		locate = listFindNoCase(arguments.options.keys, arguments.options.rewriteBase);
		
		// If we found the rewrite base key in the location trigger the rewrite functionality
		if(locate) {
			if(len(arguments.options.start) && right(arguments.options.start, 1) == '/') {
				arguments.options.start = reReplace(arguments.options.start, '[/]*$', '');
			}
			
			if( left(currentLocation[arguments.options.rewriteBase], 1) != '/' ) {
				currentLocation[arguments.options.rewriteBase] = '/' & currentLocation[arguments.options.rewriteBase];
			}
			
			arguments.options.start &= currentLocation[arguments.options.rewriteBase];
			
			arguments.options.keys = listDeleteAt(arguments.options.keys, locate);
		}
		
		try {
			return super.__get(argumentCollection = arguments);
		} catch(any e) {
			writeDump(var = currentLocation, label = 'Rewrite currentlocation');
			writeDump(var = arguments.options.keys, label = 'Rewrite arguments.options.keys');
			writeDump(var = variables.locations, label = 'Rewrite variables.locations');
			writeDump(e);
			abort;
		}
	}
}
