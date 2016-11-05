#create some users
dax = User.create(username: "Dax", email: "Dax.charles@whatever.com", password: "99problems", password_confirmation: "99problems")
jax = User.create(username: "Jax", email: "SkaiJackson@doodle.com", password: "98problems", password_confirmation: "98problems")
kay = User.create(username: "Kay", email: "kaleisgreat@doodle.com", password: "207problems", password_confirmation: "207problems")

#create some courses
pi_course = Course.create(user_id: dax.id, course_title: "Raspberry Pi: Full Stack", topic: "IoT")
hack_course = Course.create(user_id: jax.id, course_title: "Complete Ethical Hacking Course", topic: "Infosec")
web_course = Course.create(user_id: jax.id, course_title: "Learn.co", topic: "Web Development")

#create some tasks
Task.create(course_id: web_course.id, title: "Finish Rails", description: "Build project for Rails Assessment", goal_date: Date.yesterday)
Task.create(course_id: pi_course.id, title: "Set Up SSH", description: "Set up SSH connection for headless Raspberry Pi", goal_date: Date.today.next_month	)
Task.create(course_id: hack_course.id, title: "Install Kali", description: "Create virtual machine and install Kali Linux", goal_date: Date.today.next_month)
Task.create(course_id: web_course.id, title: "Finish JavaScript", description: "Complete all JavaScript assignments",  goal_date: Date.tomorrow)

#create some cheers
Cheer.create(user_id: dax.id, course_id: pi_course.id, content: "Keep up the good work! I know you can finish.")
Cheer.create(user_id: jax.id, course_id: web_course.id, content: "Noticed you've got a goal date coming up this week, You can do it!")
Cheer.create(user_id: kay.id, course_id: web_course.id, content: "Don't get discouraged, you're almost there!!!")

java_course = Course.create(user_id: kay.id, course_title: "Intro to Java", topic: "Java")
Task.create(course_id: java_course.id, title: "Install Eclipse", description: "Get text editor Eclipse installed", goal_date: Date.today.next_month)
java_course.save

pi_course.save
hack_course.save
web_course.save

kay.save
dax.save
jax.save