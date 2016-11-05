require 'rails_helper'

RSpec.describe Cheer, type: :model do
     before(:each) do
    @user = User.create(first_name: "Andrew", email: "andrew.dasilva@lol.com", password: "probablyBatman", password_confirmation: "probablyBatman")
    @user2 = User.create(first_name: "Erin", email: "erin.noodles@wat1.com", password: "amidone", password_confirmation: "amidone")
    @course = Course.create(user_id: @user.id, course_title: "How to cook spaghetti", topic: "Cooking")
    @some_task = Task.create(course_id: @course.id)
  end

  it "belongs to one class" do
    expect(@cheer.my_class).to eq(@class)
  end

  it "belongs to one user" do
    expect(@cheer.user).to eq(@user)
  end
end
