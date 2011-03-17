component extends="cf-compendium.inc.resource.base.object" {
	public component function init(required component i18n, required struct source, string locale = 'en_US', struct options = {}) {
		super.init();
		
		variables.i18n = arguments.i18n;
		variables.locale = arguments.locale;
		variables.label = createObject('component', 'cf-compendium.inc.resource.i18n.label').init(arguments.i18n, arguments.locale);
		
		variables.source = arguments.source;
		variables.options = arguments.options;
		
		// Set base bundle for translation
		addBundle('/cf-compendium/i18n/inc/resource/structure', 'detail');
		
		return this;
	}
	
	public void function addBundle(required string path, required string name) {
		variables.label.addBundle(argumentCollection = arguments);
	}
	
	public string function display( required string key, struct options = {} ) {
		arguments.options = extend(variables.options, arguments.options);
		
		return getLabel(arguments.key) & get(arguments.key);
	}
	
	public string function get( required string key ) {
		return getValue(variables.source, arguments.key);
	}
	
	public string function getLabel( required string key ) {
		return variables.label.get(arguments.key);
	}
	
	private string function getValue( required struct data, required string key ) {
		if(structKeyExists(arguments.data, arguments.key)) {
			return arguments.data[arguments.key];
		}
		
		local.currentKey = listFirst(arguments.key, '.');
		local.nextKey = listRest(arguments.key, '.');
		
		if(structKeyExists(arguments.data, local.currentKey) && isStruct(arguments.data[local.currentKey])) {
			return getValue( arguments.data[local.currentKey], local.nextKey );
		}
		
		return '';
	}
}
