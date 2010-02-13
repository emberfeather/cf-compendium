<!---
	Testing against a list of mobile browser user agents listed on Wikipedia.
	
	@see http://en.wikipedia.org/wiki/List_of_user_agents_for_mobile_phones
--->
<cfcomponent extends="mxunit.framework.TestCase" output="false">
<cfscript>
	/**
	 * 
	 */
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