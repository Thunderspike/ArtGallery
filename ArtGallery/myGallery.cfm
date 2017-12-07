<!---<cfdump var="#session#"><cfabort>--->
<cfif session.auth eq "">
	<cflocation url="login.cfm" addtoken="no"/>
</cfif>
<cfquery name="getOrders" datasource="artgallery">
		Select * from [dbo].[Order] Where UserID = '#session.auth#'
</cfquery>
<cfinclude template="includes/header.cfm" />
<div class="container">

	<br>
	<br>
	<h1 class="heading"> <i style="font-size: 1.5em" class="fa fa-user-circle" aria-hidden="true"></i> Welcome <cfoutput><strong>#Session.user.FirstName# #Session.user.lastName#</strong></cfoutput> </h1>
		
		<div class="row">
			<cfif getOrders.recordcount eq 0>
				<h2>You have no orders.</h2>
			<cfelse> 
				<table class="table table-bordered table-hover table-striped">
					<thead>
						<tr>
							<th>Order Id</th><th>Date</th><th>Total</th><th>Status</th>
						</tr>
					</thead>
					<tbody>
						<cfoutput query="getOrders">
							<tr>
								<td>#ID#</td>
								<td>#dateTime#</td>
								<td>#total#</td>
								<td>#Status#</td>
							</tr>
						</cfoutput>
					</tbody>
				</table>
			</cfif>
		</div>
</div><br>
<br>
<br>

<cfinclude template="includes/footer.cfm" />