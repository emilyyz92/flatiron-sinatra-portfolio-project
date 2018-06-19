class OrdersController < ApplicationController
  register Sinatra::ActiveRecordExtension
  register Sinatra::Flash

  get '/orders/new' do
    erb :'/orders/new'
  end

  post '/orders' do
    if session[:user_id] == current_user.id && logged_in?
      if !params[:order][:count].all?{|c| c == 0}
        @order = Order.create(user_id: current_user.id)
        array = params[:order][:product_id].zip(params[:order][:count])
        @order.create_items(array)
        redirect "/orders/#{@order.id}"
      else
        flash[:message] = "Can't create an order with zero quantities."
        redirect "/orders/new"
      end
    else
      redirect "/"
    end
  end

  get '/orders/:id' do
    @order = Order.find_by(id: params[:id])
    @products = @order.products
    if session[:user_id] == current_user.id && logged_in?
      erb :'/orders/show'
    else
      flash[:message] = "You don't have access to this order"
      redirect "/"
    end
  end

  get '/orders/:id/edit' do
    if session[:user_id] == current_user.id && logged_in?
      @order = Order.find_by(id: params[:id])
      erb :'/orders/edit'
    else
      flash[:message] = "You don't have access to this order"
      redirect "/"
    end
  end

  post '/orders/:id' do
    if !params[:order][:count].all?{|c| c == 0}
      @order = Order.find_by(id: params[:id])
      @order.products.clear
      Item.delete(@order.items)
      @order.items.clear
      array = params[:order][:product_id].zip(params[:order][:count])
      @order.create_items(array)
    else
      flash[:message] = "Can't create an order with zero quantities."
    end
    redirect "/orders/#{@order.id}"
  end

  get '/orders/:id/delete' do
    if session[:user_id] == current_user.id && logged_in?
      @order = Order.find_by(id: params[:id])
      Item.delete(@order.items)
      Order.delete(@order)
      redirect "/users/#{session[:user_id]}"
    else
      flash[:message] = "You don't have access to this order"
      redirect "/"
    end
  end
end
