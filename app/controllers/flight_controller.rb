class FlightController < ApplicationController

    get '/flights' do
        if !logged_in?
            redirect '/'
        else
        @flights = Flight.all.sort_by{|flight| flight[:date]}
        erb :'/flights/index'
        end
    end

    get '/flights/new' do
        erb :'/flights/new'
    end

    post '/new_flight' do
        booked_flight = Flight.find_by(date: params[:date], ship: params[:ship])
        if booked_flight
            erb :'/flights/flight_error'
        else
        Flight.create(date: params[:date], ship: params[:ship], items: params[:items], destination: params[:destination], user_id: current_user.id)
        redirect '/flights'
        end
    end

    get '/flights/:id' do
        @flight = Flight.all.find(params[:id])
        erb :'/flights/show'
    end

    get '/flights/:id/edit' do
        @flight = Flight.all.find(params[:id])
        erb :'/flights/edit'
    end

    get '/flights/:id/destroy' do
        flight = Flight.all.find(params[:id])
        flight.destroy
        redirect '/flights'
    end


end
