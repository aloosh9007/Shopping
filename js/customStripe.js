

function pay(){
var form = document.getElementById('payment-form');
var userlog = document.getElementById('userlog').value;
var x = document.getElementById('different')
if(userlog == "true"){
	if(!x.checked){RunStripe();}else{if(form.checkValidity()){RunStripe();}}
}
else{
		if(form.checkValidity()){RunStripe();}
}



}
//Runstripe function 


function stripeTokenHandler(token) {
  // Insert the token ID into the form so it gets submitted to the server
	$("#myModal").modal();
	 var form = document.getElementById('payment-form');
  var hiddenInput = document.createElement('input');
  hiddenInput.setAttribute('type', 'hidden');
  hiddenInput.setAttribute('name', 'stripeToken');
  hiddenInput.setAttribute('value', token.id);
  form.appendChild(hiddenInput);

  // Submit the form
 
form.submit();
  
}
function RunStripe(){
// Create a token or display an error when the form is submitted.
// add listener for checkbox for different address 
  var form = document.getElementById('payment-form');

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


}//end function 

