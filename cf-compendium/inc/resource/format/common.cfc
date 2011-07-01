component extends="cf-compendium.inc.resource.base.formatter" {
	public string function baseN(required any value, any options) {
		if(!isNumeric(arguments.value)) {
			return arguments.value;
		}
		
		if(!structKeyExists(arguments.options, 'radix')) {
			arguments.options.radix = 10;
		}
		
		return formatBaseN(arguments.value, arguments.options.radix);
	}
	
	public string function date(required any value, any options) {
		if(!isDate(arguments.value)) {
			return arguments.value;
		}
		
		return dateFormat(arguments.value, arguments.options.mask);
	}
	
	public string function datetime(required any value, any options) {
		if(!isDate(arguments.value)) {
			return arguments.value;
		}
		
		return dateFormat(arguments.value, arguments.options.mask.date) & ' ' & timeFormat(arguments.value, arguments.options.mask.time);
	}
	
	public string function dollar(required any value, any options) {
		if(!isNumeric(arguments.value)) {
			return arguments.value;
		}
		
		return dollarFormat(arguments.value);
	}
	
	public string function htmlEdit(required string value, any options) {
		return htmlEditFormat(arguments.value);
	}
	
	public string function lsDate(required any value, any options) {
		if(!isDate(arguments.value)) {
			return arguments.value;
		}
		
		if(!structKeyExists(arguments.options, 'local')) {
			arguments.options.locale = GetLocale();
		}
		
		return lsDateFormat(arguments.value, arguments.options.mask, arguments.options.local);
	}
	
	public string function lsCurrency(required string value, any options) {
		if(!isNumeric(arguments.value)) {
			return arguments.value;
		}
		
		if(!structKeyExists(arguments.options, 'type')) {
			arguments.options.type = 'international';
		}
		
		if(!structKeyExists(arguments.options, 'local')) {
			arguments.options.locale = GetLocale();
		}
		
		return lsCurrencyFormat(arguments.value, arguments.options.type, arguments.options.locale);
	}
	
	public string function lsDatetime(required any value, any options) {
		if(!isDate(arguments.value)) {
			return arguments.value;
		}
		
		if(!structKeyExists(arguments.options, 'local')) {
			arguments.options.locale = GetLocale();
		}
		
		return lsDateFormat(arguments.value, arguments.options.mask.date, arguments.options.locale) & ' ' & lsTimeFormat(arguments.value, arguments.options.mask.time, arguments.options.locale);
	}
	
	public string function lsEuroCurrency(required string value, any options) {
		if(!isNumeric(arguments.value)) {
			return arguments.value;
		}
		
		if(!structKeyExists(arguments.options, 'type')) {
			arguments.options.type = 'international';
		}
		
		if(!structKeyExists(arguments.options, 'local')) {
			arguments.options.locale = GetLocale();
		}
		
		return lsEuroCurrencyFormat(arguments.value, arguments.options.type, arguments.options.locale);
	}
	
	public string function lsNumber(required string value, any options) {
		if(!isNumeric(arguments.value)) {
			return arguments.value;
		}
		
		if(!structKeyExists(arguments.options, 'local')) {
			arguments.options.locale = GetLocale();
		}
		
		return lsNumberFormat(arguments.value, arguments.options.mask, arguments.options.locale);
	}
	
	public string function lsTime(required any value, any options) {
		if(!isDate(arguments.value)) {
			return arguments.value;
		}
		
		return lsTimeFormat(arguments.value, arguments.options.mask);
	}
	
	public string function number(required string value, any options) {
		if(!isNumeric(arguments.value)) {
			return arguments.value;
		}
		
		return numberFormat(arguments.value, arguments.options.mask);
	}
	
	public string function time(required any value, any options) {
		if(!isDate(arguments.value)) {
			return arguments.value;
		}
		
		return timeFormat(arguments.value, arguments.options.mask);
	}
	
	public string function url(required any value, any options) {
		if(!len(arguments.value) || !reFindNoCase('^(http(|s)://|/|\./)', arguments.value)) {
			return arguments.value;
		}
		
		return '<a href="' & arguments.value & '">' & arguments.value & '</a>';
	}
	
	public string function uuid(required any value, any options) {
		if(len(arguments.value) <= 8) {
			return arguments.value;
		}
		
		return left(arguments.value, 8);
	}
}
