<!-- main application -->
<cfcomponent output="false">
	<cfset this.name = "ILS Shopping" />
		<cfset this.sessionManagement = true>
			<cfset this.applicationTimeout= createtimespan(0,0,1,0)>
				<cfset this.datasource = "shop" />
<!--- import page services --->
	<cffunction name="onApplicationStart" returntype="boolean">
		<cfset application.pageService = createObject('component','Shopping.components.searchitem') />
			<!--- alldpts=dpt // searchItem=items // submitReview --->
			<cfset application.products = createObject('component','Shopping.components.pageRender') />
				<!--- saleitems = itemonsale // bestseller = bestseller // departmentitems = items // singleitem = item --->
				<cfset application.cart = createObject('component','Shopping.components.cart') />
				<!--- additem // DelItem // cartCounter = cartItems //CartTotal = total --->
	
	<cfreturn true />	
	</cffunction>
	<!-- on request start method -->
	<cffunction name="onRequestStart" returntype="boolean">
		<cfargument name="targetPage" type="string" required="true" />
			<!-- handle special url params -->
				<cfif isDefined('url.restartapp')>
  				<cfset OnApplicationStart() />
			</cfif>
		<cfreturn true />
	</cffunction>
</cfcomponent>