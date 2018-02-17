<cfif structKeyExists(session, 'shoppingcart')>
<cfif structKeyExists(url, 'stripeToken') >
<!--- strip process start --->
          <cfset itemstotal = application.cart.carttotal()>
            <cfset total = Ceiling((itemstotal * 1.087) * 100) />
      <cfhttp
        result="charge"
        method="post"
        url="https://api.stripe.com/v1/charges"
        username="#application.stripeSecretKey#"
        password="">

        <!--- Our donation amount (in cents). --->
        <cfhttpparam
          type="formfield"
          name="amount"
          value="#total#"
          />

        <!--- Our currency (only USD if supported. --->
        <cfhttpparam
          type="formfield"
          name="currency"
          value="usd"
          />

        <!---
          For the "Card" value, we will provide the Stripe
          transaction token that we received from the client-
          side API call.
        --->
        <cfhttpparam
          type="formfield"
          name="card"
          value="#url.stripeToken#"
          />

        <!---
          A description of the transaction to show up in
          OUR records for tracking purposes. It is
          considered a good practice to add the Email
          address here in order to follow up if necessary.
        --->


      </cfhttp>
<cfset response = deserializeJSON( charge.fileContent ) />
<cfif structKeyExists(response, 'error') >
<cfdump var="#response#" />
<cflocation url="checkout.cfm?declined&message=#response.error.message#" /> 
<cfoutput>#response.error.message#</cfoutput>
<cfelse>
<cfdump var="#response#" />
</cfif>


<!--- / strippe process end --->
  <!--- begin checkout process if cart and token --->
        
                <cfif isDefined('session.loggedUser.usersid')><!--- if user is logged in --->
                    <cfif isDefined('form.differentAddress')><!--- if user logged in but wants to ship to different address --->
                                  <cfquery name="getad">
                                  select * from users where usersid = '#session.loggedUser.usersid#' 
                                  </cfquery>
                                  <cfquery name="addrecord">
                                  insert into orders (usersid, address, city, state, zip, stripeConfirmation, date, userfirstname, shipping, amount, email, phone)
                                  values ('#session.loggedUser.usersid#','#getad.address#','#getad.city#','#getad.state#','#getad.zip#','#response.id#','<cfqueryparam value="#now()#" cfsqltype="cf_sql_timestamp">' ,'#session.loggedUser.firstname#','#url.Shipping#','#total#','#session.loggedUser.email#', '#getad.phonenumber#')
                                  </cfquery>
                                  <cfquery name="getorder">
                                  select max(orderid) as orderid from orders limit 1 
                                  </cfquery>
                                  <cfloop collection="#session.shoppingCart.item#" item="key">
                                  <cfquery name="insertItems">
                                  insert into orderitem (orderid, itemid, qty )
                                  values('#getorder.orderid#','#session.shoppingcart.item[key].itemid#','#session.shoppingcart.item[key].qty#') 
                                  </cfquery>
                                  </cfloop>
                                              <cfset name = '#session.loggedUser.userfirstname#' />
                                              <cfset email = '#session.loggedUser.email#' />
                                                          
                </cfif><!--- / if different address --->

                                      <cfquery name="getaddress">
                                        select * from users where usersid = '#session.loggedUser.usersid#'
                                        </cfquery>
                                        <cfquery name="addrecord">
                                        insert into orders (usersid, address, city, state, zip, stripeConfirmation, date, userfirstname, shipping, amount, email, phone)
                                        values ('#session.loggedUser.usersid#','#url.address#','#url.city#','#url.state#','#url.zip#','#response.id#',<cfqueryparam value="#now()#" cfsqltype="cf_sql_timestamp"> ,'#session.loggedUser.firstname#','#url.Shipping#','#total#','#session.loggedUser.email#','#getaddress.phonenumber#')
                                        </cfquery>
                                        <cfquery name="getorder">
                                        select max(orderid) as orderid from orders
                                        limit 1 
                                        </cfquery>
                                        <cfloop collection="#session.shoppingCart.item#" item="key">
                                        <cfquery name="insertItems">
                                        insert into orderitem (orderid, itemid, qty )
                                        values('#getorder.orderid#','#session.shoppingcart.item[key].itemid#','#session.shoppingcart.item[key].qty#') 
                                        </cfquery>
                                        </cfloop>  
                      <cfset name = '#session.loggedUser.userfirstname#' />
                      <cfset email = '#session.loggedUser.email#' />               
            <cfelseif not isDefined('session.loggedUser')><!--- cfelse user not logged in --->
                              <cfquery name="addrecord">
                                        insert into orders (usersid, address, city, state, zip, stripeConfirmation, date, userfirstname, shipping, amount, email, phone)
                                        values ('0','#url.address#','#url.city#','#url.state#','#url.zip#','#response.id#',<cfqueryparam value="#now()#"cfsqltype="cf_sql_timestamp"> ,'#url.firstname# #url.lastname#','#url.Shipping#','#total#','#url.email#', '#url.tel#')
                                        </cfquery>
                                        <cfquery name="getorder">
                                        select max(orderid) as orderid from orders limit 1 
                                        </cfquery>
                                        <cfloop collection="#session.shoppingCart.item#" item="key">
                                        <cfquery name="insertItems">
                                        insert into orderitem (orderid, itemid, qty )
                                        values('#getorder.orderid#','#session.shoppingcart.item[key].itemid#','#session.shoppingcart.item[key].qty#') 
                                        </cfquery>
                                        </cfloop>
                                                                    <cfset name = '#url.firstname# #url.lastname#' />
                                                                    <cfset email = '#url.email#' />
            </cfif><!--- /cfif structure for logged in --->
<!--- now lets generate email for the user to confirm that order was placed --->
<!--- first we need to get the order placed --->
<cfquery name="getinfo"> SELECT * FROM Orders ORDER BY orderid DESC LIMIT 1;</cfquery>
<!--- then using cfmail we will set up the email to the user --->
  <cfmail from="Support@IGT.com" to="#email#" subject="Order Confirmation E-mail" type="html">
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
##list {
  margin-top: 20px;
}
ul {
  list-style-type: none;
  max-width: 500px;
  margin: 0 auto;
  margin-top: 50px;
  padding: 0 15px;
}
li {
  background: white;
  border-radius: 8px;
  margin-top: 20px;
  overflow: hidden;
  padding: 20px;
  position: relative;
}
.avatar {
  background: ##eaeaea;
  border-radius: 4px;
  display: inline-block;
  width: 80px;
  height: 80px;
}
p {
 color: gray;
 font-family: Geneva,Tahoma,Verdana,sans-serif;
  font-size: 14px;
  font-style: normal;
  font-variant: normal;
  font-weight: 400;
  line-height: 19.99px;

}
.lines {
  display: inline-block;
  height: 80px;
  margin-left: 20px;
  width: calc(100% - 100px);
}
.lines:before, .lines:after {
  background: ##eaeaea;
  content: ' ';
  display: block;
  margin-bottom: 10px;
  width: 100%;
  height: 10px;
}
##destroy {
  left: 0;
  opacity: 0;
  position: absolute;
  top: 0;
  width: 100%;
}
svg {
  opacity: 0;
}
path {
  transform-origin: 50% 50%;
}


</style>
</head>
<body>
<div class="card">
  <div class="container">
        <h2 style="color:orange">You order have been placed!</h2>  
            <h4><b>Thank you!</b></h4>
              <div>
              <p align="center">Dear #name#,</p></div>
                  <div><p align="center">Once your item has shipped, we will notify you with an email containing the tracking number. For mroe information please visit the contact us page.  Thank you!</p></div>
                  <div align="center">
                      <a class="btn btn-primary" href="http://192.168.1.66:8500/Shopping/inde.cfm" role="button">
                  <button class="btn success">Contact Us!</button>
                </a>
              </div>
              </div>
          </div>
          <h4 style="color: ##3f6eba">Order Details:</h4>
    <div id="list">
        <ul>
          <li>
          <cfloop collection="#session.shoppingCart.item#" item="key">
            <h5>#session.shoppingcart.item[key].itemname#</h5>
            <p>#session.shoppingcart.item[key].description#</p>
                  <p>#session.shoppingcart.item[key].qty# X $#session.shoppingcart.item[key].price#</p>
          </cfloop>
              </li>
            </ul>
          <h5 style="color: ##9e3b32">Total: $ #total#</h5>
          <small>tax and shipping included</small>
          </div>
                  <h4 style="color: ##3f6eba">Shipping Infomration:</h4>
          <p>Address: #getinfo.address#<br>
          #getinfo.city# , #getinfo.state# #getinfo.zip# </p>

      </body>
    </html> 
  </cfmail> 








  <!--- / checkout process if cart and token --->
</cfif>
<cfelse>
<cflocation url="index.cfm" />
</cfif>