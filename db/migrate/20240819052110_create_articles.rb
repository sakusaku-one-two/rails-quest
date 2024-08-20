class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles do |t|
      t.string :slug
      t.string :title
      t.text :description
      t.text :body
      t.datetime :createdAt
      t.datetime :updatedAt
      t.boolean :favorited
      t.integer :favoritesCount
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end