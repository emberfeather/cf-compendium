<!---
	This component is made for parsing cfc files, component or interfaces.
--->
<cfcomponent output="false" hint="Parses through cfc files.">
	<cffunction name="init" access="public" returntype="any" output="false">
		<cfargument name="lazyLoad" type="boolean" default="true" />
		
		<cfset variables.lazyLoad = arguments.lazyLoad />
		
		<cfreturn this />
	</cffunction>
	
	<!---
		Use this function to determine if a given file is a component
	--->
	<cffunction name="isComponent" access="public" returntype="boolean" output="false" hint="Determines if a cfc file is a component.">
		<cfargument name="filename" type="string" required="true" />
		<cfargument name="directory" type="string" required="true" />

		<cfset var expression = "<cfcomponent" />
		<cfset var fileContent = '' />
		
		<!--- If lazy loading then don't even try --->
		<cfif variables.lazyLoad>
			<cfreturn true />
		</cfif>
		
		<!--- Read the file contents --->
		<cffile action="read" file="#checkFile(arguments.filename, arguments.directory)#" variable="fileContent" />
		
		<!--- Search for the component tag --->
		<cfreturn reFindNoCase(expression, fileContent) />
	</cffunction>
	
	<!---
		Checks to see if the file exists. Also tries checking for a relative path.
	--->
	<cffunction name="checkFile" access="private" returntype="string" output="false">
		<cfargument name="filename" type="string" required="true" />
		<cfargument name="directory" type="string" required="true" />
		
		<cfset var filePath = '' />
		
		<!--- Check for no directory --->
		<cfif arguments.directory EQ ''>
			<cfset arguments.directory = './' />
		</cfif>
		
		<!--- Check for trailing slash on directory --->
		<cfif right(arguments.directory, 1) NEQ '/'>
			<cfset arguments.directory &= '/' />
		</cfif>
		
		<!--- Set the file path --->
		<cfset filePath = arguments.directory & arguments.filename />
		
		<!--- Check to see if there is a file --->
		<cfif NOT fileExists(filePath)>
			<!--- Allow a relative path --->
			<cfset filePath = expandPath(filePath) />
			
			<!--- Still no joy --->
			<cfif NOT fileExists(filePath)>
				<cfthrow message="File does not exist" detail="The file (#filePath#) does not exist." />
			</cfif>
		</cfif>
		
		<cfreturn filePath />
	</cffunction>
	
	<!---
		Executes the methods to open and parse a component.
	--->
	<cffunction name="parse" access="public" returntype="struct" output="false" hint="Parses a specified file into a struct.">
		<cfargument name="filename" type="string" required="true" />
		<cfargument name="directory" type="string" required="true" />
		<cfargument name="constructors" type="string" required="true" />

		<cfset var fileContent = '' />
		<cfset var parsed = '' />
		
		<!--- Read the file contents --->
		<cffile action="read" file="#checkFile(arguments.filename, arguments.directory)#" variable="fileContent" />
		
		<!--- Parse the component --->
		<cfset parsed = parseComponent(fileContent, arguments.constructors) />
		
		<!--- Set the component name from the filename --->
		<cfset parsed.attributes.name = left(arguments.filename, len(arguments.filename) - len('.cfc')) />
		
		<cfreturn parsed />
	</cffunction>
	
	<!---
		Parses the comments out of a string.
	--->
	<cffunction name="parseComments" access="private" returntype="array" output="false">
		<cfargument name="comments" type="string" required="true" />
		
		<cfset var i = '' />
		<cfset var isComment = false />
		<cfset var parsedComments = arrayNew(1) />
		
		<cfloop list="#arguments.comments#" index="i" delimiters="#chr(10)##chr(13)#">
			<cfset i = trim(i) />
			
			<cfif left(i, 5) EQ '<!---' AND right(i, 4) EQ '--->'>
				<cfset isComment = true />
				
				<cfset i = trim(replaceList(i, '<!---,--->', ',')) />
			<cfelseif left(i, 5) EQ '<!---'>
				<cfset isComment = true />
				
				<cfif len(i) GT 5>
					<cfset i = right(i,  len(i) - 6) />
				<cfelse>
					<cfset i = '' />
				</cfif>
			<cfelseif right(i, 4) EQ '--->'>
				<cfset isComment = false />
				
				<cfif len(i) GT 4>
					<cfset i = left(i,  len(i) - 5) />
				<cfelse>
					<cfset i = '' />
				</cfif>
			</cfif>
			
			<cfif i NEQ '' AND isComment>
				<cfset arrayAppend(parsedComments, i) />
			</cfif>
		</cfloop>
		
		<cfreturn parsedComments />
	</cffunction>
	
	<!---
		Parse a component.
	--->
	<cffunction name="parseComponent" access="private" returntype="struct" output="false">
		<cfargument name="fileContents" type="string" required="true" />
		<cfargument name="constructors" type="string" required="true" />
		
		<cfset var expression = "<cf(component|interface)([^>]*)>(.*)</cf(component|interface)>" />
		<cfset var location = '' />
		<cfset var component = structNew() />
		<cfset var comments = arrayNew(1) />
		<cfset var attributes = '' />
		<cfset var contents = '' />
		
		<!--- Create the initial component values --->
		<cfset component.comments = arrayNew(1) />
		<cfset component.attributes = arrayNew(1) />
		<cfset component.properties = arrayNew(1) />
		
		<!--- Find the component information --->
		<cfset location = reFindNoCase(expression, arguments.fileContents, 1, true) />
		
		<!--- Check if was successful --->
		<cfif location.pos[1] NEQ 0>
			<!--- Parse out the comments --->
			<cfif location.pos[1] GT 1>
				<cfset comments = parseComments(left(arguments.fileContents, location.pos[1] - 1)) />
			</cfif>
			
			<!--- Process the component comments --->
			<cfset component.comments = processComments(comments) />
			
			<!--- Set the type of component --->
			<cfset component.type = mid(arguments.fileContents, location.pos[2], location.len[2]) />
			
			<!--- Parse out the information in the actual component --->
			<cfset component.attributes = processAttributes(mid(arguments.fileContents, location.pos[3], location.len[3])) />
			
			<!--- Parse out the content of the actual component --->
			<cfset contents = mid(arguments.fileContents, location.pos[4], location.len[4]) />
			
			<!--- Parse out the properties --->
			<cfset component.properties = parseTag(contents, 'cfproperty', 'property') />
			
			<!--- Parse out the functions --->
			<cfset component.methods = parseFunctions(contents, arguments.constructors) />
		<cfelse>
			<cfthrow message="Error trying to parse the cfc file." detail="While trying to parse the cfc file there was no <cfcomponent> or <cfinterface> tags found" />
		</cfif>
		
		<cfreturn component />
	</cffunction>
	
	<!---
		Parse through each function in the component.
	--->
	<cffunction name="parseFunctions" access="private" returntype="struct" output="false">
		<cfargument name="contents" type="string" required="true" />
		<cfargument name="constructors" type="string" required="true" />
		
		<cfset var expression = "<cffunction([^>]*)>(.*?)</cffunction>" />
		<cfset var location = '' />
		<cfset var functions = structNew() />
		<cfset var tempFunction = '' />
		<cfset var lastEnd = 1 />
		<cfset var comments = '' />
		
		<!--- Create the function arrays --->
		<cfset functions.constructors = arrayNew(1) />
		<cfset functions.functions = arrayNew(1) />
		
		<!--- find the expression in the contents --->
		<cfset location = reFindNoCase(expression, arguments.contents, 1, true) />
		
		<!--- Check if was successful --->
		<cfloop condition="location.pos[1]">
			<!--- Create the temp function --->
			<cfset tempFunction = structNew() />
			<cfset tempFunction.contents = '' />
			<cfset tempFunction.comments = arrayNew(1) />
			<cfset tempFunction.attributes = arrayNew(1) />
			<cfset tempFunction.arguments = arrayNew(1) />
			
			<!--- Parse out the comments --->
			<cfset comments = parseComments(mid(arguments.contents, lastEnd, location.pos[1] - lastEnd)) />
			
			<!--- Process the function comments --->
			<cfset tempFunction.comments = processComments(comments) />
			
			<!--- Set where the function ends for commenting purposes --->
			<cfset lastEnd = location.pos[1] + location.len[1] />
			
			<!--- Parse out the information in the component --->
			<cfset tempFunction.attributes = processAttributes(mid(arguments.contents, location.pos[2], location.len[2]), 'function') />

			<!--- Parse out the content of the function --->
			<cfset tempFunction.contents = mid(arguments.contents, location.pos[1], location.len[1]) />
			
			<!--- Parse out the arguments of the function --->
			<cfset tempFunction.arguments = parseTag(tempFunction.contents, 'cfargument', 'argument') />
			
			<!--- Add to function array --->
			<cfif ListFind(arguments.constructors, tempFunction.attributes.name)>
				<cfset arrayAppend(functions.constructors, tempFunction) />
			<cfelse>
				<cfset arrayAppend(functions.functions, tempFunction) />
			</cfif>
			
			<!--- Look for another function --->
			<cfset location = reFindNoCase(expression, arguments.contents, lastEnd, true) />
		</cfloop>
		
		<cfreturn functions />
	</cffunction>
	
	<!---
		Parse a given string for a tag and retrieve the attributes.
	--->
	<cffunction name="parseTag" access="private" returntype="array" output="false">
		<cfargument name="contents" type="string" required="true" />
		<cfargument name="tagName" type="string" required="true" />
		<cfargument name="attributeType" type="string" required="true" />

		<cfset var expression = '<' & arguments.tagName & '([^>]*)[/]?>' />
		<cfset var location = '' />
		<cfset var tags = arrayNew(1) />
		
		<!--- find the expression in the contents --->
		<cfset location = reFindNoCase(expression, arguments.contents, 1, true) />
		
		<cfloop condition="location.pos[1]">
			<cfset arrayAppend(tags, processAttributes(mid(arguments.contents, location.pos[2], location.len[2]), arguments.attributeType)) />
			
			<!--- look for another tag --->
			<cfset location = reFindNoCase(expression, arguments.contents, location.pos[2] + location.len[2], true) />
		</cfloop>
		
		<cfreturn tags />
	</cffunction>
	
	<!---
		Process a string and pull out the attributes and their values.
	--->
	<cffunction name="processAttributes" access="private" returntype="struct" output="false">
		<cfargument name="contents" type="string" required="true" hint="foo|bar" />
		<cfargument name="attributeType" type="string" default="component" />
		
		<cfset var attributes = structNew() />
		<cfset var expression = "([\S]*)=[""']([^""']*)[""']" />
		<cfset var location = '' />
		<cfset var i = '' />
		<cfset var temp = '' />
		
		<cfswitch expression="#arguments.attributeType#">
			<cfcase value="property">
				<cfset attributes.attributeOrder = 'type,required,default' />
				<cfset attributes.name = '' />
				<cfset attributes.required = false />
			</cfcase>
			<cfcase value="argument">
				<cfset attributes.attributeOrder = 'type,required,default' />
				<cfset attributes.name = '' />
				<cfset attributes.type = 'any' />
				<cfset attributes.required = false />
			</cfcase>
			<cfcase value="function">
				<cfset attributes.attributeOrder = 'returntype,roles,access,output' />
				<cfset attributes.name = '' />
				<cfset attributes.returnType = 'any' />
				<cfset attributes.roles = '' />
				<cfset attributes.access = 'public' />
			</cfcase>
			<cfdefaultcase>
				<cfset attributes.attributeOrder = 'extends,output,style,namespace,serviceportname,porttypename,bindingname,wsdlfile' />
				<cfset attributes.style = 'rpc' />
			</cfdefaultcase>
		</cfswitch>
		
		<cfset location = reFindNoCase(expression, arguments.contents, 1, true) />
		
		<cfloop condition="location.pos[1]">
			<cfset attributes[mid(arguments.contents, location.pos[2], location.len[2])] = mid(arguments.contents, location.pos[3], location.len[3]) />
			
			<cfset location = REFindNoCase(expression, arguments.contents, location.pos[3] + location.len[3], true) />
		</cfloop>
		
		<cfreturn attributes />
	</cffunction>
	
	<!---
		Process through a string and pull out comments.
	--->
	<cffunction name="processComments" access="private" returntype="struct" output="false">
		<cfargument name="contents" type="array" required="true" />
		
		<cfset var comments = structNew() />
		<cfset var expression = '@([\S]*) (.*)' />
		<cfset var location = '' />
		<cfset var i = '' />
		<cfset var temp = '' />
		
		<cfset comments.description = arrayNew(1) />
		<cfset comments.meta = structNew() />
		<cfset comments.metaOrder = '' />
		
		<cfloop from="1" to="#arrayLen(arguments.contents)#" index="i">
			<cfset location = REFindNoCase(expression, arguments.contents[i], 1, true) />
			
			<cfif location.pos[1] EQ 0>
				<cfset arrayAppend(comments.description, arguments.contents[i]) />
			<cfelse>
				<cfset temp = mid(arguments.contents[i], location.pos[2], location.len[2]) />
				
				<!--- Store the order of original comments in list --->
				<cfset comments.metaOrder = listAppend(comments.metaOrder, temp) />
				
				<!--- Store value of the meta information --->
				<cfset comments.meta[temp] = mid(arguments.contents[i], location.pos[3], location.len[3]) />
			</cfif>
		</cfloop>
		
		<cfreturn comments />
	</cffunction>
</cfcomponent>