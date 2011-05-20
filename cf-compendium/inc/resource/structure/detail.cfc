component extends="cf-compendium.inc.resource.base.object" {
	public component function init(required struct source, required component i18n, string locale = 'en_US', struct options = {}) {
		super.init();
		
		variables.i18n = arguments.i18n;
		variables.locale = arguments.locale;
		variables.label = createObject('component', 'cf-compendium.inc.resource.i18n.label').init(arguments.i18n, arguments.locale);
		variables.format = createObject('component', 'cf-compendium.inc.resource.format.format').init(arguments.i18n, arguments.locale);
		variables.introspect = createObject('component', 'cf-compendium.inc.resource.utility.introspect').init(arguments.source);
		
		variables.options = extend({
			empty: {
				defaultValue: ''
			},
			wrap: {
				outerContainer: 'dl',
				innerContainer: 'dl',
				label: 'dt',
				value: 'dd'
			},
			value: {
				keys: [],
				labels: [],
				isConditional: false
			}
		}, arguments.options, -1);
		
		// Set base bundle for translation
		addBundle('/cf-compendium/i18n/inc/resource/structure', 'detail');
		
		return this;
	}
	
	public void function addBundle(required string path, required string name) {
		variables.label.addBundle(argumentCollection = arguments);
		variables.format.add__bundle(argumentCollection = arguments);
	}
	
	public void function addFormatter(required component formatter) {
		variables.format.add__formatter(arguments.formatter);
	}
	
	public string function display( required any keys, struct options = {} ) {
		arguments.options = extend(variables.options, arguments.options, -1);
		
		if(!isArray(arguments.keys)) {
			arguments.keys = [ arguments.keys ];
		}
		
		local.result = '';
		
		for(local.i = 1; local.i <= arrayLen(arguments.keys); local.i++) {
			local.label = wrapTag(variables.label.get(arguments.keys[local.i]), arguments.options.wrap.label);
			
			local.areSubValues = arrayLen(arguments.options.value.keys);
			
			local.value = variables.introspect.get(arguments.keys[local.i]);
			
			// Determine if we are showing sub values
			local.areSubValues = local.areSubValues
				&& (
					!arguments.options.value.isConditional
					|| (isBoolean(local.value) && local.value == true)
				);
			
			if(isArray(local.value) && !local.areSubValues) {
				local.result &= local.label & displayArray(arguments.keys[local.i], local.value, arguments.options);
			} else if(isStruct(local.value) && !local.areSubValues) {
				local.result &= local.label & displayStruct(arguments.keys[local.i], local.value, arguments.options);
			} else if(isSimpleValue(local.value)) {
				// Allow for having the value be a label key to show a message
				local.value = variables.label.get(arguments.keys[local.i] & '.' & local.value, local.value);
			}
			
			if(!isArray(local.value) && !isStruct(local.value) && (!local.areSubValues || local.value != '')) {
				if( local.value == '' && arguments.options.empty.defaultValue != '' ) {
					// Allow for empty override
					local.value = variables.label.get(arguments.options.empty.defaultValue, arguments.options.empty.defaultValue);
				}
				
				if(local.value != '') {
					if(structKeyExists(arguments.options, 'format')) {
						local.value = this.format(local.value, arguments.options.format);
					}
					
					local.result &= local.label & wrapTag(local.value, arguments.options.wrap.value);
				}
			}
			
			if(local.areSubValues) {
				local.sub = '';
				
				// Look for multiple pieces of information to show
				for(local.j = 1; local.j <= arrayLen(arguments.options.value.keys); local.j++) {
					if(arrayLen(arguments.options.value.labels) >= local.j) {
						if(variables.label.has(arguments.options.value.labels[local.j])) {
							local.label = variables.label.get(arguments.options.value.labels[local.j]);
						} else {
							local.label = variables.label.get(arguments.keys[local.i] & '.' & arguments.options.value.labels[local.j]);
						}
						
						local.sub &= wrapTag(local.label, arguments.options.wrap.label);
					}
					
					local.value = variables.introspect.get(arguments.keys[local.i] & '.' & arguments.options.value.keys[local.j]);
					
					// Get a fully qualified value without appending
					if(isSimpleValue(local.value) && local.value == '') {
						local.value = variables.introspect.get(arguments.options.value.keys[local.j]);
					}
					
					if(isSimpleValue(local.value)) {
						if( local.value != '') {
							// Allow for having the value be a label key to show a message
							local.value = variables.label.get(arguments.keys[local.i] & '.' & local.value, local.value);
						} else if( local.value == '' && arguments.options.empty.defaultValue != '' ) {
							// Allow for empty override
							local.value = variables.label.get(arguments.options.empty.defaultValue, arguments.options.empty.defaultValue);
						}
						
						if(structKeyExists(arguments.options, 'format')) {
							local.value = this.format(local.value, arguments.options.format);
						}
						
						local.sub &= wrapTag(local.value, arguments.options.wrap.value);
					} else if(isArray(local.value)) {
						local.sub &= displayArray(arguments.keys[local.i], local.value, arguments.options);
					} else if(isStruct(local.value)) {
						local.sub &= displayStruct(arguments.keys[local.i], local.value, arguments.options);
					}
				}
				
				if(len(trim(local.sub))) {
					local.result &= wrapTag(local.sub, arguments.options.wrap.innerContainer);
				}
			}
		}
		
		return wrapTag(local.result, arguments.options.wrap.outerContainer, 'detail');
	}
	
	public string function displayArray( required string key, required array value, struct options = {} ) {
		local.result = '';
		
		for(local.j = 1; local.j <= arrayLen(arguments.value); local.j++) {
			// Allow for having the value be a label key to show a message
			if(variables.label.has(arguments.value[local.j])) {
				arguments.value[local.j] = variables.label.get(arguments.value[local.j]);
			} else if(variables.label.has(arguments.key & '.' & arguments.value[local.j])) {
				arguments.value[local.j] = variables.label.get(arguments.key & '.' & arguments.value[local.j]);
			}
			
			// Allow for having the value be a label key to show a message
			if( arguments.value[local.j] != '') {
				arguments.value[local.j] = variables.label.get(arguments.key & '.' & arguments.value[local.j], arguments.value[local.j]);
			}
			
			if(structKeyExists(arguments.options, 'format')) {
				local.value[local.j] = this.format(arguments.value[local.j], arguments.options.format);
			}
			
			local.result &= wrapTag(arguments.value[local.j], arguments.options.wrap.value);
		}
		
		local.result = wrapTag(local.result, arguments.options.wrap.innerContainer);
		
		return local.result;
	}
	
	public string function displayStruct( required string key, required struct value, struct options = {} ) {
		local.result = '';
		local.keys = listToArray(listSort(structKeyList(arguments.value), 'text'));
		
		for(local.i = 1; local.i <= arrayLen(local.keys); local.i++) {
			if(variables.label.has(local.keys[local.i])) {
				local.label = variables.label.get(local.keys[local.i]);
			} else {
				local.label = variables.label.get(arguments.key & '.' & local.keys[local.i], local.keys[local.i]);
			}
			
			local.result &= wrapTag(local.label, arguments.options.wrap.label);
			
			// Allow for having the value be a label key to show a message
			if( arguments.value[local.keys[local.i]] != '') {
				arguments.value[local.keys[local.i]] = variables.label.get(arguments.key & '.' & local.keys[local.i] & '.' & arguments.value[local.keys[local.i]], arguments.value[local.keys[local.i]]);
			}
			
			if(structKeyExists(arguments.options, 'format')) {
				arguments.value[local.keys[local.i]] = this.format(local.value[local.keys[local.i]], arguments.options.format);
			}
			
			local.result &= wrapTag(arguments.value[local.keys[local.i]], arguments.options.wrap.value);
		}
		
		local.result = wrapTag(local.result, arguments.options.wrap.innerContainer);
		
		return local.result;
	}
	
	private string function format( required string value, struct format = {} ) {
		local.result = '';
		local.keys = listToArray(structKeyList(arguments.format));
		
		for(local.i = 1; local.i <= arrayLen(local.keys); local.i++) {
			arguments.value = variables.format[local.keys[local.i]](arguments.value, arguments.format[local.keys[local.i]]);
		}
		
		return arguments.value;
	}
	
	public string function getLabel( required string key ) {
		return variables.label.get(arguments.key);
	}
	
	public void function map(required string path, required struct value) {
		variables.introspect.map(arguments.path, arguments.value);
	}
	
	private string function wrapTag( required string value, string tag = 'div', string class = '' ) {
		if (arguments.tag != '') {
			return chr(10) & '<' & arguments.tag & ' class="' & arguments.class & '">' & chr(10) & arguments.value & chr(10) & '</' & arguments.tag & '>';
		}
		
		return arguments.value;
	}
}
