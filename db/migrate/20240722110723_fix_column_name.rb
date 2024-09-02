class FixColumnName < ActiveRecord::Migration[7.1]
  def change
    rename_column :likes, :liked_id, :article_id
  end
end
