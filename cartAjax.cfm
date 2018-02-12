<!-- cart ajax -->
<cfif isDefined('url.additem')>
	<cfset application.cart.additem(#url.itemid#, #url.qty#, #url.price#)>
		<cfelseif isDefined('url.delitem')>
			<cfset application.cart.Delitem(#url.itemid#)>
				<cfelse>
					</cfif>
						<cfset total = application.cart.cartTotal()>
 <body>
<div>
		<cfif isDefined('session.shoppingCart.item')>
			<cfif structCount(session.shoppingCart.item) neq 0>
				<cfset cartItems = application.cart.cartCounter()>
						<li class="header-cart dropdown default-dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
								<div class="header-btns-icon">
									<i class="fa fa-shopping-cart"></i>
									<span class="qty"><cfoutput>#cartItems#</cfoutput></span>
								</div>
								<strong class="text-uppercase">My Cart:</strong>
								<br>
								<span>$<cfoutput>#total#</cfoutput></span>
							</a>
							<div class="custom-menu">
								<div id="shopping-cart">
									<div class="shopping-cart-list">
										<!-- widget loop start -->
										<cfset counter = 1>
							<cfloop collection="#session.shoppingCart.item#" item="key">
								<cfoutput>
										<div class="product product-widget" id="widget#counter#">
											<div class="product-thumb">
												<cfif #session.shoppingcart.item[key].img# eq "">
												<img src="./img/thumb-product01.jpg" alt="">
											<cfelse>
											<img src="#session.shoppingcart.item[key].img#" alt="">
											</cfif>
											</div>
											<div class="product-body">
												<h3 class="product-price">$#session.shoppingcart.item[key].price# <span class="qty">x<li>#session.shoppingcart.item[key].qty#</span></h3>
												<h2 class="product-name"><a href="product-detail.cfm?itemid=#session.shoppingcart.item[key].itemid#">
												#session.shoppingcart.item[key].itemname# -- #session.shoppingcart.item[key].description#</a></h2>
											</div>
											<button class="cancel-btn" onclick="delnew(#session.shoppingcart.item[key].itemid#, #counter#)"><i class="fa fa-trash" ></i></button>
										</div>
									</cfoutput>
									<cfset counter++>
									</cfloop><!-- /widget loop end -->
									</div>
									<div class="shopping-cart-btns">
										<a href="cart.cfm"><button class="main-btn">View Cart</button></a>
								<a href="Checkout.cfm"><button class="primary-btn">Checkout <i class="fa fa-arrow-circle-right"></i></button></a>
									</div>
								</div>
							</div>
</li>
<cfelse>


			</cfif>
			<cfelse><!-- else if cart is empty -->


						<!-- Cart -->
						<li class="header-cart dropdown default-dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
								<div class="header-btns-icon">
									<i class="fa fa-shopping-cart"></i>
									<span class="qty">0</span>
								</div>
								<strong class="text-uppercase">My Cart:</strong>
								<br>
								<span>$0</span>
							</a>
							<div class="custom-menu">
								<div id="shopping-cart">
									<div class="shopping-cart-list">
										<div class="product product-widget">
											<div class="product-thumb">
												<img src="./img/thumb-product01.jpg" alt="">
											</div>
											<div class="product-body">
												<h3 class="product-price">$0 <span class="qty">x0</span></h3>
												<h2 class="product-name"><a href="#">Shopping Cart is Empty</a></h2>
											</div>
											<button class="cancel-btn"><i class="fa fa-trash"></i></button>
										</div>
									</div>
									<div class="shopping-cart-btns">
										<button class="main-btn">View Cart</button>
									<a href="Checkout.cfm">	<button class="primary-btn">Checkout <i class="fa fa-arrow-circle-right"></i></button></a>
									</div>
								</div>
							</div>
</li>
						<!-- /Cart -->

	</cfif>
</div>
</body>