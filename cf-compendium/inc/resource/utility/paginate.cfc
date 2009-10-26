<cfcomponent output="false">
	<cffunction name="init" access="public" returntype="component" output="false">
		<cfargument name="total" type="numeric" required="true" />
		<cfargument name="numPerPage" type="numeric" required="true" />
		<cfargument name="page" type="numeric" required="true" />
		
		<cfset variables.total = 0 />
		<cfset variables.numPerPage = 0 />
		<cfset variables.page = 0 />
		<cfset variables.lastPage = 0 />
		
		<!--- Set the values --->
		<cfset set(arguments.total, arguments.numPerPage, arguments.page) />
		
		<cfreturn this />
	</cffunction>
	
	<!---
		Returns the end row being showed
	--->
	<cffunction name="getEndRow" access="public" returntype="numeric" output="false">
		<!--- If there are no rows we are nowhere --->
		<cfif variables.total EQ 0>
			<cfreturn 0 />
		</cfif>
		
		<!--- return whichever is lower --->
		<cfreturn min(variables.page * variables.numPerPage, variables.total) />
	</cffunction>
	
	<!---
		Returns the first page
	--->
	<cffunction name="getFirst" access="public" returntype="numeric" output="false">
		<cfreturn 1 />
	</cffunction>
	
	<!---
		Returns the last page
	--->
	<cffunction name="getLast" access="public" returntype="numeric" output="false">
		<cfreturn variables.lastPage />
	</cffunction>
	
	<!---
		Returns the next page
	--->
	<cffunction name="getNext" access="public" returntype="numeric" output="false">
		<cfif variables.page LT variables.lastPage>
			<cfreturn variables.page + 1 />
		</cfif>
		
		<cfreturn variables.lastPage />
	</cffunction>
	
	<!---
		Returns the number per page
	--->
	<cffunction name="getNumPerPage" access="public" returntype="numeric" output="false">
		<cfreturn variables.numPerPage />
	</cffunction>
	
	<!---
		Returns the current page
	--->
	<cffunction name="getPage" access="public" returntype="numeric" output="false">
		<cfreturn variables.page />
	</cffunction>
	
	<!---
		Returns the previous page
	--->
	<cffunction name="getPrevious" access="public" returntype="numeric" output="false">
		<cfif variables.page GT 1>
			<cfreturn variables.page - 1 />
		</cfif>
		
		<cfreturn 1 />
	</cffunction>
	
	<!---
		Returns the starting row being displayed
	--->
	<cffunction name="getStartRow" access="public" returntype="numeric" output="false">
		<!--- If there are no rows we are nowhere --->
		<cfif variables.total EQ 0>
			<cfreturn 1 />
		</cfif>
		
		<cfreturn 1 + ((variables.page - 1) * variables.numPerPage) />
	</cffunction>
	
	<cffunction name="getTotal" access="public" returntype="numeric" output="false">
		<cfreturn variables.total />
	</cffunction>
	
	<cffunction name="hasNext" access="public" returntype="boolean" output="false">
		<cfreturn variables.page LT variables.lastPage />
	</cffunction>
	
	<cffunction name="hasPrevious" access="public" returntype="boolean" output="false">
		<cfreturn variables.page GT 1 />
	</cffunction>
	
	<!---
		Sets the values of the total number of rows, number of rows per page, and the current page.
		<p>
		Also calculates the last page with the given information.
	--->
	<cffunction name="set" access="public" returntype="void" output="false">
		<cfargument name="total" type="numeric" required="true" />
		<cfargument name="numPerPage" type="numeric" required="true" />
		<cfargument name="page" type="numeric" required="true" />
		
		<!--- Validate total --->
		<cfif arguments.total LT 0>
			<cfthrow message="Invalid total number of rows" detail="The total number of rows cannot be less than 0" />
		</cfif>
		
		<cfset variables.total = arguments.total />
		
		<!--- Validate numPerPage --->
		<cfif arguments.numPerPage LTE 0 OR arguments.numPerPage GT 1000>
			<!--- Use a default value --->
			<cfset arguments.numPerPage = 30 />
		</cfif>
		
		<cfset variables.numPerPage = arguments.numPerPage />
		
		<!--- Calculate the lastPage --->
		<!--- Can't be less than 1 --->
		<cfset variables.lastPage = max(ceiling(variables.total / variables.numPerPage), 1) />
		
		<!--- Validate page --->
		<cfif arguments.page LT 1>
			<cfset arguments.page = 1 />
		</cfif>
		
		<cfif arguments.page GT variables.lastPage>
			<cfset arguments.page = variables.lastPage />
		</cfif>
		
		<cfset variables.page = arguments.page />
	</cffunction>
	
	<!---
		Create HTMl output of the pagination
	--->
	<cffunction name="toHTML" access="public" returntype="string" output="false">
		<cfargument name="theURL" type="component" required="true" />
		<cfargument name="queryVar" type="string" default="onPage" />
		
		<cfset var html = '' />
		<cfset var i = '' />
		<cfset var linkCount = 5 />
		<cfset var middleLink = ceiling(linkCount / 2) />
		
		<cfsavecontent variable="html">
			<cfoutput>
				<ul class="pagination">
					<li>Page: </li>
					<cfif variables.page GT middleLink>
						<cfset arguments.theURL.setNavQuery(arguments.queryVar, 1)>
						<li><a href="#arguments.theURL.getNavQuery()#" title="Page 1">1</a></li>
						<cfif variables.page GT middleLink + 1>
							<li>&##8230;</li><!--- Ellipis --->
						</cfif>
					</cfif>
					
					<cfloop from="#max(1, variables.page - middleLink + 1)#" to="#min(variables.lastPage, variables.page + middleLink - 1)#" index="i">
						<cfset arguments.theURL.setNavQuery(arguments.queryVar, i)>
						<li class="<cfif i EQ variables.page>selected</cfif>"><a href="#arguments.theURL.getNavQuery()#" title="Page #i#">#i#</a></li>
					</cfloop>
					
					<cfif variables.page LT variables.lastPage - middleLink + 1>
						<cfif variables.page LT variables.lastPage - middleLink>
							<li>&##8230;</li><!--- Ellipis --->
						</cfif>
						<cfset arguments.theURL.setNavQuery(arguments.queryVar, variables.lastPage)>
						<li><a href="#arguments.theURL.getNavQuery()#" title="Page #variables.lastPage#">#variables.lastPage#</a></li>
					</cfif>
					
					<cfif variables.page GT 1>
						<cfset arguments.theURL.setNavQuery(arguments.queryVar, variables.page - 1)>
						<li><a href="#arguments.theURL.getNavQuery()#" title="Previous Page">&laquo;</a></li>
					</cfif>
					
					<cfif variables.page LT variables.lastPage>
						<cfset arguments.theURL.setNavQuery(arguments.queryVar, variables.page + 1)>
						<li><a href="#arguments.theURL.getNavQuery()#" title="Next Page">&raquo;</a></li>
					</cfif>
				</ul>
			</cfoutput>
		</cfsavecontent>
		
		<cfreturn html />
	</cffunction>
</cfcomponent>