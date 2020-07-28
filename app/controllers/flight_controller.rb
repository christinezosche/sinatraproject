class FlightController < ApplicationController

    get '/flights' do
        redirect_if_not_logged_in
        @flights = Flight.all.sort_by{|flight| flight[:date]}
        erb :'/flights/index'
    end

    get '/flights/new' do
        redirect_if_not_logged_in
        erb :'/flights/new'
    end

    post '/new_flight' do
        redirect_if_not_logged_in
        booked_flight = Flight.find_by(date: params[:date], ship: params[:ship])
        date_taken = Flight.find_by(date: params[:date], user_id: current_user.id)
        if booked_flight
            erb :'/flights/flight_error'
        elsif date_taken
            erb :'/flights/date_error'
        else
        Flight.create(date: params[:date], ship: params[:ship], items: params[:items], destination: params[:destination], user_id: current_user.id)
        redirect '/flights'
        end
    end

    get '/flights/:id' do
        verify_user
        erb :'/flights/show'
    end

    post '/flights/:id/edit' do
        verify_user
        erb :'/flights/edit'
    end

    post '/flights/:id/delete' do
        verify_user
        @flight.destroy
        redirect '/flights'
    end

    patch '/flights/:id' do
        verify_user
        other_flights = Flight.where.not(id: @flight.id)
        booked_flight = other_flights.find_by(date: params[:date], ship: params[:ship])
        date_taken = other_flights.find_by(date: params[:date], user_id: current_user.id)
        if booked_flight
            erb :'/flights/edit_flight_error'
        elsif date_taken
            erb :'/flights/edit_date_error'
        else
            @flight.update(date: params[:date], ship: params[:ship], items: params[:items], destination: params[:destination])
            redirect "/flights/#{@flight.id}"
        end
    end




end
