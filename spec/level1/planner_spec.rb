require_relative '../../backend/level1/planner'

RSpec.describe Planner do
  let(:my_planner) {Planner.new(filepath)}
  let(:filepath) {""}

  describe "#Initialize" do
    context "input data are not found" do
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
    context "valid input data are found" do
      let(:filepath) {'spec/level1/input_spec.json'}

      it "instanciate a planner" do
        expect(my_planner).to be_an Planner
      end
      it "assign cars list" do
        expect(my_planner.cars).to be_an Array
      end
      it "setup all Car object" do
        expect(my_planner.cars.size).to eq 3
      end
      it "construct cars object" do
        my_planner.cars.each { |car| expect(car).to be_a Car }
      end
      it "assign rentals list" do
        expect(my_planner.rentals).to be_an Array
      end
      it "setup all Rental object" do
        expect(my_planner.rentals.size).to eq 3
      end
      it "construct rentals object" do
        my_planner.rentals.each { |rental| expect(rental).to be_a Rental }
      end
    end
  end

  describe "#rental with price" do
    let(:on_test) { my_planner.rentals_with_prices}

    context "with no rentals" do
      let(:filepath) {'spec/level1/input_no_rental.json'}

      it "return a list" do
        expect(on_test).to be_an Array
      end
      it "return a empty list" do
        expect(on_test).to eq []
      end
    end
    context "with a rental" do
      let(:filepath) {'spec/level1/input_one_rental.json'}
      before(:each) { expect(my_planner.rentals.first).to receive(:price) {999}}

      it "return a list" do
        expect(on_test).to be_an Array
      end
      it "return a list of one element" do
        expect(on_test.size).to eq 1
      end
      it "return a list of hashes" do
        expect(on_test.first).to be_an Hash
      end
      it "setup id key" do
        expect(on_test.first).to have_key "id"
      end
      it "setup correct id" do
        expect(on_test.first["id"]).to eq 8
      end
      it "setup price key" do
        expect(on_test.first).to have_key "price"
      end
      it "setup correct price" do
        expect(on_test.first["price"]).to eq 999
      end
    end
    context "with many rentals" do
      let(:filepath) {'spec/level1/input_spec.json'}
      before(:each) do
        my_planner.rentals.each { |rental| expect(rental).to receive(:price) {555}}
      end

      it "return a list" do
        expect(on_test).to be_an Array
      end
      it "return a list of 3 element" do
        expect(on_test.size).to eq 3
      end
      it "return a list of hashes" do
        on_test.each { |rental| expect(rental).to be_an Hash }
      end
      it "setup id keys" do
        on_test.each { |rental| expect(rental).to have_key "id" }
      end
      it "setup price keys" do
        on_test.each { |rental| expect(rental).to have_key "price" }
      end
    end
  end
end
