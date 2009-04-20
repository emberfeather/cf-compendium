<cfcomponent extends="mxunit.framework.TestCase" output="false">
	<!---
		Test the calculateMaxFit with a 4x3 ratio original image and using a 1x1 resolution ratio.
	--->
	<cffunction name="testCalculateMaxFit4x3with1x1" access="public" returntype="void" output="false">
		<cfset var theObject = createObject('component', 'cf-compendium.inc.resource.media.imageResize').init() />
		<cfset var resolutions = [
				{
					width = 1000,
					height = 1000
				}
			] />
		<cfset var result = '' />
		
		<cfset result = theObject.calculateMaxFit(4000, 3000, resolutions) />
		
		<cfset assertEquals(3000, result[resolutions[1].ratio].width) />
		<cfset assertEquals(3000, result[resolutions[1].ratio].height) />
	</cffunction>
	
	<!---
		Test the calculateMaxFit with a 4x3 ratio original image and using a 1x5 resolution ratio.
	--->
	<cffunction name="testCalculateMaxFit4x3with1x5" access="public" returntype="void" output="false">
		<cfset var theObject = createObject('component', 'cf-compendium.inc.resource.media.imageResize').init() />
		<cfset var resolutions = [
				{
					width = 100,
					height = 500
				}
			] />
		<cfset var result = '' />
		
		<cfset result = theObject.calculateMaxFit(4000, 3000, resolutions) />
		
		<cfset assertEquals(600, result[resolutions[1].ratio].width) />
		<cfset assertEquals(3000, result[resolutions[1].ratio].height) />
	</cffunction>
	
	<!---
		Test the calculateMaxFit with a 4x3 ratio original image and using a 1x10 resolution ratio.
	--->
	<cffunction name="testCalculateMaxFit4x3with1x10" access="public" returntype="void" output="false">
		<cfset var theObject = createObject('component', 'cf-compendium.inc.resource.media.imageResize').init() />
		<cfset var resolutions = [
				{
					width = 100,
					height = 1000
				}
			] />
		<cfset var result = '' />
		
		<cfset result = theObject.calculateMaxFit(4000, 3000, resolutions) />
		
		<cfset assertEquals(300, result[resolutions[1].ratio].width) />
		<cfset assertEquals(3000, result[resolutions[1].ratio].height) />
	</cffunction>
	
	<!---
		Test the calculateMaxFit with a 4x3 ratio original image and using a 5x1 resolution ratio.
	--->
	<cffunction name="testCalculateMaxFit4x3with5x1" access="public" returntype="void" output="false">
		<cfset var theObject = createObject('component', 'cf-compendium.inc.resource.media.imageResize').init() />
		<cfset var resolutions = [
				{
					width = 500,
					height = 100
				}
			] />
		<cfset var result = '' />
		
		<cfset result = theObject.calculateMaxFit(4000, 3000, resolutions) />
		
		<cfset assertEquals(4000, result[resolutions[1].ratio].width) />
		<cfset assertEquals(800, result[resolutions[1].ratio].height) />
	</cffunction>
	
	<!---
		Test the calculateMaxFit with a 4x3 ratio original image and using a 10x1 resolution ratio.
	--->
	<cffunction name="testCalculateMaxFit4x3with10x1" access="public" returntype="void" output="false">
		<cfset var theObject = createObject('component', 'cf-compendium.inc.resource.media.imageResize').init() />
		<cfset var resolutions = [
				{
					width = 1000,
					height = 100
				}
			] />
		<cfset var result = '' />
		
		<cfset result = theObject.calculateMaxFit(4000, 3000, resolutions) />
		
		<cfset assertEquals(4000, result[resolutions[1].ratio].width) />
		<cfset assertEquals(400, result[resolutions[1].ratio].height) />
	</cffunction>
	
	<!---
		Test the calculateMaxFit with a 3x4 ratio original image and using a 1x1 resolution ratio.
	--->
	<cffunction name="testCalculateMaxFit3x4with1x1" access="public" returntype="void" output="false">
		<cfset var theObject = createObject('component', 'cf-compendium.inc.resource.media.imageResize').init() />
		<cfset var resolutions = [
				{
					width = 1000,
					height = 1000
				}
			] />
		<cfset var result = '' />
		
		<cfset result = theObject.calculateMaxFit(3000, 4000, resolutions) />
		
		<cfset assertEquals(3000, result[resolutions[1].ratio].width) />
		<cfset assertEquals(3000, result[resolutions[1].ratio].height) />
	</cffunction>
	
	<!---
		Test the calculateMaxFit with a 3x4 ratio original image and using a 1x5 resolution ratio.
	--->
	<cffunction name="testCalculateMaxFit3x4with1x5" access="public" returntype="void" output="false">
		<cfset var theObject = createObject('component', 'cf-compendium.inc.resource.media.imageResize').init() />
		<cfset var resolutions = [
				{
					width = 100,
					height = 500
				}
			] />
		<cfset var result = '' />
		
		<cfset result = theObject.calculateMaxFit(3000, 4000, resolutions) />
		
		<cfset assertEquals(800, result[resolutions[1].ratio].width) />
		<cfset assertEquals(4000, result[resolutions[1].ratio].height) />
	</cffunction>
	
	<!---
		Test the calculateMaxFit with a 3x4 ratio original image and using a 1x10 resolution ratio.
	--->
	<cffunction name="testCalculateMaxFit3x4with10x10" access="public" returntype="void" output="false">
		<cfset var theObject = createObject('component', 'cf-compendium.inc.resource.media.imageResize').init() />
		<cfset var resolutions = [
				{
					width = 100,
					height = 1000
				}
			] />
		<cfset var result = '' />
		
		<cfset result = theObject.calculateMaxFit(3000, 4000, resolutions) />
		
		<cfset assertEquals(400, result[resolutions[1].ratio].width) />
		<cfset assertEquals(4000, result[resolutions[1].ratio].height) />
	</cffunction>
	
	<!---
		Test the calculateMaxFit with a 3x4 ratio original image and using a 5x1 resolution ratio.
	--->
	<cffunction name="testCalculateMaxFit3x4with5x1" access="public" returntype="void" output="false">
		<cfset var theObject = createObject('component', 'cf-compendium.inc.resource.media.imageResize').init() />
		<cfset var resolutions = [
				{
					width = 500,
					height = 100
				}
			] />
		<cfset var result = '' />
		
		<cfset result = theObject.calculateMaxFit(3000, 4000, resolutions) />
		
		<cfset assertEquals(3000, result[resolutions[1].ratio].width) />
		<cfset assertEquals(600, result[resolutions[1].ratio].height) />
	</cffunction>
	
	<!---
		Test the calculateMaxFit with a 3x4 ratio original image and using a 10x1 resolution ratio.
	--->
	<cffunction name="testCalculateMaxFit3x4with10x1" access="public" returntype="void" output="false">
		<cfset var theObject = createObject('component', 'cf-compendium.inc.resource.media.imageResize').init() />
		<cfset var resolutions = [
				{
					width = 1000,
					height = 100
				}
			] />
		<cfset var result = '' />
		
		<cfset result = theObject.calculateMaxFit(3000, 4000, resolutions) />
		
		<cfset assertEquals(3000, result[resolutions[1].ratio].width) />
		<cfset assertEquals(300, result[resolutions[1].ratio].height) />
	</cffunction>
</cfcomponent>