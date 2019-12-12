class Flight < ApplicationRecord
  belongs_to :from_airport, class_name: "Airport"
  belongs_to :to_airport, class_name: "Airport"
  has_many :bookings
  has_many :passengers, through: :bookings

  def date_formatted
    self.start.strftime("%m/%d/%Y")
  end

  def time_formatted
    self.start.strftime("%l:%M %P")
  end

  def self.search(search_params)
    # search_query = ["from_airport_id = ? and to_airport_id = ? and start = ?", 
    #               search_params[:from].to_i, 
    #               search_params[:to].to_i, 
    #               search_params[:start].to_time]
    # search_query = ""
    valid_params = search_params.select{ |key,value| value != ""}
    begin
      valid_params[:start] = valid_params[:start].to_time.all_day
    rescue  
    end
    #byebug
    Flight.where(valid_params)
  end
end

