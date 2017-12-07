 var cart = [];
$(function(){
	getCart();	
})
function getCart(){
	$.ajax({
		method: "POST",
		url: "/artgallery/cfc/cart.cfc?method=getCart",
		success: function(data, textStatus, jqXHR){
			cart = $.parseJSON(jqXHR.responseText);
			parseCart();
		},
		error: function(jqXHR, textStatus, errorThrown){
			alert(textStatus)
		}
	})
}

function addToCart(itemID){
	$.ajax({
		method: "POST",
		url: "/artgallery/cfc/cart.cfc?method=addToCart&itemID="+itemID,
		success: function(data, textStatus, jqXHR){
			getCart();
		},
		error: function(jqXHR, textStatus, errorThrown){
			alert(textStatus)
		}
	})
}

function removeFromCart(itemID){
	$.ajax({
		method: "POST",
		url: "/artgallery/cfc/cart.cfc?method=removeFromCart&itemID="+itemID,
		success: function(data, textStatus, jqXHR){
			getCart();
		},
		error: function(jqXHR, textStatus, errorThrown){
			alert(textStatus)
		}
	})
}

function parseCart(){
		$("#cartCounter").html(cart.length);
		$("#checkoutbtn").prop('disabled',false);
		if(cart.length == 0){
			if($("#checkouttable").length > 0)
				window.location='/artgallery/index.cfm';
			$("#checkoutbtn").prop('disabled',true);
			return $("#cartContent").html($("<p class='alert alert-info'>Cart is empty</p>"));
		}
		var tbl = $("<table class='table table-highlight table-striped'><thead><tr><th>Painting</th><th style='text-align: right'>Price</th><th></th></tr></thead><tbody></tbody></table>");
	var total = 0;
	$(cart).each(function(i, e){
			total += e.PRICE;
			$(tbl).find("tbody").append($("<tr><td style='text-align: left'>"+e.NAME+"</td><td style='text-align: right'>"+e.PRICE+"</td><td><button onClick='removeFromCart("+e.ID+")' class='text-danger btn btn-link'><i class='fa fa-times' aria-hidden='true'></i> Remove</button></td></tr>"));
	})
	$(tbl).append($("<tfoot><tr><th style='padding-top: 20px'>TOTAL: </th><td style='text-align: right; padding-top: 20px'>$ "+total+"</td></tr></tfoot>"));
	$("#cartContent").html(tbl);
}

function showCart() {
	$("#cartModal").modal();
	
}
function processOrder(form)
{
	var f = $(form).serialize();
	$.ajax({
		method: "POST",
		url: "/artgallery/cfc/cart.cfc?method=processOrder",
		data:f,
		success: function(data, textStatus, jqXHR){
			$("#SuccessMessageContainer").html('<h2>Thank you for your order.</h2><p>Check your email for the order confirmation and receipt.</p>');
			$("#SuccessMessageModal").modal('show');
			//getCart();
		},
		error: function(jqXHR, textStatus, errorThrown){
			alert(textStatus)
		}
	})
}
