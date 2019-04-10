class Car
  attr_reader :id, :price_per_km, :price_per_day

  def initialize(params={})
    @id            = params[:id]
    @price_per_km  = params[:price_per_km]
    @price_per_day = params[:price_per_day]
  end
end
