component {
	public component function init(struct options = {}) {
		variables.options = arguments.options;
		
		return this;
	}
	
	public string function phone( required string value ) {
		return reReplace(arguments.value, '[^0-9a-zA-Z]', '', 'all');
	}
}
