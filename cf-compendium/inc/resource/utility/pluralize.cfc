component {
	/**
	 * Based off pluralize from CFWheels global functions
	 */
	
	public component function init(struct options = {}) {
		variables.pluralized = {};
		
		return this;
	}
	
	public string function pluralize(required string text, numeric count = -1, boolean returnCount = true, string which = 'pluralize') {
		// run conversion unless count is passed in and its value means conversion is unnecessary
		if (arguments.which == "pluralize" && arguments.count == 1) {
			local.result = arguments.text;
		} else {
			local.result = singularizeOrPluralize( text = arguments.text, which = arguments.which );
		}
		
		// return the count number in the string (e.g. "5 sites" instead of just "sites")
		if (arguments.returnCount && arguments.count != -1) {
			local.result = LSNumberFormat(arguments.count) & " " & local.result;
		}
		
		return local.result;
	}
	
	public string function singularizeOrPluralize(required string text, string which = 'pluralize') {
		if(structKeyExists(variables.pluralized, arguments.which & '__' & arguments.text)) {
			return variables.pluralized[arguments.which & '__' & arguments.text];
		}
		
		// default to returning the same string when nothing can be converted
		local.result = arguments.text;
		
		// only pluralize/singularize the last part of a camelCased variable (e.g. in "websiteStatusUpdate" we only change the "update" part)
		// also set a variable with the unchanged part of the string (to be prepended before returning final result)
		if (REFind("[A-Z]", arguments.text))
		{
			local.upperCasePos = REFind("[A-Z]", Reverse(arguments.text));
			local.prepend = Mid(arguments.text, 1, Len(arguments.text)-local.upperCasePos);
			arguments.text = Reverse(Mid(Reverse(arguments.text), 1, local.upperCasePos));
		}
		
		local.uncountables = "advice,air,blood,deer,equipment,fish,food,furniture,garbage,graffiti,grass,homework,housework,information,knowledge,luggage,mathematics,meat,milk,money,music,pollution,research,rice,sand,series,sheep,soap,software,species,sugar,traffic,transportation,travel,trash,water,feedback";
		local.irregulars = "child,children,foot,feet,man,men,move,moves,person,people,sex,sexes,tooth,teeth,woman,women";
		
		if (ListFindNoCase(local.uncountables, arguments.text)) {
			// this word is the same in both plural and singular so it can just be returned as is
			local.result = arguments.text;
		} else if (ListFindNoCase(local.irregulars, arguments.text)) {
			// this word cannot be converted in a standard way so we return a preset value as specifed in the list above
			local.pos = ListFindNoCase(local.irregulars, arguments.text);
			
			if (arguments.which == "singularize" && local.pos MOD 2 == 0) {
				local.result = ListGetAt(local.irregulars, local.pos-1);
			} else if (arguments.which == "pluralize" && local.pos MOD 2 != 0) {
				local.result = ListGetAt(local.irregulars, local.pos+1);
			} else {
				local.result = arguments.text;
			}
		} else {
			// this word can probably be converted to plural/singular using standard rules so we'll do that
			// we'll start by setting the rules and create an array from them
			if (arguments.which == "pluralize") {
				local.ruleList = "(quiz)$,\1zes,^(ox)$,\1en,([m|l])ouse$,\1ice,(matr|vert|ind)ix|ex$,\1ices,(x|ch|ss|sh)$,\1es,([^aeiouy]|qu)y$,\1ies,(hive)$,\1s,(?:([^f])fe|([lr])f)$,\1\2ves,sis$,ses,([ti])um$,\1a,(buffal|tomat|potat|volcan|her)o$,\1oes,(bu)s$,\1ses,(alias|status)$,\1es,(octop|vir)us$,\1i,(ax|test)is$,\1es,s$,s,$,s";
			} else if (arguments.which == "singularize") {
				local.ruleList = "(quiz)zes$,\1,(matr)ices$,\1ix,(vert|ind)ices$,\1ex,^(ox)en,\1,(alias|status)es$,\1,([octop|vir])i$,\1us,(cris|ax|test)es$,\1is,(shoe)s$,\1,(o)es$,\1,(bus)es$,\1,([m|l])ice$,\1ouse,(x|ch|ss|sh)es$,\1,(m)ovies$,\1ovie,(s)eries$,\1eries,([^aeiouy]|qu)ies$,\1y,([lr])ves$,\1f,(tive)s$,\1,(hive)s$,\1,([^f])ves$,\1fe,(^analy)ses$,\1sis,((a)naly|(b)a|(d)iagno|(p)arenthe|(p)rogno|(s)ynop|(t)he)ses$,\1\2sis,([ti])a$,\1um,(n)ews$,\1ews,(.*)?ss$,\1ss,s$,#Chr(7)#";
			}
			
			local.rules = ArrayNew(2);
			local.count = 1;
			local.iEnd = ListLen(local.ruleList);
			
			for(local.i = 1; local.i <= local.iEnd; local.i= local.i + 2) {
				local.rules[local.count][1] = ListGetAt(local.ruleList, local.i);
				local.rules[local.count][2] = ListGetAt(local.ruleList, local.i+1);
				local.count = local.count + 1;
			}
			
			// loop through the rules looking for a match and perform the regex replace when we find one
			local.iEnd = ArrayLen(local.rules);
			for(local.i=1; local.i <= local.iEnd; local.i++) {
				if (reFindNoCase(local.rules[local.i][1], arguments.text)) {
					local.result = reReplaceNoCase(arguments.text, local.rules[local.i][1], local.rules[local.i][2]);
					break;
				}
			}
			
			// set back to blank string since we worked around the fact that we can't have blank values in lists above by using Chr(7) instead
			local.result = Replace(local.result, chr(7), "", "all");
		}
		
		// if this is a camel cased string we need to prepend the unchanged part to the result
		if (structKeyExists(local, "prepend")) {
			local.result = local.prepend & local.result;
		}
		
		// Cache it for now
		variables.pluralized[arguments.which & '__' & arguments.text] = local.result;
		
		return local.result;
	}
}
