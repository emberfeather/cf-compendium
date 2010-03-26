<!---
	Testing against a list of mobile browser user agents listed on Wikipedia.
	
	@see http://en.wikipedia.org/wiki/List_of_user_agents_for_mobile_phones
--->
<cfcomponent extends="mxunit.framework.TestCase" output="false">
<cfscript>
	public void function setup() {
		variables.browser = createObject('component', 'cf-compendium.inc.resource.utility.browser').init();
	}
	
	/**
	 * Apple
	 */
	public void function testIsMobile_apple_areMobile() {
		// Apple iPhone
		assertTrue(variables.browser.isMobile('Mozilla/5.0 (iPhone; U; CPU iPhone OS 3_0 like Mac OS X; en-us) AppleWebKit/420.1 (KHTML, like Gecko) Version/3.0 Mobile/1A542a Safari/419.3'));
		// iPod Touch
		assertTrue(variables.browser.isMobile('Mozilla/5.0 (iPod; U; CPU iPhone OS 3_1_1 like Mac OS X; en-us) AppleWebKit/528.18 (KHTML, like Gecko) Mobile/7C145'));
		// Apple iPad
		assertTrue(variables.browser.isMobile('Mozilla/5.0 (iPad; U; CPU iPhone OS 3_2 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Version/4.0.4 Mobile/7B314 Safari/531.21.10'));
	}
	
	/**
	 * Apple Safari 4.0.5
	 */
	public void function testIsMobile_apple_safari4_0_5_notMobile() {
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US) AppleWebKit/531.22.7 (KHTML, like Gecko) Version/4.0.5 Safari/531.22.7'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; U; Windows NT 5.1; cs-CZ) AppleWebKit/531.22.7 (KHTML, like Gecko) Version/4.0.5 Safari/531.22.7'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Macintosh; U; PPC Mac OS X 10_5_8; en-us) AppleWebKit/531.22.7 (KHTML, like Gecko) Version/4.0.5 Safari/531.22.7'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Macintosh; U; PPC Mac OS X 10_4_11; da-dk) AppleWebKit/531.22.7 (KHTML, like Gecko) Version/4.0.5 Safari/531.22.7'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_3; en-us) AppleWebKit/531.22.7 (KHTML, like Gecko) Version/4.0.5 Safari/531.22.7'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_2; ja-jp) AppleWebKit/531.22.7 (KHTML, like Gecko) Version/4.0.5 Safari/531.22.7'));
	}
	
	/**
	 * Apple Safari 4.0.4
	 */
	public void function testIsMobile_apple_safari4_0_4_notMobile() {
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-TW) AppleWebKit/531.21.8 (KHTML, like Gecko) Version/4.0.4 Safari/531.21.10'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; U; Windows NT 6.1; ko-KR) AppleWebKit/531.21.8 (KHTML, like Gecko) Version/4.0.4 Safari/531.21.10'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; U; Windows NT 5.2; en-US) AppleWebKit/531.21.8 (KHTML, like Gecko) Version/4.0.4 Safari/531.21.10'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; U; Windows NT 5.1; de-DE) AppleWebKit/532+ (KHTML, like Gecko) Version/4.0.4 Safari/531.21.10'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Macintosh; U; PPC Mac OS X 10_4_11; hu-hu) AppleWebKit/531.21.8 (KHTML, like Gecko) Version/4.0.4 Safari/531.21.10'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_2; ru-ru) AppleWebKit/533.2+ (KHTML, like Gecko) Version/4.0.4 Safari/531.21.10'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_2; de-at) AppleWebKit/531.21.8 (KHTML, like Gecko) Version/4.0.4 Safari/531.21.10'));
	}
	
	/**
	 * Apple Safari 4.0.3
	 */
	public void function testIsMobile_apple_safari4_0_3_notMobile() {
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; U; Windows NT 6.0; en-us) AppleWebKit/531.9 (KHTML, like Gecko) Version/4.0.3 Safari/531.9'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Macintosh; U; PPC Mac OS X 10_5_8; en-us) AppleWebKit/532.0+ (KHTML, like Gecko) Version/4.0.3 Safari/531.9.2009'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Macintosh; U; PPC Mac OS X 10_5_8; en-us) AppleWebKit/532.0+ (KHTML, like Gecko) Version/4.0.3 Safari/531.9'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_1; nl-nl) AppleWebKit/532.3+ (KHTML, like Gecko) Version/4.0.3 Safari/531.9'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_8; fi-fi) AppleWebKit/531.9 (KHTML, like Gecko) Version/4.0.3 Safari/531.9'));
	}
	
	/**
	 * Apple Safari 4.0.2
	 */
	public void function testIsMobile_apple_safari4_0_2_notMobile() {
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/532+ (KHTML, like Gecko) Version/4.0.2 Safari/530.19.1'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/530.19.2 (KHTML, like Gecko) Version/4.0.2 Safari/530.19.1'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; U; Windows NT 6.0; zh-TW) AppleWebKit/530.19.2 (KHTML, like Gecko) Version/4.0.2 Safari/530.19.1'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; U; Windows NT 6.0; pl-PL) AppleWebKit/530.19.2 (KHTML, like Gecko) Version/4.0.2 Safari/530.19.1'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; U; Windows NT 6.0; ja-JP) AppleWebKit/530.19.2 (KHTML, like Gecko) Version/4.0.2 Safari/530.19.1'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; U; Windows NT 6.0; fr-FR) AppleWebKit/530.19.2 (KHTML, like Gecko) Version/4.0.2 Safari/530.19.1'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US) AppleWebKit/530.19.2 (KHTML, like Gecko) Version/4.0.2 Safari/530.19.1'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; U; Windows NT 5.2; de-DE) AppleWebKit/530.19.2 (KHTML, like Gecko) Version/4.0.2 Safari/530.19.1'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; U; Windows NT 5.1; zh-CN) AppleWebKit/530.19.2 (KHTML, like Gecko) Version/4.0.2 Safari/530.19.1'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/530.19.2 (KHTML, like Gecko) Version/4.0.2 Safari/530.19.1'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Macintosh; U; PPC Mac OS X 10_5_7; en-us) AppleWebKit/530.19.2 (KHTML, like Gecko) Version/4.0.2 Safari/530.19'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_7; en-us) AppleWebKit/530.19.2 (KHTML, like Gecko) Version/4.0.2 Safari/530.19'));
	}
	
	/**
	 * Apple Safari 4.0.1
	 */
	public void function testIsMobile_apple_safari4_0_1_notMobile() {
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_7; en-us) AppleWebKit/531.2+ (KHTML, like Gecko) Version/4.0.1 Safari/530.18'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_7; en-us) AppleWebKit/530.19.2 (KHTML, like Gecko) Version/4.0.1 Safari/530.18'));
	}
	
	/**
	 * Apple Safari 4.0
	 */
	public void function testIsMobile_apple_safari4_0_notMobile() {
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; U; Windows NT 6.0; ru-RU) AppleWebKit/528.16 (KHTML, like Gecko) Version/4.0 Safari/528.16'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; U; Windows NT 6.0; ja-JP) AppleWebKit/528.16 (KHTML, like Gecko) Version/4.0 Safari/528.16'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; U; Windows NT 6.0; hu-HU) AppleWebKit/528.16 (KHTML, like Gecko) Version/4.0 Safari/528.16'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; U; Windows NT 6.0; he-IL) AppleWebKit/528.16 (KHTML, like Gecko) Version/4.0 Safari/528.16'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; U; Windows NT 6.0; he-IL) AppleWebKit/528+ (KHTML, like Gecko) Version/4.0 Safari/528.16'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; U; Windows NT 6.0; fr-FR) AppleWebKit/528.16 (KHTML, like Gecko) Version/4.0 Safari/528.16'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; U; Windows NT 6.0; es-es) AppleWebKit/528.16 (KHTML, like Gecko) Version/4.0 Safari/528.16'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US) AppleWebKit/528.16 (KHTML, like Gecko) Version/4.0 Safari/528.16'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; U; Windows NT 6.0; en) AppleWebKit/528.16 (KHTML, like Gecko) Version/4.0 Safari/528.16'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; U; Windows NT 6.0; de-DE) AppleWebKit/528.16 (KHTML, like Gecko) Version/4.0 Safari/528.16'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; U; Windows NT 5.1; zh-TW) AppleWebKit/528.16 (KHTML, like Gecko) Version/4.0 Safari/528.16'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; U; Windows NT 5.1; zh-CN) AppleWebKit/528.16 (KHTML, like Gecko) Version/4.0 Safari/528.16'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; U; Windows NT 5.1; sv-SE) AppleWebKit/528.16 (KHTML, like Gecko) Version/4.0 Safari/528.16'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; U; Windows NT 5.1; ru-RU) AppleWebKit/528.16 (KHTML, like Gecko) Version/4.0 Safari/528.16'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; U; Windows NT 5.1; pt-PT) AppleWebKit/528.16 (KHTML, like Gecko) Version/4.0 Safari/528.16'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; U; Windows NT 5.1; pt-BR) AppleWebKit/528.16 (KHTML, like Gecko) Version/4.0 Safari/528.16'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; U; Windows NT 5.1; nb-NO) AppleWebKit/528.16 (KHTML, like Gecko) Version/4.0 Safari/528.16'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; U; Windows NT 5.1; hu-HU) AppleWebKit/528.16 (KHTML, like Gecko) Version/4.0 Safari/528.16'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; U; Windows NT 5.1; fr-FR) AppleWebKit/528.16 (KHTML, like Gecko) Version/4.0 Safari/528.16'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; U; Windows NT 5.1; fi-FI) AppleWebKit/528.16 (KHTML, like Gecko) Version/4.0 Safari/528.16'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/528+ (KHTML, like Gecko) Version/4.0 Safari/528.16'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/528+ (KHTML, like Gecko) Version/4.0 Safari/528+'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; U; Windows NT 5.1; cs-CZ) AppleWebKit/528.16 (KHTML, like Gecko) Version/4.0 Safari/528.16'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Macintosh; U; PPC Mac OS X 10_5_6; tr-TR) AppleWebKit/528.16 (KHTML, like Gecko) Version/4.0 Safari/528.1'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Macintosh; U; PPC Mac OS X 10_5_6; ja-jp) AppleWebKit/528.16 (KHTML, like Gecko) Version/4.0 Safari/528.16'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Macintosh; U; PPC Mac OS X 10_5_6; it-it) AppleWebKit/528.16 (KHTML, like Gecko) Version/4.0 Safari/528.16'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Macintosh; U; PPC Mac OS X 10_5_6; en-us) AppleWebKit/530.9+ (KHTML, like Gecko) Version/4.0 Safari/528.16'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Macintosh; U; PPC Mac OS X 10_5_6; en-us) AppleWebKit/530.1+ (KHTML, like Gecko) Version/4.0 Safari/528.16'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Macintosh; U; PPC Mac OS X 10_5_6; en-us) AppleWebKit/528.16 (KHTML, like Gecko) Version/4.0 Safari/528.16'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Macintosh; U; PPC Mac OS X 10_4_11; ja-jp) AppleWebKit/528.16 (KHTML, like Gecko) Version/4.0 Safari/528.16'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Macintosh; U; PPC Mac OS X 10_4_11; it-it) AppleWebKit/528.16 (KHTML, like Gecko) Version/4.0 Safari/528.16'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Macintosh; U; PPC Mac OS X 10_4_11; en-us) AppleWebKit/528.16 (KHTML, like Gecko) Version/4.0 Safari/528.16'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Macintosh; U; PPC Mac OS X 10_4_11; en) AppleWebKit/528.5+ (KHTML, like Gecko) Version/4.0 Safari/528.1'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Macintosh; U; PPC Mac OS X 10_4_11; en) AppleWebKit/528.4+ (KHTML, like Gecko) Version/4.0 Safari/528.1'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Macintosh; U; PPC Mac OS X 10_4_11; en) AppleWebKit/528.1 (KHTML, like Gecko) Version/4.0 Safari/528.1'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Macintosh; U; PPC Mac OS X 10_4_11; el-gr) AppleWebKit/528.16 (KHTML, like Gecko) Version/4.0 Safari/528.16'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6; en-us) AppleWebKit/530.6+ (KHTML, like Gecko) Version/4.0 Safari/530.6'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6; en-us) AppleWebKit/530.3 (KHTML, like Gecko) Version/4.0 Safari/530.3'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6; en-us) AppleWebKit/530.1 (KHTML, like Gecko) Version/4.0 Safari/530.1'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6; en-gb) AppleWebKit/530.1 (KHTML, like Gecko) Version/4.0 Safari/530.1'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_7; fr-fr) AppleWebKit/528.18.1 (KHTML, like Gecko) Version/4.0 Safari/528.17'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_7; en-us) AppleWebKit/530.18 (KHTML, like Gecko) Version/4.0 Safari/528.17'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_6; ru-ru) AppleWebKit/528.16 (KHTML, like Gecko) Version/4.0 Safari/528.16'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_6; nb-no) AppleWebKit/528.16 (KHTML, like Gecko) Version/4.0 Safari/528.16'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_6; ko-kr) AppleWebKit/528.16 (KHTML, like Gecko) Version/4.0 Safari/528.16'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_6; it-it) AppleWebKit/528.16 (KHTML, like Gecko) Version/4.0 Safari/528.16'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_6; fr-fr) AppleWebKit/530.5+ (KHTML, like Gecko) Version/4.0 Safari/528.16'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_6; fr-fr) AppleWebKit/528.16 (KHTML, like Gecko) Version/4.0 Safari/528.16'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_6; fr-ca) AppleWebKit/528.16 (KHTML, like Gecko) Version/4.0 Safari/528.16'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_6; es-es) AppleWebKit/528.16 (KHTML, like Gecko) Version/4.0 Safari/528.16'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_6; en-us) AppleWebKit/530.6+ (KHTML, like Gecko) Version/4.0 Safari/528.16'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_6; en-us) AppleWebKit/530.5+ (KHTML, like Gecko) Version/4.0 Safari/528.16'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_6; en-us) AppleWebKit/530.1+ (KHTML, like Gecko) Version/4.0 Safari/528.16'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_6; en-us) AppleWebKit/528.16 (KHTML, like Gecko) Version/4.0 Safari/528.16'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_6; en-us) AppleWebKit/528.10+ (KHTML, like Gecko) Version/4.0 Safari/528.1'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_6; en-gb) AppleWebKit/528.16 (KHTML, like Gecko) Version/4.0 Safari/528.16'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_6; de-de) AppleWebKit/528.16 (KHTML, like Gecko) Version/4.0 Safari/528.16'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_6; da-dk) AppleWebKit/528.16 (KHTML, like Gecko) Version/4.0 Safari/528.16'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_5; en-us) AppleWebKit/528.1 (KHTML, like Gecko) Version/4.0 Safari/528.1'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_4; nl-nl) AppleWebKit/528.4+ (KHTML, like Gecko) Version/4.0 Safari/528.1'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_4_11; en) AppleWebKit/530.1+ (KHTML, like Gecko) Version/4.0 Safari/528.16'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_4_11; en) AppleWebKit/528.16 (KHTML, like Gecko) Version/4.0 Safari/528.16'));
	}
	
	/**
	 * BenQ-Siemens (Openwave)
	 */
	public void function testIsMobile_benQSiemens_areMobile() {
		// S68
		assertTrue(variables.browser.isMobile('SIE-S68/36 UP.Browser/7.1.0.e.18 (GUI) MMP/2.0 Profile/MIDP-2.0 Configuration/CLDC-1.1'));
		// EF81
		assertTrue(variables.browser.isMobile('SIE-EF81/58 UP.Browser/7.0.0.1.181 (GUI) MMP/2.0 Profile/MIDP-2.0 Configuration/CLDC-1.1'));
	}
	
	/**
	 * BlackBerry
	 */
	public void function testIsMobile_blackBerry_areMobile() {
		// BlackBerry 7100i
		assertTrue(variables.browser.isMobile('BlackBerry7100i/4.1.0 Profile/MIDP-2.0 Configuration/CLDC-1.1 VendorID/103'));
		// BlackBerry 7130e
		assertTrue(variables.browser.isMobile('BlackBerry7130e/4.1.0 Profile/MIDP-2.0 Configuration/CLDC-1.1 VendorID/104'));
		// BlackBerry 7250
		assertTrue(variables.browser.isMobile('BlackBerry7250/4.0.0 Profile/MIDP-2.0 Configuration/CLDC-1.1'));
		// BlackBerry 7230
		assertTrue(variables.browser.isMobile('BlackBerry7230/3.7.0'));
		// BlackBerry 7520
		assertTrue(variables.browser.isMobile('BlackBerry7520/4.0.0 Profile/MIDP-2.0 Configuration/CLDC-1.1'));
		// BlackBerry 7730
		assertTrue(variables.browser.isMobile('BlackBerry7730/3.7.0'));
		// BlackBerry 8100
		assertTrue(variables.browser.isMobile('Mozilla/4.0 BlackBerry8100/4.2.0 Profile/MIDP-2.0 Configuration/CLDC-1.1 VendorID/100'));
		// BlackBerry 8130
		assertTrue(variables.browser.isMobile('BlackBerry8130/4.3.0 Profile/MIDP-2.0 Configuration/CLDC-1.1 VendorID/109'));
		// BlackBerry 8310
		assertTrue(variables.browser.isMobile('BlackBerry8310/4.2.2 Profile/MIDP-2.0 Configuration/CLDC-1.1 VendorID/121'));
		// BlackBerry 8320
		assertTrue(variables.browser.isMobile('BlackBerry8320/4.3.1 Profile/MIDP-2.0 Configuration/CLDC-1.1'));
		// BlackBerry 8700
		assertTrue(variables.browser.isMobile('BlackBerry8700/4.1.0 Profile/MIDP-2.0 Configuration/CLDC-1.1 VendorID/100'));
		// BlackBerry 8703e
		assertTrue(variables.browser.isMobile('BlackBerry8703e/4.1.0 Profile/MIDP-2.0 Configuration/CLDC-1.1 VendorID/105'));
		// BlackBerry 8820
		assertTrue(variables.browser.isMobile('BlackBerry8820/4.2.2 Profile/MIDP-2.0 Configuration/CLDC-1.1 VendorID/102'));
		// BlackBerry 8830
		assertTrue(variables.browser.isMobile('BlackBerry8830/4.2.2 Profile/MIDP-2.0 Configuration/CLOC-1.1 VendorID/105'));
		// BlackBerry 9000
		assertTrue(variables.browser.isMobile('BlackBerry9000/4.6.0.65 Profile/MIDP-2.0 Configuration/CLDC-1.1 VendorID/102'));
		// BlackBerry 9530
		assertTrue(variables.browser.isMobile('BlackBerry9530/4.7.0.167 Profile/MIDP-2.0 Configuration/CLDC-1.1 VendorID/102 UP.Link/6.3.1.20.0'));
		// BlackBerry 9530
		assertTrue(variables.browser.isMobile('BlackBerry9530/5.0.0.328 Profile/MIDP-2.1 Configuration/CLDC-1.1 VendorID/105'));
		// BlackBerry 9630 Tour
		assertTrue(variables.browser.isMobile('BlackBerry9630/4.7.1.40 Profile/MIDP-2.0 Configuration/CLDC-1.1 VendorID/104'));
	}
	
	/**
	 * Google
	 */
	public void function testIsMobile_google_areMobile() {
		// Android SDK 1.5r3
		assertTrue(variables.browser.isMobile('Mozilla/5.0 (Linux; U; Android 1.5; de-; sdk Build/CUPCAKE) AppleWebkit/528.5+ (KHTML, like Gecko) Version/3.1.2 Mobile Safari/525.20.1'));
	}
	
	/**
	 * Google Chrome 6.0
	 */
	public void function testIsMobile_microsoft_chrome6_0_notMobile() {
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/533.2 (KHTML, like Gecko) Chrome/6.0'));
	}
	
	/**
	 * Google Chrome 5.0.358.0
	 */
	public void function testIsMobile_microsoft_chrome5_0_358_0_notMobile() {
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (X11; U; Linux x86_64; en-US) AppleWebKit/533.3 (KHTML, like Gecko) Chrome/5.0.358.0 Safari/533.3'));
	}
	
	/**
	 * Google Chrome 5.0.357.0
	 */
	public void function testIsMobile_microsoft_chrome5_0_357_0_notMobile() {
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/533.3 (KHTML, like Gecko) Chrome/5.0.357.0 Safari/533.3'));
	}
	
	/**
	 * Google Chrome 5.0.356.0
	 */
	public void function testIsMobile_microsoft_chrome5_0_356_0_notMobile() {
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/533.3 (KHTML, like Gecko) Chrome/5.0.356.0 Safari/533.3'));
	}
	
	/**
	 * Google Chrome 5.0.355.0
	 */
	public void function testIsMobile_microsoft_chrome5_0_355_0_notMobile() {
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/533.3 (KHTML, like Gecko) Chrome/5.0.355.0 Safari/533.3'));
	}
	
	/**
	 * Google Chrome 5.0.354.0
	 */
	public void function testIsMobile_microsoft_chrome5_0_354_0_notMobile() {
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (X11; U; Linux x86_64; en-US) AppleWebKit/533.3 (KHTML, like Gecko) Chrome/5.0.354.0 Safari/533.3'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/533.3 (KHTML, like Gecko) Chrome/5.0.354.0 Safari/533.3'));
	}
	
	/**
	 * Google Chrome 5.0.353.0
	 */
	public void function testIsMobile_microsoft_chrome5_0_353_0_notMobile() {
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (X11; U; Linux x86_64; en-US) AppleWebKit/533.3 (KHTML, like Gecko) Chrome/5.0.353.0 Safari/533.3'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/533.3 (KHTML, like Gecko) Chrome/5.0.353.0 Safari/533.3'));
	}
	
	/**
	 * Google Chrome 5.0.343.0
	 */
	public void function testIsMobile_microsoft_chrome5_0_343_0_notMobile() {
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_2; en-US) AppleWebKit/533.2 (KHTML, like Gecko) Chrome/5.0.343.0 Safari/533.2'));
	}
	
	/**
	 * Google Chrome 5.0.342.5
	 */
	public void function testIsMobile_microsoft_chrome5_0_342_5_notMobile() {
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US) AppleWebKit/533.2 (KHTML, like Gecko) Chrome/5.0.342.5 Safari/533.2'));
	}
	
	/**
	 * Google Chrome 5.0.342.3
	 */
	public void function testIsMobile_microsoft_chrome5_0_342_3_notMobile() {
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (X11; U; Linux x86_64; en-US) AppleWebKit/533.2 (KHTML, like Gecko) Chrome/5.0.342.3 Safari/533.2'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/533.2 (KHTML, like Gecko) Chrome/5.0.342.3 Safari/533.2'));
	}
	
	/**
	 * Google Chrome 5.0.342.2
	 */
	public void function testIsMobile_microsoft_chrome5_0_342_2_notMobile() {
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/533.2 (KHTML, like Gecko) Chrome/5.0.342.2 Safari/533.2'));
	}
	
	/**
	 * Google Chrome 5.0.342.1
	 */
	public void function testIsMobile_microsoft_chrome5_0_342_1_notMobile() {
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (X11; U; Linux x86_64; en-US) AppleWebKit/533.2 (KHTML, like Gecko) Chrome/5.0.342.1 Safari/533.2'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (X11; U; Linux i586; en-US) AppleWebKit/533.2 (KHTML, like Gecko) Chrome/5.0.342.1 Safari/533.2'));
	}
	
	/**
	 * Google Chrome 5.0.335.0
	 */
	public void function testIsMobile_microsoft_chrome5_0_335_0_notMobile() {
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (X11; U; Linux x86_64; en-US) AppleWebKit/533.1 (KHTML, like Gecko) Chrome/5.0.335.0 Safari/533.1'));
	}
	
	/**
	 * Google Chrome 5.0.310.0
	 */
	public void function testIsMobile_microsoft_chrome5_0_310_0_notMobile() {
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; U; Windows NT 5.2; en-US) AppleWebKit/532.9 (KHTML, like Gecko) Chrome/5.0.310.0 Safari/532.9'));
	}
	
	/**
	 * Google Chrome 5.0.309.0
	 */
	public void function testIsMobile_microsoft_chrome5_0_309_0_notMobile() {
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (X11; U; Linux x86_64; en-US) AppleWebKit/532.9 (KHTML, like Gecko) Chrome/5.0.309.0 Safari/532.9'));
	}
	
	/**
	 * Google Chrome 5.0.307.11
	 */
	public void function testIsMobile_microsoft_chrome5_0_307_11_notMobile() {
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_0; en-US) AppleWebKit/532.9 (KHTML, like Gecko) Chrome/5.0.307.11 Safari/532.9'));
	}
	
	/**
	 * Google Chrome 5.0.307.1
	 */
	public void function testIsMobile_microsoft_chrome5_0_307_1_notMobile() {
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/532.9 (KHTML, like Gecko) Chrome/5.0.307.1 Safari/532.9'));
	}
	
	/**
	 * HTC
	 */
	public void function testIsMobile_HTC_areMobile() {
		// 8500
		assertTrue(variables.browser.isMobile('HTC-8500/1.2 Mozilla/4.0 (compatible; MSIE 5.5; Windows CE; PPC; 240x320)'));
		// 8500
		assertTrue(variables.browser.isMobile('HTC-8500/1.2 Mozilla/4.0 (compatible; MSIE 6.0; Windows CE; IEMobile 7.6) UP.Link/6.3.1.17.0'));
		// P3650
		assertTrue(variables.browser.isMobile('HTC_P3650 Mozilla/4.0 (compatible; MSIE 6.0; Windows CE; IEMobile 7.6)'));
		// P3450
		assertTrue(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 6.0; Windows CE; IEMobile 6.12) PPC; 240x320; HTC P3450; OpVer 23.116.1.611'));
		// S710
		assertTrue(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 6.0; Windows CE; IEMobile 7.6) SP; 240x320; HTC_S710/1.0 ...'));
		// Hero
		assertTrue(variables.browser.isMobile('Mozilla/5.0 (Linux; U; Android 1.5; en-za; HTC Hero Build/CUPCAKE) AppleWebKit/528.5+ (KHTML, like Gecko) Version/3.1.2 Mobile Safari/525.20.1'));
		// Tattoo
		assertTrue(variables.browser.isMobile('Mozilla/5.0 (Linux; U; Android 1.6; en-us; HTC_TATTOO_A3288 Build/DRC79) AppleWebKit/528.5+ (KHTML, like Gecko) Version/3.1.2 Mobile Safari/525.20.1'));
	}
	
	/**
	 * LG Electronics
	 */
	public void function testIsMobile_LGElectronics_areMobile() {
		// LG U880
		assertTrue(variables.browser.isMobile('LG/U880/v1.0'));
		// LG B2050
		assertTrue(variables.browser.isMobile('LG-B2050 MIC/WAP2.0 MIDP-2.0/CLDC-1.0'));
		// LG C1100
		assertTrue(variables.browser.isMobile('LG-C1100 MIC/WAP2.0 MIDP-2.0/CLDC-1.0'));
		// LG CU8080
		assertTrue(variables.browser.isMobile('LGE-CU8080/1.0 UP.Browser/4.1.26l'));
		// LG G1800
		assertTrue(variables.browser.isMobile('LG-G1800 MIC/WAP2.0 MIDP-2.0/CLDC-1.0'));
		// LG G210
		assertTrue(variables.browser.isMobile('LG-G210/SW100/WAP2.0 Profile/MIDP-2.0 Configuration/CLDC-1.0'));
		// LG G220
		assertTrue(variables.browser.isMobile('LG-G220/V100/WAP2.0 Profile/MIDP-2.0 Configuration/CLDC-1.0'));
		// LG G232
		assertTrue(variables.browser.isMobile('LG-G232/V100/WAP2.0 Profile/MIDP-2.0 Configuration/CLDC-1.0'));
		// LG G262
		assertTrue(variables.browser.isMobile('LG-G262/V100/WAP2.0 Profile/MIDP-2.0 Configuration/CLDC-1.0'));
		// LG G5200
		assertTrue(variables.browser.isMobile('LG-G5200 AU/4.10'));
		// LG G5600
		assertTrue(variables.browser.isMobile('LG-G5600 MIC/WAP2.0 MIDP-2.0/CLDC-1.0'));
		// LG G610
		assertTrue(variables.browser.isMobile('LG-G610 V100 AU/4.10 Profile/MIDP-1.0 Configuration/CLDC-1.0'));
		// LG G622
		assertTrue(variables.browser.isMobile('LG-G622/V100/WAP2.0 Profile/MIDP-2.0 Configuration/CLDC-1.0'));
		// LG G650
		assertTrue(variables.browser.isMobile('LG-G650 V100 AU/4.10 Profile/MIDP-1.0 Configuration/CLDC-1.0'));
		// LG G660
		assertTrue(variables.browser.isMobile('LG-G660/V100/WAP2.0 Profile/MIDP-2.0 Configuration/CLDC-1.0'));
		// LG G672
		assertTrue(variables.browser.isMobile('LG-G672/V100/WAP2.0 Profile/MIDP-2.0 Configuration/CLDC-1.0'));
		// LG G682
		assertTrue(variables.browser.isMobile('LG-G682 /V100/WAP2.0 Profile/MIDP-2.0 Configuration/CLDC-1.0'));
		// LG G688
		assertTrue(variables.browser.isMobile('LG-G688 MIC/V100/WAP2.0 MIDP-2.0/CLDC-1.0'));
		// LG G7000
		assertTrue(variables.browser.isMobile('LG-G7000 AU/4.10'));
		// LG G7050
		assertTrue(variables.browser.isMobile('LG-G7050 UP.Browser/6.2.2 (GUI) MMP/1.0 Profile/MIDP-1.0 Configuration/CLDC-1.0'));
		// LG G7100
		assertTrue(variables.browser.isMobile('LG-G7100 AU/4.10 Profile/MIDP-1.0 Configuration/CLDC-1.0'));
		// LG G7200
		assertTrue(variables.browser.isMobile('LG-G7200 UP.Browser/6.2.2 (GUI) MMP/1.0 Profile/MIDP-1.0 Configuration/CLDC-1.0'));
		// LG G822
		assertTrue(variables.browser.isMobile('LG-G822/SW100/WAP2.0 Profile/MIDP-2.0 Configuration/CLDC-1.0'));
		// LG G850
		assertTrue(variables.browser.isMobile('LG-G850 V100 UP.Browser/6.2.2 (GUI) MMP/1.0 Profile/MIDP-1.0 Configuration/CLDC-1.0'));
		// LG G920
		assertTrue(variables.browser.isMobile('LG-G920/V122/WAP2.0 Profile/MIDP-1.0 Configuration/CLDC-1.0'));
		// LG G922
		assertTrue(variables.browser.isMobile('LG-G922 Obigo/WAP2.0 MIDP-2.0/CLDC-1.1'));
		// LG G932
		assertTrue(variables.browser.isMobile('LG-G932 UP.Browser/6.2.3(GUI)MMP/1.0 Profile/MIDP-2.0 Configuration/CLDC-1.1'));
		// LG L1100
		assertTrue(variables.browser.isMobile('LG-L1100 UP.Browser/6.2.2 (GUI) MMP/1.0 Profile/MIDP-1.0 Configuration/CLDC-1.0'));
		// LG MX8700
		assertTrue(variables.browser.isMobile('LGE-MX8700/1.0 UP.Browser/6.2.3.2 (GUI) MMP/2.0'));
		// LG T5100
		assertTrue(variables.browser.isMobile('LG-T5100 UP.Browser/6.2.3 (GUI) MMP/1.0 Profile/MIDP-1.0 Configuration/CLDC-1.0'));
		// LG U8120
		assertTrue(variables.browser.isMobile('LG/U8120/v1.0'));
		// LG U8130
		assertTrue(variables.browser.isMobile('LG/U8130/v1.0'));
		// LG U8138
		assertTrue(variables.browser.isMobile('LG/U8138/v2.0'));
		// LG U8180
		assertTrue(variables.browser.isMobile('LG/U8180/v1.0'));
		// LG VX9100
		assertTrue(variables.browser.isMobile('LGE-VX9100/1.0 UP.Browser/6.2.3.2 (GUI) MMP/2.0'));
	}
	
	/**
	 * KDE Konqueror 4.4
	 */
	public void function testIsMobile_kde_knoqueror4_4_notMobile() {
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (compatible; Konqueror/4.4; Linux) KHTML/4.4.1 (like Gecko) Fedora/4.4.1-1.fc12'));
	}
	
	/**
	 * KDE Konqueror 4.3
	 */
	public void function testIsMobile_kde_knoqueror4_3_notMobile() {
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (compatible; Konqueror/4.3; Linux) KHTML/4.3.1 (like Gecko) Fedora/4.3.1-3.fc11'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (compatible; Konqueror/4.3; Linux 2.6.31-16-generic; X11) KHTML/4.3.2 (like Gecko)'));
	}
	
	/**
	 * KDE Konqueror 4.2
	 */
	public void function testIsMobile_kde_knoqueror4_2_notMobile() {
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (compatible; Konqueror/4.2; Linux; X11; x86_64) KHTML/4.2.4 (like Gecko) Fedora/4.2.4-2.fc11'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (compatible; Konqueror/4.2; Linux) KHTML/4.2.98 (like Gecko)'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (compatible; Konqueror/4.2; Linux) KHTML/4.2.96 (like Gecko)'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (compatible; Konqueror/4.2; Linux) KHTML/4.2.4 (like Gecko) Slackware/13.0'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (compatible; Konqueror/4.2; Linux) KHTML/4.2.4 (like Gecko) Fedora/4.2.4-2.fc11'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (compatible; Konqueror/4.2; Linux) KHTML/4.2.2 (like Gecko)'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (compatible; Konqueror/4.2; Linux) KHTML/4.2.1 (like Gecko) Fedora/4.2.1-4.fc11'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (compatible; Konqueror/4.2) KHTML/4.2.4 (like Gecko) Fedora/4.2.4-2.fc11'));
	}
	
	/**
	 * KDE Konqueror 4.1
	 */
	public void function testIsMobile_kde_knoqueror4_1_notMobile() {
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (compatible; Konqueror/4.1; OpenBSD) KHTML/4.1.4 (like Gecko)'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (compatible; Konqueror/4.1; Linux) KHTML/4.1.4 (like Gecko)'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (compatible; Konqueror/4.1; Linux) KHTML/4.1.3 (like Gecko) Fedora/4.1.3-3.fc10'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (compatible; Konqueror/4.1; Linux 2.6.27.7-134.fc10.x86_64; X11; x86_64) KHTML/4.1.3 (like Gecko) Fedora/4.1.3-4.fc10'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (compatible; Konqueror/4.1; DragonFly) KHTML/4.1.4 (like Gecko)'));
	}
	
	/**
	 * KDE Konqueror 4.0
	 */
	public void function testIsMobile_kde_knoqueror4_0_notMobile() {
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (compatible; Konqueror/4.0; X11) KHTML/4.0.3 (like Gecko)'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (compatible; Konqueror/4.0; Windows) KHTML/4.0.83 (like Gecko)'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (compatible; Konqueror/4.0; Linux; x86_64) KHTML/4.0.2 (like Gecko)'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (compatible; Konqueror/4.0; Linux) KHTML/4.0.82 (like Gecko)'));
	}
	
	/**
	 * Microsoft IE 7.0
	 */
	public void function testIsMobile_microsoft_ie70_notMobile() {
				assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; U; MSIE 7.0; Windows NT 6.0; en-US'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; U; MSIE 7.0; Windows NT 6.0; el-GR'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (MSIE 7.0; Macintosh; U; SunOS; X11; gu; SV1; InfoPath.2; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (compatible; MSIE 7.0; Windows NT 6.0; WOW64; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; c .NET CLR 3.0.04506; .NET CLR 3.5.30707; InfoPath.1; el-GR'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; c .NET CLR 3.0.04506; .NET CLR 3.5.30707; InfoPath.1; el-GR'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (compatible; MSIE 7.0; Windows NT 6.0; fr-FR'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (compatible; MSIE 7.0; Windows NT 6.0; en-US'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (compatible; MSIE 7.0; Windows NT 5.2; WOW64; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.79 [en] (compatible; MSIE 7.0; Windows NT 5.0; .NET CLR 2.0.50727; InfoPath.2; .NET CLR 1.1.4322; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (Windows; MSIE 7.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (Mozilla/4.0; MSIE 7.0; Windows NT 5.1; FDM; SV1; .NET CLR 3.0.04506.30'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (Mozilla/4.0; MSIE 7.0; Windows NT 5.1; FDM; SV1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible;MSIE 7.0;Windows NT 6.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.1; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0;'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; YPC 3.2.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; InfoPath.2; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; YPC 3.2.0; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.0.04506'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; WOW64; SLCC1; Media Center PC 5.0; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; WOW64; SLCC1; .NET CLR 3.0.04506'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; WOW64; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; InfoPath.2; .NET CLR 3.5.30729; .NET CLR 3.0.30618; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; WOW64; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; InfoPath.2; .NET CLR 1.1.4322; .NET CLR 3.5.30729; .NET CLR 3.0.30618; FDM'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; WOW64; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.5.30707; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; WOW64; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.5.21022; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; WOW64; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.5.21022; .NET CLR 3.5.30428; .NET CLR 3.0.30422'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; WOW64; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; WOW64; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.30618; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; WOW64; SLCC1; .NET CLR 2.0.50727; InfoPath.2; .NET CLR 3.5.21022; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; WOW64; SLCC1; .NET CLR 2.0.50727; InfoPath.2; .NET CLR 3.5.21022; .NET CLR 1.1.4322; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; WOW64; SLCC1; .NET CLR 2.0.50727; InfoPath.2; .NET CLR 3.0.30618; .NET CLR 3.5.30729; Media Center PC 5.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; WOW64; SLCC1; .NET CLR 2.0.50727; InfoPath.2; .NET CLR 1.1.4322; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; WOW64; SLCC1; .NET CLR 2.0.50727; InfoPath.1; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; WOW64; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; WOW64; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.5.21022; InfoPath.2; MS-RTC LM 8; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; WOW64; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.5.21022; InfoPath.2; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; WOW64; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.5.21022; .NET CLR 3.0.30618; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; WOW64; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.0.30729; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; WOW64; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.0.04506; Zango 10.3.75.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; WOW64; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.0.04506; Media Center PC 5.0; .NET CLR 3.5.21022; MEGAUPLOAD 2.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; WOW64; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.0.04506; Media Center PC 5.0; .NET CLR 3.5.21022; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; WOW64; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.0.04506; Media Center PC 5.0; .NET CLR 1.1.4322; .NET CLR 3.5.21022'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; WOW64; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.0.04506; InfoPath.1; Media Center PC 5.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; WOW64; SLCC1; .NET CLR 2.0.50727; .NET CLR 1.1.4322; InfoPath.2; MS-RTC LM 8; .NET CLR 3.5.21022; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; WOW64; SLCC1; .NET CLR 2.0.50727; .NET CLR 1.1.4322; InfoPath.2; .NET CLR 3.5.21022; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; WOW64; SLCC1; .NET CLR 2.0.50727; .NET CLR 1.1.4322; InfoPath.2; .NET CLR 3.5.21022; .NET CLR 3.0.30729; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; WOW64; SLCC1; .NET CLR 1.1.4322; InfoPath.2; MS-RTC LM 8; .NET CLR 3.5.30729; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; WOW64; SLCC1; .NET CLR 1.1.4322; InfoPath.2; MS-RTC LM 8; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; WOW64; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.5.30729; .NET CLR 3.0.30618; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; WOW64; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.5.21022; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; WOW64; GTB6; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; InfoPath.2; .NET CLR 3.5.21022; .NET CLR 3.5.30729; .NET CLR 3.0.30618; .NET CLR 1.1.4322; MS-RTC LM 8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; WOW64; GTB6; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.0.04506; Media Center PC 5.0; InfoPath.2; .NET CLR 3.5.21022; .NET CLR 1.1.4322; MS-RTC LM 8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; WOW64; GTB5; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; Media Center PC 5.1; .NET CLR 3.5.21022; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; WOW64; GTB5; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; InfoPath.2; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; WOW64; GTB5; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; WOW64; GTB5; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.5.21022; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; WOW64; GTB5; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.5.21022; .NET CLR 3.0.30618; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; WOW64; GTB5; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.0.04506; Media Center PC 5.0; InfoPath.2; .NET CLR 3.5.21022; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; WOW64; FunWebProducts; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; InfoPath.2; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; WOW64; chromeframe; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30618; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; Win64; x64; .NET CLR 2.0.50727; SLCC1; Media Center PC 5.1; .NET CLR 3.5.21022; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; Win64; x64; .NET CLR 2.0.50727; SLCC1; Media Center PC 5.0; .NET CLR 3.5.30729; .NET CLR 3.0.30618; Tablet PC 2.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; Win64; x64; .NET CLR 2.0.50727; SLCC1; .NET CLR 3.0.30618; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; User-agent: Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1;); SLCC1; .NET CLR 2.0.50727; .NET CLR 1.1.4322; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; Tablet PC 2.0; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SV1; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.5.30729; .NET CLR 3.0.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SV1; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 1.1.4322; .NET CLR 3.5.30729; .NET CLR 3.0.30618; MSN Optimized;US'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SV1; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.0.04506; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SV1; SLCC1; .NET CLR 2.0.50727; .NET CLR 1.1.4322; .NET CLR 3.5.21022; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SV1; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SV1; InfoPath.1; .NET CLR 1.1.4322; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SV1; FunWebProducts; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.04506; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; Zango 10.3.75.0; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; MS-RTC LM 8; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.1; .NET CLR 3.5.21022; .NET CLR 3.0.30618; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; Tablet PC 2.0; .NET CLR 3.5.30729; .NET CLR 3.0.30618; InfoPath.1; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; Tablet PC 2.0; .NET CLR 3.5.21022; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; InfoPath.2; FDM; .NET CLR 3.5.21022; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; InfoPath.2; Dealio Toolbar 3.4; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; InfoPath.2; .NET CLR 3.5.30729; .NET CLR 3.0.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; InfoPath.2; .NET CLR 3.5.21022; MS-RTC LM 8; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.5.30729; .NET CLR 3.0.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.5.30729; .NET CLR 3.0.30618; yie8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.5.30729; .NET CLR 3.0.30618; .NET CLR 1.1.4322; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.5.21022; InfoPath.2; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.5.21022; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.5.21022; .NET CLR 1.1.4322; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.30618; InfoPath.2; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.30618; .NET CLR 3.5.30729; Tablet PC 2.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.30618; .NET CLR 3.5.30729; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.30618; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.30618; .NET CLR 3.5.30628'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.04506; Zango 10.3.70.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.04506; Zango 10.0.370.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.04506; Tablet PC 2.0; InfoPath.2; .NET CLR 3.5.21022'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.04506; Seekmo 10.0.406.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.04506; PeoplePal 3.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.04506; MEGAUPLOAD 2.0; .NET CLR 3.5.21022'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.04506; InfoPath.2; Seekmo 10.0.341.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.04506; InfoPath.2; .NET CLR 3.5.21022; Tablet PC 2.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.04506; InfoPath.1; Windows-Media-Player/10.00.00.3990'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.04506; InfoPath.1; MS-RTC LM 8; .NET CLR 3.5.21022'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.04506; FDM; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.04506; FDM; .NET CLR 3.5.21022'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.04506; Alexa Toolbar; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.04506; .NET CLR 1.1.4322; Zango 10.3.65.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.04506; .NET CLR 1.1.4322; Zango 10.3.37.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.04506; .NET CLR 1.1.4322; Windows-Media-Player/10.00.00.3990'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.04506; .NET CLR 1.1.4322; Tablet PC 2.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.04506; .NET CLR 1.1.4322; InfoPath.2; Zango 10.3.75.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.04506; .NET CLR 1.1.4322; FDM'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.04506; .NET CLR 1.0.3705'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 1.1.4322; .NET CLR 3.5.21022; InfoPath.2; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 1.1.4322; .NET CLR 3.0.04506; Tablet PC 2.0; Zango 10.3.65.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; InfoPath.2; Zango 10.3.37.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; InfoPath.2; MS-RTC LM 8; .NET CLR 3.5.30729; .NET CLR 3.0.30618; FDM'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; InfoPath.2; .NET CLR 3.0.30618; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; InfoPath.2; .NET CLR 3.0.30618; .NET CLR 3.5.21022'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; InfoPath.2; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; InfoPath.2; .NET CLR 3.0.04506; .NET CLR 3.5.21022; MS-RTC LM 8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; InfoPath.2; .NET CLR 3.0.04506; .NET CLR 3.5.21022; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; InfoPath.2; .NET CLR 1.1.4322; .NET CLR 3.5.30729; .NET CLR 3.0.30618; Zune 3.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; InfoPath.2; .NET CLR 1.1.4322; .NET CLR 3.5.30729; .NET CLR 3.0.30618; MS-RTC LM 8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; InfoPath.1; .NET CLR 3.5.21022; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30618; Zango 10.3.75.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30618; FDM'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30618; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.5.21022; MS-RTC LM 8; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.5.21022; InfoPath.2; .NET CLR 3.5.30729; .NET CLR 3.0.30618; FDM'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.5.21022; InfoPath.2; .NET CLR 1.1.4322; .NET CLR 3.5.30428; .NET CLR 3.0.30422'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.5.21022; InfoPath.1; .NET CLR 1.1.4322; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.5.21022; .NET CLR 3.5.30729; .NET CLR 3.0.30618; yie8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.5.21022; .NET CLR 3.5.30729; .NET CLR 3.0.30618; MS-RTC LM 8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.5.21022; .NET CLR 3.0.04506; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.0.04506; Zango 10.3.74.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.0.04506; Zango 10.3.37.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.0.04506; Zango 10.3.35.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.0.04506; Tablet PC 2.0; InfoPath.2; .NET CLR 3.5.21022; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.0.04506; Tablet PC 2.0; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.0.04506; Tablet PC 2.0; .NET CLR 1.1.4322; InfoPath.2; .NET CLR 3.5.21022'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.0.04506; InfoPath.2; FDM'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.0.04506; InfoPath.2; .NET CLR 3.5.21022; Tablet PC 2.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.0.04506; InfoPath.2; .NET CLR 3.5.21022; FDM'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.0.04506; InfoPath.2; .NET CLR 1.1.4322; FDM'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.0.04506; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.0.04506; .NET CLR 3.5.21022; .NET CLR 1.1.4322; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.0.04506; .NET CLR 1.1.4322; Zune 3.0; MS-RTC LM 8; InfoPath.3'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.0.04506; .NET CLR 1.0.3705; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; .NET CLR 1.1.4322; InfoPath.2; MS-RTC LM 8; .NET CLR 3.5.20706; .NET CLR 3.0.590'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; .NET CLR 1.1.4322; InfoPath.2; .NET CLR 3.5.21022; .NET CLR 3.5.30729; OfficeLiveConnector.1.3; OfficeLivePatch.0.0; .NET CLR 3.0.30729; MS-RTC LM 8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; .NET CLR 1.1.4322; .NET CLR 3.5.21022; InfoPath.2; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; .NET CLR 1.1.4322; .NET CLR 3.5.21022; .NET CLR 3.0.04506'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1); SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; SLCC1; .NET CLR 2.0.50727; Seekmo 10.0.406.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; InfoPath.2; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.04506; Zango 10.3.75.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.04506; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.04506; .NET CLR 1.1.4322; Zango 10.3.65.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.04506; .NET CLR 1.1.4322; .NET CLR 3.5.21022'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.0.04506; .NET CLR 1.1.4322; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; SLCC1; .NET CLR 2.0.50727; .NET CLR 1.1.4322; InfoPath.1; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; SLCC1; .NET CLR 2.0.50727; .NET CLR 1.1.4322; .NET CLR 3.5.21022; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; MathPlayer 2.10d; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; MathPlayer 2.10d; GTB5; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.30618; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; MathPlayer 2.10d; GTB5; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.04506; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; InfoPath.1; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; GTB6; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; InfoPath.2; .NET CLR 3.5.30729; .NET CLR 3.0.30618; Zune 3.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; GTB6; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.30618; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; GTB6; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.04506; InfoPath.2; Zune 2.5; OfficeLiveConnector.1.3; OfficeLivePatch.0.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; GTB6; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.04506; InfoPath.2; .NET CLR 1.1.4322; Dealio Toolbar 3.4'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; GTB6; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.04506; InfoPath.2; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; GTB6; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.04506; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; GTB6; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.04506; Dealio Toolbar 3.4; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; GTB6; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.0.04506; AskTB5.3'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; GTB6; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.0.04506; .NET CLR 1.1.4322; InfoPath.1; Zune 3.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; GTB6; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.0.04506; .NET CLR 1.1.4322; InfoPath.1; Zune 2.5'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; GTB6; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.0.04506; .NET CLR 1.1.4322; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; GTB6.4; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.0.30618; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; GTB6.3; FBSMTWB; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.5.30729; .NET CLR 3.0.30618; OfficeLiveConnector.1.3; OfficeLivePatch.0.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; GTB5; SLCC1; .NET CLR 2.0.50727; Seekmo 10.0.406.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; GTB5; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.1; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; GTB5; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; Tablet PC 2.0; .NET CLR 3.5.21022; .NET CLR 3.5.30729; .NET CLR 3.0.04506'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; GTB5; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; Tablet PC 2.0; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; GTB5; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; InfoPath.2; FDM; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; GTB5; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; InfoPath.2; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; GTB5; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; InfoPath.2; .NET CLR 3.5.21022; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; GTB5; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; InfoPath.2; .NET CLR 3.0.04506'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; GTB5; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; InfoPath.1; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; GTB5; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.5.30729; .NET CLR 3.0.30618; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; GTB5; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.5.30729; .NET CLR 3.0.30618; FDM'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; GTB5; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.04506; Zune 3.0; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; GTB5; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.04506; InfoPath.2; .NET CLR 3.5.21022'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; GTB5; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.04506; InfoPath.2; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; GTB5; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.04506; FDM'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; GTB5; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.04506; .NET CLR 1.1.4322; .NET CLR 3.5.21022; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; GTB5; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 1.1.4322; .NET CLR 3.5.21022; InfoPath.2; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; GTB5; SLCC1; .NET CLR 2.0.50727; InfoPath.2; .NET CLR 1.1.4322; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; GTB5; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.0.04506; Media Center PC 5.1; .NET CLR 3.5.21022'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; GTB5; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.0.04506; Media Center PC 5.1; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; GTB5; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.0.04506; InfoPath.1; FDM'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; GTB5; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.0.04506; .NET CLR 1.1.4322; MS-RTC LM 8; InfoPath.2; OfficeLiveConnector.1.2; Zune 3.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; GTB5; SLCC1; .NET CLR 2.0.50727; .NET CLR 1.1.4322; .NET CLR 3.5.21022; .NET CLR 3.0.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; GTB5; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; InfoPath.1; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; GTB5; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; SLCC1; .NET CLR 2.0.50727; InfoPath.1; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; GTB5; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30618; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; GTB5; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.0.04506; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; GTB5; MathPlayer 2.10d; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.04506; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; GTB5; FunWebProducts; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; InfoPath.1; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; GTB5; FunWebProducts; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; GTB5; FunWebProducts; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; SLCC1; .NET CLR 2.0.50727; InfoPath.2; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; GTB5; FunWebProducts; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.0.04506'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; GTB5; (R1 1.5); SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.04506; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; GTB5; (R1 1.5); SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.04506; .NET CLR 3.5.21022'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; FunWebProducts; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; InfoPath.2; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; FunWebProducts; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; FunWebProducts; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.04506; Zango 10.3.74.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; FunWebProducts; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.04506; InfoPath.2; Seekmo 10.0.406.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; FunWebProducts; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.04506; .NET CLR 1.1.4322; InfoPath.2; Zango 10.3.74.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; FunWebProducts; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.04506; .NET CLR 1.1.4322; AskTB5.3'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; FunWebProducts; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; SLCC1; .NET CLR 2.0.50727; Seekmo 10.0.406.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; FunWebProducts; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.04506; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; FunWebProducts; GTB6; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.0.04506'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; FunWebProducts; GTB5; SLCC1; .NET CLR 2.0.50727; Zango 10.3.75.0; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; FunWebProducts; GTB5; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; InfoPath.2; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; FunWebProducts; GTB5; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.04506; Tablet PC 2.0; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; FunWebProducts; GTB5; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.04506; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; FunWebProducts; GTB5; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 1.1.4322; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; chromeframe; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.0.30618; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; chromeframe; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.0.04506; MS-RTC LM 8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; Alexa Toolbar'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; ABPlayer_1.3.22; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.5.21022; InfoPath.2; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.04506; FDM'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.04506; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; .NET CLR 2.0.50727; .NET CLR 3.0.04506'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; .NET CLR 1.1.4322; InfoPath.2; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; (R1 1.6); SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.04506; InfoPath.2; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; (R1 1.6); SLCC1; .NET CLR 2.0.50727; .NET CLR 1.1.4322; InfoPath.2; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; (R1 1.5); SLCC1; .NET CLR 2.0.50727; .NET CLR 3.0.04506; InfoPath.2; FDM'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0 SLCC1; .NET CLR 2.0.50727; .NET CLR 3.0.04506'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.5'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2; WOW64; Seekmo 10.0.431.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2; WOW64; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; FDM; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2; WOW64; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 1.1.4322; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2; WOW64; InfoPath.2; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2; WOW64; InfoPath.1; .NET CLR 2.0.50727; .NET CLR 1.1.4322; .NET CLR 3.0.04506.30'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2; WOW64; InfoPath.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2; WOW64; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2; WOW64; .NET CLR 2.0.50727; InfoPath.2; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 1.1.4322; MS-RTC LM 8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2; WOW64; .NET CLR 2.0.50727; InfoPath.1; SV1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2; WOW64; .NET CLR 2.0.50727; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2; WOW64; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2; WOW64; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2; WOW64; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2; WOW64; .NET CLR 2.0.50727; .NET CLR 3.0.04506.590; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2; WOW64; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; InfoPath.2; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2; WOW64; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2; WOW64; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2; WOW64; .NET CLR 2.0.50727; .NET CLR 1.1.4322; .NET CLR 3.0.04506.30'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2; WOW64; .NET CLR 2.0.50727; .NET CLR 1.1.4322; .NET CLR 3.0.04506.03'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2; WOW64; .NET CLR 2.0.50727; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2; WOW64; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2; WOW64; .NET CLR 1.1.4322; InfoPath.2; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2; WOW64; .NET CLR 1.1.4322; InfoPath.1; .NET CLR 3.0.04506.30; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2; WOW64; .NET CLR 1.1.4322; InfoPath.1; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2; WOW64; .NET CLR 1.1.4322; .NET CLR 2.0.50727; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2; WOW64; .NET CLR 1.1.4322; .NET CLR 2.0.50727; InfoPath.1; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2; WOW64; .NET CLR 1.1.4322; .NET CLR 2.0.50727; InfoPath.1; .NET CLR 3.0.04506.30'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2; WOW64; .NET CLR 1.1.4322; .NET CLR 2.0.50727; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2; WOW64; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2; WOW64; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; InfoPath.2; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2; WOW64; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; InfoPath.2; .NET CLR 3.0.04506.648'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2; WOW64; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2; WOW64; .NET CLR 1.1.4322; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2; WOW64'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2; Win64; x64; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2; Win64; x64; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2; SV1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2; Q312461; .NET CLR 1.0.3705; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2; MathPlayer 2.10; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2; GTB6; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2; GTB6; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; InfoPath.2; .NET CLR 3.5.21022; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; MS-RTC LM 8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2; GTB5; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2; FunWebProducts; .NET CLR 1.1.4322; InfoPath.2; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2; .NET CLR 2.0.50727; FDM'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2; .NET CLR 1.1.4322; InfoPath.2; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2; .NET CLR 1.1.4322; InfoPath.1; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2; .NET CLR 1.1.4322; .NET CLR 3.0.04506.30'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2; .NET CLR 1.1.4322; .NET CLR 2.0.50727; WinFX RunTime 3.0.50727; InfoPath.2; .NET CLR 3.0.04506.30'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2; .NET CLR 1.1.4322; .NET CLR 2.0.50727; InfoPath.2; .NET CLR 3.0.04506.30'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2; .NET CLR 1.1.4322; .NET CLR 2.0.50727; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2; .NET CLR 1.1.4322; .NET CLR 2.0.50727; InfoPath.1; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2; .NET CLR 1.1.4322; .NET CLR 2.0.50727; InfoPath.1; .NET CLR 3.0.04506.30'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2; .NET CLR 1.1.4322; .NET CLR 2.0.50727; Avalon 6.0.5070; WinFX RunTime 3.0.50727; .NET CLR 3.0.04506.30'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; InfoPath.2; .NET CLR 3.0.04506.648'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; InfoPath.1; .NET CLR 3.0.04506.648; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; FDM; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; InfoPath.2; .NET CLR 3.5.21022; MS-RTC LM 8; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; InfoPath.2; .NET CLR 3.5.21022; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; MS-RTC LM 8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; InfoPath.1; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; FDM; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2; .NET CLR 1.1.4322; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2; .NET CLR 1.1.4322; .NET CLR 1.0.3705; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1;'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; zh-cn'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Zango 10.3.75.0; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Zango 10.0.370.0; .NET CLR 2.0.50727; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; YPC 3.2.0; yplus 5.3.04b'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; YPC 3.2.0; SV1; FunWebProducts; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; YPC 3.2.0; Media Center PC 3.0; .NET CLR 1.0.3705; .NET CLR 1.1.4322; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; YPC 3.2.0; GTB5; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; .NET CLR 1.1.4322; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; YPC 3.2.0; GTB5; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 4.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; YPC 3.2.0; GTB5; .NET CLR 2.0.50727; yplus 5.3.04b'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; YPC 3.2.0; GTB5; .NET CLR 1.1.4322; yplus 5.3.04b'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; YPC 3.2.0; GTB5; .NET CLR 1.1.4322; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; YPC 3.2.0; GTB5; .NET CLR 1.1.4322; .NET CLR 2.0.50727; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; YPC 3.2.0; GTB5; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; YPC 3.2.0; GTB5; .NET CLR 1.0.3705; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; .NET CLR 1.1.4322; Media Center PC 4.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; YPC 3.2.0; FunWebProducts; PeoplePal 3.0; yplus 5.6.04b'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; YPC 3.2.0; FunWebProducts; GTB5; .NET CLR 1.1.4322; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; YPC 3.2.0; FunWebProducts; .NET CLR 1.1.4322; Zango 10.0.314.0; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; YPC 3.2.0; FunWebProducts; .NET CLR 1.1.4322; .NET CLR 2.0.50727; yplus 5.3.04b'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; YPC 3.2.0; FunWebProducts; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 4.0; .NET CLR 2.0.50727; InfoPath.1; yplus 5.3.04b'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; YPC 3.2.0; FunWebProducts; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 4.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; YPC 3.2.0; .NET CLR 2.0.50727; yplus 5.1.04b'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; YPC 3.2.0; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; YPC 3.2.0; .NET CLR 1.1.4322; Zango 10.0.314.0; yplus 5.1.02b'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; YPC 3.2.0; .NET CLR 1.1.4322; InfoPath.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; YPC 3.2.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727; Seekmo 10.0.424.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; YPC 3.2.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727; Seekmo 10.0.345.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; YPC 3.2.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; YPC 3.2.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; YPC 3.2.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; YPC 3.2.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; YPC 3.2.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; YPC 3.2.0; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; YPC 3.2.0; .NET CLR 1.0.3705; .NET CLR 2.0.50727; .NET CLR 1.1.4322; Media Center PC 4.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; YPC 3.2.0; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 4.0; .NET CLR 2.0.50727; yplus 5.5.04b'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; YPC 3.2.0; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 4.0; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; yplus 5.1.04b'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; YPC 3.2.0; (R1 1.5); .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; YPC 3.2.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; YPC 3.0.3; yplus 4.2.00b'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; YPC 3.0.3; .NET CLR 1.1.4322; yplus 5.1.04b'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; YPC 3.0.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; YPC 3.0.0; .NET CLR 1.1.4322; InfoPath.1; .NET CLR 2.0.50727; Zango 10.3.36.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; YComp 5.0.0.0; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; YComp 5.0.0.0; .NET CLR 1.0.3705'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Wysigot 5.5; .NET CLR 2.0.50727; .NET CLR 3.0.04307.00; FDM; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Wanadoo 6.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Trident/4.0; GTB5; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 4.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Tablet PC 1.7; .NET CLR 1.0.3705; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Tablet PC 1.7; .NET CLR 1.0.3705; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Tablet PC 1.7; .NET CLR 1.0.3705; .NET CLR 1.1.4322; InfoPath.2; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Tablet PC 1.7; .NET CLR 1.0.3705; .NET CLR 1.1.4322; InfoPath.1; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Tablet PC 1.7; .NET CLR 1.0.3705; .NET CLR 1.1.4322; .NET CLR 2.0.50727; Zango 10.3.75.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Tablet PC 1.7; .NET CLR 1.0.3705; .NET CLR 1.1.4322; .NET CLR 2.0.50727; WinFX RunTime 3.0.50727; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Tablet PC 1.7; .NET CLR 1.0.3705; .NET CLR 1.1.4322; .NET CLR 2.0.50727; MS-RTC LM 8; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Tablet PC 1.7; .NET CLR 1.0.3705; .NET CLR 1.1.4322; .NET CLR 2.0.50727; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Tablet PC 1.7; .NET CLR 1.0.3705; .NET CLR 1.1.4322; .NET CLR 2.0.50727; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Tablet PC 1.7; .NET CLR 1.0.3705; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; InfoPath.2; .NET CLR 3.0.04506.648'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Tablet PC 1.7; .NET CLR 1.0.3705; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Tablet PC 1.7; .NET CLR 1.0.3705; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Tablet PC 1.7; .NET CLR 1.0.3705; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Tablet PC 1.7; .NET CLR 1.0.3705; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; T312461; GTB5; InfoPath.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; YPC 3.2.0; InfoPath.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; YPC 3.2.0; FunWebProducts; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 3.1; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; Wanadoo 6.2; .NET CLR 1.1.4322; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; Tablet PC 1.7; .NET CLR 1.0.3705; .NET CLR 1.1.4322; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; Stardock Blog Navigator 1.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1) ; .NET CLR 2.0.50727; FDM'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; .NET CLR 2.0.50727; FDM'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; iOpus-I-M; .NET CLR 1.1.4322; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; iOpus-I-M; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; InfoPath.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; HbTools 4.8.4'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; GTB5; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; FunWebProducts; Zango 10.0.341.0; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; FunWebProducts; GTB5; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; FunWebProducts; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; FunWebProducts; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; FDM'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; Alexa Toolbar'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727; FDM'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727; .NET CLR 1.1.4322; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727; .NET CLR 1.1.4322; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322; InfoPath.2; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322; InfoPath.1; Alexa Toolbar'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322; InfoPath.1; .NET CLR 2.0.50727; Avalon 6.0.5070; WinFX RunTime 3.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322; InfoPath.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322; InfoPath.1; .NET CLR 2.0.50727; .NET CLR 1.0.3705'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322; FDM; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322; FDM'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322; .NET CLR 3.0.04506.03'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; WinFX RunTime 3.0.50727; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; FDM'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; Alexa Toolbar'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; InfoPath.2; InfoPath.1; .NET CLR 3.0.04506.648'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322; .NET CLR 2.0.50215'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322; .NET CLR 1.0.3705; InfoPath.1; .NET CLR 2.0.50727; WinFX RunTime 3.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Tablet PC 1.7; .NET CLR 2.0.40607'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 4.0; Media Center PC 2.8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 4.0; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 4.0; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 4.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 3.1; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 3.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; .NET CLR 1.0.3705; .NET CLR 1.1.4322; InfoPath.2; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; .NET CLR 1.0.3705; .NET CLR 1.1.4322; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; .NET CLR 1.0.3705; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; (R1 1.5); .NET CLR 1.1.4322; InfoPath.1; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; (R1 1.5); .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; (R1 1.5); .NET CLR 1.0.3705; .NET CLR 1.1.4322; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1; (R1 1.3)'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Stardock Blog Navigator 1.1; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SiteKiosk 6.5 Build 150'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Seekmo 10.0.406.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Seekmo 10.0.345.0; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Q312461; YPC 3.2.0; FunWebProducts; .NET CLR 1.1.4322; PeoplePal 6.1; PeoplePal 3.0; yplus 5.1.03b'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Q312461; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; MS-RTC LM 8; .NET CLR 2.0.50727; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; MRA 5.2 (build 02405); GTB6.3; InfoPath.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; MRA 4.2 (build 01102); GTB6.3; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; SV1) ; .NET CLR 3.0.04506.648; MEGAUPLOAD 2.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; Zango 10.3.37.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; Zango 10.1.181.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; Zango 10.0.314.0; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; chromeframe; InfoPath.1; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; .NET CLR 2.0.50727; Zango 10.3.36.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; .NET CLR 2.0.50727; Seekmo 10.0.431.0; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; .NET CLR 2.0.50727; InfoPath.1; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; Zango 10.3.36.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 1.1.4322; .NET CLR 3.0.04506.648; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; .NET CLR 2.0.50727; .NET CLR 1.1.4322; Seekmo 10.0.427.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; .NET CLR 1.1.4322; InfoPath.1; .NET CLR 2.0.50727; Zango 10.1.181.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; .NET CLR 1.1.4322; .NET CLR 2.0.50727; Zango 10.3.74.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; .NET CLR 1.1.4322; .NET CLR 2.0.50727; Zango 10.3.37.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; .NET CLR 1.1.4322; .NET CLR 2.0.50727; Zango 10.1.181.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; InfoPath.2; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; .NET CLR 1.0.3705; Media Center PC 4.0; InfoPath.2; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; .NET CLR 1.0.3705; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 4.0; MEGAUPLOAD 2.0; Seekmo 10.0.341.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 4.0; InfoPath.1; .NET CLR 2.0.50727; Zango 10.3.37.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 4.0; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; .NET CLR 1.0.3705; .NET CLR 1.1.4322; .NET CLR 2.0.50727; Media Center PC 4.0; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; (R1 1.6); .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; MEGAUPLOAD 2.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Media Center PC 3.0; .NET CLR 1.0.3705; FDM; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Media Center PC 3.0; .NET CLR 1.0.3705; .NET CLR 2.0.50727; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Media Center PC 3.0; .NET CLR 1.0.3705; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Media Center PC 3.0; .NET CLR 1.0.3705; .NET CLR 2.0.50727; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Media Center PC 3.0; .NET CLR 1.0.3705; .NET CLR 1.1.4322; .NET CLR 2.0.50727; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Media Center PC 3.0; .NET CLR 1.0.3705; .NET CLR 1.1.4322; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Media Center PC 3.0; .NET CLR 1.0.3705; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; MathPlayer 2.10d; GTB6; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; MathPlayer 2.10d; .NET CLR 1.1.4322; InfoPath.2; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; MathPlayer 2.10d; .NET CLR 1.1.4322; .NET CLR 2.0.50727; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; MathPlayer 2.10d; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; MathPlayer 2.10d; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; InfoPath.2; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; MathPlayer 2.10d; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; MathPlayer 2.10d; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 4.0; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; MathPlayer 2.10b; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; MathPlayer 2.10b; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; InfoPath.2; .NET CLR 3.5.21022'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; MathPlayer 2.10b; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; MathPlayer 2.10b; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; MathPlayer 2.10b; .NET CLR 1.0.3705; .NET CLR 1.1.4322; .NET CLR 2.0.50727; Media Center PC 4.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; MathPlayer 2.10b; (R1 1.1); .NET CLR 2.0.50727; .NET CLR 1.1.4322; InfoPath.2; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; MathPlayer 2.0; InfoPath.1; .NET CLR 2.0.50727; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; MathPlayer 2.0; GTB5; .NET CLR 1.1.4322; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; MathPlayer 2.0; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; MathPlayer 2.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; iOpus-I-M; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.577; .NET CLR 3.5.20526'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; iOpus-I-M; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; iOpus-I-M; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.590'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; iOpus-I-M; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; InfoPath.2; AskTB5.3'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; InfoPath.2; Alexa Toolbar; .NET CLR 1.1.4322; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; InfoPath.2; .NET CLR 2.0.50727; Windows-Media-Player/10.00.00.3990'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; InfoPath.2; .NET CLR 2.0.50727; FDM; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; InfoPath.2; .NET CLR 2.0.50727; Alexa Toolbar; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; InfoPath.2; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; InfoPath.2; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 1.1.4322; MS-RTC LM 8; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; InfoPath.2; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 1.1.4322; MS-RTC LM 8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; InfoPath.2; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; InfoPath.2; .NET CLR 2.0.50727; .NET CLR 1.1.4322; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; InfoPath.2; .NET CLR 2.0.50727; .NET CLR 1.1.4322; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.590; .NET CLR 3.5.20706'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; InfoPath.2; .NET CLR 2.0.50727; .NET CLR 1.1.4322; .NET CLR 3.0.04506.30'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; InfoPath.2; .NET CLR 2.0.50727; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; InfoPath.2; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; InfoPath.2; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; OfficeLiveConnector.1.3; OfficeLivePatch.0.0; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; InfoPath.2; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; InfoPath.2; .NET CLR 1.1.4322; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; InfoPath.1; Zango 10.0.370.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; InfoPath.1; Seekmo 10.0.406.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; InfoPath.1; MS-RTC LM 8; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; InfoPath.1; MS-RTC LM 8; .NET CLR 1.1.4322; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; InfoPath.1; .NET CLR 2.0.50727; Zango 10.3.75.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; InfoPath.1; .NET CLR 2.0.50727; MS-RTC LM 8; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; InfoPath.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; MS-RTC LM 8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; InfoPath.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; MS-RTC LM 8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; InfoPath.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 1.1.4322; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; InfoPath.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 1.1.4322; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; InfoPath.1; .NET CLR 2.0.50727; .NET CLR 1.1.4322; MS-RTC LM 8; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; InfoPath.1; .NET CLR 2.0.50727; .NET CLR 1.1.4322; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; InfoPath.1; .NET CLR 2.0.50727; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; InfoPath.1; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; InfoPath.1; .NET CLR 1.1.4322; msn Optimized IE build03;JP'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; InfoPath.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; Zango 10.3.65.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; InfoPath.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; HbTools 4.8.4; Zango 10.0.275.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; InfoPath.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; Alexa Toolbar; MEGAUPLOAD 1.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; InfoPath.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 3.0.4506.2152'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; InfoPath.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; InfoPath.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; InfoPath.1; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; iebar; GTB5; .NET CLR 1.1.4322; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; iebar; .NET CLR 1.0.3705; .NET CLR 1.1.4322; .NET CLR 2.0.50727; Zango 10.1.181.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Hotbar 4.5.0.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB6; OfficeLiveConnector.1.3; OfficeLivePatch.0.0; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB6; InfoPath.2; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB6; InfoPath.2; .NET CLR 1.1.4322; .NET CLR 2.0.50727; Zune 3.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB6; InfoPath.1; FDM; OfficeLiveConnector.1.3; OfficeLivePatch.0.0; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB6; InfoPath.1; .NET CLR 2.0.50727; FDM; .NET CLR 3.0.04506.30; .NET CLR 1.1.4322; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB6; InfoPath.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB6; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB6; .NET CLR 2.0.50727; .NET CLR 1.1.4322; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB6; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB6; .NET CLR 1.1.4322; .NET CLR 2.0.50727; Zune 2.5; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB6; .NET CLR 1.1.4322; .NET CLR 2.0.50727; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB6; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB6; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; Zune 3.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB6; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB6; .NET CLR 1.1.4322; .NET CLR 1.0.3705; .NET CLR 2.0.50727; InfoPath.1; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB6; .NET CLR 1.0.3705; .NET CLR 1.1.4322; .NET CLR 2.0.50727; InfoPath.1; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB6; (R1 1.6); .NET CLR 1.0.3705; .NET CLR 1.1.4322; Zango 10.3.75.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB6.3; MRA 5.2 (build 02405); InfoPath.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB6.3; MRA 5.0 (build 02094); .NET CLR 1.1.4322; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB6.3; .NET CLR 2.0.50727; InfoPath.2; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 1.1.4322; MS-RTC LM 8; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; OfficeLiveConnector.1.3; OfficeLivePatc'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB6.3; .NET CLR 1.1.4322; .NET CLR 2.0.50727; MS-RTC LM 8; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB6.3; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; OfficeLiveConnector.1.3; OfficeLivePatch.0.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB6.3; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; OfficeLiveConnector.1.3; OfficeLivePatch.0.0; InfoPath.1; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB6.3; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB6.3; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 4.0; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB6.3; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 4.0; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB6.3; (R1 1.3); .NET CLR 2.0.50727; .NET CLR 1.1.4322; .NET CLR 3.0.04506.30; InfoPath.1; .NET CLR 3.0.04506.648; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB6.3; (R1 1.3); .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; InfoPath.1; .NET CLR 3.0.04506.648; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB6'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; Zango 10.3.75.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; Zango 10.3.36.0; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; .NET CLR 2.0.50727; InfoPath.2; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; AskTB5.5'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; InfoPath.2; .NET CLR 3.0.04506.648; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; .NET CLR 1.1.4322; Zango 10.0.314.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; .NET CLR 1.1.4322; InfoPath.2; Zango 10.3.75.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; .NET CLR 1.1.4322; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; .NET CLR 1.1.4322; .NET CLR 2.0.50727; Zango 10.3.75.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 4.0; Seekmo 10.0.341.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; .NET CLR 1.0.3705; .NET CLR 1.1.4322; .NET CLR 2.0.50727; Media Center PC 4.0; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; InfoPath.2; MS-RTC LM 8; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; InfoPath.2; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; InfoPath.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; FDM'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; InfoPath.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; FunWebProducts; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; FunWebProducts; (R1 1.6); .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 3.0.04506.30; InfoPath.2; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 2.0.50727; Zango 10.3.74.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 2.0.50727; yie8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 2.0.50727; InfoPath.2; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 2.0.50727; InfoPath.2; .NET CLR 3.0.04506.30'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 2.0.50727; InfoPath.1; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 2.0.50727; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; FDM'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 1.1.4322; InfoPath.1; InfoPath.2; .NET CLR 3.0.04506.648'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 1.1.4322; InfoPath.1; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 2.0.50727; .NET CLR 1.1.4322; InfoPath.2; .NET CLR 3.0.04506.30'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 2.0.50727; .NET CLR 1.1.4322; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 2.0.50727; .NET CLR 1.1.4322; .NET CLR 3.0.04506.30; InfoPath.1; .NET CLR 3.0.04506.648'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 2.0.50727; .NET CLR 1.1.4322; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; InfoPath.2; MS-RTC LM 8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 2.0.50727; .NET CLR 1.1.4322; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 2.0.50727; .NET CLR 1.1.4322; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 2.0.50727; .NET CLR 1.1.4322; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 1.1.4322; Zango 10.3.37.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 1.1.4322; SpamBlockerUtility 4.8.4; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 1.1.4322; PeoplePal 6.2; PeoplePal 3.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 1.1.4322; MS-RTC LM 8; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 1.1.4322; MS-RTC LM 8; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 1.1.4322; MS-RTC LM 8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 1.1.4322; InfoPath.2; Zango 10.3.75.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 1.1.4322; InfoPath.2; InfoPath.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 1.1.4322; InfoPath.2; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 1.1.4322; InfoPath.2; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 1.1.4322; InfoPath.1; SpamBlockerUtility 4.8.4'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 1.1.4322; InfoPath.1; MS-RTC LM 8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 1.1.4322; InfoPath.1; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 1.1.4322; InfoPath.1; .NET CLR 2.0.50727; MS-RTC LM 8; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 1.1.4322; InfoPath.1; .NET CLR 2.0.50727; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 1.1.4322; InfoPath.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; MS-RTC LM 8; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 1.1.4322; InfoPath.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 1.1.4322; InfoPath.1; .NET CLR 1.0.3705'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 1.1.4322; Hotbar 10.2.236.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 1.1.4322; FDM; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 1.1.4322; .NET CLR 3.0.04506.30; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 1.1.4322; .NET CLR 2.0.50727; Zango 10.3.79.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 1.1.4322; .NET CLR 2.0.50727; Zango 10.3.37.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 1.1.4322; .NET CLR 2.0.50727; Zango 10.2.191.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 1.1.4322; .NET CLR 2.0.50727; Seekmo 10.3.79.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 1.1.4322; .NET CLR 2.0.50727; InfoPath.2; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; MS-RTC LM 8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 1.1.4322; .NET CLR 2.0.50727; InfoPath.2; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; Zango 10.3.75.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 1.1.4322; .NET CLR 2.0.50727; InfoPath.1; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 1.1.4322; .NET CLR 2.0.50727; InfoPath.1; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 1.1.4322; .NET CLR 2.0.50727; InfoPath.1; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 1.1.4322; .NET CLR 2.0.50727; InfoPath.1; .NET CLR 3.0.04506.30'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; MS-RTC LM 8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; FDM'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 3.5.30428; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; MS-RTC LM 8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; InfoPath.2; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; Zango 10.3.75.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; InfoPath.2; .NET CLR 3.5.21022; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; MS-RTC LM 8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; InfoPath.2; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; InfoPath.1; Zune 3.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; InfoPath.1; FDM'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 1.1.4322; .NET CLR 1.0.3705; Media Center PC 4.0; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 1.0.3705; Media Center PC 4.0; .NET CLR 2.0.50727; .NET CLR 1.1.4322; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 1.0.3705; .NET CLR 2.0.50727; MS-RTC LM 8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 1.0.3705; .NET CLR 2.0.50727; .NET CLR 1.1.4322; Media Center PC 4.0; InfoPath.2; .NET CLR 3.0.04506.30'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 1.0.3705; .NET CLR 2.0.50727; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 4.0; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 4.0; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 3.1; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 1.0.3705; .NET CLR 1.1.4322; .NET CLR 2.0.50727; Media Center PC 4.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 1.0.3705; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 1.0.3705; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; .NET CLR 1.0.3705; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; (R1 1.6); .NET CLR 1.1.4322; .NET CLR 2.0.50727; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; (R1 1.6); .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; (R1 1.6); .NET CLR 1.0.3705; .NET CLR 1.1.4322; Zango 10.3.75.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; (R1 1.5); .NET CLR 1.1.4322; InfoPath.1; MS-RTC LM 8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB5; (R1 1.5); .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB0.0; .NET CLR 2.0.50727; InfoPath.1; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB0.0; .NET CLR 1.1.4322; InfoPath.2; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; FunWebProducts; Zango 10.3.75.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; FunWebProducts; Zango 10.3.74.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; FunWebProducts; Zango 10.3.65.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; FunWebProducts; Zango 10.0.314.0; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; FunWebProducts; SV1; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; FunWebProducts; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; .NET CLR 1.1.4322; Seekmo 10.0.345.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; FunWebProducts; GTB6; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; .NET CLR 1.1.4322; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; FunWebProducts; GTB6; .NET CLR 1.1.4322; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; FunWebProducts; GTB6; .NET CLR 1.1.4322; .NET CLR 2.0.50727; InfoPath.1; .NET CLR 3.0.04506.30; MS-RTC LM 8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; FunWebProducts; GTB6; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; FunWebProducts; GTB6; .NET CLR 1.1.4322; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; FunWebProducts; GTB6.3; InfoPath.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; FunWebProducts; GTB5; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; MEGAUPLOAD 2.0; Zango 10.3.65.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; FunWebProducts; GTB5; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; FunWebProducts; GTB5; InfoPath.1; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; FunWebProducts; GTB5; .NET CLR 1.1.4322; InfoPath.1; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; FunWebProducts; GTB5; .NET CLR 1.1.4322; .NET CLR 2.0.50727; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; FunWebProducts; GTB5; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; FunWebProducts; GTB5; .NET CLR 1.1.4322; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; FunWebProducts; GTB5; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 4.0; .NET CLR 2.0.50727; SpamBlockerUtility 4.8.4'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; FunWebProducts; GTB5; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 4.0; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; FunWebProducts; GTB5; (R1 1.5); .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 4.0; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; FunWebProducts; .NET CLR 2.0.50727; Zune 2.5'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; FunWebProducts; .NET CLR 1.1.4322; Zango 10.3.36.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; FunWebProducts; .NET CLR 1.1.4322; Zango 10.3.35.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; FunWebProducts; .NET CLR 1.1.4322; Zango 10.0.341.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; FunWebProducts; .NET CLR 1.1.4322; Zango 10.0.328.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; FunWebProducts; .NET CLR 1.1.4322; Zango 10.0.314.0; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; FunWebProducts; .NET CLR 1.1.4322; yplus 5.1.04b'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; FunWebProducts; .NET CLR 1.1.4322; Windows-Media-Player/10.00.00.3990; InfoPath.2; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; FunWebProducts; .NET CLR 1.1.4322; Windows-Media-Player/10.00.00.3990; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; FunWebProducts; .NET CLR 1.1.4322; Windows-Media-Player/10.00.00.3990; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; FunWebProducts; .NET CLR 1.1.4322; Windows-Media-Player/10.00.00.3990; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; FunWebProducts; .NET CLR 1.1.4322; SpamBlockerUtility 4.8.6'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; FunWebProducts; .NET CLR 1.1.4322; SpamBlockerUtility 10.2.203.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; FunWebProducts; .NET CLR 1.1.4322; Seekmo 10.0.345.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; FunWebProducts; .NET CLR 1.1.4322; PeoplePal 3.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; FunWebProducts; .NET CLR 1.1.4322; InfoPath.1; SpamBlockerUtility 4.8.4'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; FunWebProducts; .NET CLR 1.1.4322; InfoPath.1; Seekmo 10.0.406.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; FunWebProducts; .NET CLR 1.1.4322; HbTools 4.8.4; SpamBlockerUtility 4.8.4'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; FunWebProducts; .NET CLR 1.1.4322; .NET CLR 2.0.50727; InfoPath.2; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; FunWebProducts; .NET CLR 1.1.4322; .NET CLR 2.0.50727; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; FunWebProducts; .NET CLR 1.1.4322; .NET CLR 2.0.50727; FDM'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; FunWebProducts; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; Seekmo 10.0.341.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; FunWebProducts; .NET CLR 1.1.4322; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; FunWebProducts; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 4.0; .NET CLR 2.0.50727; InfoPath.1; .NET CLR 3.0.04506.30; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; FunWebProducts; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 4.0; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; FunWebProducts; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 4.0; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; FunWebProducts; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 3.1; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; FunWebProducts; (R1 1.6); .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; FunWebProducts; (R1 1.5); .NET CLR 1.1.4322; InfoPath.1; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; FunWebProducts-MyWay; .NET CLR 1.1.4322; .NET CLR 1.0.3705; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; FunWebProducts'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; FDM; SV1; .NET CLR 3.0.04506.30'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; FDM; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; FDM; .NET CLR 2.0.50727; .NET CLR 1.1.4322; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; FDM; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; FDM; .NET CLR 1.1.4322; .NET CLR 2.0.50727; InfoPath.2; .NET CLR 3.0.04506.30; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; FDM; .NET CLR 1.1.4322; .NET CLR 2.0.50727; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; FDM; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR.3.0.04131.06'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; FDM; .NET CLR 1.1.4322; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; FDM; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; FBSMTWB; GTB6.3; InfoPath.1; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; FBSMTWB; .NET CLR 1.1.4322; .NET CLR 2.0.50727; OfficeLiveConnector.1.3; OfficeLivePatch.0.0; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; msn OptimizedIE8;ESES'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; en-US; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; en-US'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; DigExt; SV1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; chromeframe; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; chromeframe; .NET CLR 1.1.4322; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; chromeframe; .NET CLR 1.1.4322; InfoPath.1; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Alexa Toolbar; .NET CLR 2.0.50727; InfoPath.1; .NET CLR 3.0.04506.648; .NET CLR 1.1.4322; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Alexa Toolbar; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; InfoPath.2; SLCC1; Media Center PC 5.0; .NET CLR 3.0.04506; MEGAUPLOAD 2.0; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Alexa Toolbar'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Advanced Searchbar; .NET CLR 2.0.50727; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Advanced Searchbar'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Advanced Searchbar 3.36; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; .NET CLR 1.1.4322; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; ; .NET CLR 1.1.4322; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 3.0.04506.648; InfoPath.2; .NET CLR 1.1.4322; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 2.0.50727; .NET CLR 1.1.4322; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 3.0.04506.30; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; InfoPath.1; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 3.0.04506.30; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 3.0.04506.30; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 3.0.04506.30; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 3.0.04506.30; .NET CLR 1.1.4322; .NET CLR 2.0.50727; InfoPath.2; Windows-Media-Player/10.00.00.3990'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 3.0.04506.30; .NET CLR 1.1.4322; .NET CLR 2.0.50727; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 3.0.04506.30; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; Zune 3.0; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; Zango 10.0.370.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; yplus 5.1.04b'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; Windows-Media-Player/10.00.00.3990; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; Windows-Media-Player/10.00.00.3990'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; MS-RTC LM 8; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; MS-RTC LM 8; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; MS-RTC LM 8; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; MS-RTC LM 8; .NET CLR 3.0.04506.30; .NET CLR 1.1.4322; .NET CLR 3.0.04506.648'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; MEGAUPLOAD 2.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; MEGAUPLOAD 1.0; .NET CLR 1.1.4322; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; Zune 2.5'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; MEGAUPLOAD 1.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; InfoPath.2; MS-RTC LM 8; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; InfoPath.2; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; InfoPath.2; FDM; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; InfoPath.2; Alexa Toolbar'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; InfoPath.2; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; AskTB5.3'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; InfoPath.2; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; InfoPath.2; .NET CLR 3.0.04506.590; Alexa Toolbar; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; InfoPath.2; .NET CLR 3.0.04506.590; .NET CLR 3.5.20706'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; InfoPath.2; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; InfoPath.2; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; InfoPath.2; .NET CLR 1.1.4322; MS-RTC LM 8; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; InfoPath.2; .NET CLR 1.1.4322; MS-RTC LM 8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; InfoPath.2; .NET CLR 1.1.4322; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; InfoPath.2; .NET CLR 1.1.4322; .NET CLR 3.0.04506.30; MS-RTC LM 8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; InfoPath.1; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; InfoPath.1; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; InfoPath.1; .NET CLR 3.0.04506.30; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; InfoPath.1; .NET CLR 1.1.4322; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; InfoPath.1; .NET CLR 1.1.4322; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; InfoPath.1; .NET CLR 1.1.4322; .NET CLR 3.0.04506.30'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; InfoPath.1; .NET CLR 1.1.4322; .NET CLR 1.0.3705; .NET CLR 3.0.04506.30'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; InfoPath.1; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; Hotbar 10.0.342.0; .NET CLR 3.0.04506.30; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; FDM; .NET CLR 3.0.04506.30; InfoPath.2; MS-RTC LM 8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; FDM; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; Alexa Toolbar'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 3.5.30428; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; InfoPath.2; .NET CLR 1.1.4322; OfficeLiveConnector.1.4; OfficeLivePatch.1.3'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; .NET CLR 1.1.4322; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; MS-RTC LM 8; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; FDM'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 3.0.4506.2152; .NET CLR 1.1.4322; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 1.1.4322; InfoPath.2; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; FDM'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 1.1.4322; InfoPath.1; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 1.1.4322; .NET CLR 3.5.30428'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 1.1.4322; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 1.1.4322; .NET CLR 3.5.21022'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; Zango 10.3.75.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; MS-RTC LM 8; .NET CLR 3.0.04506.648; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; MEGAUPLOAD 1.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; InfoPath.2; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; MS-RTC LM 8; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; InfoPath.2; .NET CLR 3.0.04506.648; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; MS-RTC LM 8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; InfoPath.1; .NET CLR 3.0.04506.648'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; InfoPath.1; .NET CLR 1.1.4322; .NET CLR 3.0.04506.648; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; FDM; .NET CLR 3.0.04506.648'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; InfoPath.2; InfoPath.1; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; InfoPath.2; .NET CLR 3.5.21022'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; InfoPath.2; .NET CLR 1.1.4322; MS-RTC LM 8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; InfoPath.2; .NET CLR 1.1.4322; .NET CLR 3.5.21022; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; InfoPath.2; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; InfoPath.1; MS-RTC LM 8; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; FDM'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; InfoPath.2; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; InfoPath.1; MS-RTC LM 8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; .NET CLR 1.1.4322; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 1.1.4322; yplus 5.1.04b'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 1.1.4322; .NET CLR 3.5.21022; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.590; .NET CLR 3.5.20706; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 1.1.4322; InfoPath.2; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; AskTB5.5'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 1.1.4322; InfoPath.2; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 1.1.4322; InfoPath.2; .NET CLR 3.0.04506.648'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 1.1.4322; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 1.1.4322; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 1.1.4322; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; AskTB5.6'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 1.1.4322; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 1.1.4322; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 1.1.4322; .NET CLR 3.0.04506.648; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; yplus 5.6.04b'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 1.1.4322; .NET CLR 1.0.3705; Tablet PC 1.7; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 2.0.50215; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 1.1.4322; Zango 10.3.36.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 1.1.4322; Zango 10.0.370.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 1.1.4322; Zango 10.0.275.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 1.1.4322; Seekmo 10.0.341.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 1.1.4322; PeoplePal 3.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 1.1.4322; MEGAUPLOAD 2.0; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 1.1.4322; InfoPath.2; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 1.1.4322; InfoPath.2; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 1.1.4322; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 1.1.4322; InfoPath.1; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; AskTB5.4'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 1.1.4322; InfoPath.1; .NET CLR 3.0.04506.30'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 1.1.4322; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 1.1.4322; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 1.1.4322; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 1.1.4322; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 1.1.4322; .NET CLR 3.0.04506.30; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 1.1.4322; .NET CLR 3.0.04506.30; InfoPath.1; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 1.1.4322; .NET CLR 3.0.04506.30; InfoPath.1; .NET CLR 3.0.04506.648; MS-RTC LM 8; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 1.1.4322; .NET CLR 3.0.04506.30; InfoPath.1; .NET CLR 3.0.04506.648; MS-RTC LM 8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 1.1.4322; .NET CLR 3.0.04506.30; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 1.1.4322; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 1.1.4322; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; InfoPath.2; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 1.1.4322; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 1.1.4322; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 1.0.3705; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 1.1.4322; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 1.0.3705; .NET CLR 3.5.21022; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 1.1.4322; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 1.0.3705'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 1.1.4322; .NET CLR 3.0.04506.30'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 1.1.4322; .NET CLR 3.0.04307.00; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 1.0.3705; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 1.0.3705; .NET CLR 1.1.4322; .NET CLR 3.0.04506.30'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 1.0.3705; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 1.0.3705'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50215; Avalon 6.0.5070; WinFX RunTime 3.0.50215; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.40607; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.40301; InfoPath.2; .NET CLR 1.1.4322; MS-RTC LM 8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; Zango 10.3.74.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; Zango 10.3.65.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; Zango 10.3.36.0; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; Zango 10.1.181.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; Zango 10.0.370.0; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; Zango 10.0.341.0; Windows-Media-Player/10.00.00.3990'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; Zango 10.0.314.0; SpamBlockerUtility 4.8.4; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; Zango 10.0.275.0; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; yplus 5.1.03b'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; Windows-Media-Player/10.00.00.3990; Zango 10.0.341.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; Windows-Media-Player/10.00.00.3990; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; Windows-Media-Player/10.00.00.3990; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; Windows-Media-Player/10.00.00.3990; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; Windows-Media-Player/10.00.00.3990; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; Windows-Media-Player/10.00.00.3990'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; Seekmo 10.0.370.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; Seekmo 10.0.345.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; Seekmo 10.0.341.0; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; Seekmo 10.0.341.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; Seekmo 10.0.314.0; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; o	Mozilla/4.0 (compatible; MSIE 7.0 – Qwest 1.0; Windows NT 5.1; YPC 3.0.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727)'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; MS-RTC LM 8; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; InfoPath.2; AskTB5.3'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; InfoPath.2; .NET CLR 3.0.04506.30'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; InfoPath.2; .NET CLR 2.0.50727; Zango 10.0.341.0; .NET CLR 3.0.04506.30'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; InfoPath.2; .NET CLR 2.0.50727; Windows-Media-Player/10.00.00.3990; .NET CLR 3.0.04506.30'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; InfoPath.2; .NET CLR 2.0.50727; Windows-Media-Player/10.00.00.3990'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; InfoPath.2; .NET CLR 2.0.50727; AskTB5.4'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; InfoPath.2; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; InfoPath.2; .NET CLR 2.0.50727; .NET CLR 3.0.04506.590; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; InfoPath.2; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; Zango 10.3.65.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; InfoPath.2; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; InfoPath.2; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; MS-RTC LM 8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; InfoPath.2; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; InfoPath.2; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30) (383; 383; 383'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; InfoPath.2; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; InfoPath.1; Zango 10.3.75.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; InfoPath.1; Zango 10.0.370.0; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; InfoPath.1; Zango 10.0.314.0; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; InfoPath.1; Seekmo 10.0.275.0; Zango 10.0.341.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; InfoPath.1; MS-RTC LM 8; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; InfoPath.1; InfoPath.2; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; InfoPath.1; InfoPath.2; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; InfoPath.1; FDM; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; InfoPath.1; Alexa Toolbar'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; InfoPath.1; .NET CLR 2.0.50727; Zango 10.0.370.0; SpamBlockerUtility 4.8.4'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; InfoPath.1; .NET CLR 2.0.50727; SpamBlockerUtility 4.8.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; InfoPath.1; .NET CLR 2.0.50727; MS-RTC LM 8; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; InfoPath.1; .NET CLR 2.0.50727; InfoPath.2; .NET CLR 3.0.04506.30'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; InfoPath.1; .NET CLR 2.0.50727; Alexa Toolbar'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; InfoPath.1; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; MS-RTC LM 8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; InfoPath.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; MS-RTC LM 8; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; InfoPath.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; Zune 2.0; OfficeLiveConnector.1.3; OfficeLivePatch.0.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; InfoPath.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; MS-RTC LM 8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; InfoPath.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; InfoPath.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; InfoPath.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.590; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; InfoPath.1; .NET CLR 2.0.50727; .NET CLR 2.0.50215'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; InfoPath.1; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; FDM; InfoPath.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; FDM; InfoPath.1; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; FDM'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; Alexa Toolbar; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; Alexa Toolbar'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 3.0.04506.30; InfoPath.2; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 3.0.04506.30; InfoPath.2; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 3.0.04506.30; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; FDM'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 3.0.04506.30; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 3.0.04506.30'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; WinFX RunTime 3.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; Seekmo 10.0.427.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; Seekmo 10.0.406.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; Seekmo 10.0.345.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; Seekmo 10.0.314.0; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; MS-RTC LM 8; InfoPath.2; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; MS-RTC LM 8; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; MEGAUPLOAD 1.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; InfoPath.2; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; OfficeLiveConnector.1.4; OfficeLivePatch.1.3; AskTB5.6'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; InfoPath.2; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; MS-RTC LM 8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; InfoPath.2; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; InfoPath.2; .NET CLR 3.0.04506.30; FDM'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; InfoPath.2; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; MS-RTC LM 8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; InfoPath.2; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; InfoPath.1; OfficeLiveConnector.1.3; OfficeLivePatch.0.0; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; MS-RTC LM 8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; InfoPath.1; InfoPath.2; OfficeLiveConnector.1.3; OfficeLivePatch.0.0; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; InfoPath.1; InfoPath.2; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; InfoPath.1; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; InfoPath.1; .NET CLR 3.0.04506.30'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; FDM; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; FDM; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; FDM'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; Avalon 6.0.5070; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; AskTB5.5'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; Alexa Toolbar'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; InfoPath.2; MEGAUPLOAD 3.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; AskTB5.6'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; AskTB5.2; MSSDMC2.5.2219.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; .NET CLR 3.0.04506.30'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; MS-RTC LM 8; InfoPath.2; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; InfoPath.2; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; InfoPath.2; MS-RTC LM 8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.590'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; Zune 3.0; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; MS-RTC LM 8; .NET CLR 3.0.04506.648; InfoPath.1; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; Media Center PC 3.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; InfoPath.2; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; OfficeLiveConnector.1.4; OfficeLivePatch.1.3'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; InfoPath.2; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; InfoPath.2; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 3.0.4506.2152'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; InfoPath.2; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; InfoPath.2; .NET CLR 3.0.04506.648'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; InfoPath.1; Seekmo 10.0.275.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; InfoPath.1; InfoPath.2; MS-RTC LM 8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; InfoPath.1; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; InfoPath.1; .NET CLR 3.0.04506.590; .NET CLR 3.5.20706'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; FDM; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; FDM'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; InfoPath.2; AskTB5.5'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; MEGAUPLOAD 2.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; Alexa Toolbar'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; InfoPath.2; .NET CLR 3.5.30428'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 3.5.30428'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 1.0.3705; InfoPath.2; MS-RTC LM 8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 1.0.3705; .NET CLR 3.5.21022; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.590; .NET CLR 3.5.20706; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04324.17; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04324.17; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04324.17; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 3.5.30428'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04324.17'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 1.0.3705; Media Center PC 4.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 1.0.3705; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; OfficeLiveConnector.1.3; OfficeLivePatch.0.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 1.0.3705; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 1.0.3705; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 1.0.3705; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 1.0.3705; .NET CLR 3.0.04506.30'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 1.0.3705'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.507277777'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50215; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50215; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50215'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50110; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.40607'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 1.0.3705; Media Center PC 4.0; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 1.0.3705; InfoPath.1; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 1.0.3705; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 1.0.3705; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 1.0.3705; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322) Paros/3.2.13'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.0.3705; MEGAUPLOAD 1.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.0.3705; InfoPath.1; Media Center PC 4.0; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.0.3705; .NET CLR 2.0.50727; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.0.3705; .NET CLR 2.0.50727; InfoPath.1; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.0.3705; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.0.3705; .NET CLR 2.0.50727; .NET CLR 1.1.4322; Media Center PC 4.0; FDM'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.0.3705; .NET CLR 2.0.50727; .NET CLR 1.1.4322; Media Center PC 4.0; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.0.3705; .NET CLR 2.0.50727; .NET CLR 1.1.4322; Media Center PC 4.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.0.3705; .NET CLR 2.0.50727; .NET CLR 1.1.4322; InfoPath.1; InfoPath.2; .NET CLR 3.0.04506.590; .NET CLR 3.5.20706'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.0.3705; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Tablet PC 1.7'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 4.0; Zango 10.0.370.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 4.0; Seekmo 10.0.406.0; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 4.0; Seekmo 10.0.406.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 4.0; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 4.0; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 4.0; FDM; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 4.0; Compatible; SV1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 4.0; Alexa Toolbar'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 4.0; .NET CLR 3.0.04506.30; .NET CLR 2.0.50727; .NET CLR 3.0.04506.590'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 4.0; .NET CLR 2.0.50727; Seekmo 10.0.424.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 4.0; .NET CLR 2.0.50727; PeoplePal 3.0; SpamBlockerUtility 4.8.4'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 4.0; .NET CLR 2.0.50727; InfoPath.2; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 4.0; .NET CLR 2.0.50727; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 4.0; .NET CLR 2.0.50727; InfoPath.1; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 4.0; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; MS-RTC LM 8; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; OfficeLiveConnector'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 4.0; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; MS-RTC LM 8; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 4.0; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 4.0; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 4.0; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 4.0; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 4.0; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 4.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 3.1; yplus 5.6.04b'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 3.1; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 3.1; InfoPath.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 3.1; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 3.1; FDM; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 3.1; .NET CLR 2.0.50727; Seekmo 10.0.341.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 3.1; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 3.1; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.0.3705; .NET CLR 1.1.4322; InfoPath.1; .NET CLR 2.0.50727; InfoPath.2; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.0.3705; .NET CLR 1.1.4322; FDM'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.0.3705; .NET CLR 1.1.4322; .NET CLR 2.0.50727; Media Center PC 4.0; Zango 10.0.314.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.0.3705; .NET CLR 1.1.4322; .NET CLR 2.0.50727; Media Center PC 4.0; InfoPath.1; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; yplus 5.3.04b'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.0.3705; .NET CLR 1.1.4322; .NET CLR 2.0.50727; Media Center PC 4.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.0.3705; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; Media Center PC 4.0; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.0.3705; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.0.3705; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; InfoPath.2; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.0.3705; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.0.3705; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.0.3705; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; (R1 1.6); Zune 3.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; (R1 1.6); InfoPath.2; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; (R1 1.6); InfoPath.2; .NET CLR 1.1.4322; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; (R1 1.6); InfoPath.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; Seekmo 10.0.314.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; (R1 1.6); .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; (R1 1.6); .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; (R1 1.6); .NET CLR 1.1.4322; Hotbar 10.0.368.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; (R1 1.6); .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; InfoPath.1; .NET CLR 3.5.21022; .NET CLR 3.0.4506.2152'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; (R1 1.6); .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 4.0; .NET CLR 2.0.50727; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; (R1 1.5); Tablet PC 1.7; .NET CLR 1.0.3705; .NET CLR 1.1.4322; InfoPath.1; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; (R1 1.5); .NET CLR 1.1.4322; Seekmo 10.0.341.0; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; (R1 1.5); .NET CLR 1.1.4322; InfoPath.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; (R1 1.5); .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; (R1 1.5); .NET CLR 1.1.4322; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; (R1 1.5); .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 4.0; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; (R1 1.5); .NET CLR 1.0.3705'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; (R1 1.3); .NET CLR 1.1.4322; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; (R1 1.3); .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; (R1 1.3); .NET CLR 1.0.3705; .NET CLR 1.1.4322; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; (R1 1.1); .NET CLR 2.0.50727; InfoPath.1; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; (R1 1.1); .NET CLR 1.1.4322; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Trident/4.0; SLCC2; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.5.30729; Tablet PC 2.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1, .NET CLR 1.1.4322, .NET CLR 2.0.50727, .NET CLR 3.0.04506.30'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (Compatible; MSIE 7.0; Windows NT 5.0; SLCC1; .NET CLR 2.0.50727; InfoPath.2; .NET CLR 3.0.04506; .NET CLR 3.5.21022; MS-RTC LM 8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.0; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 4.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; Windows 95'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; CP/M 2.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0; ; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 7.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727); Windows NT 5.1; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/2.0 (compatible; MSIE 7.0; Windows NT 5.1; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/10.0 (compatible; MSIE 7.0; Windows NT 5.1; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/1.0 (compatible; MSIE 7.0; Windows NT 5.1; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible;MSIE 7.0;Windows NT6.0'));
	}
	
	/**
	 * Microsoft IE 8.0
	 */
	public void function testIsMobile_microsoft_ie80_notMobile() {
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.2; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; WOW64; Trident/4.0; SLCC2; Media Center PC 6.0; InfoPath.2; MS-RTC LM 8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; WOW64; Trident/4.0; SLCC2; .NET CLR 2.0.50727; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; WOW64; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; Zune 3.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; WOW64; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; msn OptimizedIE8;ZHCN'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; WOW64; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; MS-RTC LM 8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; WOW64; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; InfoPath.3; Zune 4.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; WOW64; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; InfoPath.3'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; WOW64; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; InfoPath.2; OfficeLiveConnector.1.4; OfficeLivePatch.1.3; yie8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; WOW64; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; InfoPath.2; OfficeLiveConnector.1.3; OfficeLivePatch.0.0; Zune 3.0; MS-RTC LM 8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; WOW64; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; InfoPath.2; MS-RTC LM 8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; WOW64; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; InfoPath.2; FDM; OfficeLiveConnector.1.4; OfficeLivePatch.1.3; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; WOW64; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET CLR 4.0.20402; MS-RTC LM 8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; WOW64; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET CLR 1.1.4322; InfoPath.2; MS-RTC LM 8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; WOW64; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET CLR 1.1.4322; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; WOW64; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; InfoPath.3; .NET CLR 4.0.20506'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; WOW64; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; WOW64; Trident/4.0; MRA 5.5 (build 02842); SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; WOW64; Trident/4.0; MRA 5.5 (build 02842); GTB6.3; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; WOW64; Trident/4.0; GTB6.4; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; MSSDMC2.5.2219.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; WOW64; Trident/4.0; GTB0.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; InfoPath.3; MS-RTC LM 8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; WOW64; Trident/4.0; chromeframe; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; InfoPath.3'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; WOW64; Trident/4.0; chromeframe; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; InfoPath.2; MS-RTC LM 8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Win64; x64; Trident/4.0; SLCC2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Win64; x64; Trident/4.0; .NET CLR 2.0.50727; SLCC2; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; Tablet PC 2.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Win64; x64; Trident/4.0; .NET CLR 2.0.50727; SLCC2; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET CLR 3.0.04506; Media Center PC 5.0; SLCC1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Win64; x64; Trident/4.0; .NET CLR 2.0.50727; SLCC2; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Win64; x64; Trident/4.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; Tablet PC 2.0; OfficeLiveConnector.1.4; OfficeLivePatch.1.3; MSSDMC2.5.2219.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; Tablet PC 2.0; InfoPath.2; OfficeLiveConnector.1.4; OfficeLivePatch.1.3; MS-RTC LM 8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; Tablet PC 2.0; .NET CLR 3.0.04506; Media Center PC 5.0; SLCC1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; SLCC1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; OfficeLiveConnector.1.4; OfficeLivePatch.1.3; Zune 4.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; InfoPath.1; OfficeLiveConnector.1.4; OfficeLivePatch.1.3; SLCC1; MSSDMC2.5.2219.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; FDM; Tablet PC 2.0; .NET CLR 4.0.20506; OfficeLiveConnector.1.4; OfficeLivePatch.1.3'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET CLR 3.0.30618; Media Center PC 5.0; MS-RTC LM 8; SLCC1; Tablet PC 2.0; MSSDMC2.5.2219.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET CLR 3.0.04506; Media Center PC 5.0; SLCC1; Tablet PC 2.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET CLR 1.1.4322; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET CLR 1.1.4322; .NET CLR 3.5.21022; SLCC1; Zune 4.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.3029; Media Center PC 6.0; Tablet PC 2.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; SLCC2; .NET CLR 2.0.50727; Media Center PC 6.0; .NET CLR 3.5.30729; .NET CLR 3.0.30729; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; Tablet PC 2.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; FDM; InfoPath.2; Tablet PC 2.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; GTB6; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; OfficeLiveConnector.1.4; OfficeLivePatch.1.3'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; GTB6; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; GTB6; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET CLR 3.0.04506; SLCC1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; chromeframe; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; Tablet PC 2.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; chromeframe; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET CLR 1.1.4322; OfficeLiveConnector.1.4; OfficeLivePatch.1.3; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; chromeframe; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; WOW64; Trident/4.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; InfoPath.2; .NET CLR 3.5.21022; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; WOW64; Trident/4.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.5.30729; OfficeLiveConnector.1.4; OfficeLivePatch.1.3; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; WOW64; Trident/4.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.5.30729; .NET CLR 3.0.30729; MSSDMC1.3.1020.3'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; WOW64; Trident/4.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; WOW64; Trident/4.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.5.21022; FDM; .NET CLR 3.5.30729; InfoPath.2; .NET CLR 3.0.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; WOW64; Trident/4.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.5.21022; .NET CLR 3.5.30729; MS-RTC LM 8; .NET CLR 3.0.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; WOW64; Trident/4.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.30618; .NET CLR 3.5.30729; .NET CLR 4.0.20506; OfficeLiveConnector.1.4; OfficeLivePatch.0.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; WOW64; Trident/4.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; WOW64; Trident/4.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 1.1.4322; .NET CLR 3.5.30729; OfficeLiveConnector.1.4; OfficeLivePatch.1.3; .NET CLR 3.0.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; WOW64; Trident/4.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 1.1.4322; .NET CLR 3.5.21022; InfoPath.2; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; WOW64; Trident/4.0; SLCC1; .NET CLR 2.0.50727; InfoPath.2; .NET CLR 3.5.30729; .NET CLR 3.0.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; WOW64; Trident/4.0; SLCC1; .NET CLR 2.0.50727; InfoPath.2; .NET CLR 3.5.30729; .NET CLR 3.0.30618; MS-RTC LM 8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; WOW64; Trident/4.0; SLCC1; .NET CLR 2.0.50727; InfoPath.2; .NET CLR 3.5.21022; .NET CLR 3.5.30729; .NET CLR 3.0.30618; MS-RTC LM 8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; WOW64; Trident/4.0; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30618; FDM'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; WOW64; Trident/4.0; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.5.21022; .NET CLR 3.5.30729; .NET CLR 3.0.30618; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; WOW64; Trident/4.0; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.0.30618; .NET CLR 3.5.30729; Media Center PC 5.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; WOW64; Trident/4.0; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.0.04506; Media Center PC 5.0; InfoPath.2; .NET CLR 3.5.21022'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; WOW64; Trident/4.0; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.0.04506; InfoPath.2; .NET CLR 3.5.21022; MS-RTC LM 8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; WOW64; Trident/4.0; SLCC1; .NET CLR 2.0.50727; .NET CLR 1.1.4322; MS-RTC LM 8; .NET CLR 3.5.21022; OfficeLiveConnector.1.3; OfficeLivePatch.0.0; .NET CLR 3.5.30729; .NET CLR 3.0.30618; InfoPath.3'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; WOW64; Trident/4.0; SLCC1; .NET CLR 2.0.50727; .NET CLR 1.1.4322; InfoPath.2; MS-RTC LM 8; .NET CLR 3.5.21022; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; WOW64; Trident/4.0; SLCC1; .NET CLR 2.0.50727; .NET CLR 1.1.4322; .NET CLR 3.5.30729; .NET CLR 3.0.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; WOW64; Trident/4.0; SLCC1; .NET CLR 2.0.50727; .NET CLR 1.1.4322; .NET CLR 3.0.30729; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; WOW64; Trident/4.0; SLCC1; .NET CLR 1.1.4322; InfoPath.2; MS-RTC LM 8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; WOW64; Trident/4.0; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.5.30729; .NET CLR 3.0.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; WOW64; Trident/4.0; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.5.21022; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; WOW64; Trident/4.0; GTB6; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; InfoPath.2; .NET CLR 3.5.21022; .NET CLR 1.1.4322; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; WOW64; Trident/4.0; GTB6; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.5.30729; .NET CLR 3.0.30618; MSSDMC2.4.2011.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; WOW64; Trident/4.0; GTB6; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 1.1.4322; OfficeLiveConnector.1.3; OfficeLivePatch.0.0; .NET CLR 3.5.30729; .NET CLR 3.0.30618; yie8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; WOW64; Trident/4.0; GTB6; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 1.1.4322; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; WOW64; Trident/4.0; GTB6; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; WOW64; Trident/4.0; GTB6; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.0.30618; .NET CLR 1.1.4322; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; WOW64; Trident/4.0; GTB6.4; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 1.1.4322; .NET CLR 3.5.30729; .NET CLR 3.0.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; WOW64; Trident/4.0; GTB5; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.0.30618; .NET CLR 3.5.30729; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; WOW64; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.0.04506; Media Center PC 5.0; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Win64; x64; Trident/4.0; .NET CLR 2.0.50727; SLCC1; Tablet PC 2.0; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Win64; x64; Trident/4.0; .NET CLR 2.0.50727; SLCC1; Media Center PC 5.0; .NET CLR 3.5.30729; .NET CLR 3.0.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Win64; x64; Trident/4.0; .NET CLR 2.0.50727; SLCC1; Media Center PC 5.0; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Win64; x64; Trident/4.0; .NET CLR 2.0.50727; SLCC1; Media Center PC 5.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Win64; x64; Trident/4.0; .NET CLR 2.0.50727; SLCC1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Win64; x64; Trident/4.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SV1; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 1.1.4322; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SV1; GTB6; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; InfoPath.2; .NET CLR 1.1.4322; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1;'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; Media Center PC 5.0; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; Tablet PC 2.0; .NET CLR 3.5.30729; .NET CLR 3.0.30618; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; Tablet PC 2.0; .NET CLR 1.1.4322; .NET CLR 3.5.30729; InfoPath.2; .NET CLR 3.0.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; Tablet PC 2.0; InfoPath.1; .NET CLR 3.5.30729; .NET CLR 3.0.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; Tablet PC 2.0; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; Tablet PC 2.0; .NET CLR 3.5.21022; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; Tablet PC 2.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; InfoPath.2; .NET CLR 3.5.30729; .NET CLR 3.0.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; InfoPath.2; .NET CLR 3.5.30729; .NET CLR 3.0.30618; FDM; .NET CLR 1.1.4322; MS-RTC LM 8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; InfoPath.2; .NET CLR 3.5.21022; .NET CLR 3.5.30729; OfficeLiveConnector.1.3; OfficeLivePatch.0.0; .NET CLR 1.1.4322; .NET CLR 3.0.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; InfoPath.2; .NET CLR 3.5.21022; .NET CLR 3.5.30729; .NET CLR 3.0.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; InfoPath.2; .NET CLR 3.5.21022; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; InfoPath.2; .NET CLR 1.1.4322; .NET CLR 3.5.30729; .NET CLR 3.0.30729; yie8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; InfoPath.2; .NET CLR 1.1.4322; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; InfoPath.1; .NET CLR 3.5.30729; .NET CLR 3.0.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; InfoPath.1; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; InfoPath.1; .NET CLR 3.5.21022; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.5.30729; InfoPath.2; .NET CLR 3.0.30729; OfficeLiveConnector.1.4; OfficeLivePatch.1.3'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.5.30729; .NET CLR 3.0.30729; yie8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.5.30729; .NET CLR 3.0.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.5.30729; .NET CLR 3.0.30618; InfoPath.2; OfficeLiveConnector.1.3; OfficeLivePatch.1.3'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.5.30729; .NET CLR 3.0.30618; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.5.21022; Tablet PC 2.0; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.5.21022; InfoPath.2; Zune 3.0; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.5.21022; InfoPath.2; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.5.21022; .NET CLR 3.5.30729; .NET CLR 3.0.30618; Tablet PC 2.0; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.5.21022; .NET CLR 3.5.30729; .NET CLR 3.0.30618; InfoPath.2; OfficeLiveConnector.1.4; OfficeLivePatch.1.3'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.5.21022; .NET CLR 3.5.30729; .NET CLR 3.0.30618; FDM; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.04506; Tablet PC 2.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.04506; InfoPath.2; MEGAUPLOAD 3.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.04506; InfoPath.2; FDM'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 1.1.4322; Zune 2.5; InfoPath.2; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 1.1.4322; .NET CLR 3.5.30729; .NET CLR 3.0.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; InfoPath.2; Windows-Media-Player/10.00.00.3990; .NET CLR 3.5.30428; .NET CLR 1.1.4322; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; InfoPath.2; MS-RTC LM 8; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; InfoPath.2; .NET CLR 3.5.30729; MS-RTC LM 8; OfficeLiveConnector.1.3; OfficeLivePatch.0.0; .NET CLR 3.0.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; InfoPath.2; .NET CLR 3.5.30729; .NET CLR 3.0.30618; .NET CLR 1.1.4322; OfficeLiveConnector.1.3; OfficeLivePatch.0.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.5.30729; InfoPath.1; .NET CLR 3.0.30729; msn OptimizedIE8;ENUS'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; yie8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30618; yie8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30618; InfoPath.2; MS-RTC LM 8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.5.21022; MS-RTC LM 8; Tablet PC 2.0; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.5.21022; .NET CLR 3.5.30428; .NET CLR 3.5.30729; Media Center PC 5.1; OfficeLiveConnector.1.4; OfficeLivePatch.1.3; .NET CLR 3.0.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.5.21022; .NET CLR 1.1.4322; OfficeLiveConnector.1.3; OfficeLivePatch.0.0; .NET CLR 3.0.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.0.30729; .NET CLR 3.5.30729; InfoPath.2; MS-RTC LM 8; OfficeLiveConnector.1.4; OfficeLivePatch.1.3'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.0.30729; .NET CLR 1.1.4322; Tablet PC 2.0; InfoPath.2; MS-RTC LM 8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.0.30618; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.0.30618; .NET CLR 3.5.30729; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.0.30618; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.0.04506; Tablet PC 2.0; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.0.04506; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.0.04506; .NET CLR 1.1.4322; InfoPath.2; .NET CLR 3.5.21022; MS-RTC LM 8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.0.04506; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; .NET CLR 1.1.4322; InfoPath.1; .NET CLR 3.5.21022; .NET CLR 3.5.30729; .NET CLR 3.0.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; .NET CLR 1.1.4322; .NET CLR 3.5.30729; .NET CLR 3.0.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; .NET CLR 1.0.3705; .NET CLR 1.1.4322; InfoPath.2; .NET CLR 3.5.30729; .NET CLR 3.0.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; .NET CLR 1.0.3705; .NET CLR 1.1.4322; InfoPath.2; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; Q312461; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; MS-RTC LM 8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; InfoPath.2; .NET CLR 1.1.4322; .NET CLR 3.5.30729; .NET CLR 3.0.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; InfoPath.1; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.5.21022; InfoPath.2; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.04506; Tablet PC 2.0; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.04506; InfoPath.2; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) '));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; MathPlayer 2.10d; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.04506; InfoPath.2; .NET CLR 3.5.21022'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; MathPlayer 2.10d; GTB6.4; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.0.04506; .NET CLR 1.1.4322; InfoPath.2; Tablet PC 2.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; GTB6; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; GTB6; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; Zune 3.0; InfoPath.2; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; GTB6; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; Zune 3.0; .NET CLR 3.5.30729; InfoPath.1; .NET CLR 3.0.30729; OfficeLiveConnector.1.4; OfficeLivePatch.1.3; MSN Optimized;US'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; GTB6; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; Windows-Media-Player/10.00.00.3990; Zune 3.0; .NET CLR 3.5.30729; .NET CLR 3.0.30729; yie8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; GTB6; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; InfoPath.2; .NET CLR 1.1.4322; Dealio Toolbar 3.4; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; GTB6; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.5.30729; .NET CLR 3.0.30729; OfficeLiveConnector.1.4; OfficeLivePatch.1.3; MSN Optimized;US'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; GTB6; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.5.21022; .NET CLR 3.5.30729; .NET CLR 1.1.4322; .NET CLR 3.0.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; GTB6; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) '));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; GTB6.4; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; InfoPath.2; .NET CLR 3.5.30729; .NET CLR 3.0.30729; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; GTB6.4; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; msn OptimizedIE8;ENUS'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; GTB5; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; Tablet PC 2.0; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; GTB5; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; MEGAUPLOAD 3.0; .NET CLR 3.0.30618; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; GTB5; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; InfoPath.1; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; GTB5; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 1.1.4322; InfoPath.2; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; GTB5; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 1.1.4322; .NET CLR 3.5.21022; .NET CLR 3.5.30729; .NET CLR 3.0.30618; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; GTB5; SLCC1; .NET CLR 2.0.50727; InfoPath.2; .NET CLR 3.5.21022; .NET CLR 3.5.30729; .NET CLR 3.0.30618; MS-RTC LM 8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; GTB5; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.0.04506; InfoPath.2; MS-RTC LM 8; .NET CLR 3.5.21022; Tablet PC 2.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; GTB5; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.0.04506; .NET CLR 1.1.4322; InfoPath.2; MS-RTC LM 8; .NET CLR 3.5.21022'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; GTB5; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 1.1.4322; InfoPath.2; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; GTB0.0; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 1.1.4322; .NET CLR 3.5.30729; .NET CLR 3.0.30729; InfoPath.1; A'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; FunWebProducts; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.04506; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; FunWebProducts; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; FunWebProducts; GTB6; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; SLCC1; .NET CLR 2.0.50727; InfoPath.1; .NET CLR 3.5.30729; .NET CLR 3.0.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; FunWebProducts; GTB6.3; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.5.30729; OfficeLiveConnector.1.4; OfficeLivePatch.0.0; .NET CLR 3.0.30729; InfoPath.2; MS-RTC LM 8; .NE'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; FunWebProducts; GTB5; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.0.04506'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; FDM'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; FBSMTWB; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.5.30729; .NET CLR 3.0.30618; OfficeLiveConnector.1.3; OfficeLivePatch.0.0; AskTB5.5'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; FBSMTWB; GTB6.3; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; chromeframe; SLCC1; .NET CLR 2.0.50727; .NET CLR 1.1.4322; .NET CLR 3.5.30729; .NET CLR 3.0.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.2; WOW64; Trident/4.0; .NET CLR 2.0.50727; InfoPath.1; .NET CLR 3.0.04506.30'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.2; WOW64; Trident/4.0; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.2; WOW64; Trident/4.0; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; InfoPath.1; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.2; Win64; x64; Trident/4.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.2; Trident/4.0; .NET CLR 3.0.04506.648; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.2; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727; InfoPath.2; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.2; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; InfoPath.2; OfficeLiveConnector.1.3; OfficeLivePatch.0.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.2; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.2; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.2; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.2; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.2; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; Zango 10.1.181.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; YPC 3.2.0; MSN Optimized;GB; .NET CLR 2.0.50727; InfoPath.1; MSN Optimized;GB'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; Windows-Media-Player/10.00.00.3990; .NET CLR 3.0.04506.30; InfoPath.1; .NET CLR 3.0.04506.648; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; Tablet PC 1.7; .NET CLR 1.0.3705; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; SV1; .NET CLR 2.0.50727; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; SV1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; InfoPath.2; .NET CLR 3.5.21022; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; MS-RTC LM 8; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; MS-RTC LM 8; .NET CLR 2.0.50727; .NET CLR 1.1.4322; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; MRA 4.3 (build 01218); .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; chromeframe; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; chromeframe'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; .NET CLR 2.0.50727; MS-RTC LM 8; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; .NET CLR 2.0.50727; FDM'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; FDM'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; .NET CLR 2.0.50727; .NET CLR 1.1.4322; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; OfficeLiveConnector.1.4; OfficeLivePatch.1.3'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; .NET CLR 2.0.50727; .NET CLR 1.1.4322; .NET CLR 3.0.04506.30'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; .NET CLR 1.1.4322; InfoPath.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; MathPlayer 2.10d; FDM; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; MathPlayer 2.10d; .NET CLR 2.0.50727; InfoPath.2; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; MathPlayer 2.10b'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; iOpus-I-M; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; InfoPath.2; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; InfoPath.2; .NET CLR 2.0.50727; Zune 3.0; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; InfoPath.2; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; InfoPath.1; .NET CLR 2.0.50727; msn OptimizedIE8;ENUS'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; InfoPath.1; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; InfoPath.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; InfoPath.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; InfoPath.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; yie8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; InfoPath.1; .NET CLR 2.0.50727; .NET CLR 1.1.4322; .NET CLR 3.0.04506.30'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; InfoPath.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB6; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB6; InfoPath.2; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB6; InfoPath.2; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; .NET CLR 1.1.4322; OfficeLiveConnector.1.4; OfficeLivePatch.1.3'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB6; InfoPath.1; .NET CLR 3.0.04506.648; InfoPath.2; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB6; InfoPath.1; .NET CLR 2.0.50727; OfficeLiveConnector.1.3; OfficeLivePatch.0.0; .NET CLR 1.1.4322; yie8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB6; InfoPath.1; .NET CLR 2.0.50727; Dealio Toolbar 3.4; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB6; FBSMTWB; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB6; chromeframe; .NET CLR 3.0.04506.30; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB6; chromeframe; .NET CLR 2.0.50727; OfficeLiveConnector.1.3; OfficeLivePatch.0.0; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; msn OptimizedIE8;DEAT'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB6; chromeframe; .NET CLR 2.0.50727; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB6; chromeframe; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB6; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; .NET CLR 1.1.4322; .NET CLR 4.0.20506'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB6; .NET CLR 2.0.50727; .NET CLR 3.0.04506.590; .NET CLR 3.5.20706; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB6; .NET CLR 1.1.4322; Zune 3.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB6; .NET CLR 1.1.4322; .NET CLR 2.0.50727; InfoPath.1; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; MS-RTC LM 8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB6; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; Zune 2.0; .NET CLR 3.0.04506.648; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB6; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.0.4506.2152; .NET CLR'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB6; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB6; .NET CLR 1.1.4322; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB6; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 4.0; .NET CLR 2.0.50727; Zango 10.3.75.0; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; yie8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB6; (R1 1.5); .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB6.4; Tablet PC 1.7; .NET CLR 1.0.3705; .NET CLR 1.1.4322; yie8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB6.3; .NET CLR 2.0.50727; InfoPath.1; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB6.3; .NET CLR 1.1.4322; InfoPath.1; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB6.3; (R1 1.6); .NET CLR 1.1.4322; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB5; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB5; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB5; Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) ; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.0.4506.2152; .NET CLR 3.5'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB5; InfoPath.2; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB5; InfoPath.2; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB5; InfoPath.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB5; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB5; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB5; .NET CLR 2.0.50727; .NET CLR 1.1.4322; InfoPath.1; InfoPath.2; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; MS-RTC LM 8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB5; .NET CLR 1.1.4322; .NET CLR 2.0.50727; InfoPath.1; .NET CLR 3.0.04506.30'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB5; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB5; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB5; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB5; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB5; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 1.0.3705; .NET CLR 3.0.04506.648'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB5; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB0.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727; OfficeLiveConnector.1.3; OfficeLivePatch.1.3; InfoPath.1; MS-RTC LM 8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; FunWebProductsp; GTB6; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 4.0; MS-RTC LM 8; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; InfoPath.2; .NET CLR 3.0.45'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; FunWebProducts; GTB6; .NET CLR 1.1.4322; InfoPath.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; MS-RTC LM 8; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; FunWebProducts; GTB6; .NET CLR 1.1.4322; HbTools 4.8.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; FunWebProducts; GTB6; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; FunWebProducts; GTB6; (R1 1.6); .NET CLR 1.1.4322; .NET CLR 2.0.50727; OfficeLiveConnector.1.3; OfficeLivePatch.0.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; FunWebProducts; GTB6.4'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; FunWebProducts; GTB6.3; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; MS-RTC LM 8; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; FunWebProducts; .NET CLR 2.0.50727; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; FunWebProducts; .NET CLR 1.1.4322; Zango 10.0.370.0; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; FunWebProducts; .NET CLR 1.1.4322; Zango 10.0.370.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; FunWebProducts; .NET CLR 1.1.4322; InfoPath.2; .NET CLR 2.0.50727; msn OptimizedIE8;ENUS'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; FDM; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; FBSMTWB; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; chromeframe; .NET CLR 3.5.30729; FDM'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; chromeframe; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; InfoPath.2; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; chromeframe; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; chromeframe; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; chromeframe; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 4.0; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; OfficeLiveConnector.1.4; OfficeLivePatch.1.3'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; chromeframe'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 3.5.30729; FDM; MS-RTC LM 8; OfficeLiveConnector.1.4; OfficeLivePatch.1.3; .NET CLR 3.0.4506.2152'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 3.5.30729; FDM'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 3.5.21022; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; Zune 3.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 3.0.04506.30; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; OfficeLiveConnector.1.3; OfficeLivePatch.0.0; .NET CLR 3.0.04506.30; .NET CLR 1.1.4322; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; MS-RTC LM 8; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; MEGAUPLOAD 1.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; InfoPath.2; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; InfoPath.1; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; InfoPath.1; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 1.1.4322; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; FDM'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; InfoPath.2; msn OptimizedIE8;KOKR'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; InfoPath.1; MS-RTC LM 8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; .NET CLR 1.1.4322; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; .NET CLR 1.0.3705'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; InfoPath.2; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; OfficeLiveConnector.1.3; OfficeLivePatch.0.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 1.1.4322; OfficeLiveConnector.1.3; OfficeLivePatch.0.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 1.1.4322; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; MS-RTC LM 8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022;'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; InfoPath.1; .NET CLR 3.0.04506.648; MS-RTC LM 8; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; InfoPath.2; .NET CLR 3.5.21022; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; OfficeLiveConnector.1.4; OfficeLivePatch.1.'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; OfficeLiveConnector.1.4; OfficeLivePatch.1.3'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; .NET CLR 1.1.4322; InfoPath.1; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; yie8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; .NET CLR 1.1.4322; InfoPath.1; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; .NET CLR 1.1.4322; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; OfficeLiveConnector.1.3; OfficeLivePatch.0.0; yie8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; .NET CLR 1.1.4322; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; .NET CLR 1.1.4322; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; Trident/4.0; InfoPath.1'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; .NET CLR 1.1.4322; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; .NET CLR 1.1.4322; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 1.1.4322; OfficeLiveConnector.1.4; OfficeLivePatch.1.3'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 1.1.4322; MS-RTC LM 8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 1.1.4322; InfoPath.2; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 1.1.4322; InfoPath.2; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; MS-RTC LM 8; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 1.1.4322; InfoPath.1; FDM; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 1.1.4322; InfoPath.1; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; yie8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 3.5.20404; .NET CLR 3.0.04506.30; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 3.0.04506.30; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727; InfoPath.2; Zune 3.0; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; OfficeLiveConnector.1.3; OfficeLivePatch.0.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727; InfoPath.2; MS-RTC LM 8; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727; InfoPath.2; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727; InfoPath.2; .NET CLR 3.0.04506.30'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727; InfoPath.1; .NET CLR 3.0.04506.30; MS-RTC LM 8; .NET CLR 3.0.04506.648'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727; InfoPath.1; .NET CLR 3.0.04506.30; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; MS-RTC LM 8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; Zune 3.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; MSN Optimized;ENAU'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; InfoPath.2; MSSDMC2.4.2011.2; AskTB5.6'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; InfoPath.2; MSSDMC2.4.2011.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729) Paros/3.2.13'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; Zune 3.0; MS-RTC LM 8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; InfoPath.2; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; MS-RTC LM 8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; InfoPath.1; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; InfoPath.2; MS-RTC LM 8'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; InfoPath.2; .NET CLR 3.0.04506.648; MS-RTC LM 8; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; Zango 10.3.74.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; Windows-Media-Player/10.00.00.3990; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; InfoPath.2; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; InfoPath.2'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; OfficeLiveConnector.1.4;'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 1.0.3705; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.4506.2152'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 1.0.3705; Media Center PC 3.1; .NET CLR 1.1.4322'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Tablet PC 1.7'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 4.0; InfoPath.2; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 1.0.3705; .NET CLR 1.1.4322; .NET CLR 2.0.50727; MS-RTC LM 8; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 1.0.3705; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; (R1 1.5); .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; (R1 1.5); .NET CLR 1.1.4322; .NET CLR 2.0.50727'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; ; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; InfoPath.2; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; InfoPath.2; .NET CLR 3.5.21022; .NET CLR 3.5.30729; .NET CLR 3.0.30618'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows 98; Win 9x 4.90; WOW64; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; Tablet PC 2.0'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0'));
	}
	
	/**
	 * Motorola
	 */
	public void function testIsMobile_motorola_areMobile() {
		// Motorola V3
		assertTrue(variables.browser.isMobile('MOT-V3r/08.BD.43R MIB/2.2.1 Profile/MIDP-2.0 Configuration/CLDC-1.1'));
		// Motorola K1
		assertTrue(variables.browser.isMobile('MOT-K1/08.03.08R MIB/BER2.2 Profile/MIDP-2.0 Configuration/CLDC-1.1 EGE/1.0'));
		// Motorola L6
		assertTrue(variables.browser.isMobile('MOT-L6/0A.52.2BR MIB/2.2.1 Profile/MIDP-2.0 Configuration/CLDC-1.1'));
		// Motorola V9
		assertTrue(variables.browser.isMobile('MOT-MOTORAZRV9/4 BER2.2 Mozilla/4.0 (compatible; MSIE 6.0; 14003181) Profile/MIDP-2.0 Configuration/CLDC-1.1 Op! era 8.00 [en] UP.Link/6.3.0.0.0'));
		// Motorola V3xx
		assertTrue(variables.browser.isMobile('MOT-RAZRV3xx/96.64.21P BER2.2 Mozilla/4.0 (compatible; MSIE 6.0; 11003002) Profile/MIDP-2.0 Configuration/CLDC-1.1 Opera 8.00 [en] UP.Link/6.3.0.0.0'));
		// Motorola V9x
		assertTrue(variables.browser.isMobile('MOT-MOTORAZRV9x/9E.03.15R BER2.2 Mozilla/4.0 (compatible; MSIE 6.0; 13003337) Profile/MIDP-2.0 Configuration/CLDC-1.1 Opera 8.60 [en] UP.Link/6.3.0.0.0'));
		// Motorola Z9
		assertTrue(variables.browser.isMobile('MOT-MOTOZ9/9E.01.03R BER2.2 Mozilla/4.0 (compatible; MSIE 6.0; 11003002) Profile/MIDP-2.0 Configuration/CLDC-1.1 Opera 8.60 [en] UP.Link/6.3.0.0.0'));
		// Motorola Droid V2.01
		assertTrue(variables.browser.isMobile('Mozilla/5.0 (Linux; U; Android 2.0.1; en-us; Droid Build/ESD56) AppleWebKit/530.17 (KHTML, like Gecko) Version/4.0 Mobile Safari/530.17'));
	}
	
	/**
	 * Mozilla Firefox 3.6.0
	 */
	public void function testIsMobile_mozilla_firefox3_6_0_notMobile() {
		assertFalse(variables.browser.isMobile('Mozilla/5.0(Windows; U; Windows NT 5.2; rv:1.9.2) Gecko/20100101 Firefox/3.6'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.9.2) Gecko/20100222 Ubuntu/10.04 (lucid) Firefox/3.6'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.9.2) Gecko/20100130 Gentoo Firefox/3.6'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (X11; U; Linux x86_64; de; rv:1.9.2) Gecko/20100308 Ubuntu/10.04 (lucid) Firefox/3.6'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.2.2pre) Gecko/20100312 Ubuntu/9.04 (jaunty) Firefox/3.6'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.2) Gecko/20100128 Gentoo Firefox/3.6'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.2) Gecko/20100115 Ubuntu/10.04 (lucid) Firefox/3.6'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.2) Gecko/20100115 Firefox/3.6 FirePHP/0.4'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; U; Windows NT 6.1; ru-RU; rv:1.9.2) Gecko/20100105 MRA 5.6 (build 03278) Firefox/3.6 (.NET CLR 3.5.30729)'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; U; Windows NT 6.1; lt; rv:1.9.2) Gecko/20100115 Firefox/3.6'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.3a3pre) Gecko/20100306 Firefox3.6 (.NET CLR 3.5.30729)'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; U; Windows NT 6.1; ar; rv:1.9.2) Gecko/20100115 Firefox/3.6'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; U; Windows NT 6.0; ru; rv:1.9.2) Gecko/20100115 Firefox/3.6'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; U; Windows NT 6.0; ru; rv:1.9.2) Gecko/20100105 Firefox/3.6 (.NET CLR 3.5.30729)'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; U; Windows NT 5.2; zh-CN; rv:1.9.2) Gecko/20100101 Firefox/3.6'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; U; Windows NT 5.2; zh-CN; rv:1.9.2) Gecko/20091111 Firefox/3.6'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; U; Windows NT 5.2; rv:1.9.2) Gecko/20100101 Firefox/3.6'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; U; Windows NT 5.1; zh-CN; rv:1.9.2) Gecko/20100115 Firefox/3.6 ( .NET CLR 3.5.30729)'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; U; Windows NT 5.1; pt-PT; rv:1.9.2) Gecko/20100115 Firefox/3.6'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; U; Windows NT 5.1; pt-BR; rv:1.9.2) Gecko/20100115 Firefox/3.6'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; U; Windows NT 5.1; nl; rv:1.9.2) Gecko/20100115 Firefox/3.6 (.NET CLR 3.5.30729)'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; U; Windows NT 5.1; it; rv:1.9.2) Gecko/20100115 Firefox/3.6 (.NET CLR 3.5.30729)'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.21) Gecko/20100312 Firefox/3.6'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; U; Windows NT 5.1; en-AU; rv:1.9.2) Gecko/20100115 Firefox/3.6 (.NET CLR 3.5.30729)'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; U; Win98; en-US; rv:1.8.1.24) Gecko/20100228 Firefox/3.6'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; N; Windows NT 6.1; ja-JP; rv:1.9.2) Gecko/20100115 Firefox/3.6'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; JA; Windows NT 6.1; JA; rv:1.9.2) Gecko/20100115 Firefox/3.6'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; fr; rv:1.9.2) Gecko/20100115 Firefox/3.6 (.NET CLR 3.5.30729)'));
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US; rv:1.9.2) Gecko/20091218 Firefox 3.6'));
	}
	
	/**
	 * Mozilla Firefox 3.6.1
	 */
	public void function testIsMobile_mozilla_firefox3_6_1_notMobile() {
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.2.1) Gecko/20100122 firefox/3.6.1'));
	}
	
	/**
	 * Mozilla Firefox 3.6.2
	 */
	public void function testIsMobile_mozilla_firefox3_6_2_notMobile() {
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US; rv:1.9.2.2) Gecko/20100316 Firefox/3.6.2 (.NET CLR 3.5.30729)'));
	}
	
	/**
	 * Nokia
	 */
	public void function testIsMobile_nokia_areMobile() {
		// Nokia 2610
		assertTrue(variables.browser.isMobile('Nokia2610/2.0 (07.04a) Profile/MIDP-2.0 Configuration/CLDC-1.1 UP.Link/6.3.1.20.0'));
		// Nokia 5300
		assertTrue(variables.browser.isMobile('Nokia5300/2.0 (05.51) Profile/MIDP-2.0 Configuration/CLDC-1.1'));
		// Nokia 5630
		assertTrue(variables.browser.isMobile('Mozilla/5.0 (SymbianOS/9.3; U; Series60/3.2 Nokia5630d-1/012.020; Profile MIDP-2.1 Configuration/CLDC-1.1) AppleWebKit/413 (KHTML, like Gecko) Safari/413'));
		// Nokia 6030
		assertTrue(variables.browser.isMobile('Nokia6030/2.0 (y3.44) Profile/MIDP-2.0 Configuration/CLDC-1.1'));
		// Nokia 6230i
		assertTrue(variables.browser.isMobile('Nokia6230i/2.0 (03.40) Profile/MIDP-2.0 Configuration/CLDC-1.1'));
		// Nokia 6280
		assertTrue(variables.browser.isMobile('Nokia6280/2.0 (03.60) Profile/MIDP-2.0 Configuration/CLDC-1.1'));
		// Nokia 6650
		assertTrue(variables.browser.isMobile('Nokia6650d-1bh/ATT.2.15 Mozilla/5.0 (SymbianOS/9.3; U; [en]; Series60/3.2; Profile/MIDP-2.1 Configuration/CLDC-1.1) AppleWebKit/413 (KHTML, like Gecko) Safari/413'));
		// Nokia E51-1
		assertTrue(variables.browser.isMobile('Mozilla/5.0 (SymbianOS/9.2; U; Series60/3.1 NokiaE51-1/220.34.37; Profile/MIDP-2.0 Configuration/CLDC-1.1) AppleWebKit/413 (KHTML, like Gecko) Safari/413'));
		// Nokia E71x
		assertTrue(variables.browser.isMobile('NokiaE71x/ATT.03.11.1 Mozilla/5.0 SymbianOS/9.3; U; [en]; Series60/3.2; Profile/MIDP-2.1 Configuration/CLDC-1.1 AppleWebKit/413 KHTML, like Gecko) Safari/413 UP.Link/6.3.0.0.0'));
		// Nokia N70
		assertTrue(variables.browser.isMobile('NokiaN70-1/5.0616.2.0.3 Series60/2.8 Profile/MIDP-2.0 Configuration/CLDC-1.1'));
		// Nokia N75
		assertTrue(variables.browser.isMobile('NokiaN75-3/3.0 (1.0635.0.0.6); SymbianOS/9.1 Series60/3.0 Profile/MIDP-2.0 Configuration/CLDC-1.1) UP.Link/6.3.0.0'));
		// Nokia N80
		assertTrue(variables.browser.isMobile('NokiaN80-1/3.0(4.0632.0.10) Series60/3.0 Profile/MIDP-2.0 Configuration/CLDC-1.1'));
		// Nokia N90
		assertTrue(variables.browser.isMobile('NokiaN90-1/5.0607.7.3 Series60/2.8 Profile/MIDP-2.0 Configuration/CLDC-1.1'));
		// Nokia N95
		assertTrue(variables.browser.isMobile('Mozilla/5.0 (SymbianOS/9.2; U; Series60/3.1 NokiaN95/11.0.026; Profile MIDP-2.0 Configuration/CLDC-1.1) AppleWebKit/413 (KHTML, like Gecko) Safari/413'));
	}
	
	/**
	 * Opera 9.70
	 */
	public void function testIsMobile_opera_opera9_70_notMobile() {
		assertFalse(variables.browser.isMobile('Mozilla/5.0 (Linux i686 ; U; en; rv:1.8.1) Gecko/20061208 Firefox/2.0.0 Opera 9.70'));
		assertFalse(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 6.0; Linux i686 ; en) Opera 9.70'));
	}
	
	/**
	 * Palm
	 */
	public void function testIsMobile_palm_areMobile() {
		// Treo 650
		assertTrue(variables.browser.isMobile('Mozilla/4.0 (compatible; MSIE 6.0; Windows 98; PalmSource/hspr-H102; Blazer/4.0) 16;320x320'));
		// Pre
		assertTrue(variables.browser.isMobile('Mozilla/5.0 (webOS/1.3.1; U; en-US) AppleWebKit/525.27.1 (KHTML, like Gecko) Version/1.0 Safari/525.27.1 Pre/1.0'));
		// Pixi
		assertTrue(variables.browser.isMobile('Mozilla/5.0 (webOS/Palm webOS 1.2.9; U; en-US) AppleWebKit/525.27.1 (KHTML, like Gecko) Version/1.0 Safari/525.27.1 Pixi/1.0'));
	}
	
	/**
	 * Samsung
	 */
	public void function testIsMobile_samsung_areMobile() {
		// Samsung A737
		assertTrue(variables.browser.isMobile('SAMSUNG-SGH-A737/UCGI3 SHP/VPP/R5 NetFront/3.4 SMM-MMS/1.2.0 profile/MIDP-2.0 configuration/CLDC-1.1 UP.Link/6.3.1.17.0'));
		// Samsung A737
		assertTrue(variables.browser.isMobile('SAMSUNG-SGH-A737/1.0 SHP/VPP/R5 NetFront/3.3 SMM-MMS/1.2.0 profile/MIDP-2.0 configuration/CLDC-1.1 UP.Link/6.3.0.0.0'));
		// Samsung A767
		assertTrue(variables.browser.isMobile('SAMSUNG-SGH-A767/A767UCHG2 SHP/VPP/R5 NetFront/3.4 SMM-MMS/1.2.0 profile/MIDP-2.0 configuration/CLDC-1.1 UP.Link/6.3.0.0.0'));
		// Samsung A867
		assertTrue(variables.browser.isMobile('SAMSUNG-SGH-A867/A867UCHG5 SHP/VPP/R5 NetFront/3.4 SMM-MMS/1.2.0 profile/MIDP-2.0 configuration/CLDC-1.1 UP.Link/6.3.0.0.0'));
		// Samsung A877
		assertTrue(variables.browser.isMobile('SAMSUNG-SGH-A877/A877UCHK1 SHP/VPP/R5 NetFront/3.5 SMM-MMS/1.2.0 profile/MIDP-2.1 configuration/CLDC-1.1 UP.Link/6.3.0.0.0'));
		// Samsung D600
		assertTrue(variables.browser.isMobile('SAMSUNG-SGH-D600/1.0 Profile/MIDP-2.0 Configuration/CLDC-1.1 UP.Browser/6.2.3.3.c.1.101 (GUI) MMP/2.0'));
		// Samsung Z720
		assertTrue(variables.browser.isMobile('SAMSUNG-SGH-Z720/1.0 SHP/VPR/R5 NetFront/3.3 SMM-MMS/1.2.0 profile/MIDP-2.0 configuration/CLDC-1.1'));
		// Samsung SGH-E250
		assertTrue(variables.browser.isMobile('SAMSUNG-SGH-E250/1.0 Profile/MIDP-2.0 Configuration/CLDC-1.1 UP.Browser/6.2.3.3.c.1.101 (GUI) MMP/2.0'));
		// Samsung SGH-U600
		assertTrue(variables.browser.isMobile('SEC-SGHU600/1.0 NetFront/3.2 Profile'));
		// Samsung SGH-U900
		assertTrue(variables.browser.isMobile('SAMSUNG-SGH-U900-Vodafone/U900BUHD6 SHP/VPP/R5 NetFront/3.4 Qtv5.3 SMM-MMS/1.2.0 profile/MIDP-2.0 configuration/CLDC-1.1'));
		// Samsung SGH-T919
		assertTrue(variables.browser.isMobile('SAMSUNG-SGH-T919/919UVHL3SHP/VPP/R5NetFront/3.5SMM-MMS/1.2.0profile/MIDP-2.1configuration/CLDC-1.1'));
		// Samsung SGH-i900 Omnia
		assertTrue(variables.browser.isMobile('SAMSUNG-SGH-i900/1.0 Opera 9.5'));
		// Samsung SGH-i907
		assertTrue(variables.browser.isMobile('SAMSUNG-SGH-i907/UCHI5 Mozilla/4.0 (compatible; MSIE 6.0; Windows CE; IEMobile 7.11)'));
		// Samsung i617
		assertTrue(variables.browser.isMobile('SAMSUNG-SGH-I617/1.0 Mozilla/4.0 (compatible; MSIE 6.0; Windows CE; IEMobile 6.12) UP.Link/6.3.0.0.0'));
		// Samsung i7500 Galaxy
		assertTrue(variables.browser.isMobile('Mozilla/5.0 (Linux; U; Android 1.5; de-de; Galaxy Build/CUPCAKE) AppleWebkit/528.5+ (KHTML, like Gecko) Version/3.1.2 Mobile Safari/525.20.1'));
		// Opera Mini on Samsung Z720
		assertTrue(variables.browser.isMobile('Opera/9.50 (J2ME/MIDP; Opera Mini/4.1.11355/542; U; en)'));
	}
	
	/**
	 * SonyEricsson
	 */
	public void function testIsMobile_sonyEricsson_areMobile() {
		// SonyEricsson K510i
		assertTrue(variables.browser.isMobile('SonyEricssonK510i/R4CJ Browser/NetFront/3.3 Profile/MIDP-2.0 Configuration/CLDC-1.1'));
		// SonyEricsson K550i
		assertTrue(variables.browser.isMobile('SonyEricssonK550i/R8BA Browser/NetFront/3.3 Profile/MIDP-2.0 Configuration/CLDC-1.1'));
		// SonyEricsson K610i
		assertTrue(variables.browser.isMobile('SonyEricssonK610i/R1CB Browser/NetFront/3.3 Profile/MIDP-2.0 Configuration/CLDC-1.1'));
		// SonyEricsson K630i
		assertTrue(variables.browser.isMobile('SonyEricssonK630i/R1CA Browser/NetFront/3.4 Profile/MIDP-2.1 Configuration/CLDC-1.1'));
		// SonyEricsson K700
		assertTrue(variables.browser.isMobile('SonyEricssonK700/R1A Profile/MIDP-1.0 MIDP-2.0 Configuration/CLDC-1.1'));
		// SonyEricsson K750i
		assertTrue(variables.browser.isMobile('SonyEricssonK750i/R1CA Browser/SEMC-Browser/4.2 Profile/MIDP-2.0 Configuration/CLDC-1.1'));
		// SonyEricsson K800i
		assertTrue(variables.browser.isMobile('SonyEricssonK800i/R8BF Browser/NetFront/3.3 Profile/MIDP-2.0 Configuration/CLDC-1.1'));
		// SonyEricsson W800i
		assertTrue(variables.browser.isMobile('SonyEricssonW800i/R1AA Browser/SEMC-Browser/4.2 Profile/MIDP-2.0 Configuration/CLDC-1.1'));
		// SonyEricsson W810i
		assertTrue(variables.browser.isMobile('SonyEricssonW810i/MIDP-2.0 Configuration/CLDC-1.1'));
		// SonyEricsson W900i
		assertTrue(variables.browser.isMobile('SonyEricssonW900i/R5AH Browser/NetFront/3.3 Profile/MIDP-2.0 Configuration/CLDC-1.1'));
		// SonyEricsson W995i
		assertTrue(variables.browser.isMobile('SonyEricssonW995/R1DB Browser/NetFront/3.4 Profile/MIDP-2.1 Configuration/CLDC-1.1 JavaPlatform/JP-8.4.1'));
		// SonyEricsson Z500a
		assertTrue(variables.browser.isMobile('SonyEricssonZ500a/R1A SEMC-Browser/4.0.1 Profile/MIDP-2.0 Configuration/CLDC-1.1 UP.Link/6.3.1.20.0'));
		// SonyEricsson C901
		assertTrue(variables.browser.isMobile('SonyEricssonC901/R1EA Browser/NetFront/3.4 Profile/MIDP-2.1 Configuration/CLDC-1.1 JavaPlatform/JP-8.4.2'));
	}
</cfscript>
</cfcomponent>