class CourseSerializer < ActiveModel::Serializer
  attributes :id, :course_title, :topic, :user_id, :created_at
  has_many :tasks
  has_many :cheers
end
