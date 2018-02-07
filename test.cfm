<head>
<script   src="http://code.jquery.com/jquery-3.3.1.min.js"   integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="   crossorigin="anonymous"></script> 
<script>
function addnew(itemid, qty, price){
 $.ajax({url: "cartAjax.cfm?additem&itemid="+itemid+"&qty="+qty+"&price="+price,
	success: function(data, textStatus) {
    	$("#resultsDiv").html(data);},
        	error: function(xhr){
            	alert("An error occured: " + xhr.status + " " + xhr.statusText);
        			}});
}
</script>
<script type="text/javascript">
	function delnew(itemid){
		$.ajax({url: "cartAjax.cfm?delitem&itemid="+itemid,
        	success: function(data, textStatus) {
        		$("#resultsDiv").html(data);},
        			error: function(xhr){
            			alert("An error occured: " + xhr.status + " " + xhr.statusText);
        					}});		
	}
</script>
</head>

<!-- Start Cart services -->
<cfif isDefined('session.shoppingCart.item')>
	<cfelse>
		<Cfset session.shoppingCart = {}>
			<cfset session.shoppingCart.item = {}>
				</cfif>
					<!-- /cart service -->
<!-- /end main set up -->

					<!-- get item info  -->
						<cfquery name="getall">
							SELECT * FROM Items
								</cfquery>
								<!-- div to desplay results ((will be replaced by actual cart)) -->	
									<div id="resultsDiv"></div>
									<cfdump var="#session#">
<ul>
	<cfoutput query="getall">
		<li><button onclick="addnew(#itemid#, 1, #price#)">Add</button><button onclick="delnew(#itemid#)">Delete</button>#itemname# - #shortdescription#</li>
				</cfoutput>
					</ul>