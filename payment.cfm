
<!DOCTYPE html>
<html>
<head>
  <title></title>
  <script src="https://js.stripe.com/v3/"></script>
</head>
<body>

<form action="stripe.cfm" method="post" id="payment-form" class="clearfix">
  <div class="form-group">
    <label for="card-element">
      Credit or debit card
    </label>
    <div id="card-element" class="form-group">
      <!-- a Stripe Element will be inserted here. -->
    </div>

    <!-- Used to display form errors -->
    <div id="card-errors" role="alert"></div>
  </div>

  <button id="StripeElement">Submit Payment</button>
</form>

<!--- stripe start here --->
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