<!---
	Description:
		The Yadis specification provides a mechanism for determining the services that are available with a
		given identifier. It uses URLs as identifiers, so given a URL, it provides a mechanism of retrieving
		a list of available services associated with that URL. The service list is an XRDS XML document.
	
	Original Author:
		Richard Davies
		http://www.richarddavies.us
		richard@richarddavies.us
	
	Specification:
		http://yadis.org/papers/yadis-v1.0.pdf		(version 1.0 - PDF)
		http://yadis.org/wiki/Yadis_1.0_(HTML)		(version 1.0 - HTML)
	
	See also:
		http://en.wikipedia.org/wiki/Yadis
--->
<cfcomponent output="false">
	<cffunction name="init" access="public" returntype="component" output="false">
		<cfreturn this />
	</cffunction>
	
	<!--- 
		Yadis XRDS discovery
		http://yadis.org/wiki/Yadis_1.0_(HTML)#6.2.4_Initiation
	--->
	<cffunction name="discover" access="public" returntype="any" output="false">
		<cfargument name="yadisURL" type="string" required="true" />
		
		<cfset var result = '' />
		<cfset var xrdsDocument = '' />
		<cfset var xrdsURL = '' />
		
		<!--- Retrieve the original yadis URL --->
		<cfhttp url="#arguments.yadisURL#" result="result">
			<cfhttpparam type="header" name="Accept" value="application/xrds+xml">
		</cfhttp>
		
		<cfif structKeyExists(result.responseHeader, 'X-XRDS-Location')>
			<!--- Retrieve from URL returned in HTTP header --->
			<cfset xrdsURL = result.responseHeader['X-XRDS-Location'] />
			
			<!--- Recurse if not the same URL --->
			<cfif xrdsURL neq arguments.yadisURL>
				<cfreturn discover( xrdsURL ) />
			</cfif>
		<cfelse>
			<!--- Retrieve from URL in <meta> HTML element --->
			<cfset xrdsURL = findMetaDescriptor( results.fileContent ) />
			
			<cfif xrdsURL neq ''>
				<cfreturn discover( xrdsURL ) />
			</cfif>
		</cfif>
		
		<!--- If the http result is an xml file, use it --->
		<cfif isXML( results.fileContent )>
			<cfset xrdsDocument = xmlParse(results.fileContent) />
		</cfif>
		
		<cfreturn xrdsDocument />
	</cffunction>
	
	<cffunction name="findMetaDescriptor" access="private" returntype="string" output="false">
		<cfargument name="content" type="string" required="true" />
		
		<cfset var descriptorURL = '' />
		<cfset var match = '' />
		
		<!--- Look for <meta http-equiv="x-xrds-locationi" content="" /> element --->
		<cfset match = reFindNoCase("<meta[^>]*(http-equiv=[""']x-xrds-location[""'][^>]*content=[""']([^""']+)[""']|content=[""']([^""']+)[""'][^>]*http-equiv=[""']x-xrds-location[""'])[^>]*\/?>", arguments.content, 1, true) />
		
		<cfif match.pos[1] neq 0>
			<!--- Check which grouping caught the descriptor --->
			<cfif match.pos[3]>
				<cfset descriptorURL = mid(arguments.content, match.pos[3], match.len[3]) />
			<cfelse>
				<cfset descriptorURL = mid(arguments.content, match.pos[4], match.len[4]) />
			</cfif>
		</cfif>
		
		<!--- Replace HTML entities with their respective characters --->
		<cfset descriptorURL = replaceNoCase(descriptorURL, '&amp;', '&', 'all') />
		<cfset descriptorURL = replaceNoCase(descriptorURL, '&lt;', '<', 'all') />
		<cfset descriptorURL = replaceNoCase(descriptorURL, '&gt;', '>', 'all') />
		<cfset descriptorURL = replaceNoCase(descriptorURL, '&quot;', '"', 'all') />
		
		<cfreturn descriptorURL />
	</cffunction>
	
	<!---
		XRDS <service> description and example
		http://openid.net/specs/openid-authentication-2_0.html#rfc.section.7.3.2
	--->
	<cffunction name="getServices" access="public" returntype="array" output="false">
		<cfargument name="xrds" type="xml" required="true" />
		
		<cfset var services = [] />
		<cfset var i = '' />
		<cfset var j = '' />
		<cfset var URIs = '' />
		
		<!--- Sort the services --->
		<cfset services = xmlPrioritySort( arguments.xrds, "Service" ) />
		
		<!--- Sort the URIs in the Services by priority --->
		<!--- Breaks in Railo 3.1.1
		<cfloop from="1" to="#arrayLen(services)#" index="i">
			<cfset URIs = xmlPrioritySort( services[i], 'URI' ) />
			
			<cfloop from="1" to="#arrayLen(URIs)#" index="j">
				<cfset services[i].URI[j] = duplicate(URIs[j]) />
			</cfloop>
		</cfloop>
		 --->
		
		<cfreturn services />
	</cffunction>
	
	<!---
		Sorts the given xml according to the priority attribute.
		The lower the priority value, the higher the priority.
	--->
	<cffunction name="xmlPrioritySort" access="private" returntype="array" output="false">
		<cfargument name="xml" type="string" required="true" />
		<cfargument name="elementName" type="string" required="true" />
		
		<cfset var element = '' />
		<cfset var elementSearch = '' />
		<cfset var minValue = '' />
		<cfset var priorities = {} />
		<cfset var priority = '' />
		<cfset var priorityList = '' />
		<cfset var sorted = [] />
		
		<!--- Find all the elements --->
		<cfset elementSearch = xmlSearch(arguments.xml, '//*[name()=''' & arguments.elementName & ''']') />
		
		<cfloop array="#elementSearch#" index="element">
			<cfset priority = 999999999999 />
			
			<!--- Check if the xml attribute as a priority --->
			<cfif structKeyExists(element.xmlAttributes, 'priority')>
				<cfset priority = element.xmlAttributes.priority />
			</cfif>
			
			<!--- Create a new array if it does not exist --->
			<cfif not structKeyExists(priorities, priority)>
				<cfset priorities[priority] = [] />
			</cfif>
			
			<cfset arrayAppend(priorities[priority], element) />
		</cfloop>
		
		<!--- Get the sorted priority list --->
		<cfset priorityList = listSort(structKeyList(priorities), 'numeric') />
		
		<!--- Make the final sorted element array --->
		<cfloop list="#priorityList#" index="priority">
			<cfloop array="#priorities[priority]#" index="element">
				<cfset arrayAppend(sorted, element) />
			</cfloop>
		</cfloop>
		
		<cfreturn sorted />
	</cffunction>
</cfcomponent>