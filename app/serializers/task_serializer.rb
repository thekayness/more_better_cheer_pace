class TaskSerializer < ActiveModel::TaskSerializer
	attributes :title, :description, :goal_date
	has_one :course
end