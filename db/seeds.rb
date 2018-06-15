User.create(username: "buyer1", password: "abc", name: "Jack", email: "jack@gmail.com")
User.create(username: "panda", password: "kungfu", name: "Jackie", email: "jackie@gmail.com")
Order.create(user_id: 1)
Product.create(name: "Gloves", price: 5.99, count: 100)
Product.create(name: "Hats", price: 8.99, count: 60)
# Category.all.each do |c|
#   c.count.times do
#     Product.create(category_id: c.id)
#   end
# end
