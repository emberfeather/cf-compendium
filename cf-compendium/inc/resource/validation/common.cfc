component extends="cf-compendium.inc.resource.base.validator" {
	/**
	 * Tests if the value given is a valid ID
	 */
	public void function ID(required string label, required any value, any extra) {
		if(!len(arguments.value)) {
			return;
		}
		
		if (not isNumeric(arguments.value) or arguments.value lt 0) {
			__throwValidation('id', arguments.label);
		}
	}
	
	/**
	 * Tests if the value given is in the given list
	 */
	public void function in(required string label, required any value, any extra) {
		if(!len(arguments.value)) {
			return;
		}
		
		if (not listFind(arguments.extra, arguments.value)) {
			__throwValidation('in', arguments.label, arguments.extra);
		}
	}
	
	/**
	 * Tests if the value given is alpha characters
	 */
	public void function isAlpha(required string label, required any value, any extra) {
		if(!len(arguments.value)) {
			return;
		}
		
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
		if(!len(arguments.value)) {
			return;
		}
		
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
		if(!len(arguments.value)) {
			return;
		}
		
		if (not isBoolean(arguments.value)) {
			__throwValidation('isBoolean', arguments.label);
		}
	}
	
	/**
	 * Tests if the value given is a valid number
	 */
	public void function isNumber(required string label, required any value, any extra) {
		if(!len(arguments.value)) {
			return;
		}
		
		if (not isNumeric(arguments.value)) {
			__throwValidation('isNumber', arguments.label);
		}
	}
	
	/**
	 * Tests if the value given is not over the max length
	 */
	public void function maxLength(required string label, required any value, any extra) {
		if(!len(arguments.value)) {
			return;
		}
		
		if (len(arguments.value) gt arguments.extra) {
			__throwValidation('maxLength', arguments.label, arguments.extra);
		}
	}
	
	/**
	 * Tests if the value given is not under the min length
	 */
	public void function minLength(required string label, required any value, any extra) {
		if(!len(arguments.value)) {
			return;
		}
		
		if (len(arguments.value) lt arguments.extra) {
			__throwValidation('minLength', arguments.label, arguments.extra);
		}
	}
	
	/**
	 * Tests if the value given does not contain whitespace
	 */
	public void function noWhitespace(required string label, required any value) {
		if(!len(arguments.value)) {
			return;
		}
		
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
		if(!len(arguments.value)) {
			return;
		}
		
		if (arguments.value gt now()) {
			__throwValidation('notFuture', arguments.label);
		}
	}
	
	/**
	 * Tests if the value given is not greater than a given amount
	 */
	public void function notGreaterThan(required string label, required any value, any extra) {
		if(!len(arguments.value)) {
			return;
		}
		
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
		if(!len(arguments.value)) {
			return;
		}
		
		local.position = listFindNoCase(arguments.extra, arguments.value);
		
		if (local.position) {
			__throwValidation('notIn', arguments.label, arguments.value);
		}
	}
	
	/**
	 * Tests if the value given is not less than a given amount
	 */
	public void function notLessThan(required string label, required any value, any extra) {
		if(!len(arguments.value)) {
			return;
		}
		
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
		if(!len(arguments.value)) {
			return;
		}
		
		if (arguments.value lt now()) {
			__throwValidation('notPast', arguments.label);
		}
	}
	
	/**
	 * Tests if the value given is a valid email address
	 * 
	 * See http://code.google.com/p/php-email-address-validation
	 */
	public void function validEmail(required string label, required any value, any extra) {
		local.validChars = '';
		
		if(!len(arguments.value)) {
			return;
		}
		// Check for control characters
		if (reFind("[\x00-\x1F\x7F-\xFF]", arguments.value)) {
			__throwValidation('validEmail_controlCharacter', arguments.label);
		}
		
		// Verify there is an @ sign
		if(not find('@', arguments.value)) {
			__throwValidation('validEmail_at', arguments.label);
		}
		
		local.domain = listLast(arguments.value, '@');
		local.localPart = len(arguments.value) > len(local.domain) + 1 ? left(arguments.value, len(arguments.value) - len(local.domain) - 1) : '';
		
		if(!len(local.localPart)) {
			__throwValidation('validEmail_localPart', arguments.label);
		}
		
		if(!len(local.domain)) {
			__throwValidation('validEmail_domain', arguments.label);
		}
		
		/**
		 * Count the "@" symbols. Only one is allowed, except where
		 * contained in quote marks in the local part. Quickest way to
		 * check this is to remove anything in quotes. We also remove
		 * characters escaped with backslash, and the backslash
		 * character.
		 */
		local.tempLocalPart = reReplace(local.localPart, '\\.', '', 'all');
		local.tempLocalPart = reReplace(local.tempLocalPart, '"[^"]+"', '', 'all');
		
		local.tempEmail = local.tempLocalPart & local.domain;
		
		if(find('@', local.tempEmail)) {
			__throwValidation('validEmail_multipleAt', arguments.label);
		}
		
		/**
		 * Local portion can only be from 1 to 64 characters, inclusive.
		 * Please note that servers are encouraged to accept longer local
		 * parts than 64 characters.
		 */
		if(len(local.localPart) > 64) {
			__throwValidation('validEmail_localPart_length', arguments.label);
		}
		
		/**
		 * Local portion must be:
		 * 1) a dot-atom (strings separated by periods)
		 * 2) a quoted string
		 * 3) an obsolete format string (combination of the above)
		 **/
		local.parts = listToArray(local.localPart, '.', true);
		
		for(local.i = 1; local.i <= arrayLen(local.parts); local.i++) {
			// Check for a length
			if(!len(local.parts[local.i])) {
				__throwValidation('validEmail_localPart_part_length', arguments.label);
			}
			
			// Check for valid characters
			if (not reFind('^(([A-Za-z0-9!##$%&\''*+/=?^_`{|}~-][A-Za-z0-9!##$%&\''*+/=?^_`{|}~-]{0,63})|("[^\\\"]{0,62}"))$', local.parts[local.i])) {
				__throwValidation('validEmail_localPart', arguments.label);
			}
		}
		
		// Total domain can only be from 1 to 255 characters, inclusive
		if(len(local.domain) > 255) {
			__throwValidation('validEmail_domain_length', arguments.label);
		}
		
		// Check if domain is IP, possibly enclosed in square brackets.
		if (reFind('^(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9]?[0-9])(\.(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9]?[0-9])){3}$', local.domain)
				or reFind('^\[(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9]?[0-9])(\.(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9]?[0-9])){3}\]$', local.domain)) {
			return;
		}
		
		local.parts = listToArray(local.domain, '.', true);
		
		if(arrayLen(local.parts) < 2) {
			__throwValidation('validEmail_domain_parts', arguments.label);
		}
		
		for(local.i = 1; local.i <= arrayLen(local.parts); local.i++) {
			// Each portion must be between 1 and 63 characters, inclusive
			if(len(local.parts[local.i]) > 63 || !len(local.parts[local.i])) {
				__throwValidation('validEmail_domain_part_length', arguments.label);
			}
			
			if (not reFind('^(([A-Za-z0-9][A-Za-z0-9-]{0,61}[A-Za-z0-9])|([A-Za-z0-9]+))$', local.parts[local.i])) {
				__throwValidation('validEmail_domain', arguments.label);
			}
			
			if(local.i == arrayLen(local.parts) - 1) {
				if(!len(reReplace(local.parts[local.i], '[0-9]', '', 'all'))) {
					__throwValidation('validEmail_domain_tld', arguments.label);
				}
			}
		}
	}
	
	/**
	 * Tests if the value given is a valid email address
	 */
	public void function validURL(required string label, required any value, any extra) {
		if(!len(arguments.value)) {
			return;
		}
		
		if (not REFind("^http[s]?://", arguments.value)) {
			__throwValidation('validURL', arguments.label);
		}
	}
}
