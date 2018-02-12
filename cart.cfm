<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

	<title>E-SHOP HTML Template</title>

	<!-- Google font -->
	<link href="https://fonts.googleapis.com/css?family=Hind:400,700" rel="stylesheet">

	<!-- Bootstrap -->
	<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />

	<!-- Slick -->
	<link type="text/css" rel="stylesheet" href="css/slick.css" />
	<link type="text/css" rel="stylesheet" href="css/slick-theme.css" />

	<!-- nouislider -->
	<link type="text/css" rel="stylesheet" href="css/nouislider.min.css" />

	<!-- Font Awesome Icon -->
	<link rel="stylesheet" href="css/font-awesome.min.css">

	<!-- Custom stlylesheet -->
	<link type="text/css" rel="stylesheet" href="css/style.css" />
	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
		<script>
function delitem(itemid, counter){

$.ajax({url: "components/cart.cfc?method=DelItem&itemid="+itemid});
	delbar();
		$("#t"+counter).fadeOut("slow");
setTimeout(refreshNew, 1000);
}
</script>
<script>
function updateqty(counter, r){
	var qty = document.getElementById('qty'+counter).value;
$.ajax({url: "components/cart.cfc?method=updateqty&itemid="+r+"&qty="+qty});
addedbar();
setTimeout(refreshNew, 1000);


}
function refreshNew(){
$.ajax({url: "tablefooter.cfm", success:function(content){
$('#tfooter').html(content);
}});
}
		</script>

</head>

<body>
<cfinclude template="header.cfm">
	<!-- /NAVIGATION -->

	<!-- BREADCRUMB -->
	<div id="breadcrumb">
		<div class="container">
			<ul class="breadcrumb">
				<li><a href="#">Home</a></li>
				<li class="active">Checkout</li>
			</ul>
		</div>
	</div>
		<cfif isDefined('session.shoppingCart.item')>
			<cfif structCount(session.shoppingCart.item) neq 0>
				<cfset cartItems = application.cart.cartCounter()>

					<div class="col-md-12" id="div1-wrapper">
						<div class="order-summary clearfix">
							<div class="section-title">
								<h3 class="title">Order Review</h3>
							</div>
							<table class="shopping-cart-table table">
								<thead>
									<tr>
										<th>Product</th>
										<th></th>
										<th class="text-center">Price</th>
										<th class="text-center">Quantity</th>
										<th class="text-center">Total</th>
										<th class="text-right"></th>
										<th class="text-right"></th>
									</tr>
								</thead>
								<tbody>
<!-- item list starts here -->
										<cfset counter = 1>
							<cfloop collection="#session.shoppingCart.item#" item="key">
								<cfoutput>
									<tr id="t#counter#">
										<td class="thumb"><img src="#session.shoppingcart.item[key].img#" alt=""></td>
										<td class="details">
											<a href="Product-page.cfm?itemid=#session.shoppingcart.item[key].itemid#">
											#session.shoppingcart.item[key].itemname# #session.shoppingcart.item[key].description#</a>
											<ul>
													<li><span>Size: XL</span></li>
													<li><span>Color: Camelot</span></li>
											</ul>
										</td>
										<td class="price text-center"><strong>$#session.shoppingcart.item[key].price#</strong><br><del class="font-weak">
											<small>$#session.shoppingcart.item[key].price#</small></del></td>
										<td class="qty text-center"><input class="input" name="qty" id="qty#counter#" 
										 type="number" value="#session.shoppingcart.item[key].qty#"></td>
										<td class="total text-center"><strong class="primary-color">
										$#(session.shoppingcart.item[key].qty * session.shoppingcart.item[key].price)#
									</strong></td>
								<td class="text-right"><button 
								 class="main-btn icon-btn"  onclick="delitem(#session.shoppingcart.item[key].itemid#, #counter#)">
											<i class="fa fa-close"></i></button></td>


											<td class="text-right"><button 
								 class="main-btn icon-btn"  onclick="updateqty(#counter#, #session.shoppingcart.item[key].itemid#)">
											<i class="fa fa-refresh"></i></button></td>


									</tr>
<!-- /item list here -->
									</cfoutput>
									<cfset counter++>
									</cfloop>

								</tbody>
								<cfset total = application.cart.cartTotal() />
								<tfoot id="tfooter">
									<tr>
										<th class="empty" colspan="3"></th>
										<th>SUBTOTAL</th>
										<th colspan="2" class="sub-total"><cfoutput>$#total#</cfoutput></th>
									</tr>
									<tr>
										<th class="empty" colspan="3"></th>
										<th>SHIPING</th>
										<td colspan="2">Free Shipping</td>
									</tr>
									<tr>
										<th class="empty" colspan="3"></th>
										<th>TAX</th>
										<td colspan="2">%8.7</td>
									</tr>
									<tr>
										<th class="empty" colspan="3"></th>
										<th>TOTAL</th>
											<cfset final = round(total * 1.087) & .00 />
										<th colspan="2" class="total"><cfoutput>$#final#</cfoutput></th>
									</tr>
								</tfoot>
							</table>
							<div class="pull-right">

<a href="checkout.cfm"><button class="primary-btn">Proceed to Checkout</button></a>
							</div>
						</div>

					</div>
				<cfelse>
								<div class="col-md-12">
						<div class="order-summary clearfix">
							<div class="section-title">
<h4> Cart is empty</h4>
</div></div></div>
</cfif>
				<cfelse>
								<div class="col-md-12">
						<div class="order-summary clearfix">
							<div class="section-title">
<h4> Cart is empty</h4>
</div></div></div>
				</cfif>

			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /section -->
<div id="snackbardel">Item removed!</div>
<div id="snackbaradd">Quantity Added!</div>
	<div>-</div>
	<!-- FOOTER -->
	<footer id="footer" class="section section-grey">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<!-- footer widget -->
				<div class="col-md-3 col-sm-6 col-xs-6">
					<div class="footer">
						<!-- footer logo -->
						<div class="footer-logo">
							<a class="logo" href="#">
		            <img src="./img/logo.png" alt="">
		          </a>
						</div>
						<!-- /footer logo -->

						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna</p>

						<!-- footer social -->
						<ul class="footer-social">
							<li><a href="#"><i class="fa fa-facebook"></i></a></li>
							<li><a href="#"><i class="fa fa-twitter"></i></a></li>
							<li><a href="#"><i class="fa fa-instagram"></i></a></li>
							<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
							<li><a href="#"><i class="fa fa-pinterest"></i></a></li>
						</ul>
						<!-- /footer social -->
					</div>
				</div>
				<!-- /footer widget -->

				<!-- footer widget -->
				<div class="col-md-3 col-sm-6 col-xs-6">
					<div class="footer">
						<h3 class="footer-header">My Account</h3>
						<ul class="list-links">
							<li><a href="#">My Account</a></li>
							<li><a href="#">My Wishlist</a></li>
							<li><a href="#">Compare</a></li>
							<li><a href="#">Checkout</a></li>
							<li><a href="#">Login</a></li>
						</ul>
					</div>
				</div>
				<!-- /footer widget -->

				<div class="clearfix visible-sm visible-xs"></div>

				<!-- footer widget -->
				<div class="col-md-3 col-sm-6 col-xs-6">
					<div class="footer">
						<h3 class="footer-header">Customer Service</h3>
						<ul class="list-links">
							<li><a href="#">About Us</a></li>
							<li><a href="#">Shiping & Return</a></li>
							<li><a href="#">Shiping Guide</a></li>
							<li><a href="#">FAQ</a></li>
						</ul>
					</div>
				</div>
				<!-- /footer widget -->

				<!-- footer subscribe -->
				<div class="col-md-3 col-sm-6 col-xs-6">
					<div class="footer">
						<h3 class="footer-header">Stay Connected</h3>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor.</p>
						<form>
							<div class="form-group">
								<input class="input" placeholder="Enter Email Address">
							</div>
							<button class="primary-btn">Join Newslatter</button>
						</form>
					</div>
				</div>
				<!-- /footer subscribe -->
			</div>
			<!-- /row -->
			<hr>
			<!-- row -->
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center">
					<!-- footer copyright -->
					<div class="footer-copyright">
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</div>
					<!-- /footer copyright -->
				</div>
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</footer>
	<!-- /FOOTER -->

	<!-- jQuery Plugins -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/slick.min.js"></script>
	<script src="js/nouislider.min.js"></script>
	<script src="js/jquery.zoom.min.js"></script>
	<script src="js/main.js"></script>
			<script>
function delbar() {
    var x = document.getElementById("snackbardel")
    x.className = "show";
    setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
}
</script>
<script>
function addedbar() {
    var x = document.getElementById("snackbaradd")
    x.className = "showadd";
    setTimeout(function(){ x.className = x.className.replace("showadd", ""); }, 3000);
}
</script>
</body>

</html>
