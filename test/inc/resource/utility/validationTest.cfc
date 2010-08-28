component extends="mxunit.framework.TestCase" {
	public void function setup() {
		var bundle = '';
		var format = '';
		
		variables.i18n = createObject('component', 'cf-compendium.inc.resource.i18n.i18n').init(expandPath('/'));
		
		bundle = variables.i18n.getResourceBundle('/cf-compendium/i18n/inc/resource/utility', 'validation', 'en_US');
		format = variables.i18n.getMessageFormat('en_US');
		
		variables.validator = createObject('component', 'cf-compendium.inc.resource.utility.validation').init(bundle, format);
	}
	
	public void function testID_invalid_nonNumeric() {
		expectException('any', 'Set should have thrown an error. ["val" is not numeric]');
		
		variables.validator.ID('testing', "val", '');
	}
	
	public void function testID_invalid_negative() {
		expectException('any', 'Negatives are not allowed');
		
		variables.validator.ID('testing', -15, '');
	}
	
	public void function testID_valid_numeric() {
		variables.validator.ID('testing', 10, '');
	}
	
	public void function testIn_valid_inList() {
		variables.validator.in('testing', 'is', 'is,it,in,here');
	}
	
	public void function testIn_invalid_notInList() {
		expectException('any', 'Set should have thrown an error. ["val" is not in "is,it,in,here"]');
		
		variables.validator.in('testing', 'val', 'is,it,in,here');
	}
	
	public void function testNotIn_invalid_inList() {
		expectException('any', 'Set should have thrown an error. ["val" is in "val,is,in,here"');
		
		variables.validator.notIn('testing', 'val', 'val,is,in,here');
	}
	
	public void function testNotIn_valid_notInList() {
		variables.validator.notIn('testing', 'waldo', 'val,is,in,here');
	}
	
	public void function testIsBoolean_invalid_string() {
		expectException('any', 'Set should have thrown an error. [val is not boolean]');
		
		variables.validator.isBoolean('testing', "val", '');
	}
	
	public void function testIsBoolean_valid_false() {
		variables.validator.isBoolean('testing', false, '');
	}
	
	public void function testIsBoolean_valid_true() {
		variables.validator.isBoolean('testing', true, '');
	}
	
	public void function testIsNumber_invalid_string() {
		expectException('any', 'Set should have thrown an error. [val is not numeric]');
		
		variables.validator.isNumber('testing', "val", '');
	}
	
	public void function testIsNumber_valid_number() {
		variables.validator.isNumber('testing', 5, '');
	}
	
	public void function testMaxLength_invalid_overLength() {
		expectException('any', 'Set should have thrown an error. [the length is greater than 2]');
		
		variables.validator.maxLength('testing', "val", 2);
	}
	
	public void function testMaxLength_valid_underLength() {
		variables.validator.maxLength('testing', "val", 5);
	}
	
	public void function testMinLength_invalid_underLength() {
		expectException('any', 'Set should have thrown an error. [the length of val is less than 4]');
		
		variables.validator.minLength('testing', "val", 4);
	}
	
	public void function testMinLength_valid_overLength() {
		variables.validator.minLength('testing', "val", 2);
	}
	
	public void function testNotEmpty_invalid_empty() {
		expectException('any', 'Set should have thrown an error. [is empty]');
		
		variables.validator.notEmpty('testing', '', '');
	}
	
	public void function testNotEmpty_valid_notEmpty() {
		variables.validator.notEmpty('testing', 'val', '');
	}
	
	public void function testNotFuture_invalid_future() {
		expectException('any', 'Set should have thrown an error. [Now()+1 is in the future]');
		
		variables.validator.notFuture('testing', Now() + 1, '');
	}
	
	public void function testNotFuture_valid_now() {
		variables.validator.notEmpty('testing', Now(), '');
	}
	
	public void function testNotGreaterThan_invalid_greaterThan() {
		expectException('any', 'Set should have thrown an error. [3 is greater than 2]');
		
		variables.validator.notGreaterThan('testing', 3, 2);
	}
	
	public void function testNotGreaterThan_valid_lessThan() {
		variables.validator.notGreaterThan('testing', 2, 3);
	}
	
	public void function testNotLessThan_invalid_lessThan() {
		expectException('any', 'Set should have thrown an error. [2 is less than 3]');
		
		variables.validator.notLessThan('testing', 2, 3);
	}
	
	public void function testNotLessThan_valid_greaterThan() {
		variables.validator.notLessThan('testing', 3, 2);
	}
	
	public void function testNotPast_invalid_past() {
		expectException('any', 'Set should have thrown an error. [Now()-1 is in the past]');
		
		variables.validator.notPast('testing', Now() - 1, '');
	}
	
	public void function testNotPast_valid_future() {
		variables.validator.notPast('testing', Now() + 1, '');
	}
	
	public void function testValidEmail_invalid_noDomain() {
		expectException('any', 'Set should have thrown an error. [test@test is not a valid email]');
		
		variables.validator.validEmail('testing', 'test@test', '');
	}
	
	public void function testValidEmail_valid_fullEmail() {
		variables.validator.validEmail('testing', 'test@test.com', '');
	}
	
	public void function testValidURL_invalid_noProtocol() {
		expectException('any', 'Set should have thrown an error. [test.com is not a valid url without a protocol]');
		
		variables.validator.validURL('testing', 'test.com', '');
	}
	
	public void function testValidURL_valid_fullUrl() {
		variables.validator.validURL('testing', 'http://test.com', '');
	}
}
