class Task < ApplicationRecord
	belongs_to :course
	scope :overdue, lambda { where('goal_date < ?', Date.today) }


  	after_save { |task| task.destroy if task.title.blank? }
end
