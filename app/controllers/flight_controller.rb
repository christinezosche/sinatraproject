class FlightController < ApplicationController

    get '/flights' do
        if !logged_in?
            redirect '/'
        else
        erb :'flights/index'
        end
    end

    post '/create_new_flight' do
        erb :'/flights/new'
    end

    post '/new_flight' do
        booked_flight = Flight.find_by(date: params[:date], ship: params[:ship])
        if booked_flight
            erb :'/flights/flight_error'
        else
        @flight = Flight.create(date: params[:date], ship: params[:ship], items: params[:items], destination: params[:destination], user_id: current_user.id)
        redirect '/flights'
        end
    end

end
