class UserController < ApplicationController

    get "/signup" do
        erb :'users/signup'
    end
    
    post "/signup" do
        @user = User.new(username: params[:username], password: params[:password])
        if @user.save
            @user.save
            session[:user_id] = @user[:id]
            redirect '/flights'
        else
            redirect '/signup'
        end
    end
    
    get "/login" do
        erb :'users/login'
    end
    
    post "/login" do
    
    end

end
