class Order < ActiveRecord::Base
  belongs_to :user
  has_many :items
  has_many :products, through: :items
  validates_presence_of :user

  def create_items(array) #creating items when order created
    array.each do |a|
      t = a[1].to_i
      t.times do
        product = Product.find_by(id: a[0])
        self.products << product
        binding.pry
        product.count -= 1
        product.save
      end
    end
      self.items.each {|i| i.update(price: i.product.price)}
      self.products = self.products.uniq {|pr|pr.id}
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
