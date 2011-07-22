component {
	public component function init() {
		variables.scrubbers = [];
		
		add__scrubber(createObject('component', 'cf-compendium.inc.resource.scrubber.common').init());
		
		return this;
	}
	
	public void function add__scrubber(required component scrubber) {
		arrayAppend(variables.scrubbers, arguments.scrubber);
	}
	
	/**
	 * LIFO priority for scrubbers.
	 */
	public any function onMissingMethod(required string missingMethodName, required struct missingMethodArguments) {
		for(local.i = arrayLen(variables.scrubbers); local.i > 0; local.i--) {
			if(structKeyExists(variables.scrubbers[local.i], arguments.missingMethodName)) {
				return variables.scrubbers[local.i][arguments.missingMethodName](argumentCollection = arguments.missingMethodArguments);
			}
		}
		
		throw (message="Unable to validate object", detail="Unable to find the proper scrubber for scrubbing '#arguments.missingMethodName#'");
	}
}
