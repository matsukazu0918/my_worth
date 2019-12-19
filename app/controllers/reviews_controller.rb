class ReviewsController < ApplicationController

	def create
		@review = Review.new(review_params)
		@content = Content.find(@review.content_id)
		@reviews = @content.reviews
		@review.user_id = current_user.id
		if @review.save
			flash[:create] = "レビューが追加されました"
			render :index
		else
			render :index
		end
	end

	def destroy
		@review = Review.find(params[:id])
		@reviews = @review.content.reviews
		@review.destroy
		render :index
	end

	private
    def review_params
      params.require(:review).permit(:user_id, :content_id, :review_body)
    end


end
