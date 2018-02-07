<div>
	<cfdump var="#session#" />
		<cfif isDefined('session.shoppingCart.item')>
			<cfif structCount(session.shoppingCart.item) neq 0>
				<cfset cartItems = application.cart.cartCounter()>
					<h3>Shopping Cart has <cfoutput>#cartItems#</cfoutput> Items</h3>		
						<ul>
							<cfloop collection="#session.shoppingCart.item#" item="key">
								<cfoutput>
									<li>#session.shoppingcart.item[key].itemid#</li>
										<li>#session.shoppingcart.item[key].qty# X #session.shoppingcart.item[key].price#</li>
								<li>#session.shoppingcart.item[key].itemname# -- #session.shoppingcart.item[key].description#</li>
							<li><img src="#session.shoppingcart.item[key].itemid#" /></li>
						</cfoutput>
					</cfloop>
				</ul> 
					<h3>Your Total is: $<cfoutput>#total#</cfoutput></h3>	
			</cfif>
			<cfelse>
		Shopping Cart is Empty 
	</cfif>
</div>