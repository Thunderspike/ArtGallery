<cfset session.AUTH = "">
<cfset session.tokenfield = ''/>
<cfset session.afterloginsuccess = ''/>
<cfset session.usertype = ""/>
<cfset session.user = ""/>
<cfinclude template="includes/header.cfm" />
<div class="container">

	<br>
	<br>
	<h1 class="heading"> <i style="font-size: 1.5em" class="fa fa-user-o" aria-hidden="true"></i> Login </h1>
		<cfif IsStruct(session.tokenfield)>
			<div class="alert alert-info">
				<h4>You must Login or <a href="Registration.cfm"> Register</a> to continue processing your order.</h4>
			</div>
		</cfif>
		<div class="row">
			<form action="Login.cfm" method="post" class="form-horizontal" onsubmit="login(); return false;">
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
<cfif session.afterloginsuccess neq ''>
	<script>
		var afterloginsuccess = <cfoutput>'#session.afterloginsuccess#'</cfoutput>;
	</script>
</cfif>
<cfinclude template="includes/footer.cfm" />