<cfcomponent>
<cffunction name="register" access="remote" returntype="any" returnformat="plain">
	<cfargument name="userData" type="string" required="yes">
	<cfset userData = DeserializeJSON(userData)>
	<cfif userData.pass1 neq userData.pass2>
		<cfreturn '{"status": "error", "message": "Passwords do not match!"}'>
	</cfif>
	<cfset checkUser = getUser(userData.email)/>
	<cfif checkUser.recordcount gt 0>
		<cfreturn '{"status": "error", "message": "User with that email already exists!"}'>
	</cfif>
		<cftry>
			<cfquery name="RegisterUser" datasource="artgallery" result="a">
				INSERT INTO Users (Password, 
									FirstName, 
									LastName, 
									Email, 
									Telephone, 
									Street1, 
									Street2, 
									City, 
									State, 
									ZipCode)
				VALUES ('#Hash(userData.pass1,"SHA-384")#', 
								'#userData.fname#',
								'#userData.lname#',
								'#userData.email#',
								'#userData.phone#',
								'#userData.Street1#',
								'#userData.Street2#',
								'#userData.City#',
								'#userData.State#',
								'#userData.ZipCode#')
			</cfquery>	
			<cfcatch type="Database">
				<cfoutput> <br />
					<div class="alert alert-warning">Your UserName needs to be unique in order to register.</div>
				</cfoutput>
				<cfset errorCaught = "Database">
			</cfcatch>
		</cftry>
		<cfreturn '{"status": "Success", "message": "Yayyyyyyy! :)"}'>
</cffunction>
<cffunction name="login" access="remote" returntype="any" returnformat="plain">
	<cfargument name="userData" type="string" required="yes">
	<cfset userData = DeserializeJSON(userData)>
	<cfquery name="loginConf" datasource="artgallery"> 
		SELECT 						
			FirstName, 
			LastName, 
			Email, 
			Telephone, 
			Street1, 
			Street2, 
			City, 
			State, 
			ZipCode, 
			UserType FROM Users
		WHERE Email = '#userData.email#' AND Password = '#hash(userData.Password, "sha-384")#'
	</cfquery>
	<cfif loginConf.recordcount lt 1>
		<cfreturn '{"status": "error", "message": "User not found!"}'>
	<cfelse>
		<cfset session.auth = loginConf.email>
		<cfset session.user = loginConf>
		<cfset session.usertype = loginConf.UserType>
		<cfreturn '{"status": "sucess", "message": "Login sucessful.", "user" : #SerializeJSON(application.utils.QueryToArray(loginConf))#}'>
	</cfif>
</cffunction>
<cffunction name="getUser" returntype="query">
	<cfargument name="email" type="string" required="yes">
	<cfquery name="getUser" datasource="artgallery"> 
		SELECT 		
			FirstName, 
			LastName, 
			Email, 
			Telephone, 
			Street1, 
			Street2, 
			City, 
			State, 
			ZipCode FROM Users
		WHERE Email = '#arguments.email#' 
	</cfquery>
	<cfreturn getUser>
</cffunction>
</cfcomponent>
