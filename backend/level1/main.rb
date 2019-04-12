require 'json'
require_relative '../../backend/level1/planner'

a = {
  "rentals" => Planner.new( JSON.parse(File.read('data/input.json')) ).rentals_with_prices
}.to_json

puts a.inspect
