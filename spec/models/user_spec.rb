require 'rails_helper'
require 'pry'

RSpec.describe User, type: :model do
  
  before(:each) do
    @user = User.create(first_name: "Andrew", email: "andrew.dasilva@lol.com", password: "probablyBatman", password_confirmation: "probablyBatman")
    @user2 = User.create(first_name: "Erin", email: "erin.noodles@wat1.com", password: "amidone", password_confirmation: "amidone")
    @course = Course.create(user_id: @user.id, course_title: "How to cook spaghetti", topic: "Cooking")
    @some_task = Task.create(course_id: @course.id)
    @cheer = Cheer.create(user_id: @user2.id, course_id: @course.id)
  end
  
  it "is valid with a name, email, and password" do
    expect(@user).to be_valid
  end

  it "is not valid without a password" do
    expect(User.new(first_name: "Name")).not_to be_valid
  end

  it "has many courses" do
    @user.courses.create(course_title: "sotired")
    expect(@user.courses.count).to eq(2)
  end

  it "has many tasks through courses" do
    expect(@user.tasks.first).to eq(@some_task)
  end

  it "can receive many cheers through courses" do
    expect(@user.courses.first.cheers.first).to eq(@cheer)
  end

  it "knows about cheers received" do
    @course.cheers.create(user_id: @user2.id, content: "You can do eeeeeeet")
    expect(@user.my_cheers_received.count).to eq(2)
  end  

  it "can tell how many people they've cheered on" do
    course2 = @user2.courses.create(course_title: "how to make meatballs")
    @user.cheers.create(course_id: course2.id, content: "keep going!")
    expect(@user.my_people_cheered.count).to eq(1)
  end

  it "can have overdue tasks" do 
    overdue_task = @course.tasks.create(goal_date: Date.yesterday)
    expect(@user.tasks.overdue.first). to eq(overdue_task)
  end

end
