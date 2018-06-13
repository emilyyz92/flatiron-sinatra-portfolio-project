require 'sinatra/flash'
class UsersController < ApplicationController
  register Sinatra::ActiveRecordExtension
  register Sinatra::Flash

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

  get '/users/login' do
    erb :'/users/login'
  end

  get '/users/:id' do
    @user = User.find_by(id: params[:id])
    erb :'/users/show'
  end


end
