require 'time'
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
          id: 123,
          car_id: 5,
          start_date: "2017-12-1",
          end_date: "2017-12-5",
          distance: 57
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
end
