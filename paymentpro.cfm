
<cfif structKeyExists(form, 'stripeToken') >
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
          value="999"
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
          value="#form.stripeToken#"
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
<cfoutput>#response.error.message#</cfoutput>
<cfelse>
<cfdump var="#response#" />
</cfif>
    </cfif>
