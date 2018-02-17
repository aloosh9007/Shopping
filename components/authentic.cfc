<!-- auth component -->
<cfcomponent output="false">

	<!-- this is the validate user method -->
	<cffunction name="validateuser" access="public" returntype="array">
		<cfargument name="useremail" type="string" required="true" >
			<cfargument name="userpassword" required="true">
				<cfset var  aErrormessages = arrayNew(1) />
					<cfif NOT isValid(email, arguments.useremail)>	
						<cfset arrayAppend(aErrormessages, 'Please Provide a valid email')>
							</cfif>
								<cfif #arguments.userpassword# eq ''>
									<cfset arrayAppend(aErrormessages, 'Please Provide a  password')>
										</cfif>

	<cfreturn aErrormessages>
	</cffunction>
				<!-- this is the do login method -->
	<cffunction name="doLogin" returntype="any" access="remote">
		<cfargument name="useremail" type="string" required="true" >
			<cfargument name="userpassword" required="true">
				
					<cfquery name="rsloginuser">
						SELECT * from users
							where email = '#arguments.useremail#'
								and userpassword = '#arguments.userpassword#'
									and activated = 1
									</cfquery>
										<cfif #rsloginuser.recordcount# eq 1>
<cfset session.loggedUser = {'userfirstname' = '#rsloginuser.firstname#', 'userid' = '#rsloginuser.usersid#', email = '#rsloginuser.email#' } />
<cfif structKeyExists(session, 'loggedUser')>
<cfoutput>
[ { "isUser": true} ] 
</cfoutput>
</cfif>
	<cfelse>

<cfoutput>
[ { "isUser": false} ] 														
</cfoutput>
															</cfif>

	</cffunction>
				<!-- do logout method -->
	<cffunction name="dologout" returntype="void">
						<cfset structDelete(session, 'loggedUser') />
							

	</cffunction>
	<cffunction name="resgisteruser" access="remote" returntype="any">
		<cfargument name="firstname" required="true">
		<cfargument name="newpassword" required="true">
		<cfargument name="street" required="true">
		<cfargument name="city" required="true">
		<cfargument name="state" required="true">
		<cfargument name="zip" required="true">
		<cfargument name="Cphone" required="true">
		<cfargument name="email" required="true">
		<cfargument name="newsletter" >
		<cfargument name="sales" >

<!--- if information is valid --->


<CFSET charlist = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvw xyz1234567890" />
 <CFSET pw = "" />
 <CFLOOP INDEX="sub" FROM="1" TO="10">
 <CFSET pw = pw & Mid(charlist, RandRange(1, Len(charlist)),1)>
 </CFLOOP>
 <cfquery name="checkemail">
select * from users where email = '#arguments.email#'
</cfquery>
<cfif #checkemail.recordcount# eq 0>
		<cfquery>
		INSERT INTO users (firstname, userpassword, email, phonenumber, address, city, state, zip, activated, activationcode, newsletter, sales)
		VALUES ('#arguments.firstname#','#arguments.newpassword#','#arguments.email#','#arguments.Cphone#','#arguments.street#','#arguments.city#','#arguments.state#','#arguments.zip#',0,'#pw#', #arguments.newsletter#, #arguments.sales#);
		</cfquery>
		<cfquery name="getuser">
		SELECT * FROM users 
		ORDER BY usersid DESC
		LIMIT 1
		</cfquery>
				<cfmail 
				 from="Support@IGT.com" 
				 to="#arguments.email#" 
				 subject="Confirmation E-mail" type="html">



				<!DOCTYPE html>
				<html>
				<head>
				<meta name="viewport" content="width=device-width, initial-scale=1">
				<style>
				body {
				    font-family:  Helvetica;
				    font-size: 10pt;
				}

				.card {
				    box-shadow: 0 8px 16px 0 rgba(0,0,0,0.4);
				    transition: 0.3s;
				    width: 100%;
				    text-align: center;
				}

				.card:hover {
				    box-shadow: 0 16px 32px 0 rgba(0,0,0,0.8);
				}

				.container {
				    padding: 2px 16px;
				}
				.btn {
				    border: none;
				    color: white;
				    padding: 14px 28px;
				    font-size: 16px;
				    cursor: pointer;
				}

				.success {background-color: ##4CAF50;} 
				.success:hover {background-color: ##46a049;}
				</style>
				</head>
				<body>


				<div class="card">
				  <div class="container">
				  <h2 style="color:orange">Last Step!</h2>
				  
				    <h4><b>Thank you!</b></h4> 
				  <div>  <p align="center">  please click the link below to activate your account.</p></div>
				<div align="center">
				  <a class="btn btn-primary" href="http://192.168.1.66:8500/Shopping/verify/?code=#pw#&key=#getuser.usersid# " role="button">
				<button class="btn success">Confirm Email!</button>
				</a>
				</div>
				<div>
				<p align="center">Email verification will help us give you a better coustomer experience. Once you place an order we can email you tracking information and keep you posted in live time on where the package is. Also, you can receive coupons and sale events.</p></div>
				  </div>
				</div>


				</body>
				</html> 

 </cfmail> 
<cfoutput>
[ { "isUser": true} ] 
</cfoutput>
	<cfelse>

<cfoutput>
[ { "isUser": false} ] 														
</cfoutput>
</cfif>
	</cffunction>
</cfcomponent>