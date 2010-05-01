component extends="mxunit.framework.TestCase" {
	/**
	 * 
	 */
	public void function setup() {
		variables.formatter = createObject('component', 'cf-compendium.inc.resource.utility.formatHtml').init();
	}
	
	/**
	 * Test the conversion of apostrophe
	 */
	public void function testCleanTypeApostropheS() {
		var testString = 'Hello World&apos;s';
		
		assertEquals('Hello World''s', variables.formatter.cleanType(testString));
	}
	
	/**
	 * Test the conversion of ellipsis
	 */
	public void function testCleanTypeEllipsis() {
		var testString = 'Hello World&##8230;';
		
		assertEquals('Hello World...', variables.formatter.cleanType(testString));
	}
	
	/**
	 * Test the conversion of ellipsis
	 */
	public void function testCleanTypeEllipsisMiddle() {
		var testString = 'Hello World&##8230;How are you?';
		
		assertEquals('Hello World...How are you?', variables.formatter.cleanType(testString));
	}
	
	/**
	 * Test the conversion of en dash
	 */
	public void function testCleanTypeEmDash() {
		var testString = 'Hello World&##8212;How are you?';
		
		assertEquals('Hello World---How are you?', variables.formatter.cleanType(testString));
	}
	
	/**
	 * Test the conversion of en dash
	 */
	public void function testCleanTypeEnDash() {
		var testString = 'Hello World&##8211;How are you?';
		
		assertEquals('Hello World--How are you?', variables.formatter.cleanType(testString));
	}
	
	/**
	 * Test the conversion of double quotes
	 */
	public void function testCleanTypeQuotesDouble() {
		var testString = '&##8220;Hello World&##8221;';
		
		assertEquals('"Hello World"', variables.formatter.cleanType(testString));
	}
	
	/**
	 * Test the conversion of single quotes
	 */
	public void function testCleanTypeQuotesSingle() {
		var testString = "&##8216;Hello World&##8217;";
		
		assertEquals('''Hello World''', variables.formatter.cleanType(testString));
	}
	
	/**
	 * Test the conversion of apostrophe
	 */
	public void function testCleanTypeSApostrophe() {
		var testString = 'Hello Worlds&apos;';
		
		assertEquals('Hello Worlds''', variables.formatter.cleanType(testString));
	}
	
	/**
	 * Test the conversion of apostrophe
	 */
	public void function testCorrectTypeApostropheS() {
		var testString = 'Hello World''s';
		
		assertEquals('Hello World&apos;s', variables.formatter.correctType(testString));
	}
	
	/**
	 * Test the conversion of backticked strings
	 */
	public void function testCorrectTypeBackticks() {
		var testString = "``Hello World''";
		
		assertEquals('&##8216;Hello World&##8217;', variables.formatter.correctType(testString));
	}
	
	/**
	 * Test the non-conversion in code tags
	 */
	public void function testCorrectTypeCodeTag() {
		var testString = "<code>'Hello'</code>";
		
		assertEquals('<code>''Hello''</code>', variables.formatter.correctType(testString));
	}
	
	/**
	 * Test the conversion of ellipsis
	 */
	public void function testCorrectTypeEllipsis() {
		var testString = 'Hello World...';
		
		assertEquals('Hello World&##8230;', variables.formatter.correctType(testString));
	}
	
	/**
	 * Test the conversion of ellipsis
	 */
	public void function testCorrectTypeEllipsisMiddle() {
		var testString = 'Hello World...How are you?';
		
		assertEquals('Hello World&##8230;How are you?', variables.formatter.correctType(testString));
	}
	
	/**
	 * Test the conversion of en dash
	 */
	public void function testCorrectTypeEmDash() {
		var testString = 'Hello World---How are you?';
		
		assertEquals('Hello World&##8212;How are you?', variables.formatter.correctType(testString));
	}
	
	/**
	 * Test the conversion of en dash
	 */
	public void function testCorrectTypeEnDash() {
		var testString = 'Hello World--How are you?';
		
		assertEquals('Hello World&##8211;How are you?', variables.formatter.correctType(testString));
	}
	
	/**
	 * Test the non-conversion in kbd tags
	 */
	public void function testCorrectTypeKbdTag() {
		var testString = "<kbd>'Hello'</kbd>";
		
		assertEquals('<kbd>''Hello''</kbd>', variables.formatter.correctType(testString));
	}
	
	/**
	 * Test the non-conversion in pre tags
	 */
	public void function testCorrectTypePreTag() {
		var testString = "<pre>'Hello'</pre>";
		
		assertEquals('<pre>''Hello''</pre>', variables.formatter.correctType(testString));
	}
	
	/**
	 * Test the conversion of double quotes
	 */
	public void function testCorrectTypeQuotesDouble() {
		var testString = '"Hello World"';
		
		assertEquals('&##8220;Hello World&##8221;', variables.formatter.correctType(testString));
	}
	
	/**
	 * Test the conversion of single quotes with an already converted first single quote
	 */
	public void function testCorrectTypeQuotesDoubleMixedOpening() {
		var variables.formatter = createObject('component', 'cf-compendium.inc.resource.utility.formatHtml').init();
		var testString = '&##8220;Hello World"';
		
		assertEquals('&##8220;Hello World&##8221;', variables.formatter.correctType(testString));
	}
	
	/**
	 * Test the conversion of single quotes with an already converted last single quote
	 */
	public void function testCorrectTypeQuotesDoubleMixedClosing() {
		var testString = '"Hello World&##8221;';
		
		assertEquals('&##8220;Hello World&##8221;', variables.formatter.correctType(testString));
	}
	
	/**
	 * Test the conversion of single quotes with an already converted last single quote between two single quotes
	 */
	public void function testCorrectTypeQuotesDoubleMixedMiddleOpening() {
		var testString = '"Hello World" &##8220;Hello World"';
		
		assertEquals('&##8220;Hello World&##8221; &##8220;Hello World&##8221;', variables.formatter.correctType(testString));
	}
	
	/**
	 * Test the conversion of single quotes with an already converted last single quote between two single quotes
	 */
	public void function testCorrectTypeQuotesDoubleMixedMiddleClosing() {
		var testString = '"Hello World&##8221; "Hello World"';
		
		assertEquals('&##8220;Hello World&##8221; &##8220;Hello World&##8221;', variables.formatter.correctType(testString));
	}
	
	/**
	 * Test the conversion of single quotes
	 */
	public void function testCorrectTypeQuotesSingle() {
		var testString = "'Hello World'";
		
		assertEquals('&##8216;Hello World&##8217;', variables.formatter.correctType(testString));
	}
	
	/**
	 * Test the conversion of single quotes with an already converted first single quote
	 */
	public void function testCorrectTypeQuotesSingleMixedOpening() {
		var testString = "&##8216;Hello World'";
		
		assertEquals('&##8216;Hello World&##8217;', variables.formatter.correctType(testString));
	}
	
	/**
	 * Test the conversion of single quotes with an already converted last single quote
	 */
	public void function testCorrectTypeQuotesSingleMixedClosing() {
		var testString = "'Hello World&##8217;";
		
		assertEquals('&##8216;Hello World&##8217;', variables.formatter.correctType(testString));
	}
	
	/**
	 * Test the conversion of single quotes with an already converted last single quote between two single quotes
	 */
	public void function testCorrectTypeQuotesSingleMixedMiddleOpening() {
		var testString = "'Hello World' &##8216;Hello World'";
		
		assertEquals('&##8216;Hello World&##8217; &##8216;Hello World&##8217;', variables.formatter.correctType(testString));
	}
	
	/**
	 * Test the conversion of single quotes with an already converted last single quote between two single quotes
	 */
	public void function testCorrectTypeQuotesSingleMixedMiddleClosing() {
		var testString = "'Hello World&##8217; 'Hello World'";
		
		assertEquals('&##8216;Hello World&##8217; &##8216;Hello World&##8217;', variables.formatter.correctType(testString));
	}
	
	/**
	 * Test the conversion of apostrophe
	 */
	public void function testCorrectTypeSApostrophe() {
		var testString = 'Hello Worlds''';
		
		assertEquals('Hello Worlds&apos;', variables.formatter.correctType(testString));
	}
	
	/**
	 * Test the non-conversion in script tags
	 */
	public void function testCorrectTypeScriptTag() {
		var testString = "<script>'Hello'</script>";
		
		assertEquals('<script>''Hello''</script>', variables.formatter.correctType(testString));
	}
}
