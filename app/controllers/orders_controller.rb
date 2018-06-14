class OrdersController < ApplicationController
  get '/orders/new' do
    erb :'/orders/new'
  end

  post '/orders' do
    binding.pry
    if logged_in?
      @order = Order.create(user_id: current_user.id)
      array = params[:order][:category_id].map! {|n|Cateogry.where(id: n)}
      array.each {|category|@order.categories << category}
    end
  end
end
