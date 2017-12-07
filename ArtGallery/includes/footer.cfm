<div class="w3-container w3-padding-32 w3-center" id="contact" style="background-color:#666;">
  <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">Contact</h3>
  <div class="w3-row-padding">
 
  <div class="col-sm-6 w3-padding-48">
  <h1>Pol.ajazi@gmail.com</h1>
  <p></p>
  <!---<blockquote>
    <p>For 50 years, WWF has been protecting the future of nature. The world's leading conservation organization, WWF works in 100 countries and is supported by 1.2 million members in the United States and close to 5 million globally.</p>
    <footer>From WWF's website</footer>
  </blockquote>--->
<!---</div> <div class="col-sm-5 w3-padding-48"><form action="/action_page.php" target="_blank">
    <input class="w3-input" type="text" placeholder="Name" required name="Name">
    <input class="w3-input w3-section" type="text" placeholder="Email" required name="Email">
    <input class="w3-input w3-section" type="text" placeholder="Subject" required name="Subject">
    <input class="w3-input w3-section" type="text" placeholder="Comment" required name="Comment">
    <button class="w3-button w3-black w3-section" type="submit">
    <i class="fa fa-paper-plane"></i> SEND MESSAGE </button>
  </form></div>
  </div>
</div>--->


<!-- Google Map -->
<footer class="w3-content w3-padding" id="" style="max-width:1564px;">
</footer>
<div id="cartModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Cart Content</h4>
      </div>
      <div class="modal-body">
        <p><span id="cartContent"></span></p>
      </div>
      <div class="modal-footer">
	  	<button type="button" onclick="window.location='/artgallery/checkout.cfm'; return false;" class="btn btn-default" id="checkoutbtn">Checkout</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<div id="errorMessageModal" class="modal fade" role="dialog">
  <div class="modal-dialog">
  
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Error</h4>
      </div>
      <div class="modal-body">
        <p class="alert alert-danger" id="errorMessageContainer"></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<div id="SuccessMessageModal" class="modal fade" role="dialog">
  <div class="modal-dialog">
  
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Success</h4>
      </div>
      <div class="modal-body">
        <p class="alert alert-success" id="SuccessMessageContainer"></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" onclick="window.location = 'index.cfm';" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>