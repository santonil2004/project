class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :title
      t.text :description
      t.boolen :status

      t.timestamps
    end
  end
end
