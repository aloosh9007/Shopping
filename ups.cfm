      <cfhttp
        result="charge"
        method="GET"
        url="https://wwwcie.ups.com/ups.app/xml/Rate"
        username="ali.a.sanad@gmail.com"
        password="soson3o3o1A@"
        access="#application.upskey#"
        >


        <!--- Our donation amount (in cents). --->
        <cfhttpparam
          type="formfield"
          name="shipfrom"
          value="IGT Inc"
          />
        <!--- Our currency (only USD if supported. --->
        <cfhttpparam
          type="formfield"
          name="addressfrom"
          value="800 Ravinia Place"
          />
        <!---
          For the "Card" value, we will provide the Stripe
          transaction token that we received from the client-
          side API call.
        --->
        <cfhttpparam
          type="formfield"
          name="state"
          value="il"
          />

        <!---
          A description of the transaction to show up in
          OUR records for tracking purposes. It is
          considered a good practice to add the Email
          address here in order to follow up if necessary.
        --->
<cfhttpparam
          type="formfield"
          name="zip"
          value="60462"
          />

      </cfhttp>


  <cfdump var="#charge.fileContent#" />



   