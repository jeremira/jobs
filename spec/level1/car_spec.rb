require_relative '../../backend/level1/car'

RSpec.describe Car do
  let(:my_car) {Car.new(car_params)}
  let(:car_params) {{}}

  describe "#Initialize" do
    context "with no params" do
      it "init a car instance" do
        expect(my_car).to be_a Car
      end
      it "assign an nil id" do
        expect(my_car.id).to be nil
      end
      it "assign an nil start date" do
        expect(my_car.price_per_day).to be nil
      end
      it "assign an nil end_date" do
        expect(my_car.price_per_km).to be nil
      end
    end
    context "with params" do
      let(:car_params) do
        {
          id: 123,
          price_per_km: 456,
          price_per_day: 789
        }
      end
      it "init a car instance" do
        expect(my_car).to be_a Car
      end
      it "assign correct id" do
        expect(my_car.id).to eq 123
      end
      it "assign correct price per km" do
        expect(my_car.price_per_km).to eq 456
      end
      it "assign correct price per day" do
        expect(my_car.price_per_day).to eq 789
      end
    end
  end

  describe "#full_price_for" do
    let(:car_params) do
       {
         id: 123,
         price_per_day: 23,
         price_per_km: 14
       }
    end

    context "with no setup" do
      let(:on_test) { my_car.full_price_for }

      it "return an Integer" do
        expect(on_test).to be_an Integer
      end
      it "return correct price" do
        expect(on_test).to eq 0
      end
    end
    context "for one day" do
      context "but no distance" do
        let(:on_test) { my_car.full_price_for days: 1 }
        it "return an Integer" do
          expect(on_test).to be_an Integer
        end
        it "return correct price" do
          expect(on_test).to eq 23
        end
      end
      context "and some distance" do
        let(:on_test) { my_car.full_price_for days: 1, distance: 55 }
        it "return an Integer" do
          expect(on_test).to be_an Integer
        end
        it "return correct price" do
          expect(on_test).to eq(23 + 55*14)
        end
      end
    end
    context "for many days" do
      context "but no distance" do
        let(:on_test) { my_car.full_price_for days: 6 }
        it "return an Integer" do
          expect(on_test).to be_an Integer
        end
        it "return correct price" do
          expect(on_test).to eq 6*23
        end
      end
      context "and some distance" do
        let(:on_test) { my_car.full_price_for days: 6, distance: 73 }
        it "return an Integer" do
          expect(on_test).to be_an Integer
        end
        it "return correct price" do
          expect(on_test).to eq(6*23 + 73*14)
        end
      end
    end
  end
end