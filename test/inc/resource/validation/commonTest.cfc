component extends="mxunit.framework.TestCase" {
	public void function setup() {
		var bundle = '';
		var format = '';
		
		variables.i18n = createObject('component', 'cf-compendium.inc.resource.i18n.i18n').init(expandPath('/'));
		variables.validator = createObject('component', 'cf-compendium.inc.resource.validation.validation').init(variables.i18n, 'en_US');
	}
	
	public void function testID_invalid_nonNumeric() {
		expectException('validation', 'Should have thrown an error. ["val" is not numeric]');
		
		variables.validator.ID('testing', "val", '');
	}
	
	public void function testID_invalid_negative() {
		expectException('validation', 'Negatives are not allowed');
		
		variables.validator.ID('testing', -15, '');
	}
	
	public void function testID_valid_blank() {
		variables.validator.ID('testing', '', '');
	}
	
	public void function testID_valid_numeric() {
		variables.validator.ID('testing', 10, '');
	}
	
	public void function testIn_invalid_notInList() {
		expectException('validation', 'Should have thrown an error. ["val" is not in "is,it,in,here"]');
		
		variables.validator.in('testing', 'val', 'is,it,in,here');
	}
	
	public void function testIn_valid_blank() {
		variables.validator.in('testing', '', 'is,it,in,here');
	}
	
	public void function testIn_valid_inList() {
		variables.validator.in('testing', 'is', 'is,it,in,here');
	}
	
	public void function testNotIn_invalid_inList() {
		expectException('validation', 'Should have thrown an error. ["val" is in "val,is,in,here"');
		
		variables.validator.notIn('testing', 'val', 'val,is,in,here');
	}
	
	public void function testNotIn_valid_blank() {
		variables.validator.notIn('testing', '', 'val,is,in,here');
	}
	
	public void function testNotIn_valid_notInList() {
		variables.validator.notIn('testing', 'waldo', 'val,is,in,here');
	}
	
	public void function testIsAlpha_invalid_number() {
		expectException('validation', 'Should have thrown an error. [contains number]');
		
		variables.validator.isAlpha('testing', "val18", {});
	}
	
	public void function testIsAlpha_invalid_space() {
		expectException('validation', 'Should have thrown an error. [contains space]');
		
		variables.validator.isAlpha('testing', "val ue", {});
	}
	
	public void function testIsAlpha_invalid_unicode() {
		expectException('validation', 'Should have thrown an error. [contains unicode]');
		
		variables.validator.isAlpha('testing', "vàlue", {});
	}
	
	public void function testIsAlpha_valid_blank() {
		variables.validator.isAlpha('testing', '', { allowSpaces: true });
	}
	
	public void function testIsAlpha_valid_space() {
		variables.validator.isAlpha('testing', "val ue", { allowSpaces: true });
	}
	
	public void function testIsAlpha_valid_special_character() {
		variables.validator.isAlpha('testing', "vàlue", { specialChars: 'à' });
	}
	
	public void function testIsAlphanumeric_invalid_space() {
		expectException('validation', 'Should have thrown an error. [contains space]');
		
		variables.validator.isAlphanumeric('testing', "val ue63", {});
	}
	
	public void function testIsAlphanumeric_invalid_unicode() {
		expectException('validation', 'Should have thrown an error. [contains unicode]');
		
		variables.validator.isAlphanumeric('testing', "vàlue", {});
	}
	
	public void function testIsAlphanumeric_valid_blank() {
		variables.validator.isAlphanumeric('testing', '', { allowSpaces: true });
	}
	
	public void function testIsAlphanumeric_valid_space() {
		variables.validator.isAlphanumeric('testing', "val 54ue", { allowSpaces: true });
	}
	
	public void function testIsAlphanumeric_valid_special_character() {
		variables.validator.isAlphanumeric('testing', "vàlue84", { specialChars: 'à' });
	}
	
	public void function testIsBoolean_invalid_string() {
		expectException('validation', 'Should have thrown an error. [val is not boolean]');
		
		variables.validator.isBoolean('testing', "val", '');
	}
	
	public void function testIsBoolean_valid_blank() {
		variables.validator.isBoolean('testing', '', '');
	}
	
	public void function testIsBoolean_valid_false() {
		variables.validator.isBoolean('testing', false, '');
	}
	
	public void function testIsBoolean_valid_true() {
		variables.validator.isBoolean('testing', true, '');
	}
	
	public void function testIsNumber_invalid_string() {
		expectException('validation', 'Should have thrown an error. [val is not numeric]');
		
		variables.validator.isNumber('testing', "val", '');
	}
	
	public void function testIsNumber_valid_blank() {
		variables.validator.isNumber('testing', '', '');
	}
	
	public void function testIsNumber_valid_number() {
		variables.validator.isNumber('testing', 5, '');
	}
	
	public void function testMaxLength_invalid_overLength() {
		expectException('validation', 'Should have thrown an error. [the length is greater than 2]');
		
		variables.validator.maxLength('testing', "val", 2);
	}
	
	public void function testMaxLength_valid_blank() {
		variables.validator.maxLength('testing', '', 5);
	}
	
	public void function testMaxLength_valid_underLength() {
		variables.validator.maxLength('testing', "val", 5);
	}
	
	public void function testMinLength_invalid_underLength() {
		expectException('validation', 'Should have thrown an error. [the length of val is less than 4]');
		
		variables.validator.minLength('testing', "val", 4);
	}
	
	public void function testMinLength_valid_blank() {
		variables.validator.minLength('testing', '', 2);
	}
	
	public void function testMinLength_valid_overLength() {
		variables.validator.minLength('testing', "val", 2);
	}
	
	public void function testNotEmpty_invalid_empty() {
		expectException('validation', 'Should have thrown an error. [is empty]');
		
		variables.validator.notEmpty('testing', '', '');
	}
	
	public void function testNotEmpty_valid_notEmpty() {
		variables.validator.notEmpty('testing', 'val', '');
	}
	
	public void function testNotFuture_invalid_future() {
		expectException('validation', 'Should have thrown an error. [Now()+1 is in the future]');
		
		variables.validator.notFuture('testing', Now() + 1, '');
	}
	
	public void function testNotFuture_valid_blank() {
		variables.validator.notFuture('testing', '', '');
	}
	
	public void function testNotFuture_valid_now() {
		variables.validator.notFuture('testing', Now(), '');
	}
	
	public void function testNotGreaterThan_invalid_greaterThan() {
		expectException('validation', 'Should have thrown an error. [3 is greater than 2]');
		
		variables.validator.notGreaterThan('testing', 3, 2);
	}
	
	public void function testNotGreaterThan_valid_blank() {
		variables.validator.notGreaterThan('testing', '', 3);
	}
	
	public void function testNotGreaterThan_valid_lessThan() {
		variables.validator.notGreaterThan('testing', 2, 3);
	}
	
	public void function testNotLessThan_invalid_lessThan() {
		expectException('validation', 'Should have thrown an error. [2 is less than 3]');
		
		variables.validator.notLessThan('testing', 2, 3);
	}
	
	public void function testNotLessThan_valid_blank() {
		variables.validator.notLessThan('testing', '', 2);
	}
	
	public void function testNotLessThan_valid_greaterThan() {
		variables.validator.notLessThan('testing', 3, 2);
	}
	
	public void function testNotPast_invalid_past() {
		expectException('validation', 'Should have thrown an error. [Now()-1 is in the past]');
		
		variables.validator.notPast('testing', Now() - 1, '');
	}
	
	public void function testNotPast_valid_blank() {
		variables.validator.notPast('testing', '', '');
	}
	
	public void function testNotPast_valid_future() {
		variables.validator.notPast('testing', Now() + 1, '');
	}
	
	public void function testValidEmail_invalid_controlCharacter() {
		expectException('validation', 'Should have thrown an error. [contains a control character]');
		
		variables.validator.validEmail('testing', 'te#chr(10)#st@test', '');
	}
	
	public void function testValidEmail_invalid_domain_short_1() {
		expectException('validation', 'Should have thrown an error. [too short domain]');
		
		variables.validator.validEmail('testing', 'test@.', '');
	}
	
	public void function testValidEmail_invalid_domain_short_2() {
		expectException('validation', 'Should have thrown an error. [too short domain]');
		
		variables.validator.validEmail('testing', 'test@example.', '');
	}
	
	public void function testValidEmail_invalid_domain_short_3() {
		expectException('validation', 'Should have thrown an error. [too short domain]');
		
		variables.validator.validEmail('testing', 'test@.org', '');
	}
	
	public void function testValidEmail_invalid_domain_long_() {
		expectException('validation', 'Should have thrown an error. [too long domain]');
		
		variables.validator.validEmail('testing', 'test@123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012.com', '');
	}
	
	public void function testValidEmail_invalid_domain_tooFewLabels() {
		expectException('validation', 'Should have thrown an error. [too few domain labels]');
		
		variables.validator.validEmail('testing', 'test@example', '');
	}
	
	public void function testValidEmail_invalid_domain_unpartneredIPBracket_1() {
		expectException('validation', 'Should have thrown an error. [unpaired brackets]');
		
		variables.validator.validEmail('testing', 'test@[123.123.123.123', '');
	}
	
	public void function testValidEmail_invalid_domain_unpartneredIPBracket_2() {
		expectException('validation', 'Should have thrown an error. [unpaired brackets]');
		
		variables.validator.validEmail('testing', 'test@123.123.123.123]', '');
	}
	
	public void function testValidEmail_invalid_localPart_blankAtom_beginning() {
		expectException('validation', 'Should have thrown an error. [blank atom part]');
		
		variables.validator.validEmail('testing', '.test@example.com', '');
	}
	
	public void function testValidEmail_invalid_localPart_blankAtom_middle() {
		expectException('validation', 'Should have thrown an error. [blank atom part]');
		
		variables.validator.validEmail('testing', 'test..test@example.com', '');
	}
	
	public void function testValidEmail_invalid_localPart_blankAtom_end() {
		expectException('validation', 'Should have thrown an error. [blank atom part]');
		
		variables.validator.validEmail('testing', 'test.@example.com', '');
	}
	
	public void function testValidEmail_invalid_localPart_character_1() {
		expectException('validation', 'Should have thrown an error. [contains invalid characters]');
		
		variables.validator.validEmail('testing', '-- test --@example.com', '');
	}
	
	public void function testValidEmail_invalid_localPart_character_2() {
		expectException('validation', 'Should have thrown an error. [contains invalid characters]');
		
		variables.validator.validEmail('testing', '[test]@example.com', '');
	}
	
	public void function testValidEmail_invalid_localPart_character_3() {
		expectException('validation', 'Should have thrown an error. [contains invalid characters]');
		
		variables.validator.validEmail('testing', '"test"test"@example.com', '');
	}
	
	public void function testValidEmail_invalid_localPart_character_4() {
		expectException('validation', 'Should have thrown an error. [contains invalid characters]');
		
		variables.validator.validEmail('testing', '()[]\;:,<>@example.com', '');
	}
	
	public void function testValidEmail_invalid_localPart_length() {
		expectException('validation', 'Should have thrown an error. [contains a too long local part]');
		
		variables.validator.validEmail('testing', '12345678901234567890123456789012345678901234567890123456789012345@example.com', '');
	}
	
	public void function testValidEmail_invalid_length() {
		expectException('validation', 'Should have thrown an error. [too long]');
		
		variables.validator.validEmail('testing', '12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345@example.com', '');
	}
	
	public void function testValidEmail_invalid_multipleAt_1() {
		expectException('validation', 'Should have thrown an error. [contains multiple @ characters out of quotes]');
		
		variables.validator.validEmail('testing', 'test@test@example.com', '');
	}
	
	public void function testValidEmail_invalid_multipleAt_2() {
		expectException('validation', 'Should have thrown an error. [contains multiple @ characters out of quotes]');
		
		variables.validator.validEmail('testing', 'test@@example.com', '');
	}
	
	public void function testValidEmail_invalid_noAt() {
		expectException('validation', 'Should have thrown an error. [missing @ symbol]');
		
		variables.validator.validEmail('testing', 'test.example.com', '');
	}
	
	public void function testValidEmail_invalid_noDomain() {
		expectException('validation', 'Should have thrown an error. [test@test is not a valid email]');
		
		variables.validator.validEmail('testing', 'test@', '');
	}
	
	public void function testValidEmail_invalid_noLocalPart() {
		expectException('validation', 'Should have thrown an error. [test@test is not a valid email]');
		
		variables.validator.validEmail('testing', '@test.com', '');
	}
	
	public void function testValidEmail_valid_blank() {
		variables.validator.validEmail('testing', '', '');
	}
	
	public void function testValidEmail_valid_domain_ip() {
		variables.validator.validEmail('testing', 'test@123.123.123.123', '');
	}
	
	public void function testValidEmail_valid_domain_ipBracket() {
		variables.validator.validEmail('testing', 'test@[123.123.123.123]', '');
	}
	
	public void function testValidEmail_valid_domain_multipleLabel() {
		variables.validator.validEmail('testing', 'test@example.example.com', '');
		variables.validator.validEmail('testing', 'test@example.example.example.com', '');
	}
	
	public void function testValidEmail_valid_email_normal() {
		variables.validator.validEmail('testing', 'test@test.com', '');
	}
	
	public void function testValidEmail_valid_localPart_atomised() {
		variables.validator.validEmail('testing', 'test.test@example.com', '');
	}
	
	public void function testValidEmail_valid_localPart_number() {
		variables.validator.validEmail('testing', '1234567890@example.com', '');
	}
	
	public void function testValidEmail_valid_localPart_obsolete() {
		variables.validator.validEmail('testing', 'test."test"@example.com', '');
	}
	
	public void function testValidEmail_valid_localPart_qmail() {
		variables.validator.validEmail('testing', 'test-test@example.com', '');
	}
	
	public void function testValidEmail_valid_localPart_quoted() {
		variables.validator.validEmail('testing', '"[[ test ]]"@example.com', '');
	}
	
	public void function testValidEmail_valid_localPart_quotedAt() {
		variables.validator.validEmail('testing', '"test@test"@example.com', '');
	}
	
	public void function testValidEmail_valid_localPart_tagged() {
		variables.validator.validEmail('testing', 'test+test@example.com', '');
	}
	
	public void function testValidEmail_valid_localPart_uppercase() {
		variables.validator.validEmail('testing', 'TEST@example.com', '');
	}
	
	public void function testValidEmail_valid_fullEmail_localPart_unusual_1() {
		variables.validator.validEmail('testing', 't*est@example.com', '');
	}
	
	public void function testValidEmail_valid_fullEmail_localPart_unusual_2() {
		variables.validator.validEmail('testing', '+1~1+@example.com', '');
	}
	
	public void function testValidEmail_valid_fullEmail_localPart_unusual_3() {
		variables.validator.validEmail('testing', '{_test_}@example.com', '');
	}
	
	public void function testValidURL_invalid_noProtocol() {
		expectException('validation', 'Should have thrown an error. [test.com is not a valid url without a protocol]');
		
		variables.validator.validURL('testing', 'test.com', '');
	}
	
	public void function testValidURL_valid_blank() {
		variables.validator.validURL('testing', '', '');
	}
	
	public void function testValidURL_valid_fullUrl_http() {
		variables.validator.validURL('testing', 'http://test.com', '');
	}
	
	public void function testValidURL_valid_fullUrl_https() {
		variables.validator.validURL('testing', 'https://test.com', '');
	}
}
