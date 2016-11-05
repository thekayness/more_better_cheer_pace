
function postFormData() {
    $('form').submit(function(event) {
      //prevent form from submitting the default way
      event.preventDefault();

      var values = $(this).serialize();
 
      var posting = $.post('/courses', values);
 
      posting.done(function(data) {
        console.log(data);
        // var course = data["course"];
        // $("#courseTitle").text(course["title"]);
        // $("#courseTopic").text(course["topic"]);
      });

	});
}

$(document).ready(function() {
	postFormData();
});