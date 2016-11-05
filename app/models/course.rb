class Course < ApplicationRecord
	belongs_to :user
	has_many :tasks
	has_many :cheers

	# after_create :build_empty_task

	validates :course_title, :topic, presence: true
	validates_associated :cheers

	accepts_nested_attributes_for :tasks, :allow_destroy => true
	# accepts_nested_attributes_for :cheers, limit: 1
	

	def cheers_attributes=(attributes)
		attributes.each do |i, cheers_params|
			cheer = self.cheers.new
			cheers_params.each do |cheer_attribute, attribute_value|
        		cheer.send("#{cheer_attribute}=", attribute_value)
      		end

		end
	end


	# def build_empty_task
	# 	if self.tasks.empty?
	# 		self.tasks.create(title: "Task title goes here", description: "Task description goes here", goal_date: Date.today.next_month)
	# 	end
	# end

	def self.order_by_inactivity
		self.all.sort_by { |c| c.oldest_task }
	end

	def oldest_task
		self.tasks.order(created_at: :asc).first
	end


end
