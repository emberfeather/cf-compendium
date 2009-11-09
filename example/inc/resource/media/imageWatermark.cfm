<h1>Image Resize Examples</h1>

<blockquote>
	<code>
		resizer = createObject('component', 'cf-compendium.inc.resource.media.imageResize').init()<br />
		watermarker = createObject('component', 'cf-compendium.inc.resource.media.imageWatermark').init()
	</code>
</blockquote>

<cfset resizer = createObject('component', 'cf-compendium.inc.resource.media.imageResize').init() />
<cfset watermarker = createObject('component', 'cf-compendium.inc.resource.media.imageWatermark').init() />

<h2>Original Image</h2>

<cfset imageRelation = '..' />
<cfset imagePath = '/implementation/img/' />
<cfset imageExpPath = expandPath(imagePath) />
<cfset baseName = 'testImg001' />
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
					maxWidth = 400,
					maxHeight = 400
				}
			]<br />
		
		modified = resizer.scaleImage(imageExpPath, imageName, resolutions)
	</code>
</blockquote>

<cfset resolutions = [
		{
			maxWidth = 400,
			maxHeight = 400
		}
	] />

<cfset modified = resizer.scaleImage(imageExpPath, imageName, resolutions) />

<cfdump var="#modified#" label="modified" />

<cfloop array="#modified#" index="i">
	<div>
		<cfoutput>
			<img src="#imageRelation##imagePath##i.filename#">
		</cfoutput>
	</div>
</cfloop>

<h2>Original Watermark</h2>

<cfset imageName = 'watermark.png' />

<p>
	<cfoutput>
		<img src="#imageRelation##imagePath##imageName#" title="Original watermark..." />
	</cfoutput>
</p>

<blockquote>
	<code>
		imageName = 'watermark.png'<br />
		watermarker.setWatermark(imageExpPath & imageName)
	</code>
</blockquote>

<cfset watermarker.setWatermark(imageExpPath & imageName) />

<h2>Watermarked Thumbnail</h2>

<blockquote>
	<code>
		watermarked = watermarker.applyWatermark(imageExpPath, modified[1].filename, 3, 35, 35)
	</code>
</blockquote>

<cfset watermarked = watermarker.applyWatermark(imageExpPath, modified[1].filename, 3, 35, 35) />

<p>
	<cfoutput>
		<img src="#imageRelation##imagePath##watermarked.filename#" title="Watermarked image..." />
	</cfoutput>
</p>

<h2>The Object</h2>

<cfdump var="#watermarker#" />