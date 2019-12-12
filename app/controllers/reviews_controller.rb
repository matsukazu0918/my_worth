class ReviewsController < ApplicationController

	def create
		@review = Review.new(review_params)
		@content = Content.find(@review.content_id)
		@reviews = @content.reviews
		@review.user_id = current_user.id
		if @review.save
			flash[:create] = "レビューが追加されました"
			redirect_to content_path(@review.content)
		else
			@content = Content.find(@review.content_id)
			render "contents/show"
		end
	end

	def edit
		@review = Review.find(params[:id])
	end

	def update
		@review = Review.find(params[:id])
		if @review.update(review_params)
			flash[:update] = "レビューが更新されました"
			redirect_to content_path(@review.cd)
	    else
	    	render :edit
	    end
	end

	def destroy
		@review = Review.find(params[:id])
		@review.destroy
		redirect_to content_path(@review.content)
	end

	private
    def review_params
      params.require(:review).permit(:user_id, :content_id, :review_body)
    end


end
