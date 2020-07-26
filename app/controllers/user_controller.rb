class UserController < ApplicationController

    get "/signup" do
        erb :'users/signup'
    end
    
    post "/signup" do
        if params[:username] == "" || params[:password] == ""
            redirect '/signup-error'
        else
            @user = User.create(username: params[:username], password: params[:password])
            session[:user_id] = @user[:id]
            redirect '/flights'
        end
    end
    
    get "/login" do
        erb :'users/login'
    end
    
    post "/login" do
    
    end

end
