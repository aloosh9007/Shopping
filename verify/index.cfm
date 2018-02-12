
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
    padding: 5px;
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

.success {background-color: #4CAF50;} /* Green */
.success:hover {background-color: #46a049;}
</style>
</head>
<body>
<cfif isDefined('url.code') and isDefined('url.key')>
<cfquery name="verify">
select * from users
where activationcode = '#url.code#'
and usersid = '#url.key#'
</cfquery>
<cfif #verify.recordcount# eq 1>
<cfquery>
UPDATE users
 SET activated = 1
where activationcode = '#url.code#'
and usersid = '#url.key#'
</cfquery>
<div class="card">
  <div class="container">
  <h2 style="color:green">Success!</h2>
  
    <h4><b>Thank you!</b></h4> 
  <div>  <p align="center">Your account is activated and verified.</p></div>
<div align="center">
  <a class="btn btn-primary" href="../index.cfm" role="button">
<button class="btn success">Return Home!</button>
</a>
</div>
  </div>
</div>

<cfelse>
error
</cfif>
<cfelse>

	<cflocation url="../index.cfm">

</cfif>
</body></html>