component extends="cf-compendium.inc.resource.base.validator" {
	/**
	 * Tests if the value given is a valid ID
	 */
	public void function ID(required string label, required any value, any extra) {
		if (not isNumeric(arguments.value) or arguments.value lt 0) {
			__throwValidation('id', arguments.label);
		}
	}
	
	/**
	 * Tests if the value given is in the given list
	 */
	public void function in(required string label, required any value, any extra) {
		if (not listFind(arguments.extra, arguments.value)) {
			__throwValidation('in', arguments.label, arguments.extra);
		}
	}
	
	/**
	 * Tests if the value given is alpha characters
	 */
	public void function isAlpha(required string label, required any value, any extra) {
		local.expr = '([^a-zA-Z';
		
		if(isStruct(arguments.extra)) {
			// Allow for spaces to count
			if(structKeyExists(arguments.extra, 'allowSpaces') && arguments.extra.allowSpaces == true) {
				local.expr &= ' ';
			}
			
			// Allow for specific special characters
			if(structKeyExists(arguments.extra, 'specialChars')) {
				local.expr &= arguments.extra.specialChars;
			}
		}
		
		local.expr &= '])';
		
		local.match = reMatch(local.expr, arguments.value);
		
		if (arrayLen(local.match)) {
			__throwValidation('isAlpha', arguments.label, arrayToList(__uniqueArray(local.match), ' '));
		}
	}
	
	/**
	 * Tests if the value given is alpha characters
	 */
	public void function isAlphanumeric(required string label, required any value, any extra) {
		local.expr = '([^a-zA-Z0-9';
		
		if(isStruct(arguments.extra)) {
			// Allow for spaces to count
			if(structKeyExists(arguments.extra, 'allowSpaces') && arguments.extra.allowSpaces == true) {
				local.expr &= ' ';
			}
			
			// Allow for specific special characters
			if(structKeyExists(arguments.extra, 'specialChars')) {
				local.expr &= arguments.extra.specialChars;
			}
		}
		
		local.expr &= '])';
		
		local.match = reMatch(local.expr, arguments.value);
		
		if (arrayLen(local.match)) {
			__throwValidation('isAlphanumeric', arguments.label, arrayToList(__uniqueArray(local.match), ' '));
		}
	}
	
	/**
	 * Tests if the value given is a valid boolean
	 */
	public void function isBoolean(required string label, required any value, any extra) {
		if (not isBoolean(arguments.value)) {
			__throwValidation('isBoolean', arguments.label);
		}
	}
	
	/**
	 * Tests if the value given is a valid number
	 */
	public void function isNumber(required string label, required any value, any extra) {
		if (not isNumeric(arguments.value)) {
			__throwValidation('isNumber', arguments.label);
		}
	}
	
	/**
	 * Tests if the value given is not over the max length
	 */
	public void function maxLength(required string label, required any value, any extra) {
		if (len(arguments.value) gt arguments.extra) {
			__throwValidation('maxLength', arguments.label, arguments.extra);
		}
	}
	
	/**
	 * Tests if the value given is not under the min length
	 */
	public void function minLength(required string label, required any value, any extra) {
		if (len(arguments.value) lt arguments.extra) {
			__throwValidation('minLength', arguments.label, arguments.extra);
		}
	}
	
	/**
	 * Tests if the value given does not contain whitespace
	 */
	public void function noWhitespace(required string label, required any value) {
		if (reFind('\s', arguments.value)) {
			__throwValidation('noWhitespace', arguments.label);
		}
	}
	
	/**
	 * Tests if the value given is not empty
	 */
	public void function notEmpty(required string label, required any value, any extra) {
		if (trim(arguments.value) eq '') {
			__throwValidation('notEmpty', arguments.label);
		}
	}
	
	/**
	 * Tests if the value given is not in the future
	 */
	public void function notFuture(required string label, required any value, any extra) {
		if (arguments.value gt now()) {
			__throwValidation('notFuture', arguments.label);
		}
	}
	
	/**
	 * Tests if the value given is not greater than a given amount
	 */
	public void function notGreaterThan(required string label, required any value, any extra) {
		// Replace all non-numeric characters in case it is money
		arguments.value = reReplace(arguments.value, '[^0-9.]', '', 'all');
		
		if (arguments.value gt arguments.extra) {
			__throwValidation('notGreaterThan', arguments.label, arguments.extra);
		}
	}
	
	/**
	 * Tests if the value given is not in a given list
	 */
	public void function notIn(required string label, required any value, any extra) {
		local.position = listFindNoCase(arguments.extra, arguments.value);
		
		if (local.position) {
			__throwValidation('notIn', arguments.label, arguments.value);
		}
	}
	
	/**
	 * Tests if the value given is not less than a given amount
	 */
	public void function notLessThan(required string label, required any value, any extra) {
		// Replace all non-numeric characters in case it is money
		arguments.value = reReplace(arguments.value, '[^0-9.]', '', 'all');
		
		if (arguments.value lt arguments.extra) {
			__throwValidation('notLessThan', arguments.label, arguments.extra);
		}
	}
	
	/**
	 * Tests if the value given is not in the past
	 */
	public void function notPast(required string label, required any value, any extra) {
		if (arguments.value lt now()) {
			__throwValidation('notPast', arguments.label);
		}
	}
	
	/**
	 * Tests if the value given is a valid email address
	 */
	public void function validEmail(required string label, required any value, any extra) {
		// Check the local part first character
		if (not reFind("^[a-zA-Z]", arguments.value)) {
			__throwValidation('validEmail_localPart_firstCharacter', arguments.label);
		}
		
		// Check the at sign
		if (not find("@", arguments.value)) {
			__throwValidation('validEmail_at', arguments.label);
		}
		
		// Check the entire local part
		if (not reFind("^[a-zA-Z][\.a-zA-Z0-9_!##\$%&'\*+/=?\^`\{|\}~-]*[a-zA-Z0-9]@", arguments.value)) {
			__throwValidation('validEmail_localPart', arguments.label);
		}
		
		// Check the local part last character
		if (not reFind("[a-zA-Z0-9]@", arguments.value)) {
			__throwValidation('validEmail_localPart_lastCharacter', arguments.label);
		}
		
		// Check the domain
		if (not reFind("@[a-zA-Z0-9]+([a-zA-Z0-9-][a-zA-Z0-9]+)?\.([a-z]+(\.[a-z]+)?){2,5}$", arguments.value)) {
			__throwValidation('validEmail_domain', arguments.label);
		}
		
		// Final Test
		if (not reFind("^[a-zA-Z][\.a-zA-Z0-9_!##\$%&'\*+/=?\^`\{|\}~-]*[a-zA-Z0-9]@[a-zA-Z0-9]+([a-zA-Z0-9-][a-zA-Z0-9]+)?\.([a-z]+(\.[a-z]+)?){2,5}$", arguments.value)) {
			__throwValidation('validEmail', arguments.label);
		}
	}
	
	/**
	 * Tests if the value given is a valid email address
	 */
	public void function validURL(required string label, required any value, any extra) {
		if (not REFind("^http[s]?://", arguments.value)) {
			__throwValidation('validURL', arguments.label);
		}
	}
}
