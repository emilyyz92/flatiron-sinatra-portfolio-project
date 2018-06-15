class CreateItemsTable < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :product_id
      t.integer :order_id
      t.float :price
    end
  end
end
