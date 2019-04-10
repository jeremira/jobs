require 'time'

class Rental
  attr_reader :id, :start_date, :end_date, :distance

  def initialize(params={})
    @id         = params[:id]
    @start_date = Time.parse(params[:start_date]) rescue nil
    @end_date   = Time.parse(params[:end_date])   rescue nil
    @distance   = params[:distance]
  end
end
