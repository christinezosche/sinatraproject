class FlightController < ApplicationController

    get '/flights' do
        erb :'flights/index'
    end

end
