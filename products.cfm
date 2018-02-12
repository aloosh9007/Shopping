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
function addnew(itemid, qty,  price){

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

</head>
<!-- page protection -->
<cfif isDefined('url.dpt')>
		<cfif #url.dpt# eq ""><cfset url.dpt = 0></cfif>
<!-- pagination start -->
<cfif isDefined('url.page')>
	<cfelse>
		<cfset url.page = 1>
			</cfif>
				<cfset  resultsPerpage = 9 />
					<cfset start = (#url.page# - 1) * #resultsPerpage# />
					<!-- item setup -->			<cfset items = application.products.departmentitems(url.dpt, #start#, #resultsPerpage#) /> 
						<cfset numofresults = #items.recordcount# />
							<cfset numberofpages = #ceiling(numofresults / resultsPerpage)# />
								<cfset q = reReplaceNoCase(cgi.query_string, "page=[^&]+&?", "")>
									<cfset currentURL = #q#  />		
<!-- / end pagination -->

				</cfif>
					<cfif isDefined('url.search')>
<!-- pagination start -->
<cfif isDefined('url.page')>
	<cfelse>
		<cfset url.page = 1>
			</cfif>
				<cfset  resultsPerpage = 9 />
					<cfset start = (#url.page# - 1) * #resultsPerpage# />
						<cfset numofresults = #items.recordcount# />
						<!-- item setup -->						<cfset items = application.pageservice.searchItem(url.search, #start#, #resultsPerpage#) />
							<cfset numberofpages = #ceiling(numofresults / resultsPerpage)# />
								<cfset q = reReplaceNoCase(cgi.query_string, "page=[^&]+&?", "")>
									<cfset currentURL = #q#  />		
<!-- / end pagination -->
							</cfif>
								<cfif NOT structKeyExists( variables, 'items' )>
									<cflocation url="index.cfm">	
										<cfif #items.recordcount# eq 0>
											<cflocation url="index.cfm">
												</cfif>
													</cfif>

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
				<li class="active">Products</li>
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
				<!-- ASIDE -->
				<div id="aside" class="col-md-3">
					<!-- aside widget -->
					<div class="aside">
						<h3 class="aside-title">Shop by:</h3>
						<ul class="filter-list">
							<li><span class="text-uppercase">color:</span></li>
							<li><a href="#" style="color:#FFF; background-color:#8A2454;">Camelot</a></li>
							<li><a href="#" style="color:#FFF; background-color:#475984;">East Bay</a></li>
							<li><a href="#" style="color:#FFF; background-color:#BF6989;">Tapestry</a></li>
							<li><a href="#" style="color:#FFF; background-color:#9A54D8;">Medium Purple</a></li>
						</ul>

						<ul class="filter-list">
							<li><span class="text-uppercase">Size:</span></li>
							<li><a href="#">X</a></li>
							<li><a href="#">XL</a></li>
						</ul>

						<ul class="filter-list">
							<li><span class="text-uppercase">Price:</span></li>
							<li><a href="#">MIN: $20.00</a></li>
							<li><a href="#">MAX: $120.00</a></li>
						</ul>

						<ul class="filter-list">
							<li><span class="text-uppercase">Gender:</span></li>
							<li><a href="#">Men</a></li>
						</ul>

						<button class="primary-btn">Clear All</button>
					</div>
					<!-- /aside widget -->

					<!-- aside widget -->
					<div class="aside">
						<h3 class="aside-title">Filter by Price</h3>
						<div id="price-slider"></div>
					</div>
					<!-- aside widget -->

					<!-- aside widget -->
					<div class="aside">
						<h3 class="aside-title">Filter By Color:</h3>
						<ul class="color-option">
							<li><a href="#" style="background-color:#475984;"></a></li>
							<li><a href="#" style="background-color:#8A2454;"></a></li>
							<li class="active"><a href="#" style="background-color:#BF6989;"></a></li>
							<li><a href="#" style="background-color:#9A54D8;"></a></li>
							<li><a href="#" style="background-color:#675F52;"></a></li>
							<li><a href="#" style="background-color:#050505;"></a></li>
							<li><a href="#" style="background-color:#D5B47B;"></a></li>
						</ul>
					</div>
					<!-- /aside widget -->

					<!-- aside widget -->
					<div class="aside">
						<h3 class="aside-title">Filter By Size:</h3>
						<ul class="size-option">
							<li class="active"><a href="#">S</a></li>
							<li class="active"><a href="#">XL</a></li>
							<li><a href="#">SL</a></li>
						</ul>
					</div>
					<!-- /aside widget -->

					<!-- aside widget -->
					<div class="aside">
						<h3 class="aside-title">Filter by Brand</h3>
						<ul class="list-links">
							<li><a href="#">Nike</a></li>
							<li><a href="#">Adidas</a></li>
							<li><a href="#">Polo</a></li>
							<li><a href="#">Lacost</a></li>
						</ul>
					</div>
					<!-- /aside widget -->

					<!-- aside widget -->
					<div class="aside">
						<h3 class="aside-title">Filter by Gender</h3>
						<ul class="list-links">
							<li class="active"><a href="#">Men</a></li>
							<li><a href="#">Women</a></li>
						</ul>
					</div>
					<!-- /aside widget -->

					<!-- aside widget -->
					<div class="aside">
						<h3 class="aside-title">Top Rated Product</h3>
						<!-- widget product -->
						
						<!-- /widget product -->
					</div>
					<!-- /aside widget -->
				</div>
				<!-- /ASIDE -->

				<!-- MAIN -->
				<div id="main" class="col-md-9">
					<!-- store top filter -->
					<div class="store-filter clearfix">
						<div class="pull-left">
							<div class="row-filter">
								<a href="#"><i class="fa fa-th-large"></i></a>
								<a href="#" class="active"><i class="fa fa-bars"></i></a>
							</div>
							<div class="sort-filter">
								<span class="text-uppercase">Sort By:</span>
								<select class="input">
										<option value="0">Position</option>
										<option value="0">Price</option>
										<option value="0">Rating</option>
									</select>
								<a href="#" class="main-btn icon-btn"><i class="fa fa-arrow-down"></i></a>
							</div>
						</div>
						<div class="pull-right">
							<div class="page-filter">
								<span class="text-uppercase">Show:</span>
								<select class="input">
										<option value="0">10</option>
										<option value="1">20</option>
										<option value="2">30</option>
									</select>
							</div>
							<ul class="store-pages">
													<cfloop from="1" to="#numberofpages#" index="i">
													<cfif #i# eq #url.page#>
													<cfoutput><li class="active">#i#</cfoutput></li>
													<cfelse><li>
														<cfoutput><a href="product-page.cfm?page=#i#&#currentURL#&##tab2">#i#</cfoutput></a></li>
													</cfif>
													</cfloop>
								<li><a href="#"><i class="fa fa-caret-right"></i></a></li>
							</ul>
						</div>
					</div>
					<!-- /store top filter -->

					<!-- STORE -->
					<div id="store">
						<!-- row -->
						<div class="row">
							<cfset counter = 1>
		<cfoutput query="items">
							<!-- Product Single -->
							<div class="col-md-4 col-sm-6 col-xs-6">
								<div class="product product-single">
									<div class="product-thumb">
							<a href="product-page.cfm?itemid=#itemid#">
										<button class="main-btn quick-view"><i class="fa fa-search-plus"></i> Quick view</button></a>
																		<cfif #cartImg# eq ""><img src="./img/product01.jpg" alt=""><cfelse><img src="#cartImg#" alt=""></cfif>
									</div>
									<div class="product-body">
										<h3 class="product-price">$#Price#</h3>
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
										<h2 class="product-name"><a href="product-page.cfm?itemid=#itemid#">#itemname# #shortdescription#</a></h2>
										<div class="product-btns">
											<button class="main-btn icon-btn"><i class="fa fa-heart"></i></button>
<p id="p#counter#" style="display: none">product-page.cfm?itemid=#itemid#</p>
										<button class="main-btn icon-btn" onclick="copyToClipboard('##p#counter#'); successbar();"><i class="fa fa-share-alt"></i></button>
											<button class="primary-btn add-to-cart" onclick="addnew(#itemid#,1,#price#); addedbar();"><i class="fa fa-shopping-cart"></i> Add to Cart</button>
										</div>
									</div>
								</div>
			<cfset counter++>				</div>
</cfoutput>							<!-- /Product Single -->
<div id="snackbar">Link Copied</div>
<div id="snackbaradd">Success! item added</div>

							<div class="clearfix visible-sm visible-xs"></div>


							<!-- /Product Single -->
						</div>
						<!-- /row -->
					</div>
					<!-- /STORE -->

					<!-- store bottom filter -->
					<div class="store-filter clearfix">
						<div class="pull-left">
							<div class="row-filter">
								<a href="#"><i class="fa fa-th-large"></i></a>
								<a href="#" class="active"><i class="fa fa-bars"></i></a>
							</div>
							<div class="sort-filter">
								<span class="text-uppercase">Sort By:</span>
								<select class="input">
										<option value="0">Position</option>
										<option value="0">Price</option>
										<option value="0">Rating</option>
									</select>
								<a href="#" class="main-btn icon-btn"><i class="fa fa-arrow-down"></i></a>
							</div>
						</div>
						<div class="pull-right">
							<div class="page-filter">
								<span class="text-uppercase">Show:</span>
								<select class="input">
										<option value="0">10</option>
										<option value="1">20</option>
										<option value="2">30</option>
									</select>
							</div>
							<ul class="store-pages">
<cfloop from="1" to="#numberofpages#" index="i">
													<cfif #i# eq #url.page#>
													<cfoutput><li class="active">#i#</cfoutput></li>
													<cfelse><li>
														<cfoutput><a href="product-page.cfm?page=#i#&#currentURL#&##tab2">#i#</cfoutput></a></li>
													</cfif>
													</cfloop>
								<li><a href="#"><i class="fa fa-caret-right"></i></a></li>
							</ul>
						</div>
					</div>
					<!-- /store bottom filter -->
				</div>
				<!-- /MAIN -->
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /section -->

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
function addedbar() {
    var x = document.getElementById("snackbaradd")
    x.className = "showadd";
    setTimeout(function(){ x.className = x.className.replace("showadd", ""); }, 3000);
}
</script>
		<script>
function successbar() {
    var x = document.getElementById("snackbar")
    x.className = "show";
    setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
}
</script>

</body>

</html>
