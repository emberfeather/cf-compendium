component {
	public component function init() {
		variables.handlers = [];
		
		return this;
	}
	
	public void function _addHandler(required component handler) {
		for(local.i = 1; local.i <= arrayLen(arguments); local.i++) {
			arrayAppend(variables.handlers, arguments[local.i]);
		}
	}
	
	public any function onMissingMethod(required string missingMethodName, required struct missingMethodArguments) {
		// Check through the handlers for the method
		for(local.i = arrayLen(variables.handlers); local.i >= 1; local.i--) {
			if(structKeyExists(variables.handlers[local.i], arguments.missingMethodName)) {
				return variables.handlers[local.i][arguments.missingMethodName](argumentCollection = arguments.missingMethodArguments);
			}
		}
		
		throw(message="Unable to find the #arguments.missingMethodName# function", detail="There was no handler for the #arguments.missingMethodName# function");
	}
}
