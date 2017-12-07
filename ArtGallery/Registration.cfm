<cfinclude template="includes/header.cfm" />
<div class="container">
	<br>
	<br>
	<h1 class="heading"> <span class="glyphicon glyphicon-th-large"></span> Registration </h1>
	<div class="row">
		<form action="registration.cfm" method="post" class="form-horizontal" onSubmit="register(); return false;">
			<div class="form-group">
				<label class="control-label col-sm-2">Email:</label>
				<div class="col-sm-5">
					<input type="email" required="required" class="form-control" placeholder="Enter Email" name="email" id="email"/>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="FN">Name:</label>
				<div class="col-sm-5">
					<input type="text" required="required" class="form-control" name="fname" placeholder="Enter your name" id="fname"/>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">Last Name:</label>
				<div class="col-sm-5">
					<input type="text" required="required" class="form-control" name="lname" placeholder="Enter your last name" id="lname"/>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">Phone Number:</label>
				<div class="col-sm-5">
					<input types="tel" class="form-control" name="phone" placeholder="(Optional) Enter your phone number" value="" id="phone"/>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">Password:</label>
				<div class="col-sm-5">
					<input type="password" required="required" class="form-control" name="Pass" placeholder="Enter Password for Acess" id="pass1"/>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">Verify Password:</label>
				<div class="col-sm-5">
					<input type="password" required="required" class="form-control" name="veriPass" placeholder="Re-Enter your Password" id="pass2"/>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">Adress 1:</label>
				<div class="col-sm-5">
					<input type="text" required="required" class="form-control" name="street1" placeholder="Street 1" id="street1"/>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">Adress 2:</label>
				<div class="col-sm-5">
					<input type="text" required="required" class="form-control" name="street2" placeholder="Street 2" id="street2"/>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">City:</label>
				<div class="col-sm-5">
					<input type="text" required="required" class="form-control" name="city" placeholder="City" id="city"/>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">State:</label>
				<div class="col-sm-5">
					<input type="text" required="required" class="form-control" name="state" placeholder="State" id="state"/>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">Zip:</label>
				<div class="col-sm-5">
					<input type="text" required="required" class="form-control" name="zipcode" placeholder="Zip Code" id="zipcode"/>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2"></label>
				<div class="col-sm-2">
					<input type="submit" class="form-control btn btn-primary" value="Save"/>
				</div>
				<div class="form-group row">
					<a href="Login.cfm" class="btn btn-link"> Login</a>
				</div>
			</div>
		</form>
	</div>
</div>
<cfinclude template="includes/footer.cfm" />