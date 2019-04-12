require 'json'
require_relative '../../backend/level1/rental'
require_relative '../../backend/level1/car'

class Planner
  attr_reader :cars, :rentals

  def initialize(filepath = 'data/input.json')
    begin
      data = JSON.parse(File.read(filepath))
    rescue Errno::ENOENT
      data = {}
    end
    @cars    = data["cars"].map    { |car|    Car.new(car) }       rescue []
    @rentals = data["rentals"].map { |rental| Rental.new(rental) } rescue []
  end

  def generate_output(filepath= 'data/output.json')
    File.write(
      filepath,
      { "rentals" => rentals_with_prices }.to_json
    )
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
