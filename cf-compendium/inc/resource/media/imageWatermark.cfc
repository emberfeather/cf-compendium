<cfcomponent extends="cf-compendium.inc.resource.base.image" output="false">
	<cffunction name="init" access="public" returntype="any" output="false">
		<cfset variables.watermark = { image = '', width = 0, height = 0 } />
		
		<cfreturn this />
	</cffunction>
	
	<cffunction name="applyWatermark" access="public" returntype="any" output="false">
		<cfargument name="imagePath" type="string" required="true" />
		<cfargument name="imageName" type="string" required="true" />
		<cfargument name="quadrant" type="numeric" default="4" hint="Cartesian Coordinate System" />
		<cfargument name="offsetX" type="numeric" default="0" />
		<cfargument name="offsetY" type="numeric" default="0" />
		
		<cfset var modded = '' />
		<cfset var newImage = '' />
		<cfset var x = 0 />
		<cfset var y = 0 />
		<cfset var width = 0 />
		<cfset var height = 0 />
		<cfset var parts = '' />
		
		<cfif NOT isImage(variables.watermark.image)>
			<cfthrow message="Missing watermark image" detail="Please set the watermark image before applying a watermark." />
		</cfif>
		
		<!--- Get the parts of the image name --->
		<cfset parts = explodeImageName(arguments.imageName) />
		
		<cfset newImage = imageRead(arguments.imagePath & arguments.imageName) />
		<cfset imageSetAntialiasing(newImage) />
		
		<cfset width = newImage.getWidth() />
		<cfset height = newImage.getHeight() />
		
		<cfif width + arguments.offsetX LT variables.watermark.width>
			<cfthrow message="Image size is smaller than watermark" detail="The width of the watermark (#variables.watermark.width#) is greater than the width of the image (#width#) with a #arguments.offsetX# offset." />
		</cfif>
		
		<cfif height + arguments.offsetY LT variables.watermark.height>
			<cfthrow message="Image size is smaller than watermark" detail="The height of the watermark (#variables.watermark.height#) is greater than the height of the image (#height#) with a #arguments.offsetY# offset." />
		</cfif>
		
		<cfswitch expression="#arguments.quadrant#">
			<cfcase value="1">
				<cfset x = width - variables.watermark.width - arguments.offsetX />
				<cfset y = arguments.offsetY />
			</cfcase>
			
			<cfcase value="3">
				<cfset x = arguments.offsetX />
				<cfset y = height - variables.watermark.height - arguments.offsetY />
			</cfcase>
			
			<cfcase value="4">
				<cfset x = width - variables.watermark.width - arguments.offsetX />
				<cfset y = height - variables.watermark.height - arguments.offsetY />
			</cfcase>
			
			<cfdefaultcase>
				<cfset x = arguments.offsetX />
				<cfset y = arguments.offsetY />
			</cfdefaultcase>
		</cfswitch>
		
		<cfset imagePaste(newImage, variables.watermark.image, x, y) />
		
		<!--- Get the modified dimensions --->
		<cfset modded = {
				width = newImage.getWidth(),
				height = newImage.getHeight(),
				filename = parts.name & '-wm' & parts.ext
			} />
		
		<!--- Save the modified file --->
		<cfset imageWrite(newImage, arguments.imagePath & modded.filename) />
		
		<cfreturn modded />
	</cffunction>
	
	<cffunction name="setWatermark" access="public" returntype="void" output="false">
		<cfargument name="imagePath" type="string" required="true" />
		
		<cfset variables.watermark.image = imageRead(arguments.imagePath) />
		<cfset variables.watermark.width = variables.watermark.image.getWidth() />
		<cfset variables.watermark.height = variables.watermark.image.getHeight() />
	</cffunction>
</cfcomponent>