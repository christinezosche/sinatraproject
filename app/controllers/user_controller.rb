class UserController < ApplicationController

    get "/signup" do
        if logged_in?
            redirect '/flights'
        else
        erb :'users/signup'
        end
    end
    
    post "/signup" do
        if params[:username] == "" || params[:password] == ""
            redirect '/signup_error'
        elsif User.find_by(username: params[:username])
            redirect '/username_error'
        else
            @user = User.create(username: params[:username], password: params[:password])
            session[:user_id] = @user[:id]
            redirect '/flights'
        end
    end

    get "/signup_error" do
        erb :'users/signup_error'
    end

    get "/username_error" do
        erb :'users/username_error'
    end
    
    get "/login" do
        erb :'users/login'
    end
    
    post "/login" do
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect '/flights'
        else
            redirect '/login_error'
        end
    end

    get '/login_error' do
        erb :'users/login_error'
    end

    post '/view_my_flights' do
        @user = current_user
        erb :'users/view_flights'
    end

    post '/logout' do
        session.clear
        redirect '/'
    end
    

end
