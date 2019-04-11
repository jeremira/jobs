require 'time'

class Rental
  attr_reader :id, :car_id, :start_date, :end_date, :distance

  def initialize(params={})
    @id         = params["id"]
    @car_id     = params["car_id"]
    @start_date = Time.parse(params["start_date"]) rescue nil
    @end_date   = Time.parse(params["end_date"])   rescue nil
    @distance   = params["distance"]
  end

  def price(cars)
    Car.find_by_id(car_id, cars)
       .full_price_for(days: days, distance: distance)
  end

  def days
    (end_date - start_date).to_i.abs / (24 * 60 * 60)
  end
end
