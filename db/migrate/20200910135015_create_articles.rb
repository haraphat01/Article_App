class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :text
      t.integer :author_id
      t.integer :votes_count

      t.timestamps
    end
  end
end
