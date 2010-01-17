<cfcomponent extends="mxunit.framework.TestCase" output="false">
	<cffunction name="setup" access="public" returntype="void" output="false">
		<!--- TODO Convert to script based when savecontent works correctly/consistently --->
		<cfsavecontent variable="variables.xrds">
			<cfoutput>
				<xrds:XRDS xmlns:xrds="xri://$xrds" xmlns="xri://$xrd*($v*2.0)"
					xmlns:openid="http://openid.net/xmlns/1.0">
					<xrd>
						<Service priority="50">
							<Type>http://openid.net/signon/1.0</Type>
							<URI>http://www.myopenid.com/server</URI>
							<openid:Delegate>http://smoker.myopenid.com/</openid:Delegate>
						</Service>
						<Service priority="10">
							<Type>http://openid.net/signon/1.0</Type>
							<URI priority="15">http://resolve2.example.com</URI>
							<URI priority="10">http://resolve.example.com</URI>
							<URI>https://resolve.example.com</URI>
							<openid:Delegate>http://www.livejournal.com/users/frank/</openid:Delegate>
						</Service>
						<Service priority="20">
							<Type>http://lid.netmesh.org/sso/2.0</Type>
							<URI>http://mylid.net/liddemouser</URI>
						</Service>
						<Service>
							<Type>http://lid.netmesh.org/sso/1.0</Type>
						</Service>
					</xrd>
				</xrds:XRDS>
			</cfoutput>
		</cfsavecontent>
		
		<cfset variables.xrds = xmlParse(variables.xrds) />
	</cffunction>
	
	<cfscript>
		/**
		 * Tests whether the descriptor url can be found if the content attribute is first
		 */
		public void function testFindMetaDescriptorContentFirst() {
			var metaTag = '';
			var yadis = createObject('component', 'cf-compendium.inc.resource.communication.yadis').init();
			
			makePublic(yadis, 'findMetaDescriptor');
			
			metaTag = '<meta content="http://example.com/yadis.xml" http-equiv="X-XRDS-Location">';
			
			assertEquals('http://example.com/yadis.xml', yadis.findMetaDescriptor(metaTag));
		}
		
		/**
		 * Tests whether the descriptor url can be found if the http-equiv attribute is first
		 */
		public void function testFindMetaDescriptorHttpEquivFirst() {
			var metaTag = '';
			var yadis = createObject('component', 'cf-compendium.inc.resource.communication.yadis').init();
			
			makePublic(yadis, 'findMetaDescriptor');
			
			metaTag = '<meta http-equiv="X-XRDS-Location" content="http://example.com/yadis.xml">';
			
			assertEquals('http://example.com/yadis.xml', yadis.findMetaDescriptor(metaTag));
		}
		
		/**
		 * Tests if the get services and sorting of uri elements based upon priority works
		 */
		public void function testGetServices() {
			var services = '';
			var yadis = createObject('component', 'cf-compendium.inc.resource.communication.yadis').init();
			
			services = yadis.getServices( variables.xrds );
			
			// TODO this ordering is incorrect, needs to have the correct URI ordering
			assertEquals('http://openid.net/signon/1.0', services[1].xmlChildren[1].xmlText);
			assertEquals('http://resolve.example.com', services[1].URI[2].xmlText);
			assertEquals('http://resolve2.example.com', services[1].URI[1].xmlText);
			assertEquals('https://resolve.example.com', services[1].URI[3].xmlText);
		}
		
		/**
		 * Tests if the sorting of xml elements based upon priority works
		 */
		public void function testSort() {
			var sorted = '';
			var yadis = createObject('component', 'cf-compendium.inc.resource.communication.yadis').init();
			
			makePublic(yadis, 'xmlPrioritySort');
			
			sorted = yadis.xmlPrioritySort( variables.xrds, 'Service' );
			
			assertEquals('http://openid.net/signon/1.0', sorted[1].xmlChildren[1].xmlText);
			assertEquals('http://lid.netmesh.org/sso/2.0', sorted[2].xmlChildren[1].xmlText);
			assertEquals('http://openid.net/signon/1.0', sorted[3].xmlChildren[1].xmlText);
			assertEquals('http://lid.netmesh.org/sso/1.0', sorted[4].xmlChildren[1].xmlText);
		}
	</cfscript>
</cfcomponent>