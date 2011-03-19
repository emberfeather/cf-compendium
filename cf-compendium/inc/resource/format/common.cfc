component extends="cf-compendium.inc.resource.base.formatter" {
	public string function date(required date value, any options) {
		if(!len(arguments.value)) {
			return '';
		}
		
		return dateFormat(arguments.value, arguments.options.mask);
	}
	
	public string function datetime(required date value, any options) {
		if(!len(arguments.value)) {
			return '';
		}
		
		return dateFormat(arguments.value, arguments.options.mask.date) & ' ' & timeFormat(arguments.value, arguments.options.mask.time);
	}
	
	public string function htmlEdit(required string value, any options) {
		return htmlEditFormat(arguments.value);
	}
	
	public string function time(required date value, any options) {
		if(!len(arguments.value)) {
			return '';
		}
		
		return timeFormat(arguments.value, arguments.options.mask);
	}
	
	public string function uuid(required string value, any options) {
		if(!len(arguments.value)) {
			return '';
		}
		
		return left(arguments.value, 8);
	}
}
