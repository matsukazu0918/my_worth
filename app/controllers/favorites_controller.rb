class FavoritesController < ApplicationController

  def create
    @favorite = Favorite.create( user_id:current_user.id,  content_id: params[:content_id])
    #@favorit.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @favorite = Favorite.find_by(content_id: params[:content_id], user_id: current_user.id)
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end

end
