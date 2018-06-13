class UsersController < ApplicationController
  get '/users/signup' do
    erb :'/users/signup'
  end

  post '/users/signup' do
    if params[:user].any?{|a|a == "" || a == [] || a == nil}
      flash[:message] = "Invalid user registration, please try again."
      redirect "/users/signup"
    else
      @user = User.create(params[:user])
      redirect "/users/#{@user.id}"
    end
  end
end
