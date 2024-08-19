class CreateAuthors < ActiveRecord::Migration[7.1]
  def change
    create_table :authors do |t|
      t.string :username
      t.string :bio
      t.string :image
      t.boolean :following

      t.timestamps
    end
  end
end
