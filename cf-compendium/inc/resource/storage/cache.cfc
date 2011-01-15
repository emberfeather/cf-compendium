<!---
	Works with the system cache.
--->
<cfcomponent extends="cf-compendium.inc.resource.base.base" output="false">
<cfscript>
	public component function init( string cacheName = '' ) {
		variables.cacheName = arguments.cacheName;
		
		return this;
	}
	
	/**
	 * Clear all cached values
	 */
	public void function clear(string filter = '') {
		cacheClear(arguments.filter, variables.cacheName);
	}
	
	/**
	 * Counts the number of cached variables
	 */
	public numeric function count() {
		return cacheCount(cacheName = variables.cacheName);
	}
	
	/**
	 * Delete a cached value from the cache
	 */
	public void function delete( string key ) {
		cacheDelete(arguments.key, false, variables.cacheName);
	}
	
	/**
	 * Get a cached value from the cache
	 */
	public any function get( string key ) {
		return cacheGet(arguments.key, false, variables.cacheName);
	}
	
	/**
	 * Get all cached values from the cache
	 */
	public struct function getAll( string filter = '' ) {
		return cacheGetAll(arguments.filter, variables.cacheName);
	}
	
	/**
	 * Get all cached keys from the cache
	 */
	public array function getAllIds( string filter = '' ) {
		return cacheGetAllIds(arguments.filter, variables.cacheName);
	}
	
	/**
	 * Check if the key exists in the cache
	 */
	public boolean function has( string key ) {
		return cacheKeyExists(arguments.key, variables.cacheName);
	}
	
	/**
	 * Put a value into the cache
	 */
	public void function put( string key, any value ) {
		cachePut(arguments.key, arguments.value, createTimeSpan(0, 0, 0, 0), createTimeSpan(0, 0, 0, 0), variables.cacheName);
	}
	
	/**
	 * Remove values from the cache
	 */
	public void function remove( any ids ) {
		cacheRemove(arguments.key, variables.cacheName);
	}
</cfscript>
</cfcomponent>
