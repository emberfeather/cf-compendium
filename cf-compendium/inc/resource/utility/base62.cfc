<cfcomponent output="false">
	<cffunction name="init" access="public" returntype="component" output="false">
		<cfreturn this />
	</cffunction>
	
	<cffunction name="characterToValue" access="private" returntype="string" output="false">
		<cfargument name="character" type="string" required="true" />
		
		<cfset var offset = 0 />
		<cfset var value = asc(left(arguments.character, 1)) - asc('0') />
		
		<!--- Skip the first set of punctuation --->
		<cfif value GT 9>
			<cfset offset -= 7 />
		</cfif>
		
		<!--- Skip the second part of punctuation --->
		<cfif value GT 42>
			<cfset offset -= 6 />
		</cfif>
		
		<!--- User the offset to determine the character --->
		<cfreturn value + offset />
	</cffunction>
	
	<cffunction name="base62ToValue" access="public" returntype="numeric" output="false">
		<cfargument name="original" type="string" required="true" />
		
		<cfset var character = '' />
		<cfset var extra = '' />
		<cfset var length = 0 />
		<cfset var value = 0 />
		
		<cfset length = len(arguments.original) />
		
		<cfif length>
			<cfset character = left(arguments.original, 1) />
			
			<cfset value = characterToValue(character) * ( 62 ^ (length - 1) ) />
			
			<cfif length GT 1>
				<cfset extra = right(arguments.original, length - 1) />
				
				<cfset value += base62ToValue(extra) />
			</cfif>
		</cfif>
		
		<cfreturn value />
	</cffunction>
	
	<cffunction name="valueToBase62" access="public" returntype="string" output="false">
		<cfargument name="original" type="numeric" required="true" />
		
		<cfset var value = '' />
		<cfset var remainder = '' />
		<cfset var divided = '' />
		
		<cfset remainder = arguments.original MOD 62 />
		<cfset divided = int(arguments.original / 62) />
		
		<cfif divided GT 0>
			<cfreturn valueToBase62(divided) & valueToCharacter(remainder) />
		<cfelse>
			<cfreturn valueToCharacter(remainder) />
		</cfif>
	</cffunction>
	
	<cffunction name="valueToCharacter" access="private" returntype="string" output="false">
		<cfargument name="value" type="numeric" required="true" />
		
		<cfset var offset = asc('0') />
		
		<!--- Skip the first set of punctuation --->
		<cfif arguments.value GT 9>
			<cfset offset += 7 />
		</cfif>
		
		<!--- Skip the second part of punctuation --->
		<cfif arguments.value GT 35>
			<cfset offset += 6 />
		</cfif>
		
		<!--- Use the offset to determine the character --->
		<cfreturn chr(offset + arguments.value) />
	</cffunction>
</cfcomponent>