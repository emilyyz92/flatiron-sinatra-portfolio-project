require 'sinatra/flash'
class UsersController < ApplicationController
  register Sinatra::ActiveRecordExtension
  register Sinatra::Flash

  get '/users/signup' do
    erb :'/users/signup'
  end

  post '/users/signup' do
    if params[:user].values.any?{|a|a == "" || a == [] || a == nil}
      flash[:error] = "Invalid user input, please try again."
      redirect "/users/signup"
    else
      @user = User.create(params[:user])
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    end
  end

  get '/users/login' do
    erb :'/users/login'
  end

  post '/users/login' do
    if params[:user].values.any?{|a|a == "" || a == nil}
      flash[:error] = "Invalid user input, please try again."
      redirect "/users/login"
    else
      user = User.find_by(username: params[:user][:username])
      if user && user.authenticate(params[:user][:password])
        session[:user_id] = user.id
        redirect "users/#{user.id}"
      else
        flash[:error] = "Invalid user input, please try again."
        redirect "/users/login"
      end
    end
  end

  get '/users/:id' do
    @user = User.find_by(id: params[:id])
    erb :'/users/show'
  end

  get '/users/logout' do
    if User.find_by(id: session[:user_id])
      session.clear
      flash[:message] = "Successfully Logged Out"
    end
    redirect "/"
  end


end
