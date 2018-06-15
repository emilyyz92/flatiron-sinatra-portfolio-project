class Order < ActiveRecord::Base
  belongs_to :user
  has_many :items
  has_many :products, through: :items

  def create_items(array) #creating items when order created
    array.each do |a|
      t = a[1].to_i
      item_array = []
      t.times do
        item = Item.create(product_id: a[0])
        item_array << item
      end
    end
      self.items = item_array
      self.save
  end

  def price

  end
end
