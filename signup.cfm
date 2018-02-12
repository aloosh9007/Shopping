<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />


	<title>Signup Wizard</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />



	<!--     Fonts and icons     -->
	<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />

	<!-- CSS Files -->
	<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
	<link href="assets/css/material-bootstrap-wizard.css" rel="stylesheet" />

	<!-- CSS Just for demo purpose, don't include it in your project -->
	<link href="assets/css/demo.css" rel="stylesheet" />
	 <!-- Compiled and minified CSS -->
	 <script   src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
  <style>
  
/* Progress Bar */
.progress {
  position: relative;
  height: 4px;
  display: block;
  width: 100%;
  background-color: #acece6;
  border-radius: 2px;
  background-clip: padding-box;
  margin: 0.5rem 0 1rem 0;
  overflow: hidden; }
  .progress .determinate {
    position: absolute;
    background-color: inherit;
    top: 0;
    bottom: 0;
    background-color: #26a69a;
    transition: width .3s linear; }
  .progress .indeterminate {
    background-color: #26a69a; }
    .progress .indeterminate:before {
      content: '';
      position: absolute;
      background-color: inherit;
      top: 0;
      left: 0;
      bottom: 0;
      will-change: left, right;
      -webkit-animation: indeterminate 2.1s cubic-bezier(0.65, 0.815, 0.735, 0.395) infinite;
              animation: indeterminate 2.1s cubic-bezier(0.65, 0.815, 0.735, 0.395) infinite; }
    .progress .indeterminate:after {
      content: '';
      position: absolute;
      background-color: inherit;
      top: 0;
      left: 0;
      bottom: 0;
      will-change: left, right;
      -webkit-animation: indeterminate-short 2.1s cubic-bezier(0.165, 0.84, 0.44, 1) infinite;
              animation: indeterminate-short 2.1s cubic-bezier(0.165, 0.84, 0.44, 1) infinite;
      -webkit-animation-delay: 1.15s;
              animation-delay: 1.15s; }

@-webkit-keyframes indeterminate {
  0% {
    left: -35%;
    right: 100%; }
  60% {
    left: 100%;
    right: -90%; }
  100% {
    left: 100%;
    right: -90%; } }
@keyframes indeterminate {
  0% {
    left: -35%;
    right: 100%; }
  60% {
    left: 100%;
    right: -90%; }
  100% {
    left: 100%;
    right: -90%; } }
@-webkit-keyframes indeterminate-short {
  0% {
    left: -200%;
    right: 100%; }
  60% {
    left: 107%;
    right: -8%; }
  100% {
    left: 107%;
    right: -8%; } }
@keyframes indeterminate-short {
  0% {
    left: -200%;
    right: 100%; }
  60% {
    left: 107%;
    right: -8%; }
  100% {
    left: 107%;
    right: -8%; } }
</style>  
	<script>
function subscribe(){
	//start loading
	$('#loading').show();
	//ajax call
	var info = $('#signupform').serialize();
$.ajax({

    url : 'auth.cfm?register&'+info,
     success : function(result) {
                  var data = JSON.parse(result);
                   if (data[0].isUser == true) {$("#myModal").modal();} 
                   else {$('#loading').hide(); document.getElementById('errors').innerHTML = 'An Account with this email already exists!'} 
    },
    error : function(xhr)
    {
        alert("Request: "+ xhr.responseText);
    }
});

}
	</script>
</head>

<body>
	<div class="image-container set-full-height" style="background-image: url('assets/img/wizard-profile.jpg')">
	    <!--   Creative Tim Branding   -->
	    <a href="index.html">
	         <div class="logo-container">
	            <div class="logo">
	                <img src="img/logo.png">
	            </div>
	            <div class="brand">
Smart Buy
	            </div>
	        </div>
	    </a>

		<!--  Made With Material Kit  -->


	    <!--   Big container   -->
	    <div class="container">
	        <div class="row">
		        <div class="col-sm-8 col-sm-offset-2">
		            <!--      Wizard container        -->
		            <div class="wizard-container">
		                <div class="card wizard-card" data-color="green" id="wizardProfile">
		                    <form id="signupform" action="auth.cfm" method="">
		                <!--        You can switch " data-color="purple" "  with one of the next bright colors: "green", "orange", "red", "blue"       -->

		                    	<div class="wizard-header">
		                        	<h3 class="wizard-title">
		                        	   Build Your Profile
		                        	</h3>
									<h5>enjoy our sales and special events. onclick checkout is available!</h5>
																				 <div class="progress" id="loading" style="display:none">
      <div class="indeterminate" ></div>
  </div>
  <div id="errors" style="color:#cc121b"></div>
		                    	</div>
								<div class="wizard-navigation">
									<ul>
			                            <li><a href="#about" data-toggle="tab">Account</a></li>
			                            <li><a href="#address" data-toggle="tab">Address</a></li>
			                            <li><a href="#account" data-toggle="tab">Subscription</a></li>
			                        </ul>
								</div>

		                        <div class="tab-content">
		                            <div class="tab-pane" id="about">
		                              <div class="row">
		                                	<h4 class="info-text"> Let's start with the basic information</h4>

		                                	<div class="col-sm-4 col-sm-offset-1">
		                                    	<div class="picture-container">
		                                        	<div class="picture">
                                        				<img src="assets/img/default-avatar.png" class="picture-src" id="wizardPicturePreview" title=""/>
		                                            	<input type="file" id="wizard-picture">
		                                        	</div>
		                                        	<h6>Choose Picture</h6>
		                                    	</div>
		                                	</div>
		                                	<div class="col-sm-6">
												<div class="input-group">
													<span class="input-group-addon">
														<i class="material-icons">face</i>
													</span>
													<div class="form-group label-floating">
			                                          <label class="control-label">First Name <small>(required)</small></label>
			                                          <input name="firstname" type="text" class="form-control">
			                                        </div>
												</div>

												<div class="input-group">
													<span class="input-group-addon">
														<i class="material-icons">lock</i>
													</span>
													<div class="form-group label-floating">
													  <label class="control-label">Password <small>(required- min 5 char)</small></label>
													  <input name="Newpassword" id="Newpassword" type="password" class="form-control">
													</div>
												</div>
												<div class="input-group">
													<span class="input-group-addon">
														<i class="material-icons">lock</i>
													</span>
													<div class="form-group label-floating">
													  <label class="control-label">Confirm password<small>(required)</small></label>
													  <input name="Cpassword" type="password" class="form-control">
													</div>
												</div>
		                                	</div>
		                                	<div class="col-sm-10 col-sm-offset-1">
												<div class="input-group">
													<span class="input-group-addon">
														<i class="material-icons">email</i>
													</span>
													<div class="form-group label-floating">
			                                            <label class="control-label">Email <small>(required)</small></label>
			                                            <input name="email" type="email" class="form-control">
			                                        </div>
												</div>
		                                	</div>
		                            	</div>
		                            </div>
		                            <div class="tab-pane" id="address">
		                                <div class="row">
		                                    <div class="col-sm-12">
		                                        <h4 class="info-text"> Please enter billing address </h4>
		                                    </div>
		                                    <div class="col-sm-3 col-sm-offset-1">
	                                        	<div class="form-group label-floating">
	                                        		<label class="control-label">Phone</label>
	                                    			<input type="text" name="Cphone" class="form-control">
	                                        	</div>
		                                    </div>
		                                    <div class="col-sm-7">
		                                        <div class="form-group label-floating">
		                                            <label class="control-label">Street Address</label>
		                                            <input type="text" name="street" class="form-control">
		                                        </div>
		                                    </div>
		                                    <div class="col-sm-5 col-sm-offset-1">
		                                        <div class="form-group label-floating">
		                                            <label class="control-label">City</label>
		                                            <input type="text" name="city" class="form-control">
		                                        </div>

		                                    </div>
		                                    <cfset result = application.pageservice.getstate() />
		                                      <div class="col-sm-2 label-floating">
		                                        <div class="form-group label-floating">
		                                            <label class="control-label">State</label>
		                                            <select name="state" class="form-control">
		                                            	 <option value=""> state </option>

		                                            		<cfoutput query="result" >
		                                            		<option value="#name#">#abbrev#</option>
		                                            		</cfoutput>

		                                            </select>
		                                        </div>

		                                        
		                                    </div>
		                                    <div class="col-sm-3 label-floating">
		                                        <div class="form-group label-floating">
		                                            <label class="control-label">Zip-code</label>
		                                            <input type="text" name="zip" class="form-control">
		                                        </div>
		                                        
		                                    </div>
		                                    <div class="col-sm-5 col-sm-offset-1">
		                                        <div class="form-group label-floating">
		                                            <label class="control-label">Country</label>
	                                            	<select name="country" class="form-control">
														<option disabled="" selected=""></option>
														<option value="USA"> United States of America </option>
	                                                	<option value="Afghanistan"> Afghanistan </option>
	                                                	<option value="Albania"> Albania </option>
	                                                	<option value="Algeria"> Algeria </option>
	                                                	<option value="American Samoa"> American Samoa </option>
	                                                	<option value="Andorra"> Andorra </option>
	                                                	<option value="Angola"> Angola </option>
	                                                	<option value="Anguilla"> Anguilla </option>
	                                                	<option value="Antarctica"> Antarctica </option>
	                                                	<option value="...">...</option>
	                                            	</select>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                            <div class="tab-pane" id="account">
		                                <h4 class="info-text"> Get our coupons and items for sale? </h4>
		                                <div class="row">
		                                    <div class="col-sm-10 col-sm-offset-1">
		                                        <div class="col-sm-4">
		                                            <div class="choice" data-toggle="wizard-checkbox">
		                                                <input type="checkbox" name="newsletter" value="1">
		                                                <div class="icon">
		                                                    <i class="fa fa-newspaper-o""></i>
		                                                </div>
		                                                <h6>News Letter</h6>
		                                            </div>
		                                        </div>
		                                        <div class="col-sm-4">
		                                            <div class="choice" data-toggle="wizard-checkbox">
		                                                <input type="checkbox" name="sales" value="1">
		                                                <div class="icon">
		                                                    <i class="fa fa-shopping-bag"></i>
		                                                </div>
		                                                <h6>Sale & Clearence</h6>
		                                            </div>
		                                        </div>
		                                        <div class="col-sm-4">
		                                            <div class="choice" data-toggle="wizard-checkbox">
		                                                <input type="checkbox" name="none" value="none">
		                                                <div class="icon">
		                                                    <i class="fa fa-times-circle"></i>
		                                                </div>
		                                                <h6>None</h6>
		                                            </div>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                        <div class="wizard-footer">
		                            <div class="pull-right">
		                                <input type='button' class='btn btn-next btn-fill btn-success btn-wd' name='next' value='Next' />
		                                <input type='button' class='btn btn-finish btn-fill btn-success btn-wd' onclick="subscribe()" name='finish' value='Finish' />
		                            </div>

		                            <div class="pull-left">
		                                <input type='button' class='btn btn-previous btn-fill btn-default btn-wd' name='previous' value='Previous' />
		                            </div>
		                            <div class="clearfix"></div>
		                        </div>
		                    </form>
		                </div>
		            </div> <!-- wizard container -->
		        </div>
	        </div><!-- end row -->
	    </div> <!--  big container -->

	    <div class="footer">

	    </div>
	</div>
  <!-- Modal -->
  <div class="modal fade" id="myModal" data-keyboard="false" data-backdrop="static" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title" style="color:green">Awesome!</h4>
        </div>
        <div class="modal-body">
          <p>Your account has been created successfully! please check your email to finalize account setup. Note, that you can use our service without verification; however, email verification will help us enhance your shopping experience. Thank you</p>
        </div>
        <div class="modal-footer">
<a href="index.cfm"><button type="button" class="btn btn-default">Home</button></a>
        </div>
      </div>
      
    </div>
  </div>
  
</div>

</body>
	<!--   Core JS Files   -->
    <script src="assets/js/jquery-2.2.4.min.js" type="text/javascript"></script>
	<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="assets/js/jquery.bootstrap.js" type="text/javascript"></script>

	<!--  Plugin for the Wizard -->
	<script src="assets/js/material-bootstrap-wizard.js"></script>

    <!--  More information about jquery.validate here: http://jqueryvalidation.org/	 -->
	<script src="assets/js/jquery.validate.min.js"></script>

</html>
