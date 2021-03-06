function Course (course_title, created_at, id, tasks, topic, cheers){
  this.course_title = course_title;
  this.created_at = created_at;
  this.id = id;
  this.tasks = tasks;
  this.topic = topic;
  this.cheers = cheers;
}
 


Course.prototype.renderSelf = function() {
	$('#newCourseMessage').text("Course successfully created!")
    $("#courseTitle").text(this.course_title);
    $("#courseTopic").text(this.topic);
    $('#coursesLink').append("<a href='/courses'>Go to courses</a>");
}

function postFormData() {
  $('#course_course_title').keyup(function() {
    var chars = $(this).val();
    console.log(chars);
    $('#showUp').text(chars);
  });
  

  $('form').submit(function(event) {

    //prevent form from submitting the default way
    event.preventDefault();

    var values = $(this).serialize();
	  $.post('/courses.json', values).done(function(data) {
    	var courseish = data['course'];
    	var newCourse = new Course(courseish.course_title, courseish.created_at, courseish.id, courseish.tasks, courseish.topic, courseish.cheers);
    	console.log(newCourse);
    	newCourse.renderSelf();
    });

  });
}

function getCourseData() {
  var path = $(location).attr('pathname');
  var id = path.substring(path.lastIndexOf('/') + 1);
  console.log(id);
  $.get("/courses/" + id + ".json").done(function(data) {
    var course = data.course
    var courseText = "";
    courseText += ("<h2> Course: " + course.course_title + "</h2>");
    for(var j = 0; j < course.tasks.length; j++) {
      courseText += ("<p>Task " + (j + 1) + ": " + course.tasks[j].title + "</p>");
      if (course.cheers.length > 0) {
        courseText += ("<p>" + course.cheers.length + " people are cheering you on!</p>");
      } 

    }
    $('#userCourse').append(courseText);
  });
}

function getCoursesData() {
	$.get("/courses.json").done(function(data) {
		var courses = data.courses
		var coursesText = "";
        for(var i = 0; i < courses.length; i++) {
          coursesText += ("<h2> Course: " + courses[i].course_title + "</h2>");
          for(var j = 0; j < courses[i].tasks.length; j++) {
            coursesText += ("<p>Task " + (j + 1) + ": " + courses[i].tasks[j].title + "</p>");
            if (courses[i].cheers.length > 0) {
            	coursesText += ("<p>" + courses[i].cheers.length + " people are cheering you on!</p>");
            }	
          }
		coursesText +="<a href='/courses/" + courses[i].id + "'>Go to this course</a>";
		}
		$('#userCourses').append(coursesText);
	});
}

$(document).ready(function() {
	if ($('.courses.index').length) {
		console.log("hiiii");
        getCoursesData();
    }
   	if ($('.courses.new').length) {
		  postFormData();
    }
    if ($('.courses.show').length) {
		  getCourseData();
    }
	
});