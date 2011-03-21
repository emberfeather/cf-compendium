component {
	public component function init(required component i18n, string locale = 'en_US') {
		variables.i18n = arguments.i18n;
		variables.locale = arguments.locale;
		
		variables.label = createObject('component', 'cf-compendium.inc.resource.i18n.label').init(variables.i18n, variables.locale);
		variables.format = variables.i18n.getMessageFormat(variables.locale);
		
		variables.formatters = [];
		
		add__formatter(createObject('component', 'cf-compendium.inc.resource.format.common').init());
		add__bundle('/cf-compendium/i18n/inc/resource/format', 'common');
		
		return this;
	}
	
	/**
	 * Used to set the bundle information for the object
	 */
	public void function add__bundle(required string path, required string name) {
		variables.label.addBundle(argumentCollection = arguments);
	}
	
	/**
	 * Used to set the bundle information for the object
	 */
	public void function add__formatter(required component formatter) {
		arguments.formatter.set__label(variables.label);
		arguments.formatter.set__format(variables.format);
		
		arrayAppend(variables.formatters, arguments.formatter);
	}
	
	/**
	 * LIFO priority for formatters.
	 */
	public string function onMissingMethod(required string missingMethodName, required struct missingMethodArguments) {
		for(local.i = arrayLen(variables.formatters); local.i > 0; local.i--) {
			if(structKeyExists(variables.formatters[local.i], arguments.missingMethodName)) {
				return variables.formatters[local.i][arguments.missingMethodName](argumentCollection = arguments.missingMethodArguments);
			}
		}
		
		return arguments.missingMethodArguments[1];
	}
}
