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
}
