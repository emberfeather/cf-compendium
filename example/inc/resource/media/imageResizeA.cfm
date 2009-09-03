<h1>Image Resize Examples</h1>

<cfset theObject = createObject('component', 'cf-compendium.inc.resource.media.imageResize').init() />

<h2>Original Image</h2>

<cfset imageRelation = '..' />
<cfset imagePath = '/implementation/img/' />
<cfset imageExpPath = expandPath(imagePath) />
<cfset baseName = 'testImg002' />
<cfset baseExt = '.jpg' />
<cfset imageName = baseName & baseExt />

<p>
	<cfoutput>
		<a href="#imageRelation##imagePath##imageName#">Original image...</a>
	</cfoutput>
</p>

<h2>Scaled Thumbnail</h2>

<blockquote>
	<code>
		resolutions = [
				{
					maxWidth: 200,
					maxHeight: 200
				}
			]<br />
		
		modified = theObject.scaleImage(imageExpPath, imageName, resolutions)
	</code>
</blockquote>

<cfset resolutions = [
		{
			maxWidth: 200,
			maxHeight: 200
		}
	] />

<cfset modified = theObject.scaleImage(imageExpPath, imageName, resolutions) />

<cfdump var="#modified#" label="modified" />

<cfloop array="#modified#" index="i">
	<div>
		<cfoutput>
			<img src="#imageRelation##imagePath##i.filename#">
		</cfoutput>
	</div>
</cfloop>

<h2>Resized Thumbnail</h2>

<blockquote>
	<code>
		resolutions = [
				{
					width: 200,
					height: 200
				}
			]<br />
		
		modified = theObject.resizeImage(imageExpPath, imageName, resolutions)
	</code>
</blockquote>

<cfset resolutions = [
		{
			width: 200,
			height: 200
		}
	] />

<cfset modified = theObject.resizeImage(imageExpPath, imageName, resolutions) />

<cfdump var="#modified#" label="modified" />

<cfloop array="#modified#" index="i">
	<div>
		<cfoutput>
			<img src="#imageRelation##imagePath##i.filename#">
		</cfoutput>
	</div>
</cfloop>

<!---
<h2>Clipped Thumbnail</h2>

<blockquote>
	<code>
	resolutions = [
			{
				width: 250,
				height: 250
			}
		]<br />
	
	modified = theObject.clipImage(imageExpPath, imageName, resolutions, -1, -1, 900, 900)
	</code>
</blockquote>

<cfset resolutions = [
		{
			width: 250,
			height: 250
		}
	] />

<cfset modified = theObject.clipImage(imageExpPath, imageName, resolutions, -1, -1, 900, 900) />

<cfdump var="#modified#" label="modified" />

<cfloop array="#modified#" index="i">
	<div>
		<cfoutput>
			<img src="#imagePath##i.filename#">
		</cfoutput>
	</div>
</cfloop>
--->

<h2>Clipped Auto Thumbnail</h2>

<blockquote>
	<code>
		resolutions = [
				{
					width: 300,
					height: 300
				}
			]<br />
		
		modified = theObject.clipImage(imageExpPath, imageName, resolutions, 200, 200, -1, -1)
	</code>
</blockquote>

<cfset resolutions = [
		{
			width: 300,
			height: 300
		}
	] />

<cfset modified = theObject.clipImage(imageExpPath, imageName, resolutions, 200, 200, -1, -1) />

<cfdump var="#modified#" label="modified" />

<cfloop array="#modified#" index="i">
	<div>
		<cfoutput>
			<img src="#imageRelation##imagePath##i.filename#">
		</cfoutput>
	</div>
</cfloop>

<h2>The Object</h2>

<cfdump var="#theObject#" />