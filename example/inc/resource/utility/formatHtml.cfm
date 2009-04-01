<cfset theFormatter = createObject('component', 'cf-compendium.inc.resource.utility.formatHtml').init() />

<cffile action="read" file="#expandPath('/inc/resource/structure/markupGuide.cfm')#" variable="testString" />

<cfoutput>#theFormatter.correctType(testString)#</cfoutput>