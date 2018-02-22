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

<!-- ajax functions for cart -->
<script   src="http://code.jquery.com/jquery-3.3.1.min.js"   integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="   crossorigin="anonymous"></script> 
<script>
function submitreview() {

var name = document.getElementById('1').value;
var email = document.getElementById('2').value;
var reviewbody = document.getElementById('3').value;
if(name == '' || email == '' || reviewbody == ''){ $( "#reviewAlert" ).fadeIn('slow');}
else{
	$( "#reviewAlert" ).fadeOut('slow');
		var review = $('#reviewform').serialize();
		  event.preventDefault();
		 $.ajax({url: "ajaxfunctions.cfm?NewReview&"+review,
	success: function(data, textStatus) {
		$('#reviewDiv').slideUp('slow');
			$('#reviewSuccess').slideDown('slow').delay(2000);
},
        	error: function(xhr){
            	alert("An error occured: " + xhr.status + " " + xhr.statusText);
        			}});

}


}
</script>

<script>
function addnew(itemid,  price){
	var qty = document.getElementById('itemqty').value;
 $.ajax({url: "cartAjax.cfm?additem&itemid="+itemid+"&qty="+qty+"&price="+price,
	success: function(data, textStatus) {
		$('#resultsDiv').html(data);
		$('#addmodal').modal({ show: false});
		$('#addmodal').modal('show');

},
        	error: function(xhr){
            	alert("An error occured: " + xhr.status + " " + xhr.statusText);
        			}});
}


</script>
<script type="text/javascript">
	function delnew(itemid, c){
		$.ajax({url: "cartAjax.cfm?delitem&itemid="+itemid,
        	success: function(data, textStatus) {
				        $('#resultsDiv').html(data);
				        		$('#delmodal').modal({ show: false});
									$('#delmodal').modal('show');
        			error: function(xhr){
            			alert("An error occured: " + xhr.status + " " + xhr.statusText);
        					}});		
	}
</script>
<script type="text/javascript">
function copyToClipboard(element) {
  var $temp = $("<input>");
  $("body").append($temp);
  $temp.val($(element).text()).select();
  document.execCommand("copy");
  $temp.remove();
}
</script>
<style>
#snackbar {
    visibility: hidden;
    min-width: 250px;
    margin-left: -125px;
    background-color: #333;
    color: #fff;
    text-align: center;
    border-radius: 2px;
    padding: 16px;
    position: fixed;
    z-index: 1;
    left: 50%;
    bottom: 30px;
    font-size: 17px;
}

#snackbar.show {
    visibility: visible;
    -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
    animation: fadein 0.5s, fadeout 0.5s 2.5s;
}

@-webkit-keyframes fadein {
    from {bottom: 0; opacity: 0;} 
    to {bottom: 30px; opacity: 1;}
}

@keyframes fadein {
    from {bottom: 0; opacity: 0;}
    to {bottom: 30px; opacity: 1;}
}

@-webkit-keyframes fadeout {
    from {bottom: 30px; opacity: 1;} 
    to {bottom: 0; opacity: 0;}
}

@keyframes fadeout {
    from {bottom: 30px; opacity: 1;}
    to {bottom: 0; opacity: 0;}
}
</style>


</head>

<body>

	<!-- /HEADER -->
	<!-- navigation -->
	<cfinclude template="header.cfm" />
	<!-- /NAVIGATION -->

	<!-- BREADCRUMB -->
	<div id="breadcrumb">
		<div class="container">
			<ul class="breadcrumb">
				<li><a href="#">Home</a></li>
				<li><a href="#">Products</a></li>
				<li><a href="#">Category</a></li>
				<li class="active">Product Name Goes Here</li>
			</ul>
		</div>
	</div>
	<!-- /BREADCRUMB -->
<cfif isDefined('url.itemid') >
	<cfif #url.itemid# eq ""><cfset url.itemid = 0></cfif>
	<cfset item = application.products.singleitem(url.itemid) />
<cfelseif isDefined('url.name') and isDefined('url.color') >
	<cfset item = application.products.singleitemcolor(url.name, url.color) />
</cfif>
<cfif structKeyExists( variables, 'item' )>
	<cfif #item.recordcount# neq 0>
<cfoutput query="item">
	<!-- section -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<!--  Product Details -->
				<div class="product product-details clearfix">
					<div class="col-md-6">
						<div id="product-main-view">
							<div class="product-view">
								<cfif #productdetail1# eq ""><img src="./img/main-product01.jpg" alt=""><cfelse><img src="#productdetail1#" alt=""></cfif>
							</div>
							<div class="product-view">
								<cfif #productdetail2# eq ""><img src="./img/main-product01.jpg" alt=""><cfelse><img src="#productdetail2#" alt=""></cfif>
							</div>
							<div class="product-view">
								<cfif #productdetail3# eq ""><img src="./img/main-product01.jpg" alt=""><cfelse><img src="#productdetail3#" alt=""></cfif>
							</div>
						</div>
						<div id="product-view">
							<div class="product-view">
								<img src="./img/thumb-product01.jpg" alt="">
							</div>
							<div class="product-view">
								<img src="./img/thumb-product02.jpg" alt="">
							</div>
							<div class="product-view">
								<img src="./img/thumb-product03.jpg" alt="">
							</div>
							<div class="product-view">
								<img src="./img/thumb-product04.jpg" alt="">
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="product-body">
							<div class="product-label">
								<cfif dateDiff('d', created, now()) lt 21><span>New</span></cfif>
							<cfif #onsale# eq 1>	<span class="sale">-20%</span></cfif>
							</div>
							<h2 class="product-name">#itemname# #shortdescription#</h2>
							<cfset oldprice = #price# * 1.2 />
							<h3 class="product-price">#price# <del class="product-old-price">#oldprice#</del></h3>
							<div>
								<div class="product-rating">
									<cfif #rating# neq "">
								<cfloop from="1" to="5" index="i">
									<cfif #rating# gte #i#>
									<i class="fa fa-star"></i>
								<cfelse>
									<i class="fa fa-star-o empty"></i>
								</cfif>
								</cfloop>
							<cfelse>No rating yet</cfif>
								</div>
								<a href="##">3 Review(s) / Add Review</a>
							</div>
							<p><strong>Availability:<cfif #qty# eq 0></strong>Not In Stock<cfelse></strong> In Stock</cfif></p>
							<p><strong>Brand:</strong> E-SHOP</p>
							<p>#Description#.</p>
							<div class="product-options">
								<cfif #itemsize# neq "">
								<ul class="size-option">
									<li><span class="text-uppercase">Size:</span></li>
									<li class="active"><a href="##">S</a></li>
									<li><a href="##">XL</a></li>
									<li><a href="##">SL</a></li>
								</ul>
							</cfif>
							<cfif #color# neq "">
								<ul class="color-option">
									<li><span class="text-uppercase">Color:</span></li>
									<li class="active">
										<a href="product-page.cfm?name=#itemname#&color=blue" style="background-color:##475984;"></a></li>
									<li><a href="product-page.cfm?name=#itemname#&color=silver" style="background-color:##636466;"></a></li>
									<li><a href="product-page.cfm?name=#itemname#&color=pink" style="background-color:##fc6279;"></a></li>
									<li><a href="product-page.cfm?name=#itemname#&color=black" style="background-color:##0c0c0c;"></a></li>
									<li><a href="product-page.cfm?name=#itemname#&color=red" style="background-color:##9e0113;"></a></li>
								</ul>
							</cfif>
							</div>

							<div class="product-btns">
								<div class="qty-input">
									<span class="text-uppercase">QTY: </span>
									<input class="input" type="number" id="itemqty" value="1">
								</div>
								<button class="primary-btn add-to-cart" onclick="addnew(#itemid#, #price#);addedbar(); "><i class="fa fa-shopping-cart"></i> Add to Cart</button>
								<div class="pull-right">
									<button class="main-btn icon-btn"><i class="fa fa-heart"></i></button>
									<button class="main-btn icon-btn"><i class="fa fa-exchange"></i></button>
									<p id="p1" style="display: none">product-detail.cfm?itemid=#itemid#</p>
										<button class="main-btn icon-btn" onclick="copyToClipboard('##p1'); successbar();"><i class="fa fa-share-alt"></i>
								</div>
							</div>
						</div>
					</div>
					<div id="snackbaradd">Item Added!</div>
					<div id="snackbar">Link Copied</div>
					<div class="col-md-12">
						<div class="product-tab">
							<ul class="tab-nav">
								</cfoutput>

<!--- pagination start --->
<cfquery name="getrecords">Select * from reviews where itemid = '#item.itemid#' </cfquery>
<cfset  resultsPerpage = 3 />
<cfset numofresults = #getrecords.recordcount# />
<cfset numberofpages = #ceiling(numofresults / resultsPerpage)# />
<cfset q = reReplaceNoCase(cgi.query_string, "page=[^&]+&?", "")>
<cfset currentURL = #q#  />

								<cfif isDefined('url.page')>
								<cfelse>
							<cfset url.page = 1>
								</cfif>
								<cfset start = (#url.page# - 1) * #resultsPerpage# />

											<cfquery name="getreviews">
												Select * from reviews where itemid = '#item.itemid#' LIMIT #start#, #resultsPerpage#
										</cfquery>


							<cfoutput>

															<li class="active"><a data-toggle="tab" href="##tab1">Description</a></li>
															<li><a data-toggle="tab" href="##tab1">Details</a></li>
															<li><a data-toggle="tab" href="##tab2">Reviews (#getrecords.recordcount#)</a></li>
															</ul>
															<div class="tab-content">
															<div id="tab1" class="tab-pane fade in active">
															<p>#item.Description#.</p>
								</div>
							</cfoutput>
								<div id="tab2" class="tab-pane fade in">

									<div class="row">

										<div class="col-md-6">
											<div class="product-reviews">

										<cfoutput query="getreviews">
												<div class="single-review">
													<div class="review-heading">
														<div><a href="##"><i class="fa fa-user-o"></i> #name#</a></div>
														<div><a href="##"><i class="fa fa-clock-o">
															
														</i> #dateTimeFormat(created, "dd mmm yyyy hh:nn")#</a></div>
														<div class="review-rating pull-right">
									<cfif #rating# neq "">
									<cfloop from="1" to="5" index="i">
									<cfif #rating# gte #i#>
									<i class="fa fa-star"></i>
									<cfelse>
									<i class="fa fa-star-o empty"></i>
									</cfif>
									</cfloop>
									</cfif>
														</div>
													</div>
													<div class="review-body">
														<p>#review#.</p>
													</div>
												</div>
											</cfoutput>
												<ul class="reviews-pages">
													<cfloop from="1" to="#numberofpages#" index="i">
													<cfif #i# eq #url.page#>
													<cfoutput><li class="active">#i#</cfoutput></li>
													<cfelse><li>
														<cfoutput><a href="product-page.cfm?page=#i#&#currentURL#&##tab2">#i#</cfoutput></a></li>
													</cfif>
													</cfloop>
													<li><a href="##"><i class="fa fa-caret-right"></i></a></li>
												</ul>
											</div>
										</div>
										<div class="col-md-6" id="reviewSuccess" style="display: none">
											<h4 class="text-uppercase" style="color:green">Success!</h4>
												<p>Your review has been submited, thank you.</p>
										</div>
				<div class="col-md-6 alert alert-danger" id="reviewAlert" style="display: none">
					<ul>
						<li>Name field is required</li>
						<li>Valid Email is required</li>
						<li>Review and rating are required</li>
					</ul>
				</div>
										
										<div class="col-md-6" id="reviewDiv">
											<h4 class="text-uppercase">Write Your Review</h4>
											<p>Your email address will not be published.</p>




											<form id="reviewform" class="review-form"  >
												<div class="form-group">
													<input name="name" id="1" class="input" type="text" placeholder="Your Name" required="true" />
												</div>
												<div class="form-group">
													<input name="email" id="2" class="input" type="email" placeholder="Email Address" required="true" />
												</div>
												<div class="form-group">
													<textarea name="review" id="3" class="input" placeholder="Your review" required="true"></textarea>
												</div>
												<cfoutput>
												<cfif isDefined('url.itemid')>
												<input type="hidden" name="itemid" value="#url.itemid#" />
												<cfelse>
												<input type="hidden" name="itemid" value="#item.itemid#" />
												</cfif>
											</cfoutput>
\
												<div class="form-group">
													<div class="input-rating">
														<strong class="text-uppercase">Your Rating: </strong>
														<div class="stars">
															<input type="radio" id="star5" name="rating" value="5" /><label for="star5"></label>
															<input type="radio" id="star4" name="rating" value="4" /><label for="star4"></label>
															<input type="radio" id="star3" name="rating" value="3" /><label for="star3"></label>
															<input type="radio" id="star2" name="rating" value="2" /><label for="star2"></label>
															<input type="radio" id="star1" name="rating" value="1" /><label for="star1"></label>
														</div>
													</div>
												</div>
																							<button class="primary-btn" onclick="submitreview()">Submit</button>
											</form>
										</div>
									</div>



								</div>
							</div>
						</div>
					</div>

				</div>
				<!-- /Product Details -->
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /section -->

	<!-- section -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<!-- section title -->
				<div class="col-md-12">
					<div class="section-title">
						<h2 class="title">Picked For You</h2>
					</div>
				</div>
				<!-- section title -->

				<!-- Product Single -->
				<div class="col-md-3 col-sm-6 col-xs-6">
					<div class="product product-single">
						<div class="product-thumb">
							<button class="main-btn quick-view"><i class="fa fa-search-plus"></i> Quick view</button>
							<img src="./img/product04.jpg" alt="">
						</div>
						<div class="product-body">
							<h3 class="product-price">$32.50</h3>
							<div class="product-rating">
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star-o empty"></i>
							</div>
							<h2 class="product-name"><a href="##">Product Name Goes Here</a></h2>
							<div class="product-btns">
								<button class="main-btn icon-btn"><i class="fa fa-heart"></i></button>
								<button class="main-btn icon-btn"><i class="fa fa-exchange"></i></button>
								<button class="primary-btn add-to-cart"><i class="fa fa-shopping-cart"></i> Add to Cart</button>
							</div>
						</div>
					</div>
				</div>
				<!-- /Product Single -->

				<!-- Product Single -->
				<div class="col-md-3 col-sm-6 col-xs-6">
					<div class="product product-single">
						<div class="product-thumb">
							<div class="product-label">
								<span>New</span>
							</div>
							<button class="main-btn quick-view"><i class="fa fa-search-plus"></i> Quick view</button>
							<img src="./img/product03.jpg" alt="">
						</div>
						<div class="product-body">
							<h3 class="product-price">$32.50</h3>
							<div class="product-rating">
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star-o empty"></i>
							</div>
							<h2 class="product-name"><a href="##">Product Name Goes Here</a></h2>
							<div class="product-btns">
								<button class="main-btn icon-btn"><i class="fa fa-heart"></i></button>
								<button class="main-btn icon-btn"><i class="fa fa-exchange"></i></button>
								<button class="primary-btn add-to-cart"><i class="fa fa-shopping-cart"></i> Add to Cart</button>
							</div>
						</div>
					</div>
				</div>
				<!-- /Product Single -->

				<!-- Product Single -->
				<div class="col-md-3 col-sm-6 col-xs-6">
					<div class="product product-single">
						<div class="product-thumb">
							<div class="product-label">
								<span class="sale">-20%</span>
							</div>
							<button class="main-btn quick-view"><i class="fa fa-search-plus"></i> Quick view</button>
							<img src="./img/product02.jpg" alt="">
						</div>
						<div class="product-body">
							<h3 class="product-price">$32.50 <del class="product-old-price">$45.00</del></h3>
							<div class="product-rating">
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star-o empty"></i>
							</div>
							<h2 class="product-name"><a href="##">Product Name Goes Here</a></h2>
							<div class="product-btns">
								<button class="main-btn icon-btn"><i class="fa fa-heart"></i></button>
								<button class="main-btn icon-btn"><i class="fa fa-exchange"></i></button>
								<button class="primary-btn add-to-cart"><i class="fa fa-shopping-cart"></i> Add to Cart</button>
							</div>
						</div>
					</div>
				</div>
				<!-- /Product Single -->

				<!-- Product Single -->
				<div class="col-md-3 col-sm-6 col-xs-6">
					<div class="product product-single">
						<div class="product-thumb">
							<div class="product-label">
								<span>New</span>
								<span class="sale">-20%</span>
							</div>
							<button class="main-btn quick-view"><i class="fa fa-search-plus"></i> Quick view</button>
							<img src="./img/product01.jpg" alt="">
						</div>
						<div class="product-body">
							<h3 class="product-price">$32.50 <del class="product-old-price">$45.00</del></h3>
							<div class="product-rating">
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star-o empty"></i>
							</div>
							<h2 class="product-name"><a href="##">Product Name Goes Here</a></h2>
							<div class="product-btns">
								<button class="main-btn icon-btn"><i class="fa fa-heart"></i></button>
								<button class="main-btn icon-btn"><i class="fa fa-exchange"></i></button>
								<button class="primary-btn add-to-cart"><i class="fa fa-shopping-cart"></i> Add to Cart</button>
							</div>
						</div>
					</div>
				</div>
				<!-- /Product Single -->
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /section -->

									<cfelse>
										<div class="row">
											<div class="col-md-3">
												<h3>No Items found</h3>
													</div>
														</div>
															</cfif>
									<cfelse>
										<div class="row">
											<div class="col-md-3">
												<h3>No Items found</h3>
													</div>
														</div>
															</cfif>

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
							<a class="logo" href="##">
		            <img src="./img/logo.png" alt="">
		          </a>
						</div>
						<!-- /footer logo -->

						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna</p>

						<!-- footer social -->
						<ul class="footer-social">
							<li><a href="##"><i class="fa fa-facebook"></i></a></li>
							<li><a href="##"><i class="fa fa-twitter"></i></a></li>
							<li><a href="##"><i class="fa fa-instagram"></i></a></li>
							<li><a href="##"><i class="fa fa-google-plus"></i></a></li>
							<li><a href="##"><i class="fa fa-pinterest"></i></a></li>
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
							<li><a href="##">My Account</a></li>
							<li><a href="##">My Wishlist</a></li>
							<li><a href="##">Compare</a></li>
							<li><a href="##">Checkout</a></li>
							<li><a href="##">Login</a></li>
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
							<li><a href="##">About Us</a></li>
							<li><a href="##">Shiping & Return</a></li>
							<li><a href="##">Shiping Guide</a></li>
							<li><a href="##">FAQ</a></li>
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
function successbar() {
    var x = document.getElementById("snackbar")
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
