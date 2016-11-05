require 'rails_helper'

RSpec.describe Course, type: :model do
  before(:each) do
    @user = User.create(first_name: "Andrew", email: "andrew.dasilva@lol.com", password: "probablyBatman", password_confirmation: "probablyBatman")
    @user2 = User.create(first_name: "Erin", email: "erin.noodles@wat1.com", password: "amidone", password_confirmation: "amidone")
    @course = Course.create(user_id: @user.id, course_title: "How to cook spaghetti", topic: "Cooking")
    @some_task = Task.create(course_id: @course.id)

  end

  it "is valid with a user, course title, and topic" do
    expect(@course).to be_valid
  end

  it "belongs to one user" do
    expect(@course.user).to_not eq(@user2)
  end

  it "has many tasks" do
    @course.tasks.create(title: "Measure noodles")
  	expect(@course.tasks.count).to eq(2)
  end

  it "has many cheers" do
    @user2.cheers.create(course_id: @course.id, content: "Yum keep it going!")
  	expect(@course.cheers.count).to eq(1)
  end  


end