<cfcomponent output="false">
<cfscript>
	public component function init() {
		return this;
	}
	
	/**
	 * Takes one or two dates and formats them together in the AP date format
	 */
	/* required date1 */
	public string function dateFormat( date date1, any date2 = '' ) {
		var hasBoth = len(arguments.date1) && len(arguments.date2);
		var formatted = '';
		var inCurrentYear = false;
		var inSameMonth = false;
		var inSameYear = false;
		
		// If we have two dates that aren't the same we need to do some special formatting
		if( hasBoth && ( day(arguments.date1) != day(arguments.date2) || month(arguments.date1) != month(arguments.date2) || year(arguments.date1) != year(arguments.date2) ) ) {
			// Determine if they are in the same year
			inSameYear = ( year(arguments.date1) == year(arguments.date2) );
			inSameMonth = ( month(arguments.date1) == month(arguments.date2) );
			inCurrentYear = (year(now()) == year(arguments.date1) );
			
			formatted = dateFormat(arguments.date1, dateMask(arguments.date1, inSameYear)) & '-' & dateFormat(arguments.date2, dateMask(arguments.date2, inCurrentYear && inSameYear, inSameMonth && inSameYear));
		} else {
			// Since only one exists make sure the value is always in the first time
			if( len(arguments.date2) ) {
				arguments.date1 = arguments.date2;
			}
			
			inCurrentYear = (year(now()) == year(arguments.date1) );
			
			formatted = dateFormat(arguments.date1, dateMask(arguments.date1, inCurrentYear));
		}
		
		return replaceList(formatted, 'January,February,August,September,October,November,December', 'Jan.,Feb.,Aug.,Sept.,Oct.,Nov.,Dec.');
	}
	
	/**
	 * Determine the proper masking for the given date.
	 */
	/* required date1 */
	private string function dateMask( date date1, boolean supressY = false, boolean supressM = false ) {
		var maskY = ', yyyy';
		var maskM = 'mmmm ';
		
		if(arguments.supressY){
			maskY = '';
		}
		
		if(arguments.supressM){
			maskM = '';
		}
		
		return maskM & 'd' & maskY;
	}
	
	/**
	 * Takes one or two times and formats them together in the AP time format
	 */
	/* required time1 */
	public string function timeFormat( date time1, any time2 = '' ) {
		var hasBoth = len(arguments.time1) && len(arguments.time2);
		var inSameTT = false;
		var formatted = '';
		
		// If we have two times that aren't the same we need to do some special formatting
		if( hasBoth && (hour(arguments.time1) != hour(arguments.time2) || minute(arguments.time1) != minute(arguments.time2) || second(arguments.time1) != second(arguments.time2)) ) {
			// Determine if they are in the same time marker
			inSameTT = ( int(hour(arguments.time1) / 12) == int(hour(arguments.time2) / 12) );
			
			formatted = timeFormatFull(arguments.time1, inSameTT) & '-' & timeFormatFull(arguments.time2);
		} else {
			// Since only one exists make sure the value is always in the first time
			if( len(arguments.time2) ) {
				arguments.time1 = arguments.time2;
			}
			
			formatted = timeFormatFull(arguments.time1);
		}
		
		return replaceList(formatted, 'AM,PM', 'a.m.,p.m.');
	}
	
	/**
	 * Checks for the Noon and Midnight possibilities otherwise does a normal time format
	 */
	/* required time1 */
	private string function timeFormatFull( date time1, boolean supressT = false, boolean supressS = false ) {
		// Check for noon or midnight
		if( !minute(arguments.time1) && !second(arguments.time1) ) {
			if( hour(arguments.time1) == 0 ) {
				return 'Midnight';
			} else if( hour(arguments.time1) == 12 ) {
				return 'Noon';
			}
		}
		
		// Default to a normal time format
		return timeFormat(arguments.time1, timeMask(argumentCollection = arguments));
	}
	
	/**
	 * Determine the proper masking for the given time.
	 */
	/* required time1 */
	private string function timeMask( date time1, boolean supressT = false, boolean supressS = false ) {
		var maskM = ':mm';
		var maskT = ' tt';
		var maskS = ':ss';
		
		if(arguments.supressT){
			maskT = '';
		}
		
		if(arguments.supressS){
			maskS = '';
		}
		
		// If there are no minutes and seconds than supress the minutes and seconds
		if( !minute(arguments.time1) && !second(arguments.time1) ) {
			maskM = '';
			maskS = '';
		} else if( !second(arguments.time1) ) {
			maskS = '';
		}
		
		return 'h' & maskM & maskS & maskT;
	}
</cfscript>
</cfcomponent>
