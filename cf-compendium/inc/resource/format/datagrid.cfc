component extends="cf-compendium.inc.resource.base.formatter" {
	public string function checkbox(required any value, any options) {
		if(!structKeyExists(arguments.options, 'name')) {
			arguments.options.name = 'checkboxSelect';
		}
		
		return '<input type="checkbox" name="#arguments.options.name#[]" value="' & arguments.value & '" />';
	}
	
	public string function radio(required any value, any options) {
		if(!structKeyExists(arguments.options, 'name')) {
			arguments.options.name = 'radioSelect';
		}
		
		return '<input type="radio" name="#arguments.options.name#[]" value="' & arguments.value & '" />';
	}
}
