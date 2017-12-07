<cfinclude template="../includes/header.cfm"/>
<script>
$(function(){
	GetArtists();
});
function SaveArt(f)
{
	 if ($("#image").prop('files').length == 0) {
        alert("You must select a file to continue.");
        return false;
    }
    var formData = new FormData();
		 
    formData.append('Name', $("#aname").val());
    formData.append('Category', $("#category").val());
    formData.append('Price', $("#price").val());
    formData.append('Artists_ID', $("#artist").val());
    formData.append('Dimensions', $("#dimensions").val());
    formData.append('Date', $("#adate").val());
    formData.append('CityPainted', $("#city").val());
    if ($("#image").val() != "")
        formData.append('Image', $("#image").prop('files')[0]);
    $.ajax({
            url: '/artgallery/admin/cfc/admin.cfc?method=SaveArt',
            processData: false, // tell jQuery not to process the data
            contentType: false, // tell jQuery not to set contentType
            data: formData,
            type: "POST",
            success: function(data, textStatus, jqXHR) {
				var r = $.parseJSON(data)
				if(r.Status == "Success")
				{
					$("#SuccessMessageContainer").html('<h2>Success.</h2><p>Artwork info was added on the database.</p>');
					$("#SuccessMessageModal").modal('show');
					$(f).trigger("reset");
					GetArtists();
				}
				else 
				{
					$("#ErrorMessageContainer").html('<h2>Success.</h2><p>Artist info was added on the database.</p>').modal('show');
				}
            }
		 });
}
function SaveArtist(f) 
{
    if ($("#picture").prop('files').length == 0) {
        alert("You must select a file to continue.");
        return false;
    }
    var formData = new FormData();
		   
    formData.append('FirstName', $("#fname").val());
    formData.append('MiddleName', $("#mname").val());
    formData.append('LastName', $("#lname").val());
    formData.append('Country', $("#country").val());
    formData.append('Bio', $("#bio").val());
    if ($("#picture").val() != "")
        formData.append('picture', $("#picture").prop('files')[0]);
    $.ajax({
            url: '/artgallery/admin/cfc/admin.cfc?method=SaveArtist',
            processData: false, // tell jQuery not to process the data
            contentType: false, // tell jQuery not to set contentType
            data: formData,
            type: "POST",
            success: function(data, textStatus, jqXHR) {
				var r = $.parseJSON(data)
				if(r.Status == "Success")
				{
					$("#SuccessMessageContainer").html('<h2>Success.</h2><p>Artist info was added on the database.</p>');
					$("#SuccessMessageModal").modal('show');
					$(f).trigger("reset");
				}
				else 
				{
					$("#ErrorMessageContainer").html('<h2>Success.</h2><p>Artist info was added on the database.</p>').modal('show');
				}
            }
		 });

}
function GetArtists()
{
	$.ajax({
		url: '/artgallery/admin/cfc/admin.cfc?method=getArtists',
		success: function(result){
			$("#artist").html('<option value="">Select Artist</option>');
			var r = $.parseJSON(result);
			$(r).each(function(i,e){
				$("#artist").append($('<option value="'+e.ID+'">'+e.FIRSTNAME+' '+e.LASTNAME+'</option>'))
			})
		},
		error: function(xhr)
		{
			alert("An error occured: " + xhr.status + " " + xhr.statusText);
		}
	});
}
	


</script>
<div class="container"> <br>
	<br>
	<h1 class="heading"> <span class="glyphicon glyphicon-th-large"></span> Login </h1>
	<cfif IsStruct(session.tokenfield)>
		<div class="alert alert-info">
			<h4>You must Login or <a href="Registration.cfm"> Register</a> to continue processing your order.</h4>
		</div>
	</cfif>
	<div class="row">
		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#home">Home</a></li>
			<li><a data-toggle="tab" href="#menu1">Add Art</a></li>
			<li><a data-toggle="tab" href="#menu2">Add Artist</a></li>
		</ul>
		<div class="tab-content">
			<div id="home" class="tab-pane fade in active">
				<h3>HOME</h3>
				<p>Some content.</p>
			</div>
			<div id="menu1" class="tab-pane fade">
				<h3>Add Art</h3>
				<form onsubmit="SaveArt(this); return false;" class="form-horizontal">
					<div class="form-group row">
						<label for="fname" class="control-label col-sm-2">Name:</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="aname" name="aname"/>
						</div>
					</div>
					<div class="form-group row">
						<label for="artist" class="control-label col-sm-2">Artist:</label>
						<div class="col-sm-5">
							<select class="form-control" id="artist" name="artist">
							</select>
						</div>
					</div>
					<div class="form-group row">
						<label for="acat" class="control-label col-sm-2">Category:</label>
						<div class="col-sm-5">
							<select class="form-control" id="category" name="category">
								<option value="Painting">Painting</option>
								<option value="Sculpture">Sculpture</option>
								<option value="Photography">Photography</option>
								<option value="Installation">Installation</option>
								<option value="Folk">Folk</option>
							</select>
						</div>
					</div>
					<div class="form-group row">
						<label for="image" class="control-label col-sm-2">Image:</label>
						<div class="col-sm-5">
							<input type="file" class="form-control" id="image" name="image"/>
						</div>
					</div>
					<div class="form-group row">
						<label for="fname" class="control-label col-sm-2">Price:</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="price" name="price"/>
						</div>
					</div>
					<div class="form-group row">
						<label for="dimensions" class="control-label col-sm-2">Dimensions:</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="dimensions" name="dimensions"/>
						</div>
					</div>
					<div class="form-group row">
						<label for="adate" class="control-label col-sm-2">Date:</label>
						<div class="col-sm-5">
							<input type="date" class="form-control" id="adate" name="adate"/>
						</div>
					</div>
					<div class="form-group row">
						<label for="city" class="control-label col-sm-2">City:</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="city" name="city"/>
						</div>
					</div>
					
					<div class="form-group row">
					<label for="city" class="control-label col-sm-2"></label>
					<button type="submit" class="btn btn-default">Save</button>
					</div>
				</form>
			</div>
			<div id="menu2" class="tab-pane fade">
				<h3>Add Artist</h3>
				<form onsubmit="SaveArtist(this); return false;" class="form-horizontal">
					<div class="form-group row">
						<label for="fname" class="control-label col-sm-2">First Name:</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="fname" name="fname"/>
						</div>
					</div>
					<div class="form-group row">
						<label for="mname" class="control-label col-sm-2">Middle Name:</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="mname" name="mname"/>
						</div>
					</div>
					<div class="form-group row">
						<label for="lname" class="control-label col-sm-2">Last Name:</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="lname" name="lname"/>
						</div>
					</div>
					<div class="form-group row">
						<label for="country" class="control-label col-sm-2">Country:</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="country" name="country"/>
						</div>
					</div>
					<div class="form-group row">
						<label for="bio" class="control-label col-sm-2">Bio:</label>
						<div class="col-sm-5">
							<textarea class="form-control" id="bio" name="bio" rows="3"></textarea>
						</div>
					</div>
					<div class="form-group row">
						<label for="picture" class="control-label col-sm-2">Picture:</label>
						<div class="col-sm-5">
							<input type="file" class="form-control" id="picture" name="picture"/>
						</div>
					</div>
					<div class="form-group row">
						<label for="picture" class="control-label col-sm-2"></label>
						<div class="col-sm-5">
							<button type="submit" class="btn btn-default">Save</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<br>
<br>
<br>
<cfinclude template="../includes/footer.cfm"/>