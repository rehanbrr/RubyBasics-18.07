class RemoveLikedWhatFromLikes < ActiveRecord::Migration[7.1]
  def change
    remove_column :likes, :liked_what
  end
end
