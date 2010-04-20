<!---
	Stub for turning off caching without having to modify the coding.
--->
<cfcomponent extends="cf-compendium.inc.resource.base.base" output="false">
<cfscript>
	public component function init( string cacheName = '' ) {
		return this;
	}
	
	/**
	 * Counts the number of cached variables
	 */
	public numeric function count() {
		return 0;
	}
	
	/**
	 * Always doesn't have what you are looking for
	 */
	public boolean function has( string key ) {
		return false;
	}
	
	/**
	 * Ignore any other requests and just return a blank string
	 */
	public any function onMissingMethod( string missingMethodName, struct missingMethodArguments ) {
		return '';
	}
</cfscript>
</cfcomponent>
