<cfif IsDefined('url.piece')>
	<cfset ID="#URL.piece#">
<cfelse>
	<cfquery name="getartists" datasource="artgallery">
		Select * from Artists
	</cfquery>
	<cfset aid = RandRange(1, getartists.recordcount)/>
	
	<cfquery name="getart" datasource="artgallery">
		Select * from Art where artists_id = #getartists.id[aid]#
	</cfquery>
	<cfset ID = #getart.id[RandRange(1, getart.recordcount)]#/>
</cfif>

<cfquery name="artsInfo" datasource="artgallery">
	SELECT * FROM art WHERE ID = #ID#
</cfquery>
<cfquery name="getArtist" datasource="artgallery">
	SELECT * from Artists WHERE ID IN(SELECT Artists_ID FROM Art WHERE ID = #ID#);
</cfquery>
<cfquery name="getArtistsPaintings" datasource="artgallery">
	SELECT art.ID as ID, art.Image as artImage FROM Art art Where art.Artists_ID = #getArtist.ID#
</cfquery>
<!---<cfdump var="#artsInfo#">
<cfdump var="#getArtist#">
<cfdump var="#getArtistsPaintings#">--->
<cfinclude template="includes/header.cfm" />
<div class="w3-content w3-container w3-center w3-padding-48 w3-white" style="max-width:1600px">
	<div class="w3-display-container  w3-padding w3-margin-top" id="home">
		<div class="w3-row-padding w3-light-gray">
			<div class="col-sm-7 w3-margin-top">
				<div class="tab-content"> <cfoutput>
						<div id="#getArtist.FirstName#" class="tab-pane fade in active">
						<div class="w3-card-2 w3-white w3-center w3-padding w3-border" style="">
						<img src="imgs/art/#artsInfo.Image#" class="img-responsive  w3-padding "></cfoutput>
					<div class="w3-display-topleft w3-hide-small w3-padding-large w3-animate-opacity" style="margin-top:52%;">
						<div class="w3-container w3-padding" style="background: -moz-linear-gradient(-45deg, rgba(255,255,255,1) 0%, rgba(255,255,255,0) 100%); /* FF3.6-15 */
background: -webkit-linear-gradient(-45deg, rgba(255,255,255,1) 0%,rgba(255,255,255,0) 100%); /* Chrome10-25,Safari5.1-6 */
background: linear-gradient(135deg, rgba(255,255,255,1) 0%,rgba(255,255,255,0) 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffffff', endColorstr='#00ffffff',GradientType=1 ); /* IE6-9 fallback on horizontal gradient */"> <cfoutput>
								<h2 class="w3-large text-upercase w3-margin-top w3-black w3-padding" style=""><b>#artsInfo.Name#</b></h2>
							</cfoutput>
							<div class="w3-cell-row w3-row-padding ">
								<div class="w3-cell w3-container"> <cfoutput>
										<h2 class="w3-xlarge"><b>#getArtist.FirstName# #getArtist.LastName#</b></h2>
										<hr>
										<h3 class="w3-medium" style="letter-spacing:-1px;"><b>Price:&nbsp;&nbsp;$#artsInfo.Price#</b></h3>
										<hr>
										<h4 class="w3-medium">size:<b> #artsInfo.Dimensions#</b> </h4>
										<h4 class="w3-small"> <b> #artsInfo.CityPainted#</b> </h4>
										<br>
										<cfif artsInfo.Availability eq 0>
											<button type="button" class="btn btn-outline-danger" disabled>Sold</button>
										<cfelse>
											<button class="btn btn-info" onclick="addToCart(#artsInfo.ID#)"> Add To Cart </button>
										</cfif>
									</cfoutput>
									<hr>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-sm-5">
		<div class="w3-container w3-white w3-card-2 w3-margin w3-padding-large">
			<div class="w3-center"> <cfoutput><img src="imgs/art/#getArtist.Picture#" alt="Girl Hat" style="width:100%" class="w3-padding-16"></cfoutput>
				<p class="text-left w3-large w3-margin-top w3-text-dark-grey" style="line-height:130%;"> <cfoutput>#getArtist.Bio#</cfoutput> </p>
			</div>
			<div class="w3-row-padding w3-section" style="background: -moz-linear-gradient(-45deg, rgba(0,0,0,0.65) 0%, rgba(0,0,0,0) 100%); /* FF3.6-15 */
background: -webkit-linear-gradient(-45deg, rgba(0,0,0,0.65) 0%,rgba(0,0,0,0) 100%); /* Chrome10-25,Safari5.1-6 */
background: linear-gradient(135deg, rgba(0,0,0,0.65) 0%,rgba(0,0,0,0) 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#a6000000', endColorstr='#00000000',GradientType=1 ); /* IE6-9 fallback on horizontal gradient */;">
				<h3 class="w3-black w3-padding-16"><span class="w3-text-white"><cfoutput>#getArtist.LastName#</cfoutput>'s </span><b class="text-uppercase">Artworks</b></h3>
				<cfoutput query="getArtistsPaintings"> 
					<!---<cfdump var="#getArtistsPaintings.ID#">--->
					<div class="w3-col s4 active w3-padding-16 w3-margin-top"> <a <!---data-toggle="tab"---> href="piece.cfm?piece=#getArtistsPaintings.ID#"> <img class="demo w3-hover-opacity w3-card-2" src="imgs/art/#getArtistsPaintings.artImage#" style="width:100%" > </a> </div>
				</cfoutput> </div>
		</div>
	</div>
</div>
</div>
</div>
<cfinclude template="includes/footer.cfm">
