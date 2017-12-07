<cfif isdefined('form.tokenfield')>
	<cfset session.tokenfield = DeserializeJSON(form.tokenfield)/>
	<cfset session.afterloginsuccess = cgi.SCRIPT_NAME/>
	<cfif session.auth eq ''>
		<cflocation url="login.cfm"/>
	<cfelse>
		<cfset session.afterloginsuccess = ''/>
	</cfif>
<cfelseif not IsStruct(session.tokenfield)>
	<h2>Invalid Info</h2>
	<p>Go Back and try again.</p>
	<cfabort/>
</cfif>
<cfset session.afterloginsuccess = ""/>
<cfset user = application.utils.QueryToArray(CreateObject('cfc.login').GetUser(Session.auth))[1]/>
<cfinclude template="includes/header.cfm" />
<div class="container"> <br>
	<br>
	<h1 class="heading"> <i style="font-size: 1.5em" class="fa fa-address-card-o" aria-hidden="true"></i> Checkout (Shipping Info)</h1>
	<div class="row"> 
		<cfoutput>
		<form class="form-horizontal" onsubmit="processOrder(this); return false;">
			<div class="form-group">
				<label class="control-label col-sm-2">STREET1: </label> <div class="col-sm-5"><input type="text" class="form-control" value="#user.STREET1#" name="STREET1"/></div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">STREET2: </label><div class="col-sm-5"><input type="text" class="form-control" value="#user.STREET2#" name="STREET2"/></div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">CITY: </label><div class="col-sm-5"><input type="text" class="form-control" value="#user.CITY#" name="CITY"/></div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">STATE: </label><div class="col-sm-5"><input type="text" class="form-control" value="#user.STATE#" name="STATE"/></div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">ZIPCODE: </label><div class="col-sm-5"><input type="text" class="form-control" value="#user.ZIPCODE#" name="ZIPCODE"/></div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">TELEPHONE: </label><div class="col-sm-5"><input type="text" class="form-control" value="#user.TELEPHONE#" name="TELEPHONE"/></div>
				</div>
			<div class="form-group">
				<label class="control-label col-sm-2"></label>
				<div class="col-sm-5">
					<button class="btn btn-lg btn-success">Complete Order</button>
				</div>
			</div>
		</form>
		</cfoutput>
	</div>
</div>
<cfinclude template="includes/footer.cfm" />