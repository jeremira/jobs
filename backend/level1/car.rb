class Car
  attr_reader :id, :price_per_km, :price_per_day

  def initialize(params={})
    @id            = params[:id]
    @price_per_km  = params[:price_per_km]
    @price_per_day = params[:price_per_day]
  end

  def full_price_for(days: 0, distance: 0)
    days * price_per_day + distance * price_per_km
  end
end
