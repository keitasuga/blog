class ArticlesController < ApplicationController

  def index
    @articles = Article.includes(:user).all.order("created_at DESC")
  end

  def new
    @article = Article.new
  end

  def create
    Article.create(article_params)
    redirect_to articles_path method: :create
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy if article.user_id == current_user.id
    redirect_to root_path method: :get
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    article = Article.find(params[:id])
    if article.user_id == current_user.id
      article.update(article_params)
    end
    redirect_to root_path method: :post
  end


  private
  def article_params
    params.require(:article).permit(:text).merge(user_id: current_user.id)
  end

end
