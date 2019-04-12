class Car
  attr_reader :id, :price_per_km, :price_per_day

  def initialize(params={})
    @id            = params["id"]
    @price_per_km  = params["price_per_km"]
    @price_per_day = params["price_per_day"]
  end

  def full_price_for(days: 0, distance: 0)
    ((days*price_per_day*day_discount(days)) + (distance*price_per_km)).to_i
  end

  def self.find_by_id(id, cars)
    return nil if id.nil? || cars.empty?
    cars.find { |car| car.is_a?(Car) && car.id == id }
  end

  private

  def day_discount(days)
    case days
    when (0..1)
      1
    when (2..4)
      0.9
    when (5..10)
      0.7
    else
      0.5
    end
  end
end
