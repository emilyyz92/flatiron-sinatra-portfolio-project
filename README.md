# flatiron-sinatra-portfolio-project
Flatiron Sinatra Web App Project
Joe's Gear Shack
 - user accounts
 - orders
 - products (prices, quantities, orders, account_product)
 Object Relationships:
 - user has many orders; order belongs to user
 - order has many products; product belongs to order
 - Order has many product categories through products; category has many orders through products
 User can edit orders after logging in
 Users can see products and available quantities
 Order number is multi-digit integer randomly generated
