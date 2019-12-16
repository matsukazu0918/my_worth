class UsersController < ApplicationController

	PER = 24

	def index
		@users = User.page(params[:page]).per(PER)
		@user = User.new
		@q = User.ransack(params[:q])
        users = @q.result(distinct: true)
	end

	def search
		@q = User.search(search_params)
        @users = @q.result(distinct: true)
    end

	def show
		@user = User.find(params[:id])
		@heart = Heart.new
		@hearttimes = current_user.hearts.recent.limit(20)
		@heartchart = []
		@hearttimes.each do |h|
			@heartchart << [h.created_at.strftime("%Y-%m-%d"), h.status]
		end
		@contents = @user.contents
		@favorites = @user.favorites
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:update] = "情報をを更新しました"
			redirect_to user_path(@user)
		else
			render :edit
		end
	end

	def destroy
		@user = User.find(params[:id])
        @user.destroy
        redirect_to root_path
	end

	private

	def user_params
		params.require(:user).permit(:user_name, :email, :image, :introduction)
	end

	def search_params
	    params.require(:q).permit!
	end

end
