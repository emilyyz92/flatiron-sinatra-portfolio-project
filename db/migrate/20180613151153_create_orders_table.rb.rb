class CreateOrdersTable.rb < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.float :price
      t.integer :user_id
    end
  end
end
