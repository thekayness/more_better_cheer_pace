function Course (course_title, created_at, id, tasks, topic){
  this.course_title = course_title;
  this.created_at = created_at;
  this.id = id;
  this.tasks = tasks;
  this.topic = topic
}
 


Course.prototype.renderSelf = function() {
	$('#newCourseMessage').text("Course successfully created!")
    $("#courseTitle").text(this.course_title);
    $("#courseTopic").text(this.topic);
    $('#coursesLink').append("<a href='/courses'>Go to courses</a>");
}

function postFormData() {
    $('form').submit(function(event) {

      //prevent form from submitting the default way
      event.preventDefault();

      var values = $(this).serialize();
 	
      var posting = $.post('/courses', values);
 
      posting.done(function(data) {
      	var courseish = data['course'];
      	var newCourse = new Course(courseish.course_title, courseish.created_at, courseish.id, courseish.tasks, courseish.topic);
      	console.log(newCourse);
      	newCourse.renderSelf();
	  });

    });
}

$(document).ready(function() {

	postFormData();
});