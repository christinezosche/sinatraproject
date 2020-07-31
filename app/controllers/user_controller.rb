class UserController < ApplicationController

    get "/signup" do
        if logged_in?
            redirect '/flights'
        else
        erb :'users/signup'
        end
    end
    
    post "/signup" do
        if params[:name] == "" || params[:username] == "" || params[:password] == ""
            redirect '/signup_error'
        elsif User.find_by(username: params[:username])
            redirect '/username_error'
        else
            @user = User.create(name: params[:name], username: params[:username], password: params[:password])
            session[:user_id] = @user[:id]
            redirect '/flights'
        end
    end

    get "/signup_error" do
        if logged_in?
            redirect "/flights"
        else
        erb :'users/signup_error'
        end
    end

    get "/username_error" do
        if logged_in?
            redirect "/flights"
        else
        erb :'users/username_error'
        end
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

    get '/users/logout' do
        redirect_if_not_logged_in
        session.clear
        redirect '/'
    end

    get '/users/:id' do
        redirect_if_not_logged_in
        @user = User.find(params[:id])
        if @user && @user == current_user
            erb :'users/show'
        else
            redirect '/flights'
        end
    end
    

end
