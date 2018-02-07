<!-- cart add items -->
<cfcomponent output="false">

<!--- add item function --->
<cffunction name="additem" returntype="any">
	<cfargument name="itemid" type="numeric">
		<cfargument name="qty" type="numeric">
			<cfargument name="price" type="numeric">
				<cfquery name="itemq">
					SELECT * FROM Items where itemid = '#arguments.itemid#'
						</cfquery>

	<cfif structKeyExists(session.shoppingcart.item, '#arguments.itemid#')>
		<cfset session.shoppingCart.item[#arguments.itemid#].qty = #session.shoppingCart.item[#arguments.itemid#].qty# + #arguments.qty#  />
			<cfelse>
				<cfset session.shoppingcart.item[#arguments.itemid#] = {itemid = #arguments.itemid#, qty = #arguments.qty#, price = #arguments.price#, img = #itemq.cartimg#, itemname = #itemq.itemname#, description = #itemq.shortdescription# } />
						</cfif>
</cffunction>

<!--- Delete item function --->
	<cffunction name="DelItem" returntype="any" access="remote">
		<cfargument name="itemid">
<cfset StructDelete(Session.shoppingcart.item, '#arguments.itemid#')> 
	</cffunction>

<!--- Struct Counter aka Cart Items --->
	<cffunction name="cartCounter" returntype="numeric">
		<cfset cartItems = "">
			<cfset cartItems = structCount(session.shoppingCart.item) />
		<cfreturn cartItems>
	</cffunction>
<!-- none session cart total -->
	<cffunction name="CartTotal" returntype="any">
		<cfset total = 0>
<cfloop collection="#session.shoppingCart.item#" item="key">
			<cfset total = total + (#session.shoppingcart.item[key].price# * #session.shoppingcart.item[key].qty#) >
		</cfloop>
<cfreturn total>
	</cffunction>

</cfcomponent>