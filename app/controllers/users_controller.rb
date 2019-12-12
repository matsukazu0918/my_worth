class UsersController < ApplicationController

	PER = 20

	def index
		@users = User.page(params[:page]).per(PER)
		@user = User.new
		@q = User.ransack(params[:q])
        contents = @q.result(distinct: true)
	end

	def search
		@q = User.search(search_params)
        @users = @q.result(distinct: true)
    end

	def show
		@user = User.find(params[:id])
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

	def leave
		@user = User.find(params[:id])
	end

	def destroy
		@user = User.find(params[:id])
        @user.destroy
        redirect_to root_path
	end

	private

	def user_params
		params.require(:enduser).permit(:user_name, :email, :image_id)
	end

	def search_params
	    params.require(:q).permit!
	end

end
