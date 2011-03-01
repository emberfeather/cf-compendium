component {
	public component function init() {
		return this;
	}
	
	private string function determineType(required any value) {
		if(isArray(arguments.value)) {
			return 'array';
		}
		
		if(isObject(arguments.value)) {
			return 'object';
		}
		
		if(isStruct(arguments.value)) {
			return 'struct';
		}
		
		if(isNumeric(arguments.value)) {
			return 'numeric';
		}
		
		if(isDate(arguments.value)) {
			return 'date';
		}
		
		if(isSimpleValue(arguments.value)) {
			return 'string';
		}
		
		return 'unknown';
	}
	
	public struct function diff(required any original, required any current) {
		local.result = {
			'old': '',
			'new': ''
		};
		
		local.oldType = determineType(arguments.original);
		local.newType = determineType(arguments.current);
		
		// If they are not the same type then it has changed completely
		if(local.oldType != local.newType) {
			local.result.old = arguments.original;
			local.result.new = arguments.current;
			
			return local.result;
		}
		
		switch(local.newType) {
		case 'struct':
			local.result.old = {};
			local.result.new = {};
			
			break;
		case 'array':
			local.result.old = [];
			local.result.new = [];
			
			break;
		case 'date':
			arguments.original = parseDateTime(arguments.original);
			arguments.current = parseDateTime(arguments.current);
			
			break;
		}
		
		// Try a complete equality test
		if(arguments.original.equals(arguments.current)) {
			local.result.old = '';
			local.result.new = '';
			
			return local.result;
		}
		
		// Perform operations based upon the variable type
		switch(local.newType) {
		case 'struct':
			local.keys = mergeKeys(arguments.original, arguments.current);
			
			for(local.i = 1; local.i <= listLen(local.keys); local.i++) {
				local.key = listGetAt(local.keys, local.i);
				
				if(structKeyExists(arguments.original, local.key) && structKeyExists(arguments.current, local.key)) {
					local.subResult = diff(arguments.original[local.key], arguments.current[local.key]);
					
					// If the results are both blank structs we do not want them
					if(
						isStruct(local.subResult.old) && structIsEmpty(local.subResult.old)
						&& isStruct(local.subResult.new) && structIsEmpty(local.subResult.new)
					) {
						local.subResult.old = '';
						local.subResult.new = '';
					}
					
					// Only store the key if the values are not the same
					if(
						!(
							isSimpleValue(local.subResult.old) && !len(local.subResult.old)
							&& isSimpleValue(local.subResult.new) && !len(local.subResult.new)
						)
					) {
						local.result.old[local.key] = local.subResult.old;
						local.result.new[local.key] = local.subResult.new;
					}
				} else if(structKeyExists(arguments.original, local.key)) {
					local.result.old[local.key] = arguments.original[local.key];
				} else {
					local.result.new[local.key] = arguments.current[local.key];
				}
			}
			
			// If the results are both blank structs we do not want them
			if(
				isStruct(local.result.old) && structIsEmpty(local.result.old)
				&& isStruct(local.result.new) && structIsEmpty(local.result.new)
			) {
				local.result.old = '';
				local.result.new = '';
			}
			
			break;
		case 'array':
			local.lenOriginal = arrayLen(arguments.original);
			local.lenCurrent = arrayLen(arguments.current);
			
			for(local.i = 1; local.i <= max(local.lenOriginal, local.lenCurrent); local.i++) {
				if(i <= local.lenOriginal && local.i <= local.lenCurrent) {
					local.subResult = diff(arguments.original[i], arguments.current[i]);
					
					local.result.old[i] = local.subResult.old;
					local.result.new[i] = local.subResult.new;
				} else if(i <= local.lenOriginal) {
					local.result.old[i] = arguments.original[i];
				} else {
					local.result.new[i] = arguments.current[i];
				}
			}
			
			break;
		default:
			local.result.old = arguments.original;
			local.result.new = arguments.current;
			
			break;
		}
		
		return local.result;
	}
	
	private string function generateHtml(required any original, required any current, struct options = {}) {
		local.html = '';
		
		local.oldType = determineType(arguments.original);
		local.newType = determineType(arguments.current);
		
		// If they are not the same type then it has changed completely
		if(local.oldType == local.newType) {
			// Perform output based upon the variable type
			switch(local.newType) {
			case 'struct':
				local.html &= toHtml(diff(arguments.original, arguments.current), arguments.options);
				
				break;
			default:
				local.html &= '<dd class="original">' & generateHtmlItem(arguments.original) & '</dd>';
				local.html &= '<dd class="current">' & generateHtmlItem(arguments.current) & '</dd>';
			}
		} else {
			local.html &= '<dd class="original">' & generateHtmlItem(arguments.original) & '</dd>';
			local.html &= '<dd class="current">' & generateHtmlItem(arguments.current) & '</dd>';
		}
		
		return local.html;
	}
	
	private string function generateHtmlItem(required any value) {
		local.html = '';
		
		local.type = determineType(arguments.value);
		
		// Perform output based upon the variable type
		switch(local.type) {
		case 'struct':
			if(structKeyExists(arguments.value, '__filler')) {
				return '<em>None</em>';
			}
			
			local.html = 'struct...';
			
			break;
		default:
			local.text = arguments.value.toString()
			
			if(!len(local.text)) {
				return '<em>None</em>';
			}
			
			local.html = local.text;
		}
		
		return local.html;
	}
	
	/**
	 * Merges any struct keys from given structs into a single, unique list
	 **/
	private string function mergeKeys() {
		local.keys = '';
		
		for(local.i = 1; local.i <= arrayLen(arguments); local.i++) {
			local.keyKeys = structKeyList(arguments[local.i]);
			
			for(local.j = 1; local.j <= listLen(local.keyKeys); local.j++) {
				local.key = listGetAt(local.keyKeys, local.j);
				
				if(!listFindNoCase(local.keys, local.key)) {
					local.keys = listAppend(local.keys, local.key);
				}
			}
		}
		
		return local.keys;
	}
	
	public string function toHtml( required struct results, struct options = {} ) {
		local.oldType = determineType(arguments.results.old);
		local.newType = determineType(arguments.results.new);
		
		arguments.options.labelPrefix = structKeyExists(arguments.options, 'labelPrefix') ? arguments.options.labelPrefix : '';
		
		local.html = '<dl class="diff">';
		
		// If they are not the same type then it has changed completely
		if(local.oldType != local.newType) {
			// TODO determine what to do when the types are not the same
		} else {
			// Perform output based upon the variable type
			switch(local.newType) {
			case 'struct':
				local.keys = mergeKeys(arguments.results.old, arguments.results.new);
				
				local.keys = listSort(local.keys, 'text');
				
				local.labelPrefix = arguments.options.labelPrefix;
				
				for(local.i = 1; local.i <= listLen(local.keys); local.i++) {
					local.key = listGetAt(local.keys, local.i);
					local.subHtml = '';
					
					if(structKeyExists(arguments.options, 'label')) {
						local.html &= '<dt>' & arguments.options.label.get(arguments.options.labelPrefix & local.key, local.key) & '</dt>';
						
						// Add to the prefix for any sub diff output
						arguments.options.labelPrefix &= local.key & '.';
					} else {
						local.html &= '<dt>' & local.key & '</dt>';
					}
					
					if(structKeyExists(arguments.results.old, local.key) && structKeyExists(arguments.results.new, local.key)) {
						local.subHtml &= generateHtml(arguments.results.old[local.key], arguments.results.new[local.key], arguments.options);
					} else if(structKeyExists(arguments.results.old, local.key)) {
						local.subHtml &= generateHtml(arguments.results.old[local.key], { '__filler': true }, arguments.options);
					} else {
						local.subHtml &= generateHtml({ '__filler': true }, arguments.results.new[local.key], arguments.options);
					}
					
					if(len(local.subHtml)) {
						local.html &= local.subHtml;
						local.hasSub = true;
					} else {
						local.html &= '<dd class="noChange"><em>No Changes</em></dd>';
					}
					
					arguments.options.labelPrefix = local.labelPrefix;
				}
				
				break;
			default:
				local.html &= generateHtml(arguments.results.old, arguments.results.new);
				
				break;
			}
		}
		
		local.html &= '</dl>';
		
		return local.html;
	}
}
