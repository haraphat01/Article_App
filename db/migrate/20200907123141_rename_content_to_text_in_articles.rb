class RenameContentToTextInArticles < ActiveRecord::Migration[6.0]
  def change
    rename_column :articles, :content, :text
  end
end
