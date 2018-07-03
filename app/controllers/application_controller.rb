class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, "secret"
  end

  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end

  helpers do
    def redirect_if_not_logged_in
      if !logged_in?
        redirect "/users/login"
      end
    end

    def logged_in?
      !!session[:user_id]
    end

    def current_user
      if !@user
        @user = User.find_by(id: session[:user_id])
      else
        @user
      end
    end

  end
end
