<cfcomponent extends="mxunit.framework.TestCase" output="false">
	<cfscript>
		/**
		 * 
		 */
		public void function setup() {
			variables.i18n = createObject('component', 'cf-compendium.inc.resource.i18n.i18n').init(expandPath('/'));
		}
		
		/**
		 * 
		 */
		public void function testID_invalid_nonNumeric() {
			var validator = variables.i18n.getValidation('en_US');
			
			try {
				validator.ID('testing', "val", '');
				
				fail("Set should have thrown an error. ['val' is not numeric]");
			} catch(mxunit.exception.AssertionFailedError exception) {
				rethrow();
			} catch(any exception) {
				// expect to get here
			}
		}
		
		/**
		 * 
		 */
		public void function testID_invalid_negative() {
			var validator = variables.i18n.getValidation('en_US');
			
			try {
				validator.ID('testing', -15, '');
				
				fail("Negatives are not allowed");
			} catch(mxunit.exception.AssertionFailedError exception) {
				rethrow();
			} catch(any exception) {
				// expect to get here
			}
		}
		
		/**
		 * 
		 */
		public void function testID_valid_numeric() {
			var validator = variables.i18n.getValidation('en_US');
			
			validator.ID('testing', 10, '');
		}
		
		/**
		 * 
		 */
		public void function testIn_valid_inList() {
			var validator = variables.i18n.getValidation('en_US');
			
			validator.in('testing', 'is', 'is,it,in,here');
		}
		
		/**
		 * 
		 */
		public void function testIn_invalid_notInList() {
			var validator = variables.i18n.getValidation('en_US');
			
			try {
				validator.in('testing', 'val', 'is,it,in,here');
				
				fail("Set should have thrown an error. ['val' is not in 'is,it,in,here']");
			} catch(mxunit.exception.AssertionFailedError exception) {
				rethrow();
			} catch(any exception) {
				// expect to get here
			}
		}
		
		/**
		 * 
		 */
		public void function testNotIn_invalid_inList() {
			var validator = variables.i18n.getValidation('en_US');
			
			try {
				validator.notIn('testing', 'val', 'val,is,in,here');
				
				fail("Set should have thrown an error. ['val' is in 'val,is,in,here']");
			} catch (mxunit.exception.AssertionFailedError exception) {
				rethrow();
			} catch (any exception) {
				// expect to get here
			}
		}
		
		/**
		 * 
		 */
		public void function testNotIn_valid_notInList() {
			var validator = variables.i18n.getValidation('en_US');
			
			validator.notIn('testing', 'waldo', 'val,is,in,here');
		}
		
		/**
		 * 
		 */
		public void function testIsNumber_invalid_string() {
			var validator = variables.i18n.getValidation('en_US');
			
			try {
				validator.isNumber('testing', "val", '');
				
				fail("Set should have thrown an error. ['val' is not numeric]");
			} catch(mxunit.exception.AssertionFailedError exception) {
				rethrow();
			} catch(any exception) {
				// expect to get here
			}
		}
		
		/**
		 * 
		 */
		public void function testIsNumber_valid_number() {
			var validator = variables.i18n.getValidation('en_US');
			
			validator.isNumber('testing', 5, '');
		}
		
		/**
		 * 
		 */
		public void function testMaxLength_invalid_overLength() {
			var validator = variables.i18n.getValidation('en_US');
			
			try {
				validator.maxLength('testing', "val", 2);
				
				fail("Set should have thrown an error. [the length of 'val' is greater than 2]");
			} catch(mxunit.exception.AssertionFailedError exception) {
				rethrow();
			} catch(any exception) {
				// expect to get here
			}
		}
		
		/**
		 * 
		 */
		public void function testMaxLength_valid_underLength() {
			var validator = variables.i18n.getValidation('en_US');
			
			validator.maxLength('testing', "val", 5);
		}
		
		/**
		 * 
		 */
		public void function testMinLength_invalid_underLength() {
			var validator = variables.i18n.getValidation('en_US');
			
			try{
				validator.minLength('testing', "val", 4);
				
				fail("Set should have thrown an error. [the length of 'val' is less than 4]");		
			} catch(mxunit.exception.AssertionFailedError exception) {
				rethrow();
			} catch(any exception) {
				// expect to get here
			}
		}
		
		/**
		 * 
		 */
		public void function testMinLength_valid_overLength() {
			var validator = variables.i18n.getValidation('en_US');
			
			validator.minLength('testing', "val", 2);
		}
		
		/**
		 * 
		 */
		public void function testNotEmpty_invalid_empty() {
			var validator = variables.i18n.getValidation('en_US');
			
			try{
				validator.notEmpty('testing', '', '');
				
				fail("Set should have thrown an error. ['' is empty]");
			} catch(mxunit.exception.AssertionFailedError exception) {
				rethrow();
			} catch(any exception) {
				// expect to get here
			}
		}
		
		/**
		 * 
		 */
		public void function testNotEmpty_valid_notEmpty() {
			var validator = variables.i18n.getValidation('en_US');
			
			validator.notEmpty('testing', 'val', '');
		}
		
		/**
		 * 
		 */
		public void function testNotFuture_invalid_future() {
			var validator = variables.i18n.getValidation('en_US');
			
			try{
				validator.notFuture('testing', Now() + 1, '');
				
				fail("Set should have thrown an error. [Now()+1 is in the future]");
			} catch(mxunit.exception.AssertionFailedError exception) {
				rethrow();
			} catch(any exception) {
				// expect to get here
			}
		}
		
		/**
		 * 
		 */
		public void function testNotFuture_valid_now() {
			var validator = variables.i18n.getValidation('en_US');
			
			validator.notEmpty('testing', Now(), '');
		}
		
		/**
		 * 
		 */
		public void function testNotGreaterThan_invalid_greaterThan() {
			var validator = variables.i18n.getValidation('en_US');
			
			try{
				validator.notGreaterThan('testing', 3, 2);
				
				fail("Set should have thrown an error. [3 is greater than 2]");
			} catch(mxunit.exception.AssertionFailedError exception) {
				rethrow();
			} catch(any exception) {
				// expect to get here
			}
		}
		
		/**
		 * 
		 */
		public void function testNotGreaterThan_valid_lessThan() {
			var validator = variables.i18n.getValidation('en_US');
			
			validator.notGreaterThan('testing', 2, 3);
		}
		
		/**
		 * 
		 */
		public void function testNotLessThan_invalid_lessThan() {
			var validator = variables.i18n.getValidation('en_US');
			
			try{
				validator.notLessThan('testing', 2, 3);
				
				fail("Set should have thrown an error. [2 is less than 3]");
			} catch(mxunit.exception.AssertionFailedError exception) {
				rethrow();
			} catch(any exception) {
				// expect to get here
			}
		}
		
		/**
		 * 
		 */
		public void function testNotLessThan_valid_greaterThan() {
			var validator = variables.i18n.getValidation('en_US');
			
			validator.notLessThan('testing', 3, 2);
		}
		
		/**
		 * 
		 */
		public void function testNotPast_invalid_past() {
			var validator = variables.i18n.getValidation('en_US');
			
			try{
				validator.notPast('testing', Now() - 1, '');
				
				fail("Set should have thrown an error. [Now()-1 is in the past]");
			} catch(mxunit.exception.AssertionFailedError exception) {
				rethrow();
			} catch(any exception) {
				// expect to get here
			}
		}
		
		/**
		 * 
		 */
		public void function testNotPast_valid_future() {
			var validator = variables.i18n.getValidation('en_US');
			
			validator.notPast('testing', Now() + 1, '');
		}
		
		/**
		 * 
		 */
		public void function testValidEmail_invalid_noDomain() {
			var validator = variables.i18n.getValidation('en_US');
			
			try{
				validator.validEmail('testing', 'test@test', '');
				
				fail("Set should have thrown an error. [test@test is not a valid email]");
			} catch(mxunit.exception.AssertionFailedError exception) {
				rethrow();
			} catch(any exception) {
				// expect to get here
			}
		}
		
		/**
		 * 
		 */
		public void function testValidEmail_valid_fullEmail() {
			var validator = variables.i18n.getValidation('en_US');
			
			validator.validEmail('testing', 'test@test.com', '');
		}
		
		/**
		 * 
		 */
		public void function testValidURL_invalid_noProtocol() {
			var validator = variables.i18n.getValidation('en_US');
			
			try{
				validator.validURL('testing', 'test.com', '');
				
				fail("Set should have thrown an error. [test.com is not a valid url without a protocol]");
			} catch(mxunit.exception.AssertionFailedError exception) {
				rethrow();
			} catch(any exception) {
				// expect to get here
			}
		}
		
		/**
		 * 
		 */
		public void function testValidURL_valid_fullUrl() {
			var validator = variables.i18n.getValidation('en_US');
			
			validator.validURL('testing', 'http://test.com', '');
		}
	</cfscript>
</cfcomponent>