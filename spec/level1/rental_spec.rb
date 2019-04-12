require_relative '../../backend/level1/rental'

RSpec.describe Rental do
  let(:my_rental) {Rental.new(rental_params)}
  let(:rental_params) {{}}

  describe "#Initialize" do
    context "with no params" do
      it "init a rental instance" do
        expect(my_rental).to be_an Rental
      end
      it "link no car" do
        expect(my_rental.car_id).to be nil
      end
      it "assign an nil id" do
        expect(my_rental.id).to be nil
      end
      it "assign an nil start date" do
        expect(my_rental.start_date).to be nil
      end
      it "assign an nil end_date" do
        expect(my_rental.end_date).to be nil
      end
      it "assign an nil distance" do
        expect(my_rental.distance).to be nil
      end
    end
    context "with params" do
      let(:rental_params) do
        {
          "id" => 123,
          "car_id" => 5,
          "start_date" => "2017-12-1",
          "end_date" => "2017-12-5",
          "distance" => 57
        }
      end
      it "init a rental instance" do
        expect(my_rental).to be_an Rental
      end
      it "assign correct id" do
        expect(my_rental.id).to eq 123
      end
      it "assign car id" do
        expect(my_rental.car_id).to eq 5
      end
      it "assign correct start date" do
        expect(my_rental.start_date).to eq Time.parse("2017-12-1")
      end
      it "assign correct end_date" do
        expect(my_rental.end_date).to eq Time.parse("2017-12-5")
      end
      it "assign correct distance" do
        expect(my_rental.distance).to eq 57
      end
    end
  end

  describe "#price" do
    let(:on_test) {my_rental.price([])}
    let(:rental_params) do
      {
        "id" => 123,
        "car_id" => 5,
        "start_date" => "2017-12-1",
        "end_date" => "2017-12-5",
        "distance" => 57
      }
    end
    before :each do
      car_double = instance_double("Car")
      expect(Car).to receive(:find_by_id).with(5, []) {car_double}
      expect(car_double).to receive(:full_price_for).with(days: 5, distance: 57) {666}
    end
    it "find relevant car and ask for it price" do
      expect(on_test).to eq 666
    end
  end

  describe "#days" do
    let(:on_test) {my_rental.days}

    context "with same end/start date" do
      let(:rental_params) {{"start_date" => "2015-12-05", "end_date" => "2015-12-05"}}
      it "return an integer" do
        expect(on_test).to be_an Integer
      end
      it "return correct day amount" do
        expect(on_test).to eq 1
      end
    end
    context "when start before end" do
      let(:rental_params) {{"start_date" => "2015-12-05", "end_date" => "2015-12-09"}}
      it "return an integer" do
        expect(on_test).to be_an Integer
      end
      it "return correct day amount" do
        expect(on_test).to eq 5
      end
    end
    context "when ending before starting" do
      let(:rental_params) {{"start_date" => "2015-12-05", "end_date" => "2015-12-01"}}
      it "return an integer" do
        expect(on_test).to be_an Integer
      end
      it "return correct day amount" do
        expect(on_test).to eq 5
      end
    end
  end
end
