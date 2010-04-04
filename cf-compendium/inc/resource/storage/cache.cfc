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
	public void function clear() {
		cacheClear(cacheName = variables.cacheName);
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
	public any function delete( string key ) {
		return cacheDelete(id = arguments.key, cacheName = variables.cacheName);
	}
	
	/**
	 * Get a cached value from the cache
	 */
	public any function get( string key ) {
		return cacheGet(id = arguments.key, cacheName = variables.cacheName);
	}
	
	/**
	 * Get all cached values from the cache
	 */
	public struct function getAll( string filter ) {
		return cacheGetAll(filter = arguments.filter, cacheName = variables.cacheName);
	}
	
	/**
	 * Get all cached keys from the cache
	 */
	public array function getAllIds( string filter ) {
		return cacheGetAllIds(filter = arguments.filter, cacheName = variables.cacheName);
	}
	
	/**
	 * Check if the key exists in the cache
	 */
	public boolean function has( string key ) {
		return cacheKeyExists(key = arguments.key, cacheName = variables.cacheName);
	}
	
	/**
	 * Put a value into the cache
	 */
	public void function put( string key, any value ) {
		cachePut(id = arguments.key, value = arguments.value, cacheName = variables.cacheName);
	}
	
	/**
	 * Remove values from the cache
	 */
	public void function remove( any ids ) {
		cacheRemove(ids = arguments.key, cacheName = variables.cacheName);
	}
</cfscript>
</cfcomponent>
