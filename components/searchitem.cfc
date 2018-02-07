<!-- this cfc will render to home page only -->
<cfcomponent output="false">

<!-- all department function -->
<cffunction name="alldpts" returntype="query">
	<cfset var dpt= '' />
	<cfquery name="dpt">
	select * from department
	</cfquery>
	<cfreturn dpt>
</cffunction>

<!-- item search function -->
<cffunction name="searchItem" returntype="query">
	<cfargument name="itemname" type="string" rquired="true">
	<cfset var items= '' />
	
	<cfquery name="items">
	select * from items where itemname like '#arguments.itemname#%'
	</cfquery>
	<cfreturn items>
</cffunction>

<!-- submit review function -->

<cffunction name="submitReview" returntype="void">
	<cfargument name="itemid" type="numeric" required="true">
		<cfargument name="Rname" type="string" required="true">
			<cfargument name="email" type="string" required="true">
				<cfargument name="rating" type="numeric" required="true">
					<cfargument name="review" type="string" required="true">


<cfquery name="newrating">
	INSERT INTO reviews (name, email, rating, review, itemid, created)
			values ('#arguments.Rname#','#arguments.email#', '#arguments.rating#' ,'#arguments.review#', '#arguments.itemid#', '#DateTimeFormat(now(), "yyyy-MM-dd  HH:nn:ss ")# ')
				</cfquery>
<cfquery name="getreviews">
	select AVG(rating) as avgrating from reviews  
		</cfquery>
	<cfquery name="setrating">
		UPDATE items SET rating = '#getreviews.avgrating#'
		where itemid = '#arguments.itemid#'
			</cfquery>
</cffunction>
</cfcomponent>