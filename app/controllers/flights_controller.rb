class FlightsController < ApplicationController
  def index
    #byebug
    @flights = params[:flight] ? Flight.search(search_params) : Flight.all 
    #byebug
    @airport_options = Airport.all.map{ |a| [a.code, a.id] }
    @passenger_options = (1..4).to_a
    @datetime_options = Flight.order(:start).map{ |f| [f.date_formatted, f.start] }.uniq
    #@previous_selections = previous_selections(params[:flight])
  end

  private
    def search_params
      params.require(:flight).permit(:from_airport_id, :to_airport_id, :passengers, :start)
    end

    # def previous_selections(params)
    #   temp = {}
    #   temp[:from]=params[:flight][:from_aiport_id]
    # end
end
