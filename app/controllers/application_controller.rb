class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, "secret"
  end

  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end
end
