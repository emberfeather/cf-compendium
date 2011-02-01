component {
	public component function init() {
		return this;
	}
	
	public string function getSignature(required string message, required string key, string algorithm = 'HmacSHA1') {
		var mac = '';
		var signingKey = '';
		
		signingKey = createObject('java', 'javax.crypto.spec.SecretKeySpec').init(arguments.key.getBytes(), arguments.algorithm);
		
		mac = createObject('java', "javax.crypto.Mac").getInstance(arguments.algorithm);
		mac.init(signingKey);
		
		return mac.doFinal(arguments.message.GetBytes());
	}
	
	public string function getSignatureAsHex(required string message, required string key, string algorithm = 'HmacSHA1') {
		var bigInt = '';
		var result = '';
		
		result = getSignature(argumentCollection = arguments);
		
		bigInt = createObject("java", "java.math.BigInteger").init( 1, result );
		
		return bigInt.toString( 16 );
	}
	
	public string function getSignatureAsBase64(required string message, required string key, string algorithm = 'HmacSHA1') {
		return toBase64(getSignature(argumentCollection = arguments));
	}
}
