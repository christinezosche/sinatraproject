require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "intergalacticflights"
  end

  get "/" do
    erb :welcome
  end

  get "/signup" do

  end

  post "/signup" do

  end

  get "/login" do

  end

  post "/login" do

  end

  helpers

end
