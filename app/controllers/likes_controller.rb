class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @like = current_user.likes.build(like_params)
    @like.article_id = params[:article_id]

    if @like.save
      redirect_to article_path(@like.article), notice: 'Liked :)'
    else
      redirect_to article_path(@like.article), alert: @like.errors.full_messages.to_sentence
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @like = current_user.likes.find_by(article_id: @article.id)

    if @like
      @like.destroy
      redirect_to article_path(@article), notice: 'Unliked :('
    else
      redirect_to article_path(@article), alert: 'Unable to unlike'
    end
  end


  private
  def like_params
    params.permit(:article_id)
  end
end