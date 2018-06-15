class OrdersController < ApplicationController
  get '/orders/new' do
    erb :'/orders/new'
  end

  post '/orders' do
    binding.pry
    if logged_in?
      @order = Order.create(user_id: current_user.id)
      array = params[:order][:product_id].zip(params[:order][:count])
      @order.create_items(array)
    end
  end
end
