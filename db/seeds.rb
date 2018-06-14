User.create(username: "buyer1", password: "abc", name: "Jack", email: "jack@gmail.com")
User.create(username: "panda", password: "kungfu", name: "Jackie", email: "jackie@gmail.com")
Order.create(user_id: 1)
Category.create(name: "Gloves", price: 5.99, count: 100)
Category.create(name: "Hats", price: 8.99, count: 60)
Product.create(category_id: 1, order_id: 1)
Category.all.each do |c|
  c.count.times do
    Product.create(category_id: c.id)
  end
end
