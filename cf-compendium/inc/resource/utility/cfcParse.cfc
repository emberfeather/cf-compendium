<!---
	This component is made for parsing cfc files, component or interfaces.
--->
<cfcomponent output="false">
	<cffunction name="init" access="public" returntype="any" output="false">
		<cfargument name="lazyLoad" type="boolean" default="true" />
		<cfargument name="bufferSize" type="numeric" default="1000" />
		
		<cfset variables.lazyLoad = arguments.lazyLoad />
		<cfset variables.bufferSize = arguments.bufferSize />
		
		<cfreturn this />
	</cffunction>
	
	<!---
		Use this function to determine if a given file is a component
	--->
	<cffunction name="isComponent" access="public" returntype="boolean" output="false">
		<cfargument name="fileName" type="string" required="true" />
		
		<!--- If lazy loading then don't even try --->
		<cfif variables.lazyLoad>
			<cfreturn true />
		</cfif>
		
		<cfreturn checkIsComponent(trim(readFileContents(arguments.fileName, variables.bufferSize))) />
	</cffunction>
	
	<!---
		Use this function to determine if a given file is a script-based component
	--->
	<cffunction name="isScript" access="public" returntype="boolean" output="false">
		<cfargument name="fileName" type="string" required="true" />
		
		<cfreturn checkIsScript(trim(readFileContents(arguments.fileName, variables.bufferSize))) />
	</cffunction>
	
	<!---
		Check the contents of a file to see if it is a component
	--->
	<cffunction name="checkIsComponent" access="private" returntype="boolean" output="false">
		<cfargument name="fileContent" type="string" required="true" />
		
		<cfset var expression = '' />
		
		<cfif checkIsScript(arguments.fileContent)>
			<cfset expression = 'component' />
		<cfelse>
			<cfset expression = '<cfcomponent' />
		</cfif>
		
		<!--- Search for the component keyword --->
		<cfreturn reFindNoCase(expression, fileContent) gt 0 />
	</cffunction>
	
	<!---
		Check the contents of a file to see if it is a script
	--->
	<cffunction name="checkIsScript" access="private" returntype="boolean" output="false">
		<cfargument name="fileContent" type="string" required="true" />
		
		<!--- Search for the component tag --->
		<cfreturn reFind('^<', fileContent) eq 0 />
	</cffunction>
	
	<!---
		Executes the methods to open and parse a component.
	--->
	<cffunction name="parse" access="public" returntype="struct" output="false">
		<cfargument name="fileName" type="string" required="true" />
		<cfargument name="constructors" type="string" required="true" />

		<cfset var fileContent = '' />
		<cfset var parsed = '' />
		
		<!--- Read the file contents --->
		<cfset fileContent = readFileContents(arguments.fileName, -1) />
		
		<!--- Parse the component --->
		<cfif checkIsScript(fileContent)>
			<cfset parsed = parseScriptComponent(fileContent, arguments.constructors) />
		<cfelse>
			<cfset parsed = parseComponent(fileContent, arguments.constructors) />
		</cfif>
		
		<!--- Set the component name from the fileName --->
		<cfset parsed.attributes.name = left(arguments.fileName, len(arguments.fileName) - len('.cfc')) />
		
		<cfreturn parsed />
	</cffunction>
	
	<!---
		Parses the comments out of a string.
	--->
	<cffunction name="parseComments" access="private" returntype="array" output="false">
		<cfargument name="comments" type="string" required="true" />
		
		<cfset var i = '' />
		<cfset var line = '' />
		<cfset var isComment = false />
		<cfset var isSplit = true />
		<cfset var parsedComments = [] />
		
		<cfloop list="#arguments.comments#" index="i" delimiters="#chr(10)##chr(13)#">
			<cfset line = trim(i) />
			
			<cfif left(line, 5) eq '<!---' and right(line, 4) eq '--->'>
				<cfset isComment = true />
				
				<cfset line = trim(replaceList(line, '<!---,--->', ',')) />
			<cfelseif left(line, 5) eq '<!---'>
				<cfset isComment = true />
				
				<cfif len(line) gt 5>
					<cfset line = right(line,  len(line) - 6) />
				<cfelse>
					<cfset line = '' />
				</cfif>
			<cfelseif right(line, 4) eq '--->'>
				<cfset isComment = false />
				
				<cfif len(line) gt 4>
					<cfset line = left(line,  len(line) - 5) />
				<cfelse>
					<cfset line = '' />
				</cfif>
			</cfif>
			
			<cfif isComment>
				<!--- Want any lines that aren't split by a blank line to be one comment --->
				<cfif line eq '' or line eq '<p>'>
					<cfset isSplit = true />
				<cfelse>
					<!--- Split comments or meta information does not belong together --->
					<cfif isSplit or left(line, 1) eq '@'>
						<cfset arrayAppend(parsedComments, line) />
						
						<!--- End the split --->
						<cfset isSplit = false />
					<cfelse>
						<cfset parsedComments[arrayLen(parsedComments)] &= ' ' & line />
					</cfif>
				</cfif>
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
		<cfset var component = {} />
		<cfset var comments = [] />
		<cfset var attributes = '' />
		<cfset var contents = '' />
		
		<!--- Create the initial component values --->
		<cfset component.comments = [] />
		<cfset component.attributes = [] />
		<cfset component.properties = [] />
		
		<!--- Find the component information --->
		<cfset location = reFindNoCase(expression, arguments.fileContents, 1, true) />
		
		<!--- Check if was successful --->
		<cfif location.pos[1] neq 0>
			<!--- Parse out the comments --->
			<cfif location.pos[1] gt 1>
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
		
		<cfset var expression = "<cffunction([^>]*)>(.*?)</cffunction>[#chr(10)##chr(13)#]" />
		<cfset var location = '' />
		<cfset var functions = {} />
		<cfset var tempFunction = '' />
		<cfset var lastEnd = 1 />
		<cfset var comments = '' />
		
		<!--- Create the function arrays --->
		<cfset functions.constructors = [] />
		<cfset functions.functions = [] />
		
		<!--- find the expression in the contents --->
		<cfset location = reFindNoCase(expression, arguments.contents, 1, true) />
		
		<!--- Check if was successful --->
		<cfloop condition="location.pos[1]">
			<!--- Create the temp function --->
			<cfset tempFunction = {} />
			<cfset tempFunction.contents = '' />
			<cfset tempFunction.comments = [] />
			<cfset tempFunction.attributes = [] />
			<cfset tempFunction.theArguments = [] />
			
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
			<cfset tempFunction.theArguments = parseTag(tempFunction.contents, 'cfargument', 'argument') />
			
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
		Parses the comments out of a string.
	--->
	<cffunction name="parseScriptComments" access="private" returntype="array" output="false">
		<cfargument name="comments" type="string" required="true" />
		
		<cfset var i = '' />
		<cfset var line = '' />
		<cfset var isComment = false />
		<cfset var isSplit = true />
		<cfset var parsedComments = [] />
		
		<cfloop list="#arguments.comments#" index="i" delimiters="#chr(10)##chr(13)#">
			<cfset line = trim(i) />
			
			<!--- Determine state --->
			<cfif left(line, 2) eq '//'>
				<cfset isComment = true />
				
				<cfset line = trim(right(line, len(line) - len('//'))) />
			<cfelseif left(line, 2) eq '/*'>
				<cfset isComment = true />
				
				<cfif len(line) gt 2>
					<cfset line = trim(right(line,  len(line) - len('//'))) />
				<cfelse>
					<cfset line = '' />
				</cfif>
			<cfelseif right(line, 2) eq '*/'>
				<cfset isComment = false />
				
				<cfif len(line) gt 4>
					<cfset line = trim(left(line,  len(line) - len('*/'))) />
				<cfelse>
					<cfset line = '' />
				</cfif>
			</cfif>
			
			<!--- Trim multiline comment beginning with * --->
			<cfif left(line, 1) eq '*'>
				<cfif len(line) eq 1>
					<cfset line = '' />
				<cfelse>
					<cfset line = trim(right(line, len(line) - 1)) />
				</cfif>
			</cfif>
			
			<cfif isComment>
				<!--- Want any lines that aren't split by a blank line to be one comment --->
				<cfif line eq '' or line eq '<p>'>
					<cfset isSplit = true />
				<cfelse>
					<!--- Split comments or meta information does not belong together --->
					<cfif isSplit or left(line, 1) eq '@'>
						<cfset arrayAppend(parsedComments, line) />
						
						<!--- End the split --->
						<cfset isSplit = false />
					<cfelse>
						<cfset parsedComments[arrayLen(parsedComments)] &= ' ' & line />
					</cfif>
				</cfif>
			</cfif>
		</cfloop>
		
		<cfreturn parsedComments />
	</cffunction>
	
	<!---
		Parse a script component.
	--->
	<cffunction name="parseScriptComponent" access="private" returntype="struct" output="false">
		<cfargument name="fileContents" type="string" required="true" />
		<cfargument name="constructors" type="string" required="true" />
		
		<cfset var attributes = '' />
		<cfset var comments = {} />
		<cfset var component = {} />
		<cfset var contents = '' />
		<cfset var expression = '' />
		<cfset var location = '' />
		<cfset var buffer = '' />
		
		<!--- Create the initial component values --->
		<cfset component.comments = {} />
		<cfset component.attributes = {} />
		<cfset component.properties = [] />
		
		<!--- Process the component comments --->
		<cfset component.comments = trimScriptPreComments(arguments.fileContents) />
		
		<!--- Remove any found comments so it doesn't mess up the component parsing --->
		<cfif component.comments.length gt 0>
			<cfset arguments.fileContents = right(arguments.fileContents, len(arguments.fileContents) - component.comments.length) />
		</cfif>
		
		<!--- Find the component information --->
		<cfset expression = '(component|interface)([^{]*){(.*)}' />
		
		<cfset location = reFindNoCase(expression, arguments.fileContents, 1, true) />
		
		<!--- Check if was successful --->
		<cfif location.pos[1] neq 0>
			<!--- Set the type of component --->
			<cfset component.type = mid(arguments.fileContents, location.pos[2], location.len[2]) />
			
			<!--- Parse out the information in the actual component --->
			<cfset component.attributes = processAttributes(mid(arguments.fileContents, location.pos[3], location.len[3])) />
			
			<!--- Parse out the content of the actual component --->
			<cfset contents = mid(arguments.fileContents, location.pos[4], location.len[4]) />
			
			<!--- Parse out the functions --->
			<cfset component.methods = parseScriptFunctions(contents, arguments.constructors) />
		<cfelse>
			<cfthrow message="Error trying to parse the cfc file." detail="While trying to parse the cfc file there was no <cfcomponent> or <cfinterface> tags found" />
		</cfif>
		
		<cfreturn component />
	</cffunction>
	
	<!---
		Parse through an individual function in the script component.
	--->
	<cffunction name="parseScriptFunction" access="private" returntype="struct" output="false">
		<cfargument name="contents" type="string" required="true" />
		
		<cfset var expression = "(public|private|package|remote) ([a-zA-Z]+) function ([a-zA-Z0-9-_]+)[ ]?\(([^\)]*)\)[ ]?{(.*)}" />
		<cfset var location = '' />
		<cfset var tempFunction = '' />
		<cfset var comments = '' />
		
		<!--- find the expression in the contents --->
		<cfset location = reFindNoCase(expression, arguments.contents, 1, true) />
		
		<!--- Check if was successful --->
		<cfif location.pos[1]>
			<!--- Create the function information --->
			<cfset tempFunction = {} />
			<cfset tempFunction.contents = '' />
			<cfset tempFunction.comments = {} />
			<cfset tempFunction.attributes = {} />
			<cfset tempFunction.theArguments = [] />
			
			<!--- Parse out the comments --->
			<cfset comments = parseScriptComments(mid(arguments.contents, 1, location.pos[1] - 1)) />
			
			<!--- Process the function comments --->
			<cfset tempFunction.comments = processComments(comments) />
			
			<!--- Parse out the information in the component --->
			<cfset tempFunction.attributes = evaluate(serialize(tempFunction.comments.meta)) />
			
			<cfset tempFunction.attributes['access'] = mid(arguments.contents, location.pos[2], location.len[2]) />
			<cfset tempFunction.attributes['returnType'] = mid(arguments.contents, location.pos[3], location.len[3]) />
			<cfset tempFunction.attributes['name'] = mid(arguments.contents, location.pos[4], location.len[4]) />
			
			<!--- Parse out the content of the function --->
			<cfset tempFunction.contents = mid(arguments.contents, location.pos[1], location.len[1]) />
			
			<!--- Parse out the arguments of the function --->
			<cfset tempFunction.theArguments = processScriptArguments(mid(arguments.contents, location.pos[5], location.len[5])) />
		</cfif>
		
		<cfreturn tempFunction />
	</cffunction>
	
	<!---
		Parse through each function in the script component.
	--->
	<cffunction name="parseScriptFunctions" access="private" returntype="struct" output="false">
		<cfargument name="contents" type="string" required="true" />
		<cfargument name="constructors" type="string" required="true" />
		
		<cfset var functionBlock = '' />
		<cfset var functionBlocks = '' />
		<cfset var functions = {} />
		<cfset var tempFunction = '' />
		
		<!--- Create the function arrays --->
		<cfset functions.constructors = [] />
		<cfset functions.functions = [] />
		
		<!--- Split the individual functions --->
		<cfset functionBlocks = splitScriptFunctions(arguments.contents) />
		
		<cfloop array="#functionBlocks#" index="functionBlock">
			<!--- Parse the temp function --->
			<cfset tempFunction = parseScriptFunction(functionBlock) />
			
			<!--- Add to function array --->
			<cfif ListFind(arguments.constructors, tempFunction.attributes.name)>
				<cfset arrayAppend(functions.constructors, tempFunction) />
			<cfelse>
				<cfset arrayAppend(functions.functions, tempFunction) />
			</cfif>
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
		<cfset var tags = [] />
		
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
		<cfargument name="contents" type="string" required="true" />
		<cfargument name="attributeType" type="string" default="component" />
		
		<cfset var attributes = {} />
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
		Process a string and pull out the arguments and their properties.
	--->
	<cffunction name="processScriptArguments" access="private" returntype="struct" output="false">
		<cfargument name="contents" type="string" required="true" />
		
		<cfset var attributes = {} />
		<cfset var expression = "([\S]*) ([\S]*)(=[""']([^""']*)[""'])?" />
		<cfset var location = '' />
		<cfset var i = '' />
		<cfset var temp = '' />
		
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
		
		<cfset var comments = {} />
		<cfset var expression = '@([\S]*) (.*)' />
		<cfset var location = '' />
		<cfset var i = '' />
		<cfset var temp = '' />
		
		<cfset comments.description = [] />
		<cfset comments.meta = {} />
		<cfset comments.metaOrder = '' />
		
		<cfloop from="1" to="#arrayLen(arguments.contents)#" index="i">
			<cfset location = REFindNoCase(expression, arguments.contents[i], 1, true) />
			
			<cfif location.pos[1] eq 0>
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
	
	<!---
		Finds and reads in a file with the option of buffering with a set number of
		characters from the file
	--->
	<cffunction name="readFileContents" access="private" returntype="string" output="false">
		<cfargument name="fileName" type="string" required="true" />
		<cfargument name="bufferSize" type="numeric" default="#variables.bufferSize#" />
		
		<cfset var fileObj = '' />
		
		<!--- Check that the file path exists --->
		<cfif not fileExists(arguments.fileName)>
			<cfif fileExists(expandPath(arguments.fileName))>
				<cfset arguments.fileName = expandPath(arguments.fileName) />
			<cfelseif fileExists(expandPath('/' & arguments.fileName))>
				<cfset arguments.fileName = expandPath('/' & arguments.fileName) />
			</cfif>
		</cfif>
		
		<cfif arguments.bufferSize gt 0>
			<cfset fileObj = fileOpen(arguments.fileName) />
			
			<cfreturn fileRead(fileObj, arguments.buffersize) />
		</cfif>
		
		<cfreturn fileRead(arguments.fileName) />
	</cffunction>
	
	<cffunction name="splitScriptFunctions" access="public" returntype="array" output="false">
		<cfargument name="contents" type="string" required="true" />
		
		<cfset var expression = "(public|private|package|remote) [a-zA-Z]+ function [a-zA-Z0-9-_]+" />
		<cfset var findLast = '' />
		<cfset var functionBlocks = [] />
		<cfset var functionClose = '}' />
		<cfset var functionEnd = 0 />
		<cfset var lastEnd = 1 />
		<cfset var location = '' />
		
		<!--- find the expression in the contents --->
		<cfset location = reFindNoCase(expression, arguments.contents, 1, true) />
		
		<!--- if nothing was found there are no functions --->
		<cfif not location.pos[1]>
			<cfreturn functionBlocks />
		</cfif>
		
		<!--- search for the next function start --->
		<cfset location = reFindNoCase(expression, arguments.contents, location.pos[1] + location.len[1], true) />
		
		<cfloop condition="location.pos[1] gt 0">
			<cfset findLast = find(functionClose, arguments.contents, functionEnd) />
			
			<!--- Find the last } before the function --->
			<cfloop condition="findLast gt 0 and findLast lt location.pos[1]">
				<cfset functionEnd = findLast + 1 />
				
				<cfset findLast = find(functionClose, arguments.contents, functionEnd) />
			</cfloop>
			
			<!--- Append the function block --->
			<cfset arrayAppend(functionBlocks, mid(arguments.contents, lastEnd, functionEnd)) />
			
			<cfset lastEnd = functionEnd />
			
			<!--- search for the next function start --->
			<cfset location = reFindNoCase(expression, arguments.contents, location.pos[1] + location.len[1], true) />
		</cfloop>
		
		<!--- Append the last function block --->
		<cfset arrayAppend(functionBlocks, right(arguments.contents, len(arguments.contents) - lastEnd)) />
		
		<cfreturn functionBlocks />
	</cffunction>
	
	<cffunction name="trimScriptPreComments" access="private" returntype="struct" output="false">
		<cfargument name="fileContents" type="string" required="true" />
		
		<cfset var bufferComments = '' />
		<cfset var comments = '' />
		<cfset var expression = '' />
		<cfset var length = 0 />
		<cfset var location = '' />
		
		<!--- Parse out the starting multi-line comments --->
		<cfset expression = '^/\*(.*?)\*/' />
		
		<!--- Search for comment --->
		<cfset location = reFindNoCase(expression, arguments.fileContents, 1, true) />
		
		<cfloop condition="location.pos[1] gt 0">
			<cfset bufferComments &= left(arguments.fileContents, location.len[1]) & chr(10) />
			
			<!--- Remove the comments from the file content --->
			<cfset arguments.fileContents = right(arguments.fileContents, len(arguments.fileContents) - location.len[1]) />
			
			<!--- Add to the total length of comments --->
			<cfset length += location.len[1] />
			
			<!--- Re-search --->
			<cfset location = reFindNoCase(expression, arguments.fileContents, 1, true) />
		</cfloop>
		
		<!--- Parse out the starting single-line comments --->
		<cfset expression = '^//(.*?)#chr(10)#' />
		
		<!--- Search for comment --->
		<cfset location = reFindNoCase(expression, arguments.fileContents, 1, true) />
		
		<cfloop condition="location.pos[1] gt 0">
			<cfset bufferComments &= left(arguments.fileContents, location.len[1]) & chr(10) />
			
			<!--- Remove the comments from the file content --->
			<cfset arguments.fileContents = right(arguments.fileContents, len(arguments.fileContents) - location.len[1]) />
			
			<!--- Add to the total length of comments --->
			<cfset length += location.len[1] />
			
			<!--- Re-search --->
			<cfset location = reFindNoCase(expression, arguments.fileContents, 1, true) />
		</cfloop>
		
		<!--- Parse and process the comments from the buffer --->
		<cfset comments = processComments(parseScriptComments(bufferComments)) />
		
		<!--- Add the length to the processed comments --->
		<cfset comments.length = length />
		
		<cfreturn comments />
	</cffunction>
</cfcomponent>