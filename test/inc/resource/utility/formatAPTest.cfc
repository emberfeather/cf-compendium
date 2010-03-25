<cfcomponent extends="mxunit.framework.TestCase" output="false">
	<cfscript>
		/**
		 * 
		 */
		public void function setup() {
			variables.apFormat = createObject('component', 'cf-compendium.inc.resource.utility.formatAP').init();
		}
		
		public void function testDateFormat_withDoubleDates_differentYear_differentMonth_differentDays() {
			var date1 = createDate(year(now()) + 1, 5, 20);
			var date2 = createDate(year(now()) + 1, 6, 21);
			
			assertEquals('May 20-June 21, ' & year(now()) + 1, variables.apFormat.dateFormat(date1, date2));
		}
		
		public void function testDateFormat_withDoubleDates_differentYear_differentMonth_sameDays() {
			var date1 = createDate(year(now()) + 1, 5, 20);
			var date2 = createDate(year(now()) + 1, 6, 20);
			
			assertEquals('May 20-June 20, ' & year(now()) + 1, variables.apFormat.dateFormat(date1, date2));
		}
		
		public void function testDateFormat_withDoubleDates_differentYear_sameMonth_differentDays() {
			var date1 = createDate(year(now()) + 1, 5, 20);
			var date2 = createDate(year(now()) + 1, 5, 21);
			
			assertEquals('May 20-21, ' & year(now()) + 1, variables.apFormat.dateFormat(date1, date2));
		}
		
		public void function testDateFormat_withDoubleDates_differentYear_sameMonth_sameDays() {
			var date1 = createDate(year(now()) + 1, 5, 20);
			var date2 = createDate(year(now()) + 1, 5, 20);
			
			assertEquals('May 20, ' & year(now()) + 1, variables.apFormat.dateFormat(date1, date2));
		}
		
		public void function testDateFormat_withDoubleDates_differentYears_differentMonth_differentDays() {
			var date1 = createDate(year(now()), 5, 20);
			var date2 = createDate(year(now()) + 1, 6, 21);
			
			assertEquals('May 20, ' & year(now()) & '-June 21, ' & year(now()) + 1, variables.apFormat.dateFormat(date1, date2));
		}
		
		public void function testDateFormat_withDoubleDates_differentYears_differentMonth_sameDays() {
			var date1 = createDate(year(now()), 5, 20);
			var date2 = createDate(year(now()) + 1, 6, 20);
			
			assertEquals('May 20, ' & year(now()) & '-June 20, ' & year(now()) + 1, variables.apFormat.dateFormat(date1, date2));
		}
		
		public void function testDateFormat_withDoubleDates_differentYears_sameMonth_differentDays() {
			var date1 = createDate(year(now()), 5, 20);
			var date2 = createDate(year(now()) + 1, 5, 21);
			
			assertEquals('May 20, ' & year(now()) & '-May 21, ' & year(now()) + 1, variables.apFormat.dateFormat(date1, date2));
		}
		
		public void function testDateFormat_withDoubleDates_differentYears_sameMonth_sameDays() {
			var date1 = createDate(year(now()), 5, 20);
			var date2 = createDate(year(now()) + 1, 5, 20);
			
			assertEquals('May 20, ' & year(now()) & '-May 20, ' & year(now()) + 1, variables.apFormat.dateFormat(date1, date2));
		}
		
		public void function testDateFormat_withDoubleDates_sameYear_differentMonth_differentDays() {
			var date1 = createDate(year(now()), 5, 20);
			var date2 = createDate(year(now()), 6, 21);
			
			assertEquals('May 20-June 21', variables.apFormat.dateFormat(date1, date2));
		}
		
		public void function testDateFormat_withDoubleDates_sameYear_differentMonth_sameDays() {
			var date1 = createDate(year(now()), 5, 20);
			var date2 = createDate(year(now()), 6, 20);
			
			assertEquals('May 20-June 20', variables.apFormat.dateFormat(date1, date2));
		}
		
		public void function testDateFormat_withDoubleDates_sameYear_sameMonth_differentDays() {
			var date1 = createDate(year(now()), 5, 20);
			var date2 = createDate(year(now()), 5, 21);
			
			assertEquals('May 20-21', variables.apFormat.dateFormat(date1, date2));
		}
		
		public void function testDateFormat_withDoubleDates_sameYear_sameMonth_sameDays() {
			var date1 = createDate(year(now()), 5, 20);
			var date2 = createDate(year(now()), 5, 20);
			
			assertEquals('May 20', variables.apFormat.dateFormat(date1, date2));
		}
		
		/**
		 * When given a single date in a different year it should output the month, day, and year.
		 */
		public void function testDateFormat_withSingleDate_differentYear() {
			var date1 = createDate(year(now()) + 1, 5, 31);
			
			assertEquals('May 31, #year(now()) + 1#', variables.apFormat.dateFormat(date1));
		}
		
		public void function testDateFormat_withSingleDate_monthAbbreviation_april() {
			var date1 = createDate(year(now()), 4, 1);
			
			assertEquals('April 1', variables.apFormat.dateFormat(date1));
		}
		
		public void function testDateFormat_withSingleDate_monthAbbreviation_august() {
			var date1 = createDate(year(now()), 8, 1);
			
			assertEquals('Aug. 1', variables.apFormat.dateFormat(date1));
		}
		
		public void function testDateFormat_withSingleDate_monthAbbreviation_december() {
			var date1 = createDate(year(now()), 12, 1);
			
			assertEquals('Dec. 1', variables.apFormat.dateFormat(date1));
		}
		
		public void function testDateFormat_withSingleDate_monthAbbreviation_february() {
			var date1 = createDate(year(now()), 2, 1);
			
			assertEquals('Feb. 1', variables.apFormat.dateFormat(date1));
		}
		
		public void function testDateFormat_withSingleDate_monthAbbreviation_january() {
			var date1 = createDate(year(now()), 1, 1);
			
			assertEquals('Jan. 1', variables.apFormat.dateFormat(date1));
		}
		
		public void function testDateFormat_withSingleDate_monthAbbreviation_july() {
			var date1 = createDate(year(now()), 7, 1);
			
			assertEquals('July 1', variables.apFormat.dateFormat(date1));
		}
		
		public void function testDateFormat_withSingleDate_monthAbbreviation_june() {
			var date1 = createDate(year(now()), 6, 1);
			
			assertEquals('June 1', variables.apFormat.dateFormat(date1));
		}
		
		public void function testDateFormat_withSingleDate_monthAbbreviation_march() {
			var date1 = createDate(year(now()), 3, 1);
			
			assertEquals('March 1', variables.apFormat.dateFormat(date1));
		}
		
		public void function testDateFormat_withSingleDate_monthAbbreviation_may() {
			var date1 = createDate(year(now()), 5, 1);
			
			assertEquals('May 1', variables.apFormat.dateFormat(date1));
		}
		
		public void function testDateFormat_withSingleDate_monthAbbreviation_november() {
			var date1 = createDate(year(now()), 11, 1);
			
			assertEquals('Nov. 1', variables.apFormat.dateFormat(date1));
		}
		
		public void function testDateFormat_withSingleDate_monthAbbreviation_october() {
			var date1 = createDate(year(now()), 10, 1);
			
			assertEquals('Oct. 1', variables.apFormat.dateFormat(date1));
		}
		
		public void function testDateFormat_withSingleDate_monthAbbreviation_september() {
			var date1 = createDate(year(now()), 9, 1);
			
			assertEquals('Sept. 1', variables.apFormat.dateFormat(date1));
		}
		
		/**
		 * When given a single date in the current year it should just output the month and day.
		 */
		public void function testDateFormat_withSingleDate_sameYear() {
			var date1 = createDate(year(now()), 5, 31);
			
			assertEquals('May 31', variables.apFormat.dateFormat(date1));
		}
		
		public void function testDatetimeFormat_withDoubleDatetimes_differentYear_differentMonth_differentDay_differentTT_differentHour_differentMinute() {
			var datetime1 = createDateTime(year(now()) + 1, 5, 10, 10, 20, 0);
			var datetime2 = createDateTime(year(now()) + 1, 6, 20, 15, 30, 0);
			
			assertEquals('10:20 a.m. May 10, ' & year(now()) + 1 & '-3:30 p.m. June 20, ' & year(now()) + 1, variables.apFormat.datetimeFormat(datetime1, datetime2));
		}
		
		public void function testDatetimeFormat_withDoubleDatetimes_differentYear_differentMonth_differentDay_differentTT_differentHour_sameMinute() {
			var datetime1 = createDateTime(year(now()) + 1, 5, 10, 10, 30, 0);
			var datetime2 = createDateTime(year(now()) + 1, 6, 20, 15, 30, 0);
			
			assertEquals('10:30 a.m. May 10, ' & year(now()) + 1 & '-3:30 p.m. June 20, ' & year(now()) + 1, variables.apFormat.datetimeFormat(datetime1, datetime2));
		}
		
		public void function testDatetimeFormat_withDoubleDatetimes_differentYear_differentMonth_differentDay_sameTT_sameHour_sameMinute() {
			var datetime1 = createDateTime(year(now()) + 1, 5, 10, 10, 30, 0);
			var datetime2 = createDateTime(year(now()) + 1, 6, 20, 10, 30, 0);
			
			assertEquals('10:30 a.m. May 10, ' & year(now()) + 1 & '-10:30 a.m. June 20, ' & year(now()) + 1, variables.apFormat.datetimeFormat(datetime1, datetime2));
		}
		
		public void function testDatetimeFormat_withDoubleDatetimes_differentYear_differentMonth_sameDay_sameTT_sameHour_sameMinute() {
			var datetime1 = createDateTime(year(now()) + 1, 5, 20, 10, 30, 0);
			var datetime2 = createDateTime(year(now()) + 1, 6, 20, 10, 30, 0);
			
			assertEquals('10:30 a.m. May 20, ' & year(now()) + 1 & '-10:30 a.m. June 20, ' & year(now()) + 1, variables.apFormat.datetimeFormat(datetime1, datetime2));
		}
		
		public void function testDatetimeFormat_withDoubleDatetimes_differentYear_sameMonth_sameDay_differentTT_differentHour_differentMinute() {
			var datetime1 = createDateTime(year(now()) + 1, 5, 20, 10, 30, 0);
			var datetime2 = createDateTime(year(now()) + 1, 5, 20, 13, 40, 0);
			
			assertEquals('10:30 a.m.-1:40 p.m. May 20, ' & year(now()) + 1, variables.apFormat.datetimeFormat(datetime1, datetime2));
		}
		
		public void function testDatetimeFormat_withDoubleDatetimes_differentYear_sameMonth_sameDay_sameTT_differentHour_differentMinute() {
			var datetime1 = createDateTime(year(now()) + 1, 5, 20, 10, 30, 0);
			var datetime2 = createDateTime(year(now()) + 1, 5, 20, 11, 40, 0);
			
			assertEquals('10:30-11:40 a.m. May 20, ' & year(now()) + 1, variables.apFormat.datetimeFormat(datetime1, datetime2));
		}
		
		public void function testDatetimeFormat_withDoubleDatetimes_differentYear_sameMonth_sameDay_sameTT_sameHour_differentMinute() {
			var datetime1 = createDateTime(year(now()) + 1, 5, 20, 10, 30, 0);
			var datetime2 = createDateTime(year(now()) + 1, 5, 20, 10, 40, 0);
			
			assertEquals('10:30-10:40 a.m. May 20, ' & year(now()) + 1, variables.apFormat.datetimeFormat(datetime1, datetime2));
		}
		
		public void function testDatetimeFormat_withDoubleDatetimes_differentYear_sameMonth_sameDay_sameTT_sameHour_sameMinute() {
			var datetime1 = createDateTime(year(now()) + 1, 5, 20, 10, 30, 0);
			var datetime2 = createDateTime(year(now()) + 1, 5, 20, 10, 30, 0);
			
			assertEquals('10:30 a.m. May 20, ' & year(now()) + 1, variables.apFormat.datetimeFormat(datetime1, datetime2));
		}
		
		public void function testDatetimeFormat_withDoubleDatetimes_differentYears_differentMonth_differentDay_differentTT_differentHour_differentMinute() {
			var datetime1 = createDateTime(year(now()), 5, 10, 10, 20, 0);
			var datetime2 = createDateTime(year(now()) + 1, 6, 20, 15, 30, 0);
			
			assertEquals('10:20 a.m. May 10, ' & year(now()) & '-' & '3:30 p.m. June 20, ' & year(now()) + 1, variables.apFormat.datetimeFormat(datetime1, datetime2));
		}
		
		public void function testDatetimeFormat_withDoubleDatetimes_differentYears_differentMonth_differentDay_differentTT_differentHour_sameMinute() {
			var datetime1 = createDateTime(year(now()), 5, 10, 10, 30, 0);
			var datetime2 = createDateTime(year(now()) + 1, 6, 20, 15, 30, 0);
			
			assertEquals('10:30 a.m. May 10, ' & year(now()) & '-' & '3:30 p.m. June 20, ' & year(now()) + 1, variables.apFormat.datetimeFormat(datetime1, datetime2));
		}
		
		public void function testDatetimeFormat_withDoubleDatetimes_differentYears_differentMonth_differentDay_sameTT_sameHour_sameMinute() {
			var datetime1 = createDateTime(year(now()), 5, 10, 10, 30, 0);
			var datetime2 = createDateTime(year(now()) + 1, 6, 20, 10, 30, 0);
			
			assertEquals('10:30 a.m. May 10, ' & year(now()) & '-' & '10:30 a.m. June 20, ' & year(now()) + 1, variables.apFormat.datetimeFormat(datetime1, datetime2));
		}
		
		public void function testDatetimeFormat_withDoubleDatetimes_differentYears_differentMonth_sameDay_sameTT_sameHour_sameMinute() {
			var datetime1 = createDateTime(year(now()), 5, 20, 10, 30, 0);
			var datetime2 = createDateTime(year(now()) + 1, 6, 20, 10, 30, 0);
			
			assertEquals('10:30 a.m. May 20, ' & year(now()) & '-' & '10:30 a.m. June 20, ' & year(now()) + 1, variables.apFormat.datetimeFormat(datetime1, datetime2));
		}
		
		public void function testDatetimeFormat_withDoubleDatetimes_differentYears_sameMonth_sameDay_sameTT_sameHour_sameMinute() {
			var datetime1 = createDateTime(year(now()), 5, 20, 10, 30, 0);
			var datetime2 = createDateTime(year(now()) + 1, 5, 20, 10, 30, 0);
			
			assertEquals('10:30 a.m. May 20, ' & year(now()) & '-' & '10:30 a.m. May 20, ' & year(now()) + 1, variables.apFormat.datetimeFormat(datetime1, datetime2));
		}
		
		public void function testDatetimeFormat_withDoubleDatetimes_sameYear_differentMonth_differentDay_differentTT_differentHour_differentMinute() {
			var datetime1 = createDateTime(year(now()), 5, 10, 10, 20, 0);
			var datetime2 = createDateTime(year(now()), 6, 20, 15, 30, 0);
			
			assertEquals('10:20 a.m. May 10-3:30 p.m. June 20', variables.apFormat.datetimeFormat(datetime1, datetime2));
		}
		
		public void function testDatetimeFormat_withDoubleDatetimes_sameYear_differentMonth_differentDay_differentTT_differentHour_sameMinute() {
			var datetime1 = createDateTime(year(now()), 5, 10, 10, 30, 0);
			var datetime2 = createDateTime(year(now()), 6, 20, 15, 30, 0);
			
			assertEquals('10:30 a.m. May 10-3:30 p.m. June 20', variables.apFormat.datetimeFormat(datetime1, datetime2));
		}
		
		public void function testDatetimeFormat_withDoubleDatetimes_sameYear_differentMonth_differentDay_sameTT_sameHour_sameMinute() {
			var datetime1 = createDateTime(year(now()), 5, 10, 10, 30, 0);
			var datetime2 = createDateTime(year(now()), 6, 20, 10, 30, 0);
			
			assertEquals('10:30 a.m. May 10-10:30 a.m. June 20', variables.apFormat.datetimeFormat(datetime1, datetime2));
		}
		
		public void function testDatetimeFormat_withDoubleDatetimes_sameYear_differentMonth_sameDay_sameTT_sameHour_sameMinute() {
			var datetime1 = createDateTime(year(now()), 5, 20, 10, 30, 0);
			var datetime2 = createDateTime(year(now()), 6, 20, 10, 30, 0);
			
			assertEquals('10:30 a.m. May 20-10:30 a.m. June 20', variables.apFormat.datetimeFormat(datetime1, datetime2));
		}
		
		public void function testDatetimeFormat_withDoubleDatetimes_sameYear_sameMonth_sameDay_differentTT_differentHour_differentMinute() {
			var datetime1 = createDateTime(year(now()), 5, 20, 10, 30, 0);
			var datetime2 = createDateTime(year(now()), 5, 20, 13, 40, 0);
			
			assertEquals('10:30 a.m.-1:40 p.m. May 20', variables.apFormat.datetimeFormat(datetime1, datetime2));
		}
		
		public void function testDatetimeFormat_withDoubleDatetimes_sameYear_sameMonth_sameDay_sameTT_differentHour_differentMinute() {
			var datetime1 = createDateTime(year(now()), 5, 20, 10, 30, 0);
			var datetime2 = createDateTime(year(now()), 5, 20, 11, 40, 0);
			
			assertEquals('10:30-11:40 a.m. May 20', variables.apFormat.datetimeFormat(datetime1, datetime2));
		}
		
		public void function testDatetimeFormat_withDoubleDatetimes_sameYear_sameMonth_sameDay_sameTT_sameHour_differentMinute() {
			var datetime1 = createDateTime(year(now()), 5, 20, 10, 30, 0);
			var datetime2 = createDateTime(year(now()), 5, 20, 10, 40, 0);
			
			assertEquals('10:30-10:40 a.m. May 20', variables.apFormat.datetimeFormat(datetime1, datetime2));
		}
		
		public void function testDatetimeFormat_withDoubleDatetimes_sameYear_sameMonth_sameDay_sameTT_sameHour_sameMinute() {
			var datetime1 = createDateTime(year(now()), 5, 20, 10, 30, 0);
			var datetime2 = createDateTime(year(now()), 5, 20, 10, 30, 0);
			
			assertEquals('10:30 a.m. May 20', variables.apFormat.datetimeFormat(datetime1, datetime2));
		}
		
		/**
		 * When given a single datetime in a different year it should output the time, month, day, and year.
		 */
		public void function testDatetimeFormat_withSingleDatetime_differentYear() {
			var datetime1 = createDateTime(year(now()) + 1, 5, 31, 10, 20, 0);
			
			assertEquals('10:20 a.m. May 31, ' & year(now()) + 1, variables.apFormat.datetimeFormat(datetime1));
		}
		
		/**
		 * When given a single datetime in the current year it should just output the time, month, and day.
		 */
		public void function testDatetimeFormat_withSingleDatetime_sameYear() {
			var datetime1 = createDateTime(year(now()), 5, 31, 10, 20, 0);
			
			assertEquals('10:20 a.m. May 31', variables.apFormat.datetimeFormat(datetime1));
		}
		
		public void function testTimeFormat_withDoubleTime_differentTimeMarker_differentHour_differentMinute_differentSecond() {
			var time1 = createTime(10, 30, 5);
			var time2 = createTime(21, 35, 10);
			
			assertEquals('10:30:05 a.m.-9:35:10 p.m.', variables.apFormat.timeFormat(time1, time2));
		}
		
		public void function testTimeFormat_withDoubleTime_differentTimeMarker_differentHour_differentMinute_sameSecond() {
			var time1 = createTime(10, 30, 5);
			var time2 = createTime(21, 35, 5);
			
			assertEquals('10:30:05 a.m.-9:35:05 p.m.', variables.apFormat.timeFormat(time1, time2));
		}
		
		public void function testTimeFormat_withDoubleTime_differentTimeMarker_differentHour_sameMinute_sameSecond() {
			var time1 = createTime(10, 30, 5);
			var time2 = createTime(21, 30, 5);
			
			assertEquals('10:30:05 a.m.-9:30:05 p.m.', variables.apFormat.timeFormat(time1, time2));
		}
		
		public void function testTimeFormat_withDoubleTime_differentTimeMarker_sameHour_differentMinute_differentSecond() {
			var time1 = createTime(11, 30, 5);
			var time2 = createTime(21, 35, 10);
			
			assertEquals('11:30:05 a.m.-9:35:10 p.m.', variables.apFormat.timeFormat(time1, time2));
		}
		
		public void function testTimeFormat_withDoubleTime_differentTimeMarker_sameHour_differentMinute_sameSecond() {
			var time1 = createTime(11, 30, 5);
			var time2 = createTime(21, 35, 5);
			
			assertEquals('11:30:05 a.m.-9:35:05 p.m.', variables.apFormat.timeFormat(time1, time2));
		}
		
		public void function testTimeFormat_withDoubleTime_differentTimeMarker_sameHour_sameMinute_sameSecond() {
			var time1 = createTime(11, 30, 5);
			var time2 = createTime(21, 30, 5);
			
			assertEquals('11:30:05 a.m.-9:30:05 p.m.', variables.apFormat.timeFormat(time1, time2));
		}
		
		public void function testTimeFormat_withDoubleTime_sameTimeMarker_differentHour_differentMinute_differentSecond() {
			var time1 = createTime(10, 30, 5);
			var time2 = createTime(11, 35, 10);
			
			assertEquals('10:30:05-11:35:10 a.m.', variables.apFormat.timeFormat(time1, time2));
		}
		
		public void function testTimeFormat_withDoubleTime_sameTimeMarker_differentHour_differentMinute_sameSecond() {
			var time1 = createTime(10, 30, 5);
			var time2 = createTime(11, 35, 5);
			
			assertEquals('10:30:05-11:35:05 a.m.', variables.apFormat.timeFormat(time1, time2));
		}
		
		public void function testTimeFormat_withDoubleTime_sameTimeMarker_differentHour_sameMinute_sameSecond() {
			var time1 = createTime(10, 30, 5);
			var time2 = createTime(11, 30, 5);
			
			assertEquals('10:30:05-11:30:05 a.m.', variables.apFormat.timeFormat(time1, time2));
		}
		
		public void function testTimeFormat_withDoubleTime_sameTimeMarker_sameHour_differentMinute_differentSecond() {
			var time1 = createTime(11, 30, 5);
			var time2 = createTime(11, 35, 10);
			
			assertEquals('11:30:05-11:35:10 a.m.', variables.apFormat.timeFormat(time1, time2));
		}
		
		public void function testTimeFormat_withDoubleTime_sameTimeMarker_sameHour_differentMinute_sameSecond() {
			var time1 = createTime(11, 30, 5);
			var time2 = createTime(11, 35, 5);
			
			assertEquals('11:30:05-11:35:05 a.m.', variables.apFormat.timeFormat(time1, time2));
		}
		
		public void function testTimeFormat_withDoubleTime_sameTimeMarker_sameHour_sameMinute_sameSecond() {
			var time1 = createTime(11, 30, 5);
			var time2 = createTime(11, 30, 5);
			
			assertEquals('11:30:05 a.m.', variables.apFormat.timeFormat(time1, time2));
		}
		
		/**
		 * When given time in the morning it should return an 'a.m.' time marker.
		 */
		public void function testTimeFormat_withSingleTime_am() {
			var time1 = createTime(11, 30, 0);
			
			assertEquals('11:30 a.m.', variables.apFormat.timeFormat(time1));
		}
		
		/**
		 * When given 12:00 am it should return 'Midnight'.
		 */
		public void function testTimeFormat_withSingleTime_midnight() {
			var time1 = createTime(0, 0, 0);
			
			assertEquals('Midnight', variables.apFormat.timeFormat(time1));
		}
		
		/**
		 * When given 12:00 pm it should return 'Noon'.
		 */
		public void function testTimeFormat_withSingleTime_noon() {
			var time1 = createTime(12, 0, 0);
			
			assertEquals('Noon', variables.apFormat.timeFormat(time1));
		}
		
		/**
		 * When given time in the afternoon it should return a 'p.m.' time marker.
		 */
		public void function testTimeFormat_withSingleTime_pm() {
			var time1 = createTime(23, 30, 0);
			
			assertEquals('11:30 p.m.', variables.apFormat.timeFormat(time1));
		}
		
		/**
		 * When given a time without minutes and seconds it should give just the hour.
		 */
		public void function testTimeFormat_withSingleTime_sansMinutes_sansSeconds() {
			var time1 = createTime(4, 0, 0);
			
			assertEquals('4 a.m.', variables.apFormat.timeFormat(time1));
		}
		
		/**
		 * When given a time without minutes but with seconds it should give the full time.
		 */
		public void function testTimeFormat_withSingleTime_sansMinutes_withSeconds() {
			var time1 = createTime(4, 0, 10);
			
			assertEquals('4:00:10 a.m.', variables.apFormat.timeFormat(time1));
		}
		
		/**
		 * When given a time with minutes but without seconds it should display both hours and minutes.
		 */
		public void function testTimeFormat_withSingleTime_withMinutes_sansSeconds() {
			var time1 = createTime(4, 15, 0);
			
			assertEquals('4:15 a.m.', variables.apFormat.timeFormat(time1));
		}
		
		/**
		 * When given a time with minutes but with seconds it should give the full time.
		 */
		public void function testTimeFormat_withSingleTime_withMinutes_withSeconds() {
			var time1 = createTime(4, 15, 10);
			
			assertEquals('4:15:10 a.m.', variables.apFormat.timeFormat(time1));
		}
	</cfscript>
</cfcomponent>