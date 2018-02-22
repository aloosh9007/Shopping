<!-- page rendering handlers -->
<!-- get sale events -->
<cffunction name="saleitems" access="public" returntype="query">
<cfset itemOnsale = '' />
<cfquery name="itemOnsale">
Select * from items where Onsale = 1
</cfquery>
<cfreturn itemOnsale>
</cffunction>
<!--- recomended items --->
<cffunction name="recomended" access="public" returntype="query">
<cfargument name="usersid" required="false">
<cfset items = '' />
<cfif isDefined('argumetns.usersid')>
<cfquery name="last">

</cfquery>
	<cfelse>


		</cfif>
<cfreturn items />
	</cffunction>

<!-- get best seller -->
<cffunction name="bestseller" access="public" returntype="query">
<cfset bestseller = '' />
<cfquery name="bestseller">
Select * from items where bestseller = 1
</cfquery>
<cfreturn bestseller>
</cffunction>


<!-- get items by department -->
<cffunction name="departmentitems" access="public" returntype="query">
<cfargument name="departmentid" type="numeric" required="true" />
<cfargument name="start" type="numeric" required="true" />
<cfargument name="endat" type="numeric" required="true" />
<cfset items = '' />
<cfquery name="items">
Select * from items where subdpt = '#arguments.departmentid#' LIMIT #arguments.start#, #arguments.endat#
</cfquery>
<cfreturn items>
</cffunction>
<!-- get item by name and color -->
<cffunction name="singleitemcolor" returntype="query" access="public">
<cfargument name="itemname" type="string">
<cfargument name="color" type="string">
<cfset item = ''>
<cfquery name="item">
SELECT * FROM items where itemname = '#arguments.itemname#' and color='#arguments.color#'
</cfquery>

<cfreturn item />
	</cffunction>

<!-- get item by id -->
<cffunction name="singleitem" access="public" returntype="query">
<cfargument name="itemid" type="numeric" required="true" />
<cfset item = '' />
<cfquery name="item">
Select * from items where itemid = '#arguments.itemid#'
</cfquery>
<cfreturn item>
</cffunction>