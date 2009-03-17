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
	<cffunction name="clipImage" access="public" returntype="void" output="false">
		<cfargument name="imagePath" type="string" required="true" />
		<cfargument name="resolutions" type="array" required="true" />
		<cfargument name="x" type="numeric" default="-1" />
		<cfargument name="y" type="numeric" default="-1" />
		<cfargument name="width" type="numeric" default="100" />
		<cfargument name="height" type="numeric" default="100" />
		
		<cfset var original = '' />
		<cfset var clipped = '' />
		<cfset var modified = '' />
		<cfset var width = '' />
		<cfset var height = '' />
		<cfset var i = '' />
		
		<cfset original = imageRead(arguments.imagePath) />
		
		<cfset width = original.getWidth() />
		<cfset height = original.getHeight() />
		
		<cfif arguments.x LT 0>
			<cfset arguments.x = ceiling((width - arguments.width) / 2) />
		</cfif>
		
		<cfif arguments.y LT 0>
			<cfset arguments.y = ceiling((height - arguments.height) / 2) />
		</cfif>
		
		<cfif arguments.x LT 0 OR width - arguments.x LT arguments.width>
			<cfthrow message="Image size is smaller than resize" detail="The width of the resize (#arguments.width#) is greater than the width of the image (#width#) with a #arguments.x# starting position." />
		</cfif>
		
		<cfif arguments.y LT 0 OR height - arguments.y LT arguments.height>
			<cfthrow message="Image size is smaller than resize" detail="The height of the resize (#arguments.height#) is greater than the height of the image (#height#) with a #arguments.y# starting position." />
		</cfif>
		
		<cfset clipped = imageCopy(original, arguments.x, arguments.y, arguments.width, arguments.height />
		
		<cfloop array="#arguments.resolutions#" index="i">
			<cfset modified = duplicate(clipped) />
			
			<cfset imageResize(modified, i.width, i.height, 'highestQuality' />
			
			<!--- TODO save the modified image to the same location as the original but with dimensions appended --->
		</cfloop>
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
	<cffunction name="resizeImage" access="public" returntype="void" output="false">
		<cfargument name="imagePath" type="string" required="true" />
		<cfargument name="resolutions" type="array" required="true" />
		
		<cfset var original = '' />
		<cfset var modified = '' />
		<cfset var width = '' />
		<cfset var height = '' />
		<cfset var i = '' />
		
		<cfset original = imageRead(arguments.imagePath) />
		
		<cfset width = original.getWidth() />
		<cfset height = original.getHeight() />
		
		<cfloop array="#arguments.resolutions#" index="i">
			<cfset modified = duplicate(original) />
			
			<cfset imageResize(modified, i.width, i.height, 'highestQuality' />
			
			<!--- TODO save the modified image to the same location as the original but with dimensions appended --->
		</cfloop>
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
	<cffunction name="scaleImage" access="public" returntype="void" output="false">
		<cfargument name="imagePath" type="string" required="true" />
		<cfargument name="resolutions" type="array" required="true" />
		
		<cfset var original = '' />
		<cfset var modified = '' />
		<cfset var width = '' />
		<cfset var height = '' />
		<cfset var i = '' />
		
		<cfset original = imageRead(arguments.imagePath) />
		
		<cfloop array="#arguments.resolutions#" index="i">
			<cfset modified = duplicate(original) />
			
			<cfset imageScaleToFit(modified, i.maxWidth, i.maxHeight, 'highestQuality' />
			
			<cfset width = modified.getWidth() />
			<cfset height = modified.getHeight() />
			
			<!--- TODO save the modified image to the same location as the original but with dimensions appended --->
		</cfloop>
	</cffunction>
</cfcomponent>