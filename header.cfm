<script>
var today = new Date();
  var checkin = today.getMinutes();
    var checkout = checkin + 10;
document.addEventListener("mousemove", function() {
    var today = new Date();
    checkin = today.getMinutes();
    checkout = checkin + 10;
});
function startTime() {
    var today = new Date();
    var m = today.getMinutes();
    var s = today.getSeconds();
    m = checkTime(m);
    s = checkTime(s);
//    document.getElementById('txt').innerHTML  =    m + ":" + s + " " + checkin + " " + checkout;
checkLog(m);
var t = setTimeout(startTime, 500);

}
function checkTime(i) {
    if (i < 10) {i = "0" + i};  // add zero in front of numbers < 10
    return i;
}
function checkLog(cur){
var isit = cur;

if(checkout == isit){
    location.reload();
}

}

</script>

<script src="js/jquery.min.js"></script>
<script>
	// start user time counter 
$(document).ready(function(){
	startTime();
});
</script>
<script>
	function delnew(itemid, c){
		$.ajax({url: "cartAjax.cfm?delitem&itemid="+itemid,
        	success: function(data, textStatus) {
				        $('#resultsDiv').html(data);
				        		$('#delmodal').modal({ show: false});
									$('#delmodal').modal('show');},
        			error: function(xhr){
            			alert("An error occured: " + xhr.status + " " + xhr.statusText);
        					}});		
	}
</script>
	<link type="text/css" rel="stylesheet" href="css/snackbar.css">
<cfset dpt = application.pageservice.alldpts() />
<!-- init cart and cart functions -->
<!-- Start Cart services -->
<cfif isDefined('session.shoppingCart.item')>
	<cfelse>
		<Cfset session.shoppingCart = {}>
			<cfset session.shoppingCart.item = {}>
				</cfif>
					<!-- /cart service -->
	<!-- HEADER -->
	<header>
		<!-- top Header -->
		<div id="top-header">
			<div class="container">
				<div class="pull-left">
					<span>Welcome to E-shop!</span>
				</div>
				<div class="pull-right">
					<ul class="header-top-links">
						<li><a href="#">Store</a></li>
						<li><a href="#">Newsletter</a></li>
						<li><a href="#">FAQ</a></li>
						<li class="dropdown default-dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">ENG <i class="fa fa-caret-down"></i></a>
							<ul class="custom-menu">
								<li><a href="#">English (ENG)</a></li>
								<li><a href="#">Russian (Ru)</a></li>
								<li><a href="#">French (FR)</a></li>
								<li><a href="#">Spanish (Es)</a></li>
							</ul>
						</li>
						<li class="dropdown default-dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">USD <i class="fa fa-caret-down"></i></a>
							<ul class="custom-menu">
								<li><a href="#">USD ($)</a></li>
								<li><a href="#">EUR (€)</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<!-- /top Header -->

		<!-- header -->
		<div id="header">
			<div class="container">
				<div class="pull-left">
					<!-- Logo -->
					<div class="header-logo">
						<a class="logo" href="index.cfm">
							<img src="./img/logo.png" alt="">
						</a>
					</div>
					<!-- /Logo -->

					<!-- Search -->
					<div class="header-search">
						<form id="seachBar" action="products.cfm">
							<input class="input search-input" type="text" name="search" placeholder="Enter your keyword">
							<select class="input search-categories">
								<option value="0">All Categories</option>
								<cfoutput query="dpt">
								<option value="#departmentid#">#dptname#</option>
								</cfoutput>
							</select>
							<button class="search-btn"><i class="fa fa-search"></i></button>
						</form>
					</div>
					<!-- /Search -->
				</div>
				<div class="pull-right">
					<ul class="header-btns">
						<!-- Account -->
						<cfif structKeyExists(session, 'loggedUser')>
							<li class="header-account dropdown default-dropdown">
							<div class="dropdown-toggle" role="button" data-toggle="dropdown" aria-expanded="true">
								<div class="header-btns-icon">
									<i class="fa fa-user-o"></i>
								</div>
								<strong class="text-uppercase">My Account <i class="fa fa-caret-down"></i></strong>
							</div><cfoutput>Welcome #session.loggedUser.Userfirstname# | 
							<a href="logout.cfm" class="text-uppercase"> Logout</a></cfoutput>
							<ul class="custom-menu">
								<li><a href="profile.cfm"><i class="fa fa-user-o"></i> My Account</a></li>
								<li><a href="profile.cfm?wishtlist"><i class="fa fa-heart-o"></i> My Wishlist</a></li>
								<li><a href="checkout.cfm"><i class="fa fa-check"></i> Checkout</a></li>
								<li><a href="logout.cfm"><i class="fa fa-unlock-alt"></i> Logout</a></li>
							</ul>
						</li>
						<cfelse>
						<li class="header-account dropdown default-dropdown">
							<div class="dropdown-toggle" role="button" data-toggle="dropdown" aria-expanded="true">
								<div class="header-btns-icon">
									<i class="fa fa-user-o"></i>
								</div>
								<strong class="text-uppercase">My Account <i class="fa fa-caret-down"></i></strong>
							</div>
							<a href="login.html" class="text-uppercase">Login</a> / <a href="signup.cfm" class="text-uppercase">Join</a>
							<ul class="custom-menu">
								<li><a href="signup.html"><i class="fa fa-user-plus"></i> Create An Account</a></li>
								<li><a href="login.html"><i class="fa fa-user-plus"></i> login</a></li>
							</ul>
						</li>
						</cfif>
						<!-- /Account -->

<!-- cart start -->

										

						<!-- Cart -->

						<li class="header-cart dropdown default-dropdown" id="resultsDiv">
<cfif structCount(session.shoppingCart.item) neq 0>
<script type="text/javascript">


		$.ajax({url: "cartAjax.cfm?",
        	success: function(data, textStatus) {
        		$("#resultsDiv").html(data);},
        			error: function(xhr){
            			alert("An error occured: " + xhr.status + " " + xhr.statusText);
        					}});		
</script>
<cfelse>


							<a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
								<div class="header-btns-icon">
									<i class="fa fa-shopping-cart"></i>
									<span class="qty">0</span>
								</div>
								<strong class="text-uppercase">My Cart:</strong>
								<br>
								<span>0$</span>
							</a>
							<div class="custom-menu">
								<div id="shopping-cart">
									<div class="shopping-cart-list">
										<div class="product product-widget">
											<div class="product-thumb">
												</div>
											<div class="product-body">
												<h3 class="product-price"> <span class="qty"></span></h3>
												<h2 class="product-name"><a href="#">Shopping Cart is Empty</a></h2>
											</div>
										
										</div>
									</div>
									<div class="shopping-cart-btns">
								<a href="cart.cfm"><button class="main-btn">View Cart</button></a>

						<button class="primary-btn" onclick="javascript:location.href='checkout.cfm'">Checkout <i class="fa fa-arrow-circle-right"></i></button>
									</div>
								</div>
							</div>

						<!-- /Cart -->
</cfif>
						</li>
						<!-- Mobile nav toggle-->
						<li class="nav-toggle">
							<button class="nav-toggle-btn main-btn icon-btn"><i class="fa fa-bars"></i></button>
						</li>
						<!-- / Mobile nav toggle -->
					</ul>
				</div>
			</div>
			<!-- header -->
		</div>
		<!-- container -->
	</header>
	<!-- NAVIGATION -->
	<div id="navigation">
		<!-- container -->
		<div class="container">
			<div id="responsive-nav">
				<!-- init nav menu -->
				<cfset dptmenu = application.pageService.alldpts()>
				<!-- category nav -->
				<div class="category-nav show-on-click">
					<span class="category-header">Categories here <i class="fa fa-list"></i></span>
					
				</div>
				<!-- /category nav -->

				<!-- menu nav -->
				<div class="menu-nav">
					<span class="menu-header">Menu <i class="fa fa-bars"></i></span>
					<ul class="menu-list">
						<li><a href="index.cfm">Home</a></li>
						<li><a href="#">Shop</a></li>
										<cfset dptmenu = application.pageService.alldpts()>
					<cfset ie = 1>
						<cfloop query="dptmenu">						
					
					<li class="dropdown mega-dropdown full-width"><a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true"><cfoutput>#dptmenu.dptname#</cfoutput> <i class="fa fa-caret-down"></i></a>
							<div class="custom-menu">
								<div class="row">
									<div class="col-md-3">
										<div class="hidden-sm hidden-xs">
											<a class="banner banner-1" href="#">
												<img src="./img/banner06.jpg" alt=""> <!--- change dpt image --->
												<div class="banner-caption text-center">
													<h3 class="white-color text-uppercase">Women’s</h3>
												</div>
											</a>
											<hr>
										</div>
										<ul class="list-links">
											<li>
												<h3 class="list-links-title">Categories</h3></li>
																				<cfquery name="getsub">
select * from subdepartment where departmentid =  "#dptmenu['departmentid'][ie]#"
</cfquery>

										
<cfoutput query="getsub">
<li><a href="products.cfm?dpt=#subdptid#">#subdptname#</a></li>
</cfoutput>
										</ul>
									</div>
								</div>
							</div>
						</li>
						<cfset ie++>
</cfloop>
					</ul>
				</div>
				<!-- menu nav -->
			</div>
		</div>
		<!-- /container -->
	</div>
	<!-- /NAVIGATION -->