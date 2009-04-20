<h1>Image Resize Examples</h1>

<cfset theObject = createObject('component', 'cf-compendium.inc.resource.media.imageResize').init() />

<h2>Original Image</h2>

<cfset imagePath = '/implementation/img/' />
<cfset imageExpPath = expandPath(imagePath) />
<cfset baseName = 'testImg001' />
<cfset baseExt = '.jpg' />
<cfset imageName = baseName & baseExt />

<div>
	<cfoutput>
		<img src="#imagePath##imageName#">
	</cfoutput>
</div>

<h2>Scaled Thumbnail</h2>

<cfset resolutions = [
		{
			maxWidth: 200,
			maxHeight: 200
		}
	] />

<cfset modified = theObject.scaleImage(imageExpPath, imageName, resolutions) />

<cfloop array="#modified#" index="i">
	<div>
		<cfoutput>
			<img src="#imagePath##i.filename#">
		</cfoutput>
	</div>
</cfloop>

<h2>Resized Thumbnail</h2>

<cfset resolutions = [
		{
			width: 200,
			height: 200
		}
	] />

<cfset modified = theObject.resizeImage(imageExpPath, imageName, resolutions) />

<cfloop array="#modified#" index="i">
	<div>
		<cfoutput>
			<img src="#imagePath##i.filename#">
		</cfoutput>
	</div>
</cfloop>

<!--- 
<h2>Clipped Thumbnail</h2>

<cfset resolutions = [
		{
			width: 250,
			height: 250
		}
	] />

<cfset modified = theObject.clipImage(imageExpPath, imageName, resolutions, -1, -1, 900, 900) />

<cfloop array="#modified#" index="i">
	<div>
		<cfoutput>
			<img src="#imagePath##i.filename#">
		</cfoutput>
	</div>
</cfloop>
 --->

<h2>Clipped Auto Thumbnail</h2>

<cfset resolutions = [
		{
			width: 300,
			height: 300
		}
	] />

<cfset modified = theObject.clipImage(imageExpPath, imageName, resolutions, 200, 200, -1, -1) />

<cfloop array="#modified#" index="i">
	<div>
		<cfoutput>
			<img src="#imagePath##i.filename#">
		</cfoutput>
	</div>
</cfloop>

<h2>the object</h2>

<cfdump var="#theObject#" />