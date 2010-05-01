component extends="mxunit.framework.TestCase" {
	public function setup() {
		variables.cache = createObject('component', 'cf-compendium.inc.resource.storage.cacheStub').init();
	}
	
	/**
	 * Test the ability to ignore anything put into the cache
	 */
	public void function testCount_shouldReturn0() {
		assertEquals(0, variables.cache.count());
	}
	
	/**
	 * Test the ability to ignore anything put into the cache
	 */
	public void function testGet_withString() {
		variables.cache.put('testing', 'caching');
		
		assertEquals('', variables.cache.get('testing'));
	}
	
	/**
	 * Test the ability to ignore anything put into the cache
	 */
	public void function testHas_sansSet_shouldReturnFalse() {
		assertFalse(variables.cache.has('testing'));
	}
	
	/**
	 * Test the ability to ignore anything put into the cache
	 */
	public void function testHas_withSet_shouldReturnFalse() {
		variables.cache.put('testing', 'caching');
		
		assertFalse(variables.cache.has('testing'));
	}
	
	public void function tearDown() {
		variables.cache.clear();
	}
}
