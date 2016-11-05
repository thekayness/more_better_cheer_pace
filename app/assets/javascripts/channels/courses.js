
function postFormData() {
    $('form').submit(function(event) {
      //prevent form from submitting the default way
      event.preventDefault();

      var values = $(this).serialize();
 
      var posting = $.post('/products', values);
 
      posting.done(function(data) {
        console.log(data)
        var product = data["product"];
        $("#productName").text(product["name"]);
        $("#productPrice").text("$" + product["price"]);
        $("#productDescription").text(product["description"]);
        $("#productInventory").text(product["inventory"]);
      });
    });
  });

$(document).ready(function() {
	attachListeners();
});