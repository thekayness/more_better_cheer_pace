class TasksController < ApplicationController

	def index
		@course = Course.find(params[:course_id])
	end

	# def new
 #    	@course = Course.new(user_id: current_user.id)	
	# end

	# def create
	# 	@course = Course.create(course_params)
	# 	if @course.save
	# 		redirect_to courses_path
	# 	else
	# 		redirect_to main_path, alert: "Something went wrong saving this course"
	# 	end
	# end

	# def edit
 #      	@course = Course.find(params[:id])
 #      	num_new_tasks = params[:new_tasks].to_i
 #      	if num_new_tasks > 0
 #      		num_new_tasks.times {|task| @course.tasks.create}
 #      	end
 #      	if @course.tasks.count <= 1
 #      		@course.tasks.create()
 #      	end
 #      	redirect_to main_path, alert: "Course not found." if @course.nil?
	# end

	# def update
	# 	# binding.pry
	# 	@course = Course.find(params[:id])
	# 	@course.update_attributes(course_params)
		
	# 	if @course.save && params[:course][:tasks_attributes]
	# 		redirect_to courses_path
	# 	elsif @course.save && params[:course][:cheers_attributes]
	# 		redirect_to main_path, alert: "Thanks for spreading the good vibes!"
	# 	else
	# 		redirect_to new_course_path, alert: "Something went wrong saving this course"
	# 	end
	# end

	# def show
	# 	@course = Course.find(params[:id])
	# 	@cheer = @course.cheers.build()
	# 	@cheerleader = current_user
		
	# end

	# def course_params
 #  		params.require(:course).permit(:id, :course_title, :topic, :user_id, tasks_attributes: [:id, :course_id, :title, :description, :goal_date, :_destroy], cheers_attributes: [:id, :course_id, :user_id, :content])
	# end
end