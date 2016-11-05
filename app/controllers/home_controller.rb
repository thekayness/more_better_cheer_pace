class HomeController < ApplicationController
	def index
		@cheer = Cheer.new
		@courses = Course.all
	end
end