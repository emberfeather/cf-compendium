component {
	public component function init() {
		return this;
	}
	
	public void function set__label(required component label) {
		variables.label = arguments.label;
	}
	
	public void function set__format(required component format) {
		variables.format = arguments.format;
	}
	
	private void function __throwValidation(required string message) {
		arguments.message = variables.label.get(arguments.message);
		
		throw(
			type = "validation",
			message = "#variables.format.format( argumentCollection = arguments )#"
		);
	}
	
	private array function __uniqueArray(required array original) {
		local.unique = [];
		
		for(local.i = 1; local.i <= arrayLen(arguments.original); local.i++) {
			if(! arrayFindNoCase(local.unique, arguments.original[local.i])) {
				arrayAppend(local.unique, arguments.original[local.i]);
			}
		}
		
		arraySort(local.unique, 'text');
		
		return local.unique;
	}
}
