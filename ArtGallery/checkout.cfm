
<cfinclude template="includes/header.cfm" />
<div class="container">
<br>
<br>
<h1 class="heading"> <span class="glyphicon glyphicon-th-large"></span> Checkout </h1>
<div class="row">
	<table class="table table-condensed table-hover" id="checkouttable"> 
		<thead>
			<tr>
				<th colspan="2">Name</th> <th class=" pull-right">Price</th>
			</tr>
		</thead>
		<tbody>
		<cfoutput>
			<cfset total = 0/>
			<cfloop array="#DeserializeJSON(CreateObject('cfc.cart').getCart())#" index="item">
				<tr>
					<td style="vertical-align:bottom;"><div class="pull-left" style="background: url('imgs/art/#item.image#'); background-size: 60px 80px; background-repeat: no-repeat; width:60px; height:80px; "></div>	</td>
					<td style="vertical-align:bottom;"><h2 class=" pull-left">#item.name#</h2>
					</td>
					<td style="vertical-align:bottom;"><h3  class=" pull-right" style="letter-spacing:-1px;">$ #NumberFormat(item.price, "00,000")#</h3></td>
					<td style="vertical-align:bottom;"></td>
				</tr>
				<cfset total += item.price/>
			</cfloop>
		</tbody>
		<tfoot class="w3-border-top">
			<tr style="margin-top:40px;"><th colspan="2"><h3><strong>TOTAL :</strong></h3> </th><th class="pull-right"><h3><strong>$ #NumberFormat(total, "00,000")#</strong></h3></th></tr>
			<tr>
				<th colspan="3" style="text-align:center;"><button id="customButton" class="btn btn-success btn-lg">Purchase</button></th>
			</tr>
		</tfoot>
		</cfoutput>
	</table>
	
		<script src="https://checkout.stripe.com/checkout.js"></script>
	<form style="display:none;" action="processcheckout.cfm" method="post" id="paymentSuccessHandler">
		<input name="tokenfield" value="" id="tokenfield">
	</form>

		<script>
		var handler = StripeCheckout.configure({
		  key: 'pk_test_6pRNASCoBOKtIshFeQd4XMUh',
		  image: 'imgs/banner.jpg',
		  locale: 'auto',
		  token: function(token) {
			// You can access the token ID with `token.id`.
			// Get the token ID to your server-side code for use.
			$("#tokenfield").val(JSON.stringify(token)).parent().submit();
			
		  }
		});
		
		document.getElementById('customButton').addEventListener('click', function(e) {
		  // Open Checkout with further options:
		  handler.open({
			name: 'Art Gallery',
			description: 'Enter your payment info.',
			zipCode: true,
			amount: <cfoutput>#total#</cfoutput>
		  });
		  e.preventDefault();
		});
		
		// Close Checkout on page navigation:
		window.addEventListener('popstate', function() {
		  handler.close();
		});
		</script>
	</form>
</div>
</div>
<cfinclude template="includes/footer.cfm" />