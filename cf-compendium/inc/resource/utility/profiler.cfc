<!---
	Used to profile code execution. Namely to act as a named stopwatch to track 
	areas that are slow or inefficient.
--->
<cfcomponent output="false">
	<!---
		The profiler can be programmed into your code, but turned off if desired.
	--->
	<cffunction name="init" access="public" returntype="any" output="false">
		<cfargument name="isActive" type="boolean" default="false" />
		
		<cfset variables.isActive = arguments.isActive />
		<cfset variables.tickers = {} />
		
		<cfreturn this />
	</cffunction>
	
	<!---
		Formats a tick time to the appropriate value
	--->
	<cffunction name="calculateTicks" access="private" returntype="void" output="false">
		<cfargument name="tickerName" type="string" default="" />
		
		<cfset var i = '' />
		<cfset var j = '' />
		<cfset var structList = '' />
		
		<!--- Check if calculating a single ticker or everything --->
		<cfif arguments.tickerName EQ ''>
			<cfset structList = structKeyList(variables.tickers) />
		<cfelse>
			<cfset structList = arguments.tickerName />
		</cfif>
		
		<!--- Loop through each ticker --->
		<cfloop list="#structList#" index="i">
			<!--- Check for mismatched start and stop --->
			<cfif arrayLen(variables.tickers[i].start) NEQ arrayLen(variables.tickers[i].stop)>
				<cfthrow message="Ticker count mismatch" detail="The ticker (#i#) was not started and stopped the same number of times." />
			</cfif>
			
			<!--- Loop through each tick in each ticker --->
			<cfloop from="1" to="#arrayLen(variables.tickers[i].start)#" index="j">
				<!--- Calculate the tick --->
				<cfset variables.tickers[i].count[j] = variables.tickers[i].stop[j] - variables.tickers[i].start[j] />
			</cfloop>
		</cfloop>
	</cffunction>
	
	<!---
		Formats a tick time to the appropriate value
	--->
	<cffunction name="formatTickTime" access="public" returntype="string" output="false">
		<cfargument name="tickTime" type="string" required="true" />
		
		<cfset var unit = 'ms' />
		<cfset var format = '_' />
		
		<cfif arguments.tickTime GTE 0>
			<cfif arguments.tickTime GT 1000>
				<cfset arguments.tickTime /= 1000 />
				<cfset unit = 'sec' />
				<cfset format = '___.___' />
			</cfif>
			
			<cfreturn numberFormat(arguments.tickTime, format) & ' ' & unit />
		<cfelse>
			<cfreturn 'never stopped' />
		</cfif>
	</cffunction>
	
	<!---
		Used to get the specific values associated with a given ticker
	--->
	<cffunction name="getTicker" access="public" returntype="struct" output="false">
		<cfargument name="tickerName" type="string" required="true" />
		
		<cfif NOT variables.isActive>
			<cfreturn {} />
		</cfif>
		
		<!--- Check if the ticker even exists --->
		<cfif NOT structKeyExists(variables.tickers, arguments.tickerName)>
			<cfthrow message="Ticker does not exist" detail="The ticker (#arguments.tickerName#) does not exist in the current tickers." />
		</cfif>
		
		<!--- Calculating the count for the ticker --->
		<cfset calculateTicks(arguments.tickerName) />
		
		<cfreturn variables.tickers[arguments.tickerName] />
	</cffunction>
	
	<!---
		Retrieves all of the tickers that were used
	--->
	<cffunction name="getTickers" access="public" returntype="struct" output="false">
		<cfset var i = '' />
		
		<cfif NOT variables.isActive>
			<cfreturn {} />
		</cfif>
		
		<!--- Calculating the counts for the tickers --->
		<cfset calculateTicks() />
		
		<cfreturn variables.tickers />
	</cffunction>
	
	<!---
		Formats and writes the profiling to a file
	--->
	<cffunction name="toFile" access="public" returntype="void" output="false">
		<cfargument name="logPath" type="string" required="true" />
		
		<cfset var newLogLines = ''/>
		<cfset var tickList = '' />
		<cfset var maxLength = '' />
		<cfset var loggedOn = '' />
		<cfset var i = '' />
		
		<cfif NOT variables.isActive || structIsEmpty(variables.tickers)>
			<cfreturn />
		</cfif>
		
		<!--- Calculating the counts for the tickers --->
		<cfset calculateTicks() />
		
		<!--- Get the ticker list --->
		<cfset tickList = listSort(structKeyList(variables.tickers), 'text') />
		
		<!--- Find the max length --->
		<cfloop list="#tickList#" index="i">
			<cfif len(i) GT maxLength>
				<cfset maxLength = len(i) />
			</cfif>
		</cfloop>
		
		<!--- Set the time it was logged at --->
		<cfset loggedOn = dateFormat(now(), 'short') & ',' & timeFormat(now(), 'medium') & ',' />
		
		<cfloop list="#tickList#" index="i">
			<!--- Add the loggedOn stamp --->
			<cfset newLogLines &= loggedOn />
			
			<!--- Add the ticker name --->
			<cfset newLogLines &= lJustify(i, maxLength + 3) />
			
			<!--- Check if this is a multi ticker --->
			<cfif arrayLen(variables.tickers[i].count) GT 1>
				<cfset newLogLines &= 'Count: ' & lJustify(arrayLen(variables.tickers[i].count), 7) />
				<cfset newLogLines &= 'Max: ' & lJustify(formatTickTime(arrayMax(variables.tickers[i].count)), 8) />
				<cfset newLogLines &= 'Min: ' & lJustify(formatTickTime(arrayMin(variables.tickers[i].count)), 8) />
				<cfset newLogLines &= 'Avg: ' & lJustify(formatTickTime(arrayAvg(variables.tickers[i].count)), 8) />
				<cfset newLogLines &= 'Sum: ' & lJustify(formatTickTime(arraySum(variables.tickers[i].count)), 8) />
			<cfelse>
				<cfset newLogLines &= formatTickTime(variables.tickers[i].count[1]) />
			</cfif>
			
			<cfset newLogLines &= chr(10) />
		</cfloop>
		
		<cffile action="append" addnewline="false" file="#arguments.logPath#" output="#newLogLines#" />
	</cffunction>
	
	<!---
		Formats and returns the profiling to a HTML string
	--->
	<cffunction name="toHTML" access="public" returntype="string" output="false">
		<cfargument name="asComment" type="boolean" default="false" />
		
		<cfset var tempHTML = chr(10) />
		<cfset var counter = 0 />
		<cfset var maxLength = 0 />
		<cfset var tickList = '' />
		<cfset var i = '' />
		<cfset var j = '' />
		
		<cfif NOT variables.isActive || structIsEmpty(variables.tickers)>
			<cfreturn tempHTML />
		</cfif>
		
		<!--- Calculating the counts for the tickers --->
		<cfset calculateTicks() />
		
		<!--- Get the list of tickers as an alphabetical list --->
		<cfset tickList = listSort(structKeyList(variables.tickers), 'text') />
		
		<cfif arguments.asComment>
			<!--- Find the max length --->
			<cfloop list="#tickList#" index="i">
				<cfif len(i) GT maxLength>
					<cfset maxLength = len(i) />
				</cfif>
			</cfloop>
			
			<cfset tempHTML &= '<!-- Profiling Specs -->' & chr(10) />
			
			<cfloop list="#tickList#" index="i">
				<cfset tempHTML &= '<!-- ' & lJustify(i, maxLength + 3) />
				
				<!--- Check if this is a multi ticker --->
				<cfif arrayLen(variables.tickers[i].count) GT 1>
					<cfset tempHTML &= 'Count: ' & lJustify(arrayLen(variables.tickers[i].count), 7) />
					<cfset tempHTML &= 'Max: ' & lJustify(formatTickTime(arrayMax(variables.tickers[i].count)), 8) />
					<cfset tempHTML &= 'Min: ' & lJustify(formatTickTime(arrayMin(variables.tickers[i].count)), 8) />
					<cfset tempHTML &= 'Avg: ' & lJustify(formatTickTime(arrayAvg(variables.tickers[i].count)), 8) />
					<cfset tempHTML &= 'Sum: ' & lJustify(formatTickTime(arraySum(variables.tickers[i].count)), 8) />
				<cfelse>
					<cfset tempHTML &= formatTickTime(variables.tickers[i].count[1]) />
				</cfif>
				
				<cfset tempHTML &= ' -->' & chr(10) />
			</cfloop>
		<cfelse>
			<cfset tempHTML &= '<div class="profileSummary">' & chr(10) />
			<cfset tempHTML &= '	<h1>Profiling</h1>' & chr(10) />
			<cfset tempHTML &= '	<ul>' & chr(10) />
			
			<cfloop list="#tickList#" index="i">
				<cfset tempHTML &= '		<li' />
				
				<cfif (counter++) MOD 2 EQ 1>
					<cfset tempHTML &= ' class="alt"' />
				</cfif>
				
				<cfset tempHTML &= '>' & chr(10) />
				
				<cfset tempHTML &= '			<strong>' & i & ' ( ' & arrayLen(variables.tickers[i].count) & ' ) : </strong>' />
				
				<!--- Check if this is a multi ticker --->
				<cfif arrayLen(variables.tickers[i].count) GT 1>
					<cfset tempHTML &= '<span class="max">Max: ' & formatTickTime(arrayMax(variables.tickers[i].count)) & '</span> ' />
					<cfset tempHTML &= '<span class="min">Min: ' & formatTickTime(arrayMin(variables.tickers[i].count)) & '</span> ' />
					<cfset tempHTML &= '<span class="avg">Avg: ' & formatTickTime(arrayAvg(variables.tickers[i].count)) & '</span> ' />
					<cfset tempHTML &= '<span class="sum">Sum: ' & formatTickTime(arraySum(variables.tickers[i].count)) & '</span> ' />
				<cfelse>
					<cfset tempHTML &= formatTickTime(variables.tickers[i].count[1]) />
				</cfif>
				
				<cfset tempHTML &= chr(10) />
				<cfset tempHTML &= '		</li>' & chr(10) />
			</cfloop>
			
			<cfset tempHTML &= '	</ul>' & chr(10) />
			<cfset tempHTML &= '</div>' & chr(10) />
		</cfif>
		
		<cfreturn tempHTML />
	</cffunction>
	
	<!---
		Starts a ticker
	--->
	<cffunction name="start" access="public" returntype="void" output="false">
		<cfargument name="tickerName" type="string" required="true" />
		
		<cfset var tick = '' />
		
		<cfif NOT variables.isActive>
			<cfreturn />
		</cfif>
		
		<cfif arguments.tickerName EQ ''>
			<cfthrow message="Ticker name is required" detail="A name use for the ticker is required." />
		</cfif>
		
		<!--- Check if the tick exists --->
		<cfif NOT structKeyExists(variables.tickers, arguments.tickerName)>
			<cfset variables.tickers[arguments.tickerName] = { start = [], stop = [], count = [] } />
		</cfif>
		
		<!--- Start the tick --->
		<cfset arrayAppend(variables.tickers[arguments.tickerName].start, getTickCount()) />
	</cffunction>
	
	<!---
		Stops a ticker
	--->
	<cffunction name="stop" access="public" returntype="void" output="false">
		<cfargument name="tickerName" type="string" required="true" />
		
		<cfset var tickerLength = 0 />
		
		<cfif NOT variables.isActive>
			<cfreturn />
		</cfif>
		
		<cfif arguments.tickerName EQ ''>
			<cfthrow message="Ticker name is required" detail="A name use for the ticker is required." />
		</cfif>
		
		<cfif NOT structKeyExists(variables.tickers, arguments.tickerName)>
			<cfthrow message="Ticker name is not in use" detail="There is no ticker in use with the name '#arguments.tickerName#'. Please start it before you stop it." />
		</cfif>
		
		<!--- Check if it has already been stopped --->
		<cfif arrayLen(variables.tickers[arguments.tickerName].stop) GTE arrayLen(variables.tickers[arguments.tickerName].start)>
			<cfthrow message="Ticker already stopped." detail="The ticker '#arguments.tickerName#' has already been stopped." />
		</cfif>
		
		<!--- Set the stop time --->
		<cfset arrayAppend(variables.tickers[arguments.tickerName].stop, getTickCount()) />
	</cffunction>
</cfcomponent>