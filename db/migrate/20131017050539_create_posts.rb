class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :introtext
      t.text :description
      t.integer :status
      t.integer :category_id
      t.integer :user_id
      t.timestamps
    end
  end
end
