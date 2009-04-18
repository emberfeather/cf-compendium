<cfcomponent output="false">
	<cffunction name="init" access="public" returntype="any" output="false">
		<cfreturn this />
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
		<cfargument name="width" type="numeric" default="-1" />
		<cfargument name="height" type="numeric" default="-1" />
		
		<cfset var original = '' />
		<cfset var parts = '' />
		<cfset var clipped = '' />
		<cfset var modified = '' />
		<cfset var width = '' />
		<cfset var height = '' />
		<cfset var maxWidth = '' />
		<cfset var maxHeight = '' />
		<cfset var resolutionRatio = '' />
		<cfset var modded = '' />
		<cfset var newFiles = [] />
		<cfset var i = '' />
		
		<!--- Get the parts of the image name --->
		<cfset parts = explodeImageName(arguments.imageName) />
		
		<cfset original = imageRead(arguments.imagePath & arguments.imageName) />
		
		<cfset width = original.getWidth() />
		<cfset height = original.getHeight() />
		
		<cfif arguments.x LT 0>
			<cfset arguments.x = ceiling((width - arguments.width) / 2) />
		</cfif>
		
		<cfif arguments.y LT 0>
			<cfset arguments.y = ceiling((height - arguments.height) / 2) />
		</cfif>
		
		<!--- Check for an automatic size check --->
		<cfif arguments.width LT 0 AND arguments.height LT 0>
			<cfset maxWidth = width - arguments.x />
			<cfset maxHeight = height - arguments.y />
			
			<cfset resolutionRatio = arguments.resolutions[1].width / arguments.resolutions[1].height />
			
			<cfif maxWidth LT maxHeight>
				<!--- Width is the restraining --->
				<cfif resolutionRatio LT 0>
					<!--- Taller than Wide Resolution --->
					<!---
						+---------+
						| |     | |
						| |     | |
						| |     | |
						| |     | |
						| |     | |
						| |     | |
						| |     | |
						| |     | |
						+---------+
					--->
					<cfset arguments.height = maxHeight />
					<cfset arguments.width = maxHeight * resolutionRatio />
				<cfelse>
					<!--- Wider than Tall Resolution --->
					<!---
						+---------+
						|         |
						|---------|
						|         |
						|         |
						|         |
						|         |
						|---------|
						|         |
						+---------+ 
					--->
					<cfset arguments.width = maxWidth />
					<cfset arguments.height = maxWidth * resolutionRatio />
				</cfif>
			<cfelse>
				<!--- Height is restraining --->
				<cfif resolutionRatio LT 0>
					<!--- Taller than Wide Resolution --->
					<!---
						+----------------------+
						|   |              |   |
						|   |              |   |
						|   |              |   |
						|   |              |   |
						|   |              |   |
						|   |              |   |
						+----------------------+
					--->
					<cfset arguments.height = maxHeight />
					<cfset arguments.width = maxHeight * resolutionRatio />
				<cfelse>
					<!--- Wider than Tall Resolution --->
					<!---
						+----------------------+
						|                      |
						|----------------------|
						|                      |
						|                      |
						|----------------------|
						|                      |
						+----------------------+
					--->
					<cfset arguments.width = maxWidth />
					<cfset arguments.height = maxWidth * resolutionRatio />
				</cfif>
			</cfif>
		</cfif>
		
		<cfif arguments.x LT 0 OR width - arguments.x LT arguments.width>
			<cfthrow message="Image size is smaller than resize" detail="The width of the resize (#arguments.width#) is greater than the width of the image (#width#) with a #arguments.x# starting position." />
		</cfif>
		
		<cfif arguments.y LT 0 OR height - arguments.y LT arguments.height>
			<cfthrow message="Image size is smaller than resize" detail="The height of the resize (#arguments.height#) is greater than the height of the image (#height#) with a #arguments.y# starting position." />
		</cfif>
		
		<cfset clipped = imageCopy(original, arguments.x, arguments.y, arguments.width, arguments.height) />
		
		<cfloop array="#arguments.resolutions#" index="i">
			<cfset modified = imageCopy(clipped, 0, 0, arguments.width, arguments.height) />
			
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
		Used to break the image name into the base part and the file extension.
	--->
	<cffunction name="explodeImageName" access="private" returntype="struct" output="false">
		<cfargument name="imageName" type="string" required="true" />
		
		<cfset var parts = {} />
		<cfset var search = '' />
		
		<!--- Search for parts of the image name --->
		<cfset search = reFind('(.*)(\.[^\.]*)$', arguments.imageName, 1, true) />
		
		<!--- Check if we were able to locate the image name --->
		<cfif NOT search.pos[1]>
			<cfthrow message="Invalid image name." />
		</cfif>
		
		<!--- Get the base of the image name --->
		<cfset parts.name = mid(arguments.imageName, search.pos[2], search.len[2]) />
		
		<!--- Get the extension of the image name --->
		<cfset parts.ext = mid(arguments.imageName, search.pos[3], search.len[3]) />
		
		<cfreturn parts />
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