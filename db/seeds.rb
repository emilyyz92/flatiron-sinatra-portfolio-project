User.create(username: "rapunzel", password: "hair", name: "Rapunzel", email: "rapunzel@gmail.com")
User.create(username: "panda", password: "kungfu", name: "Shifu", email: "panda@gmail.com")
Product.create(name: "Gloves", price: 5.99, count: 100)
Product.create(name: "Hats", price: 8.99, count: 60)
Product.create(name: "Work Shoes", price: "15.99", count: 20)
# Category.all.each do |c|
#   c.count.times do
#     Product.create(category_id: c.id)
#   end
# end
