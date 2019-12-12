class BookingsController < ApplicationController
    def new
        @flight = Flight.find(params[:selected])
        @passenger = Passenger.new
        @booking = Booking.new
    end

    def create
        @passenger = Passenger.new(passenger_params)
        if @passenger.save
            @booking = @passenger.bookings.build(booking_params)
            if @booking.save
                flash[:success] = "Booking made"
                redirect_to bookings_path(@booking.id)
            else
                flash.now[:danger] = "Booking couldn't save"
                render 'new'
            end 
        else
            flash.now[:danger] = "Passenger couldn't save"
            render 'new'
        end 
    end

    def show
        @booking = Booking.find(params[:format])
        @flight = @booking.flight
        @passenger = @booking.passenger
    end

    private
        def booking_params
            params.require(:booking).permit(:flight_id)
        end

        def passenger_params
            params.require(:booking).permit(passenger: [:name, :email])[:passenger]
        end
end
