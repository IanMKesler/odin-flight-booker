class FlightsController < ApplicationController
  def index
    @flights = Flight.all
    @airport_codes = Airport.all.map{ |a| [a.code] }
    @passenger_options = (1..4).to_a
    @datetime_options = Flight.order(:start).map{ |f| [f.date_formatted] }.uniq
  end
end
