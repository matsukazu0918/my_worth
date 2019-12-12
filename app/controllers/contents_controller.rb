class ContentsController < ApplicationController

  PER = 20

  def index
    @contents = Content.page(params[:page]).per(PER)
    @content = Content.new
    @q = Content.ransack(params[:q])
    contents = @q.result(distinct: true)
  end

  def search
    @q = Content.search(search_params)
    @contents = @q.result(distinct: true)
  end

  def show
    @content = Content.find(params[:id])
    @favorite = Favorite.new
    @review = Review.new
    @reviews = @content.reviews
  end

  def new
    @content = Content.new
  end

  def create
    @content = Content.new(content_params)
    @content.user_id = current_user.id
    if @content.save
      flash[:create] = "投稿に成功しました"
      redirect_to contents_path
    else
      render :new
    end
  end

  def edit
    @content = Content.find(params[:id])
  end

  def update
    @content = Content.find(params[:id])
    if @content.update(content_params)
      flash[:update] = "投稿を更新しました"
      redirect_to content_path(@content)
    else
      render :edit
    end
  end

  def destroy
    @content = Content.find(params[:id])
    @content.destroy
    redirect_to contents_path
  end

  private

  def content_params
    params.require(:content).permit(:title, :body, :user_id)
  end

  def search_params
    params.require(:q).permit!
  end

end
