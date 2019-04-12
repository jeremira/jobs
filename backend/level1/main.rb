require_relative '../../backend/level1/planner'

output = {
  "rentals" => Planner.new( JSON.parse(File.read('data/input.json')) ).rentals_with_prices
}.to_json

File.write('data/output.json', output)
