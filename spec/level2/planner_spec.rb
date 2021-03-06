require_relative '../../backend/level2/planner'
require_relative '../../backend/level2/car'
require_relative '../../backend/level2/rental'

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
      let(:filepath) {'spec/level2/input_spec.json'}

      it "instanciate a planner" do
        expect(my_planner).to be_an Planner
      end
      it "assign cars list" do
        expect(my_planner.cars).to be_an Array
      end
      it "setup all Car object" do
        expect(my_planner.cars.size).to eq 1
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

  describe "#generate_output" do
    let(:on_test) {my_planner.generate_output('spec/level2/test_output.json')}
    let(:filepath) {'spec/level2/input_spec.json'}

    before(:each) { on_test }
    after(:each) { File.delete 'spec/level2/test_output.json' }

    it "generate a output file" do
      expect(File.exist? 'spec/level2/test_output.json').to be true
    end
    it "generate correct output" do
      expected_content = File.read('spec/level2/expected_output.json').gsub(/\s+/, "")
      output_content = File.read('spec/level2/test_output.json').gsub(/\s+/, "")
      expect(output_content).to eq expected_content
    end
  end

  describe "#rental with price" do
    let(:on_test) { my_planner.rentals_with_prices}

    context "with no rentals" do
      let(:filepath) {'spec/level2/input_no_rental.json'}

      it "return a list" do
        expect(on_test).to be_an Array
      end
      it "return a empty list" do
        expect(on_test).to eq []
      end
    end
    context "with a rental" do
      let(:filepath) {'spec/level2/input_one_rental.json'}
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
      let(:filepath) {'spec/level2/input_spec.json'}
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
