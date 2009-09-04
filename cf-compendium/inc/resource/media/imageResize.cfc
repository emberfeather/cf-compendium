<cfcomponent extends="cf-compendium.inc.resource.base.image" output="false">
	<cffunction name="init" access="public" returntype="any" output="false">
		<cfreturn this />
	</cffunction>
	
	<cffunction name="calculateMaxFit" access="public" returntype="struct" output="false">
		<cfargument name="maxWidth" type="string" required="true" />
		<cfargument name="maxHeight" type="string" required="true" />
		<cfargument name="resolutions" type="array" required="true" />
		
		<cfset var maxResolutionClip = {} />
		<cfset var resolution = '' />
		<cfset var maxWHRatio = arguments.maxWidth / arguments.maxHeight />
		
		<cfloop array="#arguments.resolutions#" index="resolution">
			<cfset resolution.whRatio = resolution.width / resolution.height />
			<cfset resolution.hwRatio = resolution.height / resolution.width />
			<cfset resolution.ratio = numberFormat(resolution.whRatio, "__.__") />
			
			<cfif NOT structKeyExists(maxResolutionClip, resolution.ratio)>
				<cfset maxResolutionClip[resolution.ratio] = {
						width = 0,
						height = 0
					} />
				
				<cfif maxWHRatio GT 1>
					<cfif maxWHRatio LT resolution.whRatio>
						<cfset maxResolutionClip[resolution.ratio].width = arguments.maxWidth />
						<cfset maxResolutionClip[resolution.ratio].height = arguments.maxWidth * resolution.hwRatio />
					<cfelse>
						<cfset maxResolutionClip[resolution.ratio].width = arguments.maxHeight * resolution.whRatio />
						<cfset maxResolutionClip[resolution.ratio].height = arguments.maxHeight />
					</cfif>
				<cfelse>
					<cfif maxWHRatio LT resolution.whRatio OR resolution.whRatio GT 1>
						<cfset maxResolutionClip[resolution.ratio].width = arguments.maxWidth />
						<cfset maxResolutionClip[resolution.ratio].height = arguments.maxWidth * resolution.hwRatio />
					<cfelse>
						<cfset maxResolutionClip[resolution.ratio].width = arguments.maxHeight * resolution.whRatio />
						<cfset maxResolutionClip[resolution.ratio].height = arguments.maxHeight />
					</cfif>
				</cfif>
			</cfif>
		</cfloop>
		
		<cfreturn maxResolutionClip />
	</cffunction>
	
	<!---
		Used to clip, resize, and save an image down to multiple resolutions.
		<p>
		If the x or y is negative the value with be calculated to center the clip on the axis.
		<p>
		The resolutions array should contain a struct in each row with the following information:
		<ul>
			<li>width
			<li>height
		</ul>
	--->
	<cffunction name="clipImage" access="public" returntype="array" output="false">
		<cfargument name="imagePath" type="string" required="true" />
		<cfargument name="imageName" type="string" required="true" />
		<cfargument name="resolutions" type="array" required="true" />
		<cfargument name="x" type="numeric" default="-1" />
		<cfargument name="y" type="numeric" default="-1" />
		<cfargument name="clipWidth" type="numeric" default="-1" />
		<cfargument name="clipHeight" type="numeric" default="-1" />
		
		<cfset var original = '' />
		<cfset var parts = '' />
		<cfset var modified = {} />
		<cfset var width = '' />
		<cfset var height = '' />
		<cfset var modded = '' />
		<cfset var newFiles = [] />
		<cfset var resolutionClips = '' />
		<cfset var i = '' />
		
		<!--- Get the parts of the image name --->
		<cfset parts = explodeImageName(arguments.imageName) />
		
		<cfset original = imageRead(arguments.imagePath & arguments.imageName) />
		
		<cfset width = original.getWidth() />
		<cfset height = original.getHeight() />
		
		<cfif arguments.x LT 0>
			<cfset arguments.x = ceiling((width - max(arguments.clipWidth, 0) / 2)) />
		</cfif>
		
		<cfif arguments.y LT 0>
			<cfset arguments.y = ceiling((height - max(arguments.clipHeight, 0) / 2)) />
		</cfif>
		
		<!--- Check if using only a portion of the image --->
		<cfif arguments.clipWidth GT 0 AND arguments.clipHeight GT 0>
			<cfif arguments.x LT 0 OR width - arguments.x LT arguments.clipWidth>
				<cfthrow message="Image size is smaller than resize" detail="The width of the resize (#arguments.clipWidth#) is greater than the width of the image (#width#) with a #arguments.x# starting position." />
			</cfif>
			
			<cfif arguments.y LT 0 OR height - arguments.y LT arguments.clipHeight>
				<cfthrow message="Image size is smaller than resize" detail="The height of the resize (#arguments.clipHeight#) is greater than the height of the image (#height#) with a #arguments.y# starting position." />
			</cfif>
			
			<cfset original = imageCopy(original, arguments.x, arguments.y, arguments.clipWidth, arguments.clipHeight) />
			
			<cfset width = arguments.clipWidth />
			<cfset height = arguments.clipHeight />
		</cfif>
		
		<!--- Calculate the max fit sizes for the resolutions --->
		<cfset resolutionClips = calculateMaxFit(width, height, resolutions) />
		
		<cfloop array="#arguments.resolutions#" index="i">
			<!--- Check if we already have the modified image for the width/height ratio --->
			<cfif NOT structKeyExists(modified, i.whRatio)>
				<cfset resolutionClips[i.ratio] = imageCopy(original, 0, 0, resolutionClips[i.ratio].width, resolutionClips[i.ratio].height) />
			</cfif>
			
			<cfset modified = imageCopy(resolutionClips[i.ratio], 0, 0, resolutionClips[i.ratio].width, resolutionClips[i.ratio].height) />
			
			<!--- Resize the image --->
			<cfset imageResize(modified, i.width, i.height, 'highestQuality') />
			
			<!--- Get the modified dimensions --->
			<cfset modded = {
					width = i.width,
					height = i.height
				} />
			
			<!--- Create the new filename --->
			<cfset modded.filename = parts.name & '.' & modded.width & 'x' & modded.height & parts.ext />
			
			<!--- Append to array of modified images --->
			<cfset arrayAppend(newFiles, modded) />
			
			<!--- Save the modified file --->
			<cfset imageWrite(modified, arguments.imagePath & modded.filename) />
		</cfloop>
		
		<cfreturn newFiles />
	</cffunction>
	
	<!---
		Used to resize and save an image down to multiple resolutions.
		<p>
		The resolutions array should contain a struct in each row with the following information:
		<ul>
			<li>width
			<li>height
		</ul>
	--->
	<cffunction name="resizeImage" access="public" returntype="array" output="false">
		<cfargument name="imagePath" type="string" required="true" />
		<cfargument name="imageName" type="string" required="true" />
		<cfargument name="resolutions" type="array" required="true" />
		
		<cfset var original = '' />
		<cfset var modified = '' />
		<cfset var width = '' />
		<cfset var height = '' />
		<cfset var parts = '' />
		<cfset var modded = '' />
		<cfset var newFiles = [] />
		<cfset var i = '' />
		
		<!--- Get the parts of the image name --->
		<cfset parts = explodeImageName(arguments.imageName) />
		
		<cfset original = imageRead(arguments.imagePath & arguments.imageName) />
		
		<cfset width = original.getWidth() />
		<cfset height = original.getHeight() />
		
		<cfloop array="#arguments.resolutions#" index="i">
			<cfset modified = imageCopy(original, 0, 0, width, height) />
			
			<cfset imageResize(modified, i.width, i.height, 'highestQuality') />
			
			<!--- Get the modified dimensions --->
			<cfset modded = {
					width = modified.getWidth(),
					height = modified.getHeight()
				} />
			
			<!--- Create the new filename --->
			<cfset modded.filename = parts.name & '.' & modded.width & 'x' & modded.height & parts.ext />
			
			<!--- Append to array of modified images --->
			<cfset arrayAppend(newFiles, modded) />
			
			<!--- Save the modified file --->
			<cfset imageWrite(modified, arguments.imagePath & modded.filename) />
		</cfloop>
		
		<cfreturn newFiles />
	</cffunction>
	
	<!---
		Used to scale and save an image down to multiple resolutions.
		<p>
		The resolutions array should contain a struct in each row with the following information:
		<ul>
			<li>maxWidth
			<li>maxHeight
		</ul>
	--->
	<cffunction name="scaleImage" access="public" returntype="array" output="false">
		<cfargument name="imagePath" type="string" required="true" />
		<cfargument name="imageName" type="string" required="true" />
		<cfargument name="resolutions" type="array" required="true" />
		
		<cfset var original = '' />
		<cfset var modified = '' />
		<cfset var width = '' />
		<cfset var height = '' />
		<cfset var modded = '' />
		<cfset var newFiles = [] />
		<cfset var parts = '' />
		<cfset var i = '' />
		
		<!--- Get the parts of the image name --->
		<cfset parts = explodeImageName(arguments.imageName) />
		
		<cfset original = imageRead(arguments.imagePath & arguments.imageName) />
		
		<cfset width = original.getWidth() />
		<cfset height = original.getHeight() />
		
		<cfloop array="#arguments.resolutions#" index="i">
			<cfset modified = imageCopy(original, 0, 0, width, height) />
			
			<cfset imageScaleToFit(modified, i.maxWidth, i.maxHeight, 'highestQuality') />
			
			<!--- Get the modified dimensions --->
			<cfset modded = {
					width = modified.getWidth(),
					height = modified.getHeight()
				} />
			
			<!--- Create the new filename --->
			<cfset modded.filename = parts.name & '.' & modded.width & 'x' & modded.height & parts.ext />
			
			<!--- Append to array of modified images --->
			<cfset arrayAppend(newFiles, modded) />
			
			<!--- Save the modified file --->
			<cfset imageWrite(modified, arguments.imagePath & modded.filename) />
		</cfloop>
		
		<cfreturn newFiles />
	</cffunction>
</cfcomponent>