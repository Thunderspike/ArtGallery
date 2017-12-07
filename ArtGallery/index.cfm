<cfset name = IsDefined('form.name')? form.name : ""/>
<cfset Artists_ID = IsDefined('form.Artists_ID')? form.Artists_ID : ""/>
<cfset artAvailability = IsDefined('form.artAvailability')? form.artAvailability : ""/>

<cfset artsDisplay = CreateObject('cfc.home').GetArt(Artists_ID,artAvailability,name)>
<cfset getArtists =  CreateObject('cfc.home').getArtists()>
<cfinclude template="includes/header.cfm" />
<cfinclude template="includes/banner.html" />
<div class="w3-content w3-padding" style="max-width:1564px">
	<div class="w3-row w3-margin-top" id="painting">
		<div class="w3-col s6 w3-white w3-center">
			<h1 class="w3-xxxlarge w3-text-white text-left" style=""><span class=" w3-text-black"> Painting </span><span class="w3-text-red">| Drawing</span></h1>
		</div>
	</div>
	<div class="container-fluid w3-light-grey">
			<cfoutput>
				<form class="form-horizontal" method="post" action="#cgi.SCRIPT_NAME#">
					<label class="control-label col-sm-2 col-md-1" for="email">Name:</label>
					<div class="col-sm-2">
						<input type="text" value="#name#" class="form-control" name="name"/>
					</div>
					<label class="control-label col-sm-2 col-md-1" for="email">Artist:</label>
					<div class="col-sm-2">
						<select name="Artists_ID" class="form-control">
							<option value="">Select Artist</option>
							<cfloop query="getArtists">
								<option value="#ID#" <cfif Artists_ID eq ID>selected="selected"</cfif>>#FirstName# #LastName#</option>
							</cfloop>
						</select>
					</div>
					<div class="col-sm-2 col-md-3">
						<button class="btn btn-info">Apply Filters</button>
						<span onClick="$(this).closest('form').find('input,select').each(function(){$(this).val('')}); $(this).closest('form').submit();" 
						class="btn btn-warning">Reset Filters</span>
					</div>
				</form>
			</cfoutput>
		<div id="Oil" class="w3-container city" style="">
			<div class="w3-row-padding "> <cfoutput query="artsDisplay">
					<div class="w3-third w3-margin-top "> <a href="piece.cfm?piece=#artsDisplay.ID#" style="text-decoration:none;">
						<div class=" w3-white w3-card w3-hover-blue-gray"> <img src="./imgs/art/#artsDisplay.artImage#" class="w3-hover-opacity  img-responsive" style="width:100%">
							<div class="w3-container text-left">
								<h2>#artsDisplay.artName# <span class="w3-right w3-text-green w3-large">#artsDisplay.artistFname# #artsDisplay.artistLname#</span></h2>
								<p>#artsDisplay.artCategory# | <b>#artsDisplay.artDimensions#</b></p>
								<hr>
								<p> #artsDisplay.artDate#
									<cfif artsDisplay.artAvailability eq 0>
										<span class="w3-right w3-tag w3-gray">Sold</span>
										<cfelse>
										<span class="w3-right w3-tag w3-green">for SALE</span>
									</cfif>
								</p>
							</div>
						</div>
						</a> </div>
				</cfoutput> </div>
		</div>
	</div>
</div>
<cfinclude template="includes/footer.cfm" />
