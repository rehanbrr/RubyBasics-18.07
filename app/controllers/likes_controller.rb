class LikesController < ApplicationController
  before_action :authenticaluser!

  def create
    @like = current_user.likes.build(likes_params)
    @like.liked_id = params[:article_id]

    puts(@like)

    if @like.save
      redirect_to article_path(@article), notice: 'Liked :)'
    else
      redirect_to article_path(@article), alert: 'Problem while liking'
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @like = @article.likes.find(params[:id])
    @like.destroy
    redirect_to article_path(@article), status: :see_other
  end


  private
  def likes_params
    params.require(:likes).permit(:liked_id, :user_id)
  end
end