component {
	public component function init(required component i18n, string locale = 'en_US') {
		variables.i18n = arguments.i18n;
		variables.locale = arguments.locale;
		
		variables.label = createObject('component', 'cf-compendium.inc.resource.i18n.label').init(variables.i18n, variables.locale);
		variables.format = variables.i18n.getMessageFormat(variables.locale);
		
		variables.validators = [];
		
		add__validator(createObject('component', 'cf-compendium.inc.resource.validation.common').init());
		add__bundle('/cf-compendium/i18n/inc/resource/validation', 'common');
		
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
	public void function add__validator(required component validator) {
		arguments.validator.set__label(variables.label);
		arguments.validator.set__format(variables.format);
		
		arrayAppend(variables.validators, arguments.validator);
	}
	
	/**
	 * LIFO priority for validators.
	 */
	public void function onMissingMethod(required string missingMethodName, required struct missingMethodArguments) {
		for(local.i = arrayLen(variables.validators); local.i > 0; local.i--) {
			if(structKeyExists(variables.validators[local.i], arguments.missingMethodName)) {
				variables.validators[local.i][arguments.missingMethodName](argumentCollection = arguments.missingMethodArguments);
				
				return;
			}
		}
		
		throw (message="Unable to validate object", detail="Unable to find the proper validator for validating '#arguments.missingMethodName#'");
	}
}
