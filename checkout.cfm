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
<script src="https://js.stripe.com/v3/"></script>

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
	<cfif structKeyExists(session, 'loggedUser')>
<input type="hidden" id="userlog" value="true">
<cfelse>
<input type="hidden" id="userlog" value="false">
</cfif>
<style>
.modal-backdrop {
background-color: rgba(255,255,255, 255, 12)  !important;
}

.spinner {
	margin-top: 20%;
  border: 10px solid #f3f3f3;
  border-radius: 50%;
  border-top: 10px solid #3498db;
  width: 100px;
  height: 100px;
  -webkit-animation: spin 1s linear infinite; /* Safari */
  animation: spin 1s ease infinite;
}
/* Safari */
@-webkit-keyframes spin {
  0% { -webkit-transform: rotate(0deg); }
  100% { -webkit-transform: rotate(360deg); }
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}

.sk-cube-grid {
  width: 40px;
  height: 40px;
  margin: 100px auto;
}

.sk-cube-grid .sk-cube {
  width: 33%;
  height: 33%;
  background-color: white;
  float: left;
  -webkit-animation: sk-cubeGridScaleDelay 1.3s infinite ease-in-out;
          animation: sk-cubeGridScaleDelay 1.3s infinite ease-in-out; 
}
.sk-cube-grid .sk-cube1 {
  -webkit-animation-delay: 0.2s;
          animation-delay: 0.2s; }
.sk-cube-grid .sk-cube2 {
  -webkit-animation-delay: 0.3s;
          animation-delay: 0.3s; }
.sk-cube-grid .sk-cube3 {
  -webkit-animation-delay: 0.4s;
          animation-delay: 0.4s; }
.sk-cube-grid .sk-cube4 {
  -webkit-animation-delay: 0.1s;
          animation-delay: 0.1s; }
.sk-cube-grid .sk-cube5 {
  -webkit-animation-delay: 0.2s;
          animation-delay: 0.2s; }
.sk-cube-grid .sk-cube6 {
  -webkit-animation-delay: 0.3s;
          animation-delay: 0.3s; }
.sk-cube-grid .sk-cube7 {
  -webkit-animation-delay: 0s;
          animation-delay: 0s; }
.sk-cube-grid .sk-cube8 {
  -webkit-animation-delay: 0.1s;
          animation-delay: 0.1s; }
.sk-cube-grid .sk-cube9 {
  -webkit-animation-delay: 0.2s;
          animation-delay: 0.2s; }

@-webkit-keyframes sk-cubeGridScaleDelay {
  0%, 70%, 100% {
    -webkit-transform: scale3D(1, 1, 1);
            transform: scale3D(1, 1, 1);
  } 35% {
    -webkit-transform: scale3D(0, 0, 1);
            transform: scale3D(0, 0, 1); 
  }
}

@keyframes sk-cubeGridScaleDelay {
  0%, 70%, 100% {
    -webkit-transform: scale3D(1, 1, 1);
            transform: scale3D(1, 1, 1);
  } 35% {
    -webkit-transform: scale3D(0, 0, 1);
            transform: scale3D(0, 0, 1);
  } 
}
/**
 * The CSS shown here will not be introduced in the Quickstart guide, but shows
 * how you can use CSS to style your Element's container.
 */
.StripeElement {
  background-color: white;
  height: 40px;
  padding: 10px 12px;
  border-radius: 4px;
  border: 1px solid #ccd0d2;
  box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
  -webkit-transition: box-shadow 150ms ease;
  transition: box-shadow 150ms ease;
}

.StripeElement--focus {
  box-shadow: 0 1px 3px 0 #cfd7df;
}

.StripeElement--invalid {
  border-color: #fa755a;
}

.StripeElement--webkit-autofill {
  background-color: #fefde5 !important;
}

</style>
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
	<!-- /BREADCRUMB -->

	<!-- section -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<form id="payment-form" class="clearfix" action="payment.cfm">
					<div class="col-md-6">
						<cfif NOT structKeyExists(session, 'loggedUser')>
						<div class="billing-details">
							<p>Already a customer ? <a href="#">Login</a></p>
							<div class="section-title">
								<h3 class="title">Billing Details</h3>
							</div>
							<div class="form-group">
								<input class="input" type="text" name="first-name" placeholder="First Name" required="true">
							</div>
							<div class="form-group">
								<input class="input" type="text" name="last-name" placeholder="Last Name"required="true">
							</div>
							<div class="form-group">
								<input class="input" type="email" name="email" placeholder="Email" required="true">
							</div>
							<div class="form-group">
								<input class="input" type="text" name="address" placeholder="Address" required="true">
							</div>
							<div class="form-group">
								<input class="input" type="text" name="city" placeholder="City" required="true">
							</div>
							<div class="form-group">
								<input class="input" type="text" name="country" placeholder="Country" required="true">
							</div>
							<div class="form-group">
								<input class="input" type="text" name="zip-code" placeholder="ZIP Code" required="true">
							</div>
							<div class="form-group">
								<input class="input" type="tel" name="tel" placeholder="Telephone" required="true">
							</div>
							<!--- stripe element --->
							<div class="form-group">
  <div class="form-row">
    <label for="card-element">
      Credit or debit card
    </label>
    <div id="card-element">
      <!-- a Stripe Element will be inserted here. -->
    </div>

    <!-- Used to display form errors -->
    <div id="card-errors" role="alert"></div>
  </div>
							</div>
							<div class="form-group">
								<div class="input-checkbox">
									<input type="checkbox" id="register">
									<label class="font-weak" for="register">Create Account?</label>
									<div class="caption">
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt.
											<p>
												<input class="input" type="password" name="password" placeholder="Enter Your Password">
									</div>
								</div>
							</div>
						</div>
					<cfelse>
						<div class="billing-details">
							<cfquery name="getaddress">
							SELECT address, city, state, zip from users where usersid = '#session.loggedUser.userid#'
							</cfquery>
							<cfoutput query="getaddress">
									<div class="section-title">
								<h4 class="title">Home Address</h4>
								</div>
								<div class="caption">
									<h3>Street Adress:</h3>
									<h4>#address#</h4>
									<h4>#city#, #state# #zip#</h4>
																<!--- stripe element --->
							<div class="form-group">
  <div class="form-row">
    <label for="card-element">
      Credit or debit card
    </label>
    <div id="card-element">
      <!-- a Stripe Element will be inserted here. -->
    </div>

    <!-- Used to display form errors -->
    <div id="card-errors" role="alert"></div>
  </div>
							</div>
									<div class="form-group">
								<div class="input-checkbox">
									<input type="checkbox" id="different">
									<label class="font-weak" for="different">Ship to Different Address?</label>
									<div class="caption">
										<p>Enter the Shipping address below:</p>
											<p>
												<input class="input" type="text" name="address" placeholder="Address" required="true">
												<input class="input" type="text" name="city" placeholder="City" required="true">
												<input class="input" type="text" name="state" placeholder="State" required="true">
												<input class="input" type="text" name="zip" placeholder="Zip" required="true">
									</div>
								</div>
							</div>


								</div>
							</cfoutput>
						</div>
						</cfif>
					</div>

					<div class="col-md-6">
						<div class="shiping-methods">
							<div class="section-title">
								<h4 class="title">Shiping Methods</h4>
							</div>
							<div class="input-checkbox">
								<input type="radio" name="shipping" id="shipping-1" checked>
								<label for="shipping-1">Free Shiping -  $0.00</label>
								<div class="caption">
									<p>We offer free standard shipping any where in the us; However, you can select our 2 day shipping to expedite</p>
										
								</div>
							</div>
							<div class="input-checkbox">
								<input type="radio" name="shipping" id="shipping-2">
								<label for="shipping-2">Standard - $4.00</label>
								<div class="caption">
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
										<p>
								</div>
							</div>
						</div>

						<div class="payments-methods">
							<div class="section-title">
								<h4 class="title">Payments Methods</h4>
							</div>
							<div class="input-checkbox">
								<input type="radio" name="payments" id="payments-1" checked>
								<label for="payments-1">Direct Bank Transfer</label>
								<div class="caption">
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
										<p>
								</div>
							</div>
							<div class="input-checkbox">
								<input type="radio" name="payments" id="payments-2">
								<label for="payments-2">Cheque Payment</label>
								<div class="caption">
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
										<p>
								</div>
							</div>
							<div class="input-checkbox">
								<input type="radio" name="payments" id="payments-3">
								<label for="payments-3">Paypal System</label>
								<div class="caption">
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
										<p>
								</div>
							</div>
						</div>
						<button class="primary-btn" trype="submit" id="StripeElement" onclick="pay();">Make payment</button>
					</div>
					</form>
		<cfif isDefined('session.shoppingCart.item')>
			<cfif structCount(session.shoppingCart.item) neq 0>
				<cfset cartItems = application.cart.cartCounter()>

					<div class="col-md-12">
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
										<td class="qty text-center"><input class="input" type="number" value="#session.shoppingcart.item[key].qty#"></td>
										<td class="total text-center"><strong class="primary-color">
										$#(session.shoppingcart.item[key].qty * session.shoppingcart.item[key].price)#
									</strong></td>
								<td class="text-right"><button 
								 class="main-btn icon-btn"  onclick="delitem(#session.shoppingcart.item[key].itemid#, #counter#)">
											<i class="fa fa-close"></i></button></td>
									</tr>
<!-- /item list here -->
									</cfoutput>
									<cfset counter++>
									</cfloop>
									<cfset total = application.cart.cartTotal() />

								</tbody>
								<tfoot id="tfoot">
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
<cfoutput>
<cfset final = final * 100>

</cfoutput>								
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
	<script src="js/customStripe.js"></script>
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
<script>
// Create a Stripe client
var stripe = Stripe('pk_test_e8WG9BIIRIdaZuqVbUbxJvlI');

// Create an instance of Elements
var elements = stripe.elements();

// Custom styling can be passed to options when creating an Element.
// (Note that this demo uses a wider set of styles than the guide below.)
var style = {
  base: {
    color: '#32325d',
    lineHeight: '18px',
    fontFamily: '"Helvetica Neue", Helvetica, sans-serif',
    fontSmoothing: 'antialiased',
    fontSize: '16px',
    '::placeholder': {
      color: '#aab7c4'
    }
  },
  invalid: {
    color: '#fa755a',
    iconColor: '#fa755a'
  }
};

// Create an instance of the card Element
var card = elements.create('card', {style: style});

// Add an instance of the card Element into the `card-element` <div>
card.mount('#card-element');
  </script>
<div class="modal fade" id="myModal" role="dialog" style="text-align: center">
        
      <!-- Modal content-->
         <div class="modal-body" align="center">
	<!--- one cool loader 
			<div class="sk-cube-grid">
  <div class="sk-cube sk-cube1"></div>
  <div class="sk-cube sk-cube2"></div>
  <div class="sk-cube sk-cube3"></div>
  <div class="sk-cube sk-cube4"></div>
  <div class="sk-cube sk-cube5"></div>
  <div class="sk-cube sk-cube6"></div>
  <div class="sk-cube sk-cube7"></div>
  <div class="sk-cube sk-cube8"></div>
  <div class="sk-cube sk-cube9"></div>
</div>
--->
<div class="spinner"></div>
<div style="padding-top: 10px;"><h4 style="color:white">Loading...</h4></div>
        </div>
       
      </div>



</body>

</html>
