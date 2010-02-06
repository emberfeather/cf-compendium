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
		<cfif variables.total eq 0>
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
		<cfif variables.page lt variables.lastPage>
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
		<cfif variables.page gt 1>
			<cfreturn variables.page - 1 />
		</cfif>
		
		<cfreturn 1 />
	</cffunction>
	
	<!---
		Returns the starting row being displayed
	--->
	<cffunction name="getStartRow" access="public" returntype="numeric" output="false">
		<!--- If there are no rows we are nowhere --->
		<cfif variables.total eq 0>
			<cfreturn 1 />
		</cfif>
		
		<cfreturn 1 + ((variables.page - 1) * variables.numPerPage) />
	</cffunction>
	
	<cffunction name="getTotal" access="public" returntype="numeric" output="false">
		<cfreturn variables.total />
	</cffunction>
	
	<cffunction name="hasNext" access="public" returntype="boolean" output="false">
		<cfreturn variables.page lt variables.lastPage />
	</cffunction>
	
	<cffunction name="hasPrevious" access="public" returntype="boolean" output="false">
		<cfreturn variables.page gt 1 />
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
		<cfif arguments.total lt 0>
			<cfthrow message="Invalid total number of rows" detail="The total number of rows cannot be less than 0" />
		</cfif>
		
		<cfset variables.total = arguments.total />
		
		<!--- Validate numPerPage --->
		<cfif arguments.numPerPage lte 0>
			<!--- Use a default value --->
			<cfset arguments.numPerPage = 20 />
		</cfif>
		
		<cfset variables.numPerPage = arguments.numPerPage />
		
		<!--- Calculate the lastPage --->
		<!--- Can't be less than 1 --->
		<cfset variables.lastPage = max(ceiling(variables.total / variables.numPerPage), 1) />
		
		<!--- Validate page --->
		<cfif arguments.page lt 1>
			<cfset arguments.page = 1 />
		</cfif>
		
		<cfif arguments.page gt variables.lastPage>
			<cfset arguments.page = variables.lastPage />
		</cfif>
		
		<cfset variables.page = arguments.page />
	</cffunction>
	
	<!---
		Create HTMl output of the pagination
	--->
	<cffunction name="toHTML" access="public" returntype="string" output="false">
		<cfargument name="theUrl" type="component" required="true" />
		<cfargument name="queryVar" type="string" default="onPage" />
		
		<cfset var html = '' />
		<cfset var i = '' />
		<cfset var linkCount = 5 />
		<cfset var middleLink = ceiling(linkCount / 2) />
		
		<cfsavecontent variable="html">
			<cfoutput>
				<ul class="pagination">
					<li>Page: </li>
					<cfif variables.page gt middleLink>
						<cfset arguments.theUrl.setNavQuery(arguments.queryVar, 1)>
						<li><a href="#arguments.theUrl.getNavQuery()#" title="Page 1">1</a></li>
						<cfif variables.page gt middleLink + 1>
							<li>&##8230;</li><!--- Ellipis --->
						</cfif>
					</cfif>
					
					<cfloop from="#max(1, variables.page - middleLink + 1)#" to="#min(variables.lastPage, variables.page + middleLink - 1)#" index="i">
						<cfset arguments.theUrl.setNavQuery(arguments.queryVar, i)>
						<li class="<cfif i eq variables.page>selected</cfif>"><a href="#arguments.theUrl.getNavQuery()#" title="Page #i#">#i#</a></li>
					</cfloop>
					
					<cfif variables.page lt variables.lastPage - middleLink + 1>
						<cfif variables.page lt variables.lastPage - middleLink>
							<li>&##8230;</li><!--- Ellipis --->
						</cfif>
						<cfset arguments.theUrl.setNavQuery(arguments.queryVar, variables.lastPage)>
						<li><a href="#arguments.theUrl.getNavQuery()#" title="Page #variables.lastPage#">#variables.lastPage#</a></li>
					</cfif>
					
					<cfif variables.page gt 1>
						<cfset arguments.theUrl.setNavQuery(arguments.queryVar, variables.page - 1)>
						<li><a href="#arguments.theUrl.getNavQuery()#" title="Previous Page">&laquo;</a></li>
					</cfif>
					
					<cfif variables.page lt variables.lastPage>
						<cfset arguments.theUrl.setNavQuery(arguments.queryVar, variables.page + 1)>
						<li><a href="#arguments.theUrl.getNavQuery()#" title="Next Page">&raquo;</a></li>
					</cfif>
				</ul>
			</cfoutput>
		</cfsavecontent>
		
		<cfreturn html />
	</cffunction>
</cfcomponent>