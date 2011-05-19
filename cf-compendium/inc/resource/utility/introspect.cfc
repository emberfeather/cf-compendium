component extends="cf-compendium.inc.resource.base.object" {
	public component function init(required struct source, struct options = {}) {
		super.init();
		
		variables.source = arguments.source;
		variables.mappings = {};
		
		variables.options = extend({
			autoMap: true
		}, arguments.options, -1);
		
		return this;
	}
	
	public any function get( required string key ) {
		local.source = variables.source;
		local.keys = listToArray(structKeyList(variables.mappings));
		local.keyLength = len(arguments.key);
		
		// Check the mappings before doing the full introspection
		for(local.i = 1; local.i <= arrayLen(local.keys); local.i++) {
			local.mappingLength = len(local.keys[local.i]);
			
			// If we found a mapping than use it at the base to get the value from
			if(local.keyLength > local.mappingLength + 1 && left(arguments.key, local.mappingLength) == local.keys[i]) {
				local.source = variables.mappings[local.keys[local.i]];
				
				// Also remove the period separator
				arguments.key = right(arguments.key, local.keyLength - local.mappingLength - 1);
				
				break;
			}
		}
		
		return getValue(local.source, arguments.key);
	}
	
	private any function getValue( required struct data, required string key ) {
		if(arguments.key == '') {
			return arguments.data;
		}
		
		if( structKeyExists(arguments.data, arguments.key) 
			&& (
				isSimpleValue(arguments.data[arguments.key])
				|| isArray(arguments.data[arguments.key])
			) ) {
			return arguments.data[arguments.key];
		}
		
		if( isObject(arguments.data)
			&& arguments.data['has' & arguments.key]()
			&& (
				isSimpleValue(arguments.data['get' & arguments.key]())
				|| isArray(arguments.data['get' & arguments.key]())
			) ) {
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
		
		return '';
	}
	
	public void function map(required string path, required struct value) {
		variables.mappings[arguments.path] = arguments.value;
	}
}
