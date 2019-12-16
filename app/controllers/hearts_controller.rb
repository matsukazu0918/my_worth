class HeartsController < ApplicationController

	def create
		@heart = Heart.new(heart_params)
		@heart.user_id = current_user.id
		@heart.save
		redirect_to user_path(current_user)
	end

	private

	def heart_params
      params.require(:heart).permit(:user_id, :status)
    end
end
