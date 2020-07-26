class FlightController < ApplicationController

    get '/flights' do
        if !logged_in?
            redirect '/'
        else
        erb :'flights/index'
        end
    end

    post '/create_new_flight' do

    end

end
