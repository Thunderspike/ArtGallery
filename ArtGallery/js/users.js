function register() {
	var userData = {
		email: document.getElementById("email").value,
		fname: document.getElementById("fname").value,
		lname: document.getElementById("lname").value,
		phone: document.getElementById("phone").value,
		pass1: document.getElementById("pass1").value,	
		pass2: document.getElementById("pass2").value,	
		street1: document.getElementById("street1").value,	
		street2: document.getElementById("street2").value,	
		city: document.getElementById("city").value,	
		state: document.getElementById("state").value,
		zipcode: document.getElementById("zipcode").value
	};
	$.ajax({
		method: "POST",
		url: "/artgallery/cfc/login.cfc?method=register",
		data: { userData: JSON.stringify(userData) },
		success: function(data, textStatus, jqXHR){
			data = $.parseJSON(jqXHR.responseText);
			if(data.status == 'error'){
				$("#errorMessageContainer").html(data.message);
				$("#errorMessageModal").modal();
				}
			else
			{
				$("#SuccessMessageContainer").html('<h2>Success.</h2><p>Your account was created.</p>');
				$("#SuccessMessageModal").modal('show');
				$('#SuccessMessageModal').one('hidden.bs.modal', function (e) {
				  window.location = 'login.cfm';
				})
				//setTimeout(function(){}, 5000);
			}
		},
		error: function(jqXHR, textStatus, errorThrown){
			alert(textStatus)
		}
	})
	//alert(userData.email);
}
function login() {
	var userData = {
		email: document.getElementById("email").value,
		password: document.getElementById("pass").value
	};
	$.ajax({
		method: "POST",
		url: "/artgallery/cfc/login.cfc?method=login",
		data: { userData: JSON.stringify(userData) },
		success: function(data, textStatus, jqXHR){
			data = $.parseJSON(jqXHR.responseText);
			if(data.status == 'error'){
				$("#errorMessageContainer").html(data.message);
				$("#errorMessageModal").modal();
				}
			else if (data.status == 'sucess') {
				if(typeof(afterloginsuccess) == 'undefined')
					afterloginsuccess = 'myGallery.cfm';
				window.location = afterloginsuccess;
			}
		},
		error: function(jqXHR, textStatus, errorThrown){
			alert(textStatus)
		}
	})
	//alert(userData.email);
}

function loginScreen(){
	$("#loginModal").modal();
}
