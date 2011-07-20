component extends="cf-compendium.inc.resource.base.scrubber" {
	/**
	 * Clean phone numbers to just have the actual digits.
	 * 
	 * Allowing alpha characters for phone numbers with characters.
	 **/
	public string function phone(required string value, any extra) {
		return reReplace(arguments.value, '[^a-zA-Z0-9]*', '', 'all');
	}
}
