<cfcomponent output="false">
<cfscript>
	public component function init() {
		return this;
	}
	
	/**
	 * Takes one or two dates and formats them together in the AP date format
	 */
	/* required date1 */
	public string function dateFormat( date date1, any date2 = '', boolean forceY = false ) {
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
			
			formatted = dateFormat(arguments.date1, dateMask(arguments.date1, inSameYear && !arguments.forceY)) & '-' & dateFormat(arguments.date2, dateMask(arguments.date2, inCurrentYear && inSameYear && !arguments.forceY, inSameMonth && inSameYear));
		} else {
			// Since only one exists make sure the value is always in the first time
			if( len(arguments.date2) ) {
				arguments.date1 = arguments.date2;
			}
			
			inCurrentYear = (year(now()) == year(arguments.date1) );
			
			formatted = dateFormat(arguments.date1, dateMask(arguments.date1, inCurrentYear && !arguments.forceY));
		}
		
		return replaceList(formatted, 'January,February,August,September,October,November,December', 'Jan.,Feb.,Aug.,Sept.,Oct.,Nov.,Dec.');
	}
	
	/**
	 * Determine the proper masking for the given date.
	 */
	/* required date1 */
	private string function dateMask( date date1, boolean suppressY = false, boolean suppressM = false ) {
		var maskY = ', yyyy';
		var maskM = 'mmmm ';
		
		if(arguments.suppressY){
			maskY = '';
		}
		
		if(arguments.suppressM){
			maskM = '';
		}
		
		return maskM & 'd' & maskY;
	}
	
	/**
	 * Takes one or two datetimes and formats them together in an AP time and date format
	 */
	/* required datetime1 */
	public string function datetimeFormat( date datetime1, any datetime2 = '' ) {
		var hasBoth = len(arguments.datetime1) && len(arguments.datetime2);
		var inCurrentYear = false;
		var inSameDay = false;
		var inSameMonth = false;
		var inSameYear = false;
		
		// If we have two dates that aren't the same we need to do some special formatting
		if( hasBoth && arguments.datetime1 != arguments.datetime2 ) {
			// Determine if they are in the same year
			inSameYear = ( year(arguments.datetime1) == year(arguments.datetime2) );
			inSameMonth = ( month(arguments.datetime1) == month(arguments.datetime2) );
			inSameDay = ( day(arguments.datetime1) == day(arguments.datetime2) );
			inCurrentYear = (year(now()) == year(arguments.datetime1) );
			
			if ( inSameYear && inSameMonth && inSameDay ) {
				return this.timeFormat(arguments.datetime1, arguments.datetime2) & ' ' & this.dateFormat(arguments.datetime1, arguments.datetime2);
			}
			
			return this.timeFormat(arguments.datetime1) & ' ' & this.dateFormat(date1 = arguments.datetime1, forceY = !inSameYear) & '-' & this.timeFormat(arguments.datetime2) & ' ' & this.dateFormat(arguments.datetime2);
		} else {
			// Since only one exists make sure the value is always in the first time
			if( len(arguments.datetime2) ) {
				arguments.datetime1 = arguments.datetime2;
			}
			
			return this.timeFormat(arguments.datetime1) & ' ' & this.dateFormat(arguments.datetime1);
		}
	}
	
	/**
	 * Takes one or two times and formats them together in the AP time format
	 */
	/* required time1 */
	public string function timeFormat( date time1, any time2 = '' ) {
		var hasBoth = len(arguments.time1) && len(arguments.time2);
		var inSameTT = false;
		
		// If we have two times that aren't the same we need to do some special formatting
		if( hasBoth && ( hour(arguments.time1) != hour(arguments.time2) || minute(arguments.time1) != minute(arguments.time2) || second(arguments.time1) != second(arguments.time2) ) ) {
			// Determine if they are in the same time marker
			inSameTT = ( int(hour(arguments.time1) / 12) == int(hour(arguments.time2) / 12) );
			
			return timeFormatFull(arguments.time1, inSameTT) & '-' & timeFormatFull(arguments.time2);
		}
		
		// Since only one exists make sure the value is always in the first time
		if( len(arguments.time2) ) {
			arguments.time1 = arguments.time2;
		}
		
		return timeFormatFull(arguments.time1);
	}
	
	/**
	 * Checks for the Noon and Midnight possibilities otherwise does a normal time format
	 */
	/* required time1 */
	private string function timeFormatFull( date time1, boolean suppressT = false, boolean suppressS = false ) {
		// Check for noon or midnight
		if( !minute(arguments.time1) && !second(arguments.time1) ) {
			if( hour(arguments.time1) == 0 ) {
				return 'Midnight';
			} else if( hour(arguments.time1) == 12 ) {
				return 'Noon';
			}
		}
		
		// Default to a normal time format
		return replaceList(timeFormat(arguments.time1, timeMask(argumentCollection = arguments)), 'AM,PM', 'a.m.,p.m.');
	}
	
	/**
	 * Determine the proper masking for the given time.
	 */
	/* required time1 */
	private string function timeMask( date time1, boolean suppressT = false, boolean suppressS = false ) {
		var maskM = ':mm';
		var maskT = ' tt';
		var maskS = ':ss';
		
		if(arguments.suppressT){
			maskT = '';
		}
		
		if(arguments.suppressS){
			maskS = '';
		}
		
		// If there are no minutes and seconds than suppress the minutes and seconds
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
