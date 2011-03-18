component extends="cf-compendium.inc.resource.base.object" {
	public component function init(required struct source, required component i18n, string locale = 'en_US', struct options = {}) {
		super.init();
		
		variables.i18n = arguments.i18n;
		variables.locale = arguments.locale;
		variables.label = createObject('component', 'cf-compendium.inc.resource.i18n.label').init(arguments.i18n, arguments.locale);
		
		variables.source = arguments.source;
		variables.options = extend({
			emptyDefault: '',
			wrap: {
				outerContainer: 'dl',
				innerContainer: 'dl',
				label: 'dt',
				value: 'dd'
			},
			value: {
				keys: [],
				labels: []
			}
		}, arguments.options, -1);
		
		// Set base bundle for translation
		addBundle('/cf-compendium/i18n/inc/resource/structure', 'detail');
		
		return this;
	}
	
	public void function addBundle(required string path, required string name) {
		variables.label.addBundle(argumentCollection = arguments);
	}
	
	public string function display( required any keys, struct options = {} ) {
		arguments.options = extend(variables.options, arguments.options, -1);
		
		if(!isArray(arguments.keys)) {
			arguments.keys = [ arguments.keys ];
		}
		
		local.result = '';
		
		for(local.i = 1; local.i <= arrayLen(arguments.keys); local.i++) {
			local.result &= wrapTag(getLabel(arguments.keys[local.i]), arguments.options.wrap.label);
			
			if(arrayLen(arguments.options.value.keys)) {
				local.sub = '';
				
				// Look for multiple pieces of information to show
				for(local.j = 1; local.j <= arrayLen(arguments.options.value.keys); local.j++) {
					if(arrayLen(arguments.options.value.labels) >= local.j) {
						if(variables.label.has(arguments.options.value.labels[local.j])) {
							local.label = getLabel(arguments.options.value.labels[local.j]);
						} else {
							local.label = getLabel(arguments.keys[local.i] & '.' & arguments.options.value.labels[local.j]);
						}
						
						local.sub &= wrapTag(local.label, arguments.options.wrap.label);
					}
					
					local.value = get(arguments.keys[local.i] & '.' & arguments.options.value.keys[local.j]);
					
					local.sub &= wrapTag(local.value, arguments.options.wrap.value);
				}
				
				local.result &= wrapTag(local.sub, arguments.options.wrap.innerContainer);
			} else {
				local.value = get(arguments.keys[local.i]);
				
				// Allow for having the value be a label key to show a message
				local.value = variables.label.get(arguments.keys[local.i] & '.' & local.value, local.value);
				
				// Allow for empty override
				if( local.value == '' && arguments.options.emptyDefault != '' ) {
					local.value = variables.label.get(arguments.keys[local.i] & '.' & local.value, arguments.options.emptyDefault);
				}
				
				local.result &= wrapTag(local.value, arguments.options.wrap.value);
			}
		}
		
		return wrapTag(local.result, arguments.options.wrap.outerContainer);
	}
	
	public string function get( required string key ) {
		return getValue(variables.source, arguments.key);
	}
	
	public string function getLabel( required string key ) {
		return variables.label.get(arguments.key);
	}
	
	private string function getValue( required struct data, required string key ) {
		if(structKeyExists(arguments.data, arguments.key) && isSimpleValue(arguments.data[arguments.key])) {
			return arguments.data[arguments.key];
		}
		
		if(isObject(arguments.data) && arguments.data['has' & arguments.key]() && isSimpleValue(arguments.data['get' & arguments.key]())) {
			return arguments.data['get' & arguments.key]();
		}
		
		local.currentKey = listFirst(arguments.key, '.');
		local.nextKey = listRest(arguments.key, '.');
		
		if(structKeyExists(arguments.data, local.currentKey)
			&& isStruct(arguments.data[local.currentKey])
			) {
			return getValue( arguments.data[local.currentKey], local.nextKey );
		} else if( isObject(arguments.data)
			&& arguments.data['has' & local.currentKey]()
			&& isStruct(arguments.data['get' & local.currentKey]())
			) {
			return getValue( arguments.data['get' & local.currentKey](), local.nextKey );
		}
		
		writeDump(arguments);
		abort;
		
		return '';
	}
	
	private string function wrapTag( required string value, string tag = '' ) {
		if (arguments.tag != '') {
			return '<' & arguments.tag & '>' & arguments.value & '</' & arguments.tag & '>';
		}
		
		return arguments.value;
	}
}
