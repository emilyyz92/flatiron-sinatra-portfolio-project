class CreateProductsTable < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :category_id
      t.integer :order_id
    end
  end
end
