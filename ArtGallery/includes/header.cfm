<!DOCTYPE html>
<html>
<head>
<title>Art Gallery</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="refresh" content="0; url=https://localhost/ArtGallery/">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="shortcut icon" href="img/banner/browserLogo.png"/>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/artgallery/css/myStyle2.css" />
<script src="/artgallery/js/users.js"></script>
<script src="/artgallery/js/cart.js"></script>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60" style="">
<nav class="navbar navbar-default navbar-fixed-top w3-card-2">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar"> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
			<a class="navbar-brand" href="./index.cfm">
			<div class="w3-container"> <span class="w3-tag w3-xxlarge w3-red" style="font-weight:bold;">Ajazi</span> <span class="w3-tag w3-large" style="font-weight:bold;">Gallery</span> </div>
			</a> </div>
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav navbar-right">
				<li> <a href="/artgallery/index.cfm#painting">Artworks</a> </li>
				<li> <a href="/artgallery/piece.cfm"><i style="font-size: 1.5em" class="fa fa-star"></i> Venture </a> </li>
				<cfoutput>
					<cfif session.auth neq "">
						<cfif session.usertype eq 1>
							<li><a href="/artgallery/admin/index.cfm">Admin</a> </li>
						</cfif>
						<li id="signout"> <a href="/artgallery/Login.cfm">Sign Out</a> </li>
						<cfelse>
						<li id="signInLink"> <a href="/artgallery/Login.cfm">Sign In</a> </li>
					</cfif>
				</cfoutput>
				<li> 
					<cfif ListLast(cgi.SCRIPT_NAME, '/') eq 'checkout.cfm'>
						<a href="#" onClick="showCart();return false;"><i style="font-size: 1.5em" class="fa fa-shopping-cart" aria-hidden="true"></i> <span id="cartCounter"></span> My Cart</a>
					<cfelse>
					<a href="#" onClick="showCart(); return false;"><i style="font-size: 1.5em" class="fa fa-shopping-cart" aria-hidden="true"></i> <span id="cartCounter"></span> My Cart</a>
					</cfif> </li>
			</ul>
		</div>
	</div>
</nav>
