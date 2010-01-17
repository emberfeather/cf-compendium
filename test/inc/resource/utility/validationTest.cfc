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
		public void function testID_Valid() {
			var validator = variables.i18n.getValidation('en_US');
			
			validator.ID('testing', 10, '');
		}
		
		/**
		 * 
		 */
		public void function testIn_Valid() {
			var validator = variables.i18n.getValidation('en_US');
			
			validator.in('testing', 'is', 'is,it,in,here');
		}
		
		/**
		 * 
		 */
		public void function testIn_Invalid() {
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
		public void function testIn_Valid() {
			var validator = variables.i18n.getValidation('en_US');
			
			validator.in('testing', 'is', 'is,it,in,here');
		}
		
		/**
		 * 
		 */
		public void function testNotIn_Invalid() {
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
		public void function testNotIn_Valid() {
			var validator = variables.i18n.getValidation('en_US');
			
			validator.notIn('testing', 'waldo', 'val,is,in,here');
		}
		
		/**
		 * 
		 */
		public void function testIsNumer_Invalid() {
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
		public void function testIsNumer_Valid() {
			var validator = variables.i18n.getValidation('en_US');
			
			validator.isNumber('testing', 5, '');
		}
		
		/**
		 * 
		 */
		public void function testMaxLength_Invalid() {
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
		public void function testMaxLength_Valid() {
			var validator = variables.i18n.getValidation('en_US');
			
			validator.maxLength('testing', "val", 5);
		}
		
		/**
		 * 
		 */
		public void function testMinLength_Invalid() {
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
		public void function testMinLength_Valid() {
			var validator = variables.i18n.getValidation('en_US');
			
			validator.minLength('testing', "val", 2);
		}
		
		/**
		 * 
		 */
		public void function testNotEmpty_Invalid() {
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
		public void function testNotEmpty_Valid() {
			var validator = variables.i18n.getValidation('en_US');
			
			validator.notEmpty('testing', 'val', '');
		}
		
		/**
		 * 
		 */
		public void function testNotFuture_Invalid() {
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
		public void function testNotFuture_Valid() {
			var validator = variables.i18n.getValidation('en_US');
			
			validator.notEmpty('testing', Now(), '');
		}
		
		/**
		 * 
		 */
		public void function testNotGreaterThan_Invalid() {
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
		public void function testNotGreaterThan_Valid() {
			var validator = variables.i18n.getValidation('en_US');
			
			validator.notGreaterThan('testing', 2, 3);
		}
		
		/**
		 * 
		 */
		public void function testNotLessThan_Invalid() {
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
		public void function testNotLessThan_Valid() {
			var validator = variables.i18n.getValidation('en_US');
			
			validator.notLessThan('testing', 3, 2);
		}
		
		/**
		 * 
		 */
		public void function testNotPast_Invalid() {
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
		public void function testNotPast_Valid() {
			var validator = variables.i18n.getValidation('en_US');
			
			validator.notPast('testing', Now() + 1, '');
		}
		
		/**
		 * 
		 */
		public void function testValidEmail_Invalid() {
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
		public void function testValidEmail_Valid() {
			var validator = variables.i18n.getValidation('en_US');
			
			validator.validEmail('testing', 'test@test.com', '');
		}
		
		/**
		 * 
		 */
		public void function testValidURL_Invalid() {
			var validator = variables.i18n.getValidation('en_US');
			
			try{
				validator.validURL('testing', 'www.test', '');
				
				fail("Set should have thrown an error. [www.test is not a valid url]");
			} catch(mxunit.exception.AssertionFailedError exception) {
				rethrow();
			} catch(any exception) {
				// expect to get here
			}
		}
		
		/**
		 * 
		 */
		public void function testValidURL_Valid() {
			var validator = variables.i18n.getValidation('en_US');
			
			validator.validURL('testing', 'http://test.com', '');
		}
	</cfscript>
</cfcomponent>