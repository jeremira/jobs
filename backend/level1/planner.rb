require_relative '../../backend/level1/rental'
require_relative '../../backend/level1/car'

class Planner
  attr_reader :cars, :rentals

  def initialize(data={})
    @cars    = data["cars"].map    { |car|    Car.new(car) }       rescue []
    @rentals = data["rentals"].map { |rental| Rental.new(rental) } rescue []
  end

  def rentals_with_prices
    @rentals.map do |rental|
      {
        "id" => rental.id,
        "price" => rental.price(@cars)
      }
    end
  end

end
