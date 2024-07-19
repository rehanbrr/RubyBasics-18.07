class AddWrittenByToArticles < ActiveRecord::Migration[7.1]
  def change
    add_column :articles, :written_by, :string
  end
end
