class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.integer :author_id
      t.string :title
      t.text :content
      t.integer :votes_count

      t.timestamps
    end
  end
end
