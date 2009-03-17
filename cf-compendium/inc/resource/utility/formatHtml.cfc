<cfcomponent output="false">
	<cffunction name="init" access="public" returntype="any" output="false">
		<cfreturn this />
	</cffunction>
	
	<!---
		Used to convert ", ', --, ---, and ... back from html entities
		<p>
		<ul>
			<li>"		==		&#8220;	&#8221;
			<li>'		==		&#8216;	&#8217;
			<li>--		==		&#8211;
			<li>---		==		&#8212;
			<li>...		==		&#8230;
		</ul>
	--->
	<cffunction name="cleanType" access="public" returntype="string" output="false">
		<cfargument name="html" type="string" required="true" />
	 	
	 	<cfset var entityList = "&quot;,&##8220;,&##8221;,&##8216;,&##8217;,&apos;,&##8211;,&##8212;,&##8230;" />
	 	<cfset var charList = ""","","",',',',--,---,..." />
	 	
	 	<cfreturn replaceList(arguments.html, entityList, charList) />
	</cffunction>
	
	<!---
		Used to convert ", ', --, ---, and ... to the correct html entities
		<p>
		<ul>
			<li>"		==		&#8220;	&#8221;
			<li>'		==		&#8216;	&#8217;
			<li>--		==		&#8211;
			<li>---		==		&#8212;
			<li>...		==		&#8230;
		</ul>
	--->
	<cffunction name="correctType" access="public" returntype="string" output="false">
		<cfargument name="html" type="string" required="true" />
		<cfargument name="doQuote" type="boolean" default="true" />
		<cfargument name="doBackticks" type="boolean" default="true" />
		<cfargument name="doDashes" type="boolean" default="true" />
		<cfargument name="doEllipses" type="boolean" default="true" />
	 	
	 	<cfset var pattern = CreateObject( "java", "java.util.regex.Pattern" ).Compile("(?i)(\<pre)|(\</pre\>)|(\<code)|(\</code\>)|(\<script)|(\</script\>)|(\<kbd)|(\</kbd\>)|(</?[^>]*>)|(&quot;)|("")|(``)|('')|([s]?'[std]?)|([\.]{3})|([-]{2,3})|(&##8220;)|(&##8221;)|(&##8216;)|(&##8217;)") />
	 	<cfset var matcher = pattern.matcher( arguments.html ) />
	 	<cfset var buffer = CreateObject( "java", "java.lang.StringBuffer" ).init() />
	 	<cfset var value = '' />
	 	<cfset var inIgnoreTag = false />
	 	<cfset var inCode = false />
	 	<cfset var inPre = false />
	 	<cfset var inKbd = false />
	 	<cfset var inScript = false />
	 	<cfset var inDouble = false />
	 	<cfset var inSingle = false />
	 	
	 	<cfloop condition="matcher.find()">
		 	<!--- get the current group value --->
		 	<cfset value = matcher.group() />
		 	
		 	<!--- Check if we are not in a pre, code, or script tag --->
		 	<cfif NOT inIgnoreTag>
			 	<cfswitch expression="#value#">
				 	<cfcase value=""",&quot;,&##8220;,&##8221;">
					 	<!--- Check if we should be converting the &quot; --->
					 	<cfif value NEQ '&quot;' OR arguments.doQuote>
							<!--- Check if already opened a double quote --->
							<cfif inDouble>
								<cfset value = '&##8221;' />
							<cfelse>
								<cfset value = '&##8220;' />
							</cfif>
							
							<cfset inDouble = NOT inDouble />
						</cfif>
					</cfcase>
				 	<cfcase value="``">
					 	<cfif doBackticks>
							<cfset value = '&##8216;' />
						</cfif>
					</cfcase>
				 	<cfcase value="''">
					 	<cfif arguments.doBackticks>
							<cfset value = '&##8217;' />
						</cfif>
					</cfcase>
				 	<cfcase value="',&##8216;,&##8217;,'',``">
						<!--- Check if already opened a double quote --->
						<cfif inSingle>
							<cfset value = '&##8217;' />
						<cfelse>
							<cfset value = '&##8216;' />
						</cfif>
						
						<cfset inSingle = NOT inSingle />
					</cfcase>
				 	<cfcase value="s','s,'d,'t">
					 	<!--- Apostrophe --->
						<cfset value = replace(value, "'", '&apos;') />
					</cfcase>
				 	<cfcase value="...">
					 	<cfif arguments.doEllipses>
						 	<!--- Ellipsis --->
							<cfset value = '&##8230;' />
						</cfif>
					</cfcase>
				 	<cfcase value="---">
					 	<cfif arguments.doDashes>
						 	<!--- Em Dash --->
							<cfset value = '&##8212;' />
						</cfif>
					</cfcase>
				 	<cfcase value="--">
					 	<cfif arguments.doDashes>
						 	<!--- En Dash --->
							<cfset value = '&##8211;' />
						</cfif>
					</cfcase>
				 	<cfcase value="<pre">
					 	<cfset inPre = true />
					</cfcase>
				 	<cfcase value="<code">
					 	<cfset inCode = true />
					</cfcase>
				 	<cfcase value="<kbd">
					 	<cfset inKbd = true />
					</cfcase>
				 	<cfcase value="<script">
					 	<cfset inScript = true />
					</cfcase>
				</cfswitch>
			<cfelse>
			 	<cfswitch expression="#value#">
				 	<cfcase value="</pre>">
					 	<cfset inPre = false />
					</cfcase>
				 	<cfcase value="</code>">
					 	<cfset inCode = false />
					</cfcase>
				 	<cfcase value="</kbd>">
					 	<cfset inKbd = false />
					</cfcase>
				 	<cfcase value="</script>">
					 	<cfset inScript = false />
					</cfcase>
				</cfswitch>
			</cfif>
			
			<!--- Check if still in ignore tag --->
		 	<cfset inIgnoreTag = (inPre OR inCode OR inScript OR inKbd) />
			
			<cfset matcher.appendReplacement(buffer, value.replaceAll("([\\\$])", "\\$1")) />
		</cfloop>
		
		<!--- Add the reset of the stuff to buffer. --->
		<cfset matcher.appendTail( buffer ) />
		
		<cfreturn buffer.toString() />
	</cffunction>
	
	<!---
		Used with permission from Ben Nadel. Modified.

		@blog How My ColdFusion Code Snippet Color Coding Works
		@author Ben Nadel / Kinky Solutions
		@link http://www.bennadel.com/index.cfm?dax=blog:604.view
		@modified Randy Merrill
	--->
	<cffunction name="colorCode" access="public" returntype="string" output="false" hint="This takes code samples and color codes for display.">
		<cfargument name="code" type="string" required="true" />
	 	
	 	<cfset var pattern = CreateObject( "java", "java.util.regex.Pattern" ).Compile("(?i)(</?div[^>]*>)|(&lt;!--)|(--&gt;)|(&lt;/?[a-z]+)|(/?&gt;)|(&quot;)|(')") />
	 	<cfset var matcher = pattern.matcher( arguments.code ) />
	 	<cfset var buffer = CreateObject( "java", "java.lang.StringBuffer" ).init() />
	 	<cfset var state = structNew() />
	 	<cfset var value = '' />
	 	<cfset var inCF = false />
	 	<cfset var inHTML = false />
	 	<cfset var inAttribute = false />
	 	<cfset var inComment = false />
	 	<cfset var inScript = false />
	 	
	 	<cfloop condition="matcher.find()">
		 	<!--- get the current group value --->
		 	<cfset value = matcher.group() />
		 	
		 	<!--- Check to see if we are in script. If we are, we need to do things very differently. --->
		 	<cfif inScript>
		 		<!--- Check to see if found a cloase cfscript tag and that we NOT in a comment tag. --->
			 	<cfif reFindNoCase("^&lt;/cfscript", value)>
				 	<cfset value = '<span class="cfmlCodeColor">' & value />
				 	
				 	<cfset inCF = true />
				 	<cfset inScript = false />
				</cfif>
				
				<!--- Check to see if we found a close tag. --->
				<cfif REFindNoCase( "/?&gt;$", value ) AND inCF>
					<cfset value &= '</span>' />
					
					<cfset inCF = false />
				</cfif>
			<cfelse>
				<!--- Check to see if found a comment. --->
				<cfif value EQ '&lt;!--'>
					<cfset value = '<span class="commentCodeColor">' & value />
					
					<cfset inComment = true />
				</cfif>
				
				<!--- Check to see if found a close comment and that we are already in a comment. --->
				<cfif value EQ '--&gt;' AND inComment>
					<cfset value &= '</span>' />
					
					<cfset inComment = false />
				</cfif>
				
				<!--- Check to see if found a cf tag and that we are NOT in a comment tag. --->
				<cfif reFindNoCase('^&lt;cf', value) AND NOT inComment>
					<!--- Check to see if we started a script tag. --->
					<cfif reFindNoCase('^&lt;cfscript', value)>
						<cfset inScript = true />
					</cfif>
					
					<cfset value = '<span class="cfmlCodeColor">' & value />
					
					<cfset inCF = true />
				</cfif>
				
				<!--- Check to see if found a close cf tag and that we NOT in a comment tag. --->
				<cfif reFindNoCase('^&lt;/cf', value) AND NOT inComment>
					<cfset value = '<span class="cfmlCodeColor">' & value />
					
					<cfset inCF = true />
				</cfif>
			</cfif>
		 	
		 	<!--- Check to see if found an open HTML tag and that we are not in a comment. --->
		 	<cfif reFindNoCase('^&lt;(?!cf)', value) AND NOT inComment>
			 	<cfset value = '<span class="htmlCodeColor">' & value />
			 	
			 	<cfset inHTML = true />
			</cfif>
			
			<!--- Check to see if we found a self closing tag. --->
			<cfif reFindNoCase('/?&gt;$', value) AND NOT inComment AND NOT inAttribute AND (inCF OR inHTML)>
				<cfset value &= '</span>' />
				
				<cfif inCF>
					<cfset inCF = false />
				<cfelse>
					<cfset inHTML = false />
				</cfif>
			</cfif>
			
			<!--- Check to see if we found a attribute of a tag --->
			<cfif value EQ '&quot;' AND value EQ "'" AND (inCF OR inHTML)>
				<!--- Are we starting or ending the attribute --->
				<cfif NOT inAttribute>
					<cfset value = '<span class="attributeCodeColor">' & value />
					
					<cfset inAttribute = true />
				<cfelse>
					<cfset value &= '</span>' />
					
					<cfset inAttribute = false />
				</cfif>
			</cfif>
			
			<cfset matcher.appendReplacement(buffer, value.replaceAll("([\\\$])", "\\$1")) />
		</cfloop>
		
		<!--- Add the reset of the stuff to buffer. --->
		<cfset matcher.appendTail( buffer ) />
		
		<cfreturn buffer.toString() />
	</cffunction>
</cfcomponent>