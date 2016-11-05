require 'rails_helper'
require 'pry'

RSpec.describe Task, type: :model do
	 before(:each) do
    @user = User.create(first_name: "Andrew", email: "andrew.dasilva@lol.com", password: "probablyBatman", password_confirmation: "probablyBatman")
    @course = Course.create(user_id: @user.id, course_title: "How to cook spaghetti", topic: "Cooking")
    @some_task = Task.create(course_id: @course.id, title: "Make Sauce", description: "gather ingredients for pasta sauce", goal_date: Date.tomorrow)
    @overdue_task = @course.tasks.create(goal_date: Date.yesterday)
  end

  it "belongs to one class" do
    expect(@some_task.course).to eq(@course)
  end

  it "is valid with a title, description, status, and goal date" do
    expect(@some_task).to be_valid
  end

  it "knows when it is overdue" do
    expect(Task.overdue).to include(@overdue_task)
  end
  
end
