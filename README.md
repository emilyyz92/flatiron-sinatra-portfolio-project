# flatiron-sinatra-portfolio-project
Flatiron Sinatra Web App Project
My Equipment Shack
 - user accounts
 - orders
 - products (prices, quantities, orders, account_product)
 A product can have many orders, and have many user accounts through orders.
 User account has many orders, and has many products through orders.
 Orders belong to user account.
 Order & Product (has_many)
 Order & User Account (belong_to)
 Product & User Account (has_many)
