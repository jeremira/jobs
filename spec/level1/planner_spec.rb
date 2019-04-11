require 'time'
require_relative '../../backend/level1/planner'

RSpec.describe Planner do

  describe "#Initialize" do
    let(:my_planner) {Planner.new(data_planner)}
    let(:data_planner) {{}}

    context "with no data" do
      it "instanciate a planner" do
        expect(my_planner).to be_a Planner
      end
      it "assign no car" do
        expect(my_planner.cars).to eq []
      end
      it "assign no rental" do
        expect(my_planner.rentals).to eq []
      end
    end
    context "with valid data" do
      let(:data_planner) do
        {
          "cars": [
            { "id": 1, "price_per_day": 2000, "price_per_km": 10 },
            { "id": 2, "price_per_day": 3000, "price_per_km": 15 },
            { "id": 3, "price_per_day": 1700, "price_per_km": 8 }
          ],
          "rentals": [
            { "id": 1, "car_id": 1, "start_date": "2017-12-8", "end_date": "2017-12-10", "distance": 100 },
            { "id": 2, "car_id": 1, "start_date": "2017-12-14", "end_date": "2017-12-18", "distance": 550 },
            { "id": 3, "car_id": 2, "start_date": "2017-12-8", "end_date": "2017-12-10", "distance": 150 }
          ]
        }
      end

      it "instanciate a planner" do
        expect(my_planner).to be_an Planner
      end
      it "assign cars list" do
        expect(my_planner.cars).to be_an Array
      end
      it "construct cars object" do
        my_planner.cars.each { |car| expect(car).to be_a Car }
      end
      it "assign rentals list" do
        expect(my_planner.rentals).to be_an Array
      end
      it "construct rentals object" do
        my_planner.rentals.each { |rental| expect(rental).to be_a Rental }
      end
    end
  end

  describe "#rental with price" do

    context "with no rentals" do
      it "return a list"
      it "return a empty list"
      
    end
  end
end
