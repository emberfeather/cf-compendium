component {
	public component function init() {
		return this;
	}
	
	public string function getSignature(required string message, required string key, string hashFunction = 'HmacSHA1') {
		var mac = '';
		var signingKey = '';
		
		signingKey = createObject('java', 'javax.crypto.spec.SecretKeySpec').init(arguments.key.getBytes(), arguments.hashFunction);
		
		mac = createObject('java', "javax.crypto.Mac").getInstance(arguments.hashFunction);
		mac.init(signingKey);
		
		return mac.doFinal(arguments.message.GetBytes());
	}
	
	public string function getSignatureAsBase64(required string message, required string key, string hashFunction = 'HmacSHA1') {
		var bigInt = '';
		var result = '';
		
		result = getSignature(argumentCollection = arguments)
		
		bigInt = createObject("java", "java.math.BigInteger").init( 1, result );
		
		return bigInt.toString( 16 );
	}
}
