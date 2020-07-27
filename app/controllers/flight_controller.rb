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

    post '/flights/:id/edit' do
        @flight = Flight.all.find(params[:id])
        erb :'/flights/edit'
    end

    post '/flights/:id/delete' do
        flight = Flight.all.find(params[:id])
        flight.destroy
        redirect '/flights'
    end

    patch '/flights/:id' do
        @flight = Flight.find(params[:id])
        booked_flight = Flight.find_by(date: params[:date], ship: params[:ship])
        if booked_flight && booked_flight.date != @flight.date && booked_flight.ship != @flight.ship
            erb :'/flights/edit_flight_error'
        else
            @flight.update(date: params[:date], ship: params[:ship], items: params[:items], destination: params[:destination])
            redirect "/flights/#{@flight.id}"
        end
    end




end
