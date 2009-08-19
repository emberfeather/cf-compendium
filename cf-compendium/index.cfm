<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		
		<title>cf-compendium</title>
	</head>
	<body>
		<h1>cf-compendium</h1>
		
		<cftry>
			<!--- Test a component creation to verify it is installed correctly --->
			<cfset createObject('component', 'cf-compendium.inc.resource.base.base') />
			
			<h2>Congratulations!</h2>
			
			<p>
				cf-compendium appears to be up and working correctly!
			</p>
			
			<cfcatch type="any">
				<h2>Oops!</h2>
				
				<p>
					<strong>
						cf-compendium does not appear to be installed correctly.
						Please ensure that a mapping has been created for '/cf-compendium'
						and is pointing to this directory!
					</strong>
				</p>
			</cfcatch>
		</cftry>
	</body>
</html>