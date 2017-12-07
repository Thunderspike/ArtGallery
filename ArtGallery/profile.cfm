<cfinclude template="includes/header.cfm" />
<cfquery name="getUser" datasource="artgallery">
</cfquery>
<div class="container">

	<br>
	<br>
	<h1 class="heading"> <span class="glyphicon glyphicon-th-large"></span> Login </h1>
		<div class="row">
			<form action="Login.cfm" method="post" class="form-horizontal" onSubmit="login(); return false;">
				<div class="form-group">
					<label class="control-label col-sm-2">Email:</label>
					<div class="col-sm-5">
						<input type="email" required="required" class="form-control" placeholder="Enter Email" name="email" id="email"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2">Password:</label>
					<div class="col-sm-5">
						<input type="password" required="required" class="form-control" name="Pass" placeholder="Enter Password for Acess" id="pass"/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2"></label>
					<div class="col-sm-2">
						<input type="submit" class="form-control btn btn-primary" value="Login"/>
					</div>
					<div class="form-group row">
						<a href="Registration.cfm" class="btn btn-link"> Register</a>
					</div>
				</div>
				
			</form>
		</div>
</div>
<cfinclude template="includes/footer.cfm" />