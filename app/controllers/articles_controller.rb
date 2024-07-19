class ArticlesController < ApplicationController
  def index
    if user_signed_in?
      @articles = Article.where("written_by = ? OR status = ?", current_user.email, "public")
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to @article, status: :see_other
  end

  private
    def article_params
      params.require(:article).permit(:title, :body, :status, :written_by)
    end
end
