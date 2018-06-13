class CreateCategoriesTable < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.float :price
      t.integer :count
    end
  end
end
