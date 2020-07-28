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

  helpers do
    def redirect_if_not_logged_in
      if !logged_in?
        redirect "/"
      end
    end

    def must_be_current_user
      if @flight.user_id != current_user.id
        redirect "/flights"
      end
    end

    def verify_user
      @flight = Flight.find(params[:id])
        redirect_if_not_logged_in
        must_be_current_user
    end
    
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end

  end

end
