class Order < ActiveRecord::Base
  belongs_to :user
  has_many :items
  has_many :products, through: :items
  validates_presence_of :items, :user

  def create_items(array) #creating items when order created
    item_array = []
    array.each do |a|
      t = a[1].to_i
      t.times do
        product = Product.find_by(id: a[0])
        item = Item.create(product_id: product.id, price: product.price)
        item_array << item
      end
    end
      self.items = item_array
      self.save
  end

  def order_item_count(product_id)
      array = items.select {|i| i.product_id ==  product_id}
      array.count
  end

  def order_price
    a = 0
    items.each do |i|
      a += i.price
    end
    a = a.round(2)
  end

end
