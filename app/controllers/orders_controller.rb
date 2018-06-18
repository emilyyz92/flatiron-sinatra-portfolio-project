class OrdersController < ApplicationController
  get '/orders/new' do
    erb :'/orders/new'
  end

  post '/orders' do
    if logged_in?
      @order = Order.create(user_id: current_user.id)
      array = params[:order][:product_id].zip(params[:order][:count])
      @order.create_items(array)
      @order.save
      redirect "/orders/#{@order.id}"
    end
  end

  get '/orders/:id' do
    @order = Order.find_by(id: params[:id])
    @products = @order.products
    erb :'/orders/show'
  end

  get '/orders/:id/edit' do
    @order = Order.find_by(id: params[:id])
    erb :'/order/edit'
  end
end
