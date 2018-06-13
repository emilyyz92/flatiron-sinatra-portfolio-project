# flatiron-sinatra-portfolio-project
Flatiron Sinatra Web App Project
Joe's Gear Shack
 - user accounts
 - orders
 - products (prices, quantities, orders, account_product)
 A product can have many orders, and have many user accounts through orders.
 User account has many orders, and has many products through orders.
 Orders belong to user.
 Order & Product (has_many)
 Order & User Account (belong_to)
 Product & User Account (has_many)

 User can edit orders after logging in
 Users can see products and available quantities
 Order number is multi-digit integer randomly generated
