module LikesHelper
  def user_already_liked?(article)
    current_user.likes.exists?(article_id: article.id)
  end
end
