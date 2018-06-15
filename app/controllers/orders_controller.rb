class OrdersController < ApplicationController
  get '/orders/new' do
    erb :'/orders/new'
  end

  post '/orders' do
    binding.pry
    if logged_in?
      @order = Order.create(user_id: current_user.id)
      array = params[:order][:product_id].zip(params[:order][:count])
      array.map! do |a|
        t = a[1].to_i
        t.count.Item.create(product_id: a[0])
      end
    end
  end
end
