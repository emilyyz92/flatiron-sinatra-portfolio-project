class OrdersController < ApplicationController
  get '/orders/new' do
    erb :'/orders/new'
  end

  post '/orders' do
    binding.pry
    if logged_in?
      @order = Order.create(user_id: current_user.id)
    end
  end
end
