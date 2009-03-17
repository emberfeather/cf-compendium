<cfcomponent output="false">
	<cffunction name="init" access="public" returntype="any" output="false">
		<cfset variables.watermark = { image = '', width = 0, height = 0 } />
		
		<cfreturn this />
	</cffunction>
	
	<cffunction name="applyWatermark" access="public" returntype="any" output="false">
		<cfargument name="imagePath" type="string" required="true" />
		<cfargument name="quadrant" type="numeric" default="4" hint="Cartesian Coordinate System" />
		<cfargument name="offsetX" type="numeric" default="0" />
		<cfargument name="offsetY" type="numeric" default="0" />
		
		<cfset var newImage = '' />
		<cfset var x = 0 />
		<cfset var y = 0 />
		<cfset var width = 0 />
		<cfset var height = 0 />
		
		<cfif NOT isImage(variables.watermark.image)>
			<cfthrow message="Missing watermark image" detail="Please set the watermark image before applying a watermark." />
		</cfif>
		
		<cfset newImage = imageRead(arguments.imagePath) />
		<cfset imageSetAntialiasing(newImage) />
		
		<cfset width = newImage.getWidth() + arguments.offsetX />
		<cfset height = newImage.getHeight() + arguments.offsetY />
		
		<cfif width LT variables.watermark.width>
			<cfthrow message="Image size is smaller than watermark" detail="The width of the watermark (#variables.watermark.width#) is greater than the width of the image (#width#) with a #arguments.offsetX# offset." />
		</cfif>
		
		<cfif height LT variables.watermark.height>
			<cfthrow message="Image size is smaller than watermark" detail="The height of the watermark (#variables.watermark.height#) is greater than the height of the image (#height#) with a #arguments.offsetY# offset." />
		</cfif>
		
		<cfswitch expression="#arguments.quadrant#">
			<cfcase value="1">
				<cfset x = width - variables.watermark.width />
				<cfset y = arguments.offsetY />
			</cfcase>
			<cfcase value="3">
				<cfset x = arguments.offsetX />
				<cfset y = height - variables.watermark.height />
			</cfcase>
			<cfcase value="4">
				<cfset x = width - variables.watermark.width />
				<cfset y = height - variables.watermark.height />
			</cfcase>
			<cfdefaultcase>
				<cfset x = arguments.offsetX />
				<cfset y = arguments.offsetY />
			</cfdefaultcase>
		</cfswitch>
		
		<cfset imagePaste(newImage, variables.watermark, x, y) />
		
		<cfreturn newImage />
	</cffunction>
	
	<cffunction name="setWatermark" access="public" returntype="void" output="false">
		<cfargument name="imagePath" type="string" required="true" />
		
		<cfset variables.watermark.image = imageRead(arguments.imagePath) />
		<cfset variables.watermark.width = variables.watermark.image.getWidth() />
		<cfset variables.watermark.height = variables.watermark.image.getHeight() />
	</cffunction>
</cfcomponent>