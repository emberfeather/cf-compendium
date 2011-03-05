component {
	public component function init() {
		return this;
	}
	
	public void function set__label(required component label) {
		variables.label = arguments.label;
	}
	
	public void function set__format(required component format) {
		variables.format = arguments.format;
	}
}
