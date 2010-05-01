component extends="mxunit.framework.TestCase" {
	/**
	 * Tests the init function with a negative number per page to ensure it fails
	 */
	public void function testInitFailWithNegativeNumPerPage() {
		var paginator = createObject('component', 'cf-compendium.inc.resource.utility.paginate');
		
		paginator.init(100, -1, 1);
		
		assertEquals(20, paginator.getNumPerPage());
	}
	
	/**
	 * Tests the init function with a negative number per page to ensure it suceeds
	 * <p>
	 * If an invalid page is given it should automatically be brought into the closest bound.
	 */
	public void function testInitWithZeroPage() {
		var paginator = createObject('component', 'cf-compendium.inc.resource.utility.paginate').init(100, 25, 0);
		
		assertEquals(1, paginator.getPage());
	}
	
	/**
	 * Tests the init function with a extreme page to ensure it succeeds.
	 * <p>
	 * If an invalid page is given it should automatically be brought into the closest bound.
	 */
	public void function testInitWithExtremePage() {
		var paginator = createObject('component', 'cf-compendium.inc.resource.utility.paginate').init(100, 25, 10);
		
		assertEquals(4, paginator.getPage());
	}
	
	/**
	 * Tests the init function with a negative total to ensure it fails
	 */
	public void function testInitFailWithNegativeTotal() {
		var paginator = createObject('component', 'cf-compendium.inc.resource.utility.paginate');
		
		expectException('any', 'Should not be a valid total argument');
		
		paginator.init(-1, 25, 1);
	}
	
	/**
	 * Tests the getEndRow function
	 */
	public void function testGetEndRowSansTotal() {
		var paginator = createObject('component', 'cf-compendium.inc.resource.utility.paginate').init(0, 25, 1);
		
		assertEquals(0, paginator.getEndRow());
	}
	
	/**
	 * Tests the getEndRow function
	 */
	public void function testGetEndRowOnLast() {
		var paginator = createObject('component', 'cf-compendium.inc.resource.utility.paginate').init(90, 25, 4);
		
		assertEquals(90, paginator.getEndRow());
	}
	
	/**
	 * Tests the getEndRow function
	 */
	public void function testGetEndRowOnNonLast() {
		var paginator = createObject('component', 'cf-compendium.inc.resource.utility.paginate').init(100, 25, 2);
		
		assertEquals(50, paginator.getEndRow());
	}
	
	/**
	 * Tests the getFirst function
	 */
	public void function testGetFirst() {
		var paginator = createObject('component', 'cf-compendium.inc.resource.utility.paginate').init(100, 25, 1);
		
		assertEquals(1, paginator.getFirst());
	}
	
	/**
	 * Tests the getFirst function
	 */
	public void function testGetLast() {
		var paginator = createObject('component', 'cf-compendium.inc.resource.utility.paginate').init(100, 25, 1);
		
		assertEquals(4, paginator.getLast());
	}
	
	/**
	 * Tests the getNumPerPage function
	 */
	public void function testGetNumPerPage() {
		var paginator = createObject('component', 'cf-compendium.inc.resource.utility.paginate').init(100, 25, 1);
		
		assertEquals(25, paginator.getNumPerPage());
	}
	
	/**
	 * Tests the getNext function
	 */
	public void function testGetNextOnLast() {
		var paginator = createObject('component', 'cf-compendium.inc.resource.utility.paginate').init(100, 25, 4);
		
		assertEquals(4, paginator.getNext());
	}
	
	/**
	 * Tests the getNext function
	 */
	public void function testGetNextOnNonLast() {
		var paginator = createObject('component', 'cf-compendium.inc.resource.utility.paginate').init(100, 25, 2);
		
		assertEquals(3, paginator.getNext());
	}
	
	/**
	 * Tests the getPage function
	 */
	public void function testGetPage() {
		var paginator = createObject('component', 'cf-compendium.inc.resource.utility.paginate').init(100, 25, 2);
		
		assertEquals(2, paginator.getPage());
	}
	
	/**
	 * Tests the getPrevious function
	 */
	public void function testGetPreviousOnFirst() {
		var paginator = createObject('component', 'cf-compendium.inc.resource.utility.paginate').init(100, 25, 1);
		
		assertEquals(1, paginator.getPrevious());
	}
	
	/**
	 * Tests the getPrevious function
	 */
	public void function testGetPreviousOnNonFirst() {
		var paginator = createObject('component', 'cf-compendium.inc.resource.utility.paginate').init(100, 25, 3);
		
		assertEquals(2, paginator.getPrevious());
	}
	
	/**
	 * Tests the getStartRow function
	 */
	public void function testGetStartRowSansTotal() {
		var paginator = createObject('component', 'cf-compendium.inc.resource.utility.paginate').init(0, 25, 1);
		
		assertEquals(1, paginator.getStartRow());
	}
	
	/**
	 * Tests the getStartRow function
	 */
	public void function testGetStartRowOnFirst() {
		var paginator = createObject('component', 'cf-compendium.inc.resource.utility.paginate').init(100, 25, 1);
		
		assertEquals(1, paginator.getStartRow());
	}
	
	/**
	 * Tests the getStartRow function
	 */
	public void function testGetStartRowOnNonFirst() {
		var paginator = createObject('component', 'cf-compendium.inc.resource.utility.paginate').init(100, 25, 2);
		
		assertEquals(26, paginator.getStartRow());
	}
	
	/**
	 * Tests the hasPrevious function
	 */
	public void function testHasPreviousOnFirst() {
		var paginator = createObject('component', 'cf-compendium.inc.resource.utility.paginate').init(100, 25, 1);
		
		assertEquals(false, paginator.hasPrevious());
	}
	
	/**
	 * Tests the hasPrevious function
	 */
	public void function testHasPreviousOnNonFirst() {
		var paginator = createObject('component', 'cf-compendium.inc.resource.utility.paginate').init(100, 25, 2);
		
		assertEquals(true, paginator.hasPrevious());
	}
	
	/**
	 * Tests the hasNext function
	 */
	public void function testHasNextOnLast() {
		var paginator = createObject('component', 'cf-compendium.inc.resource.utility.paginate').init(100, 25, 4);
		
		assertEquals(false, paginator.hasNext());
	}
	
	/**
	 * Tests the hasNext function
	 */
	public void function testHasNextOnNonLast() {
		var paginator = createObject('component', 'cf-compendium.inc.resource.utility.paginate').init(100, 25, 2);
		
		assertEquals(true, paginator.hasNext());
	}
}
