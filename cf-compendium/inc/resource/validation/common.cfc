component extends="cf-compendium.inc.resource.base.validator" {
	/**
	 * Tests if the value given is a valid ID
	 */
	public void function ID(required string label, required any value, any extra) {
		if (not isNumeric(arguments.value) or arguments.value lt 0) {
			// Get the message from the bundle
			local.message = variables.label.get('id');
			
			throw(type="validation", message="#variables.format.format( local.message, arguments.label )#");
		}
	}
	
	/**
	 * Tests if the value given is in the given list
	 */
	public void function in(required string label, required any value, any extra) {
		if (not listFind(arguments.extra, arguments.value)) {
			// Get the message from the bundle
			local.message = variables.label.get('in');
			
			throw(type="validation", message="#variables.format.format( local.message, arguments.label, arguments.extra )#");
		}
	}
	
	/**
	 * Tests if the value given is a valid boolean
	 */
	public void function isBoolean(required string label, required any value, any extra) {
		if (not isBoolean(arguments.value)) {
			// Get the message from the bundle
			local.message = variables.label.get('isBoolean');
			
			throw(type="validation", message="#variables.format.format( local.message, arguments.label )#");
		}
	}
	
	/**
	 * Tests if the value given is a valid number
	 */
	public void function isNumber(required string label, required any value, any extra) {
		if (not isNumeric(arguments.value)) {
			// Get the message from the bundle
			local.message = variables.label.get('isNumber');
			
			throw(type="validation", message="#variables.format.format( local.message, arguments.label )#");
		}
	}
	
	/**
	 * Tests if the value given is not over the max length
	 */
	public void function maxLength(required string label, required any value, any extra) {
		if (len(arguments.value) gt arguments.extra) {
			// Get the message from the bundle
			local.message = variables.label.get('maxLength');
			
			throw(type="validation", message="#variables.format.format( local.message, arguments.label, arguments.extra )#");
		}
	}
	
	/**
	 * Tests if the value given is not under the min length
	 */
	public void function minLength(required string label, required any value, any extra) {
		if (len(arguments.value) lt arguments.extra) {
			// Get the message from the bundle
			local.message = variables.label.get('minLength');
			
			throw(type="validation", message="#variables.format.format( local.message, arguments.label, arguments.extra )#");
		}
	}
	
	/**
	 * Tests if the value given is not empty
	 */
	public void function notEmpty(required string label, required any value, any extra) {
		if (trim(arguments.value) eq '') {
			// Get the message from the bundle
			local.message = variables.label.get('notEmpty');
			
			throw(type="validation", message="#variables.format.format( local.message, arguments.label )#");
		}
	}
	
	/**
	 * Tests if the value given is not in the future
	 */
	public void function notFuture(required string label, required any value, any extra) {
		if (arguments.value gt now()) {
			// Get the message from the bundle
			local.message = variables.label.get('notFuture');
			
			throw(type="validation", message="#variables.format.format( local.message, arguments.label )#");
		}
	}
	
	/**
	 * Tests if the value given is not greater than a given amount
	 */
	public void function notGreaterThan(required string label, required any value, any extra) {
		// Replace all non-numeric characters in case it is money
		arguments.value = reReplace(arguments.value, '[^0-9.]', '', 'all');
		
		if (arguments.value gt arguments.extra) {
			// Get the message from the bundle
			local.message = variables.label.get('notGreaterThan');
			
			throw(type="validation", message="#variables.format.format( local.message, arguments.label, arguments.extra )#");
		}
	}
	
	/**
	 * Tests if the value given is not in a given list
	 */
	public void function notIn(required string label, required any value, any extra) {
		if (listFind(arguments.extra, arguments.value)) {
			// Get the message from the bundle
			local.message = variables.label.get('notIn');
			
			throw(type="validation", message="#variables.format.format( local.message, arguments.label, arguments.extra )#");
		}
	}
	
	/**
	 * Tests if the value given is not less than a given amount
	 */
	public void function notLessThan(required string label, required any value, any extra) {
		// Replace all non-numeric characters in case it is money
		arguments.value = reReplace(arguments.value, '[^0-9.]', '', 'all');
		
		if (arguments.value lt arguments.extra) {
			// Get the message from the bundle
			local.message = variables.label.get('notLessThan');
			
			throw(type="validation", message="#variables.format.format( local.message, arguments.label, arguments.extra )#");
		}
	}
	
	/**
	 * Tests if the value given is not in the past
	 */
	public void function notPast(required string label, required any value, any extra) {
		if (arguments.value lt now()) {
			// Get the message from the bundle
			local.message = variables.label.get('notPast');
			
			throw(type="validation", message="#variables.format.format( local.message, arguments.label )#");
		}
	}
	
	/**
	 * Tests if the value given is a valid email address
	 */
	public void function validEmail(required string label, required any value, any extra) {
		// Check the local part first character
		if (not reFind("^[a-zA-Z]", arguments.value)) {
			// Get the message from the bundle
			local.message = variables.label.get('validEmail_localPart_firstCharacter');
			
			throw(type="validation", message="#variables.format.format( local.message, arguments.label )#");
		}
		
		// Check the local part last character
		if (not reFind("[a-zA-Z0-9]@", arguments.value)) {
			// Get the message from the bundle
			local.message = variables.label.get('validEmail_localPart_lastCharacter');
			
			throw(type="validation", message="#variables.format.format( local.message, arguments.label )#");
		}
		
		// Check the entire local part
		if (not reFind("^[a-zA-Z][\.a-zA-Z0-9_!##\$%&'\*+/=?\^`\{|\}~-]*[a-zA-Z0-9]@", arguments.value)) {
			// Get the message from the bundle
			local.message = variables.label.get('validEmail_localPart');
			
			throw(type="validation", message="#variables.format.format( local.message, arguments.label )#");
		}
		
		// Check the domain
		if (not reFind("@[a-zA-Z0-9]+([a-zA-Z0-9-][a-zA-Z0-9]+)?\.([a-z]+(\.[a-z]+)?){2,5}$", arguments.value)) {
			// Get the message from the bundle
			local.message = variables.label.get('validEmail_domain');
			
			throw(type="validation", message="#variables.format.format( local.message, arguments.label )#");
		}
		
		// Final Test
		if (not reFind("^[a-zA-Z][\.a-zA-Z0-9_!##\$%&'\*+/=?\^`\{|\}~-]*[a-zA-Z0-9]@[a-zA-Z0-9]+([a-zA-Z0-9-][a-zA-Z0-9]+)?\.([a-z]+(\.[a-z]+)?){2,5}$", arguments.value)) {
			// Get the message from the bundle
			local.message = variables.label.get('validEmail');
			
			throw(type="validation", message="#variables.format.format( local.message, arguments.label )#");
		}
	}
	
	/**
	 * Tests if the value given is a valid email address
	 */
	public void function validURL(required string label, required any value, any extra) {
		if (not REFind("^http[s]?://", arguments.value)) {
			// Get the message from the bundle
			local.message = variables.label.get('validURL');
			
			throw(type="validation", message="#variables.format.format( local.message, arguments.label )#");
		}
	}
}
