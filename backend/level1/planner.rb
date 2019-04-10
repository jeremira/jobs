class Planner
  attr_reader :cars, :rentals

  def initialize(data={})
    @cars    = data["cars"].map    { |car|    Car.new(car.symbolize_keys) }       rescue []
    @rentals = data["rentals"].map { |rental| Rental.new(rental.symbolize_keys) } rescue []
  end

end
