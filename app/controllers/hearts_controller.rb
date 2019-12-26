class HeartsController < ApplicationController

	def create
		if  current_user.hearts.blank? || current_user.hearts[0].created_at.strftime("%Y-%m-%-d") != Date.today.strftime("%Y-%m-%-d")
			@heart = Heart.new(heart_params)
			@heart.user_id = current_user.id
			@heart.save
			redirect_to user_path(current_user)
		else
			flash[:message] = "同じ日に記録があります"
			redirect_to user_path(current_user)
		end
	end

	private

	def heart_params
      params.require(:heart).permit(:user_id, :status)
    end
end
