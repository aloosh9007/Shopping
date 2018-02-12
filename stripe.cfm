<!DOCTYPE html>
<html>
<head>
  <title></title>
<script   src="http://code.jquery.com/jquery-2.2.4.min.js"></script> 
</head>
<body>



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

<style>
/**
 * The CSS shown here will not be introduced in the Quickstart guide, but shows
 * how you can use CSS to style your Element's container.
 */
.StripeElement {
  background-color: white;
  height: 40px;
  padding: 10px 12px;
  border-radius: 4px;
  border: 1px solid transparent;
  box-shadow: 0 1px 3px 0 #e6ebf1;
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
<form action="stripe.cfm" method="POST">
  <script
    src="https://checkout.stripe.com/checkout.js" class="stripe-button"
    data-key="pk_test_e8WG9BIIRIdaZuqVbUbxJvlI"
    data-amount="999"
    data-name="Demo Site"
    data-description="Example charge"
    data-image="https://stripe.com/img/documentation/checkout/marketplace.png"
    data-locale="auto">
  </script>
</form>

<script src="https://js.stripe.com/v3/"></script>
<div class="row">
<form action="stripe.cfm" method="post" id="payment-form">
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

  <button id="StripeElement">Submit Payment</button>
</form>
</div>

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
<script>
function stripeTokenHandler(token) {
  // Insert the token ID into the form so it gets submitted to the server
  var form = document.getElementById('payment-form');
  var hiddenInput = document.createElement('input');
  hiddenInput.setAttribute('type', 'hidden');
  hiddenInput.setAttribute('name', 'stripeToken');
  hiddenInput.setAttribute('value', token.id);
  form.appendChild(hiddenInput);

  // Submit the form
  form.submit();
}
// Create a token or display an error when the form is submitted.
  var form = document.getElementById('payment-form');
form.addEventListener('submit', function(event) {
  event.preventDefault();

  stripe.createToken(card).then(function(result) {
    if (result.error) {
      // Inform the customer that there was an error
      var errorElement = document.getElementById('card-errors');
      errorElement.textContent = result.error.message;
    } else {
      // Send the token to your server
      stripeTokenHandler(result.token);
    }
  });
});

</script>

</body>
</html>
