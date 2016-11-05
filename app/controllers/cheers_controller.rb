class CheersController < ApplicationController
	def create 
		@cheer = Cheer.create(cheer_params)
		if @cheer.save
			redirect_to root_path, alert: "Thanks for spreading the good vibes!"
		else
			redirect_to root_path, alert: "Something went wrong saving your kind words."
		end
	end

	private
	def cheer_params
		params.require(:cheer).permit(:user_id, :course_id, :content)
	end
end