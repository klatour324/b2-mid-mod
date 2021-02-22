require "rails_helper"

RSpec.describe Mechanic, type: :model do
  describe "relationships" do
    it { should have_many :ride_mechanics }
    it { should have_many(:rides).through(:ride_mechanics) }
  end

  describe "class methods" do
    describe "::average_years_of_experience" do
      it "can find average years of experience for all mechanics" do
        mechanic1 = Mechanic.create!(first_name: "Joey", last_name: "Smith", years_experience: 20)
        mechanic2 = Mechanic.create!(first_name: "Mark", last_name: "Doe", years_experience: 10)
        mechanic3 = Mechanic.create!(first_name: "Lexi", last_name: "Bea", years_experience: 15)

        expect(Mechanic.average_years_of_experience).to eq(15)
      end
    end

    describe "instance methods" do
      describe "#order_rides_descending" do
        it "can list the rides in descending order by thrill rating (most thrills first)" do
          mechanic1 = Mechanic.create!(first_name: "Joey", last_name: "Smith", years_experience: 20)
          mechanic2 = Mechanic.create!(first_name: "Mark", last_name: "Doe", years_experience: 10)
          mechanic3 = Mechanic.create!(first_name: "Lexi", last_name: "Bea", years_experience: 15)

          ride1 = mechanic1.rides.create!(name: "Whirl & Hurl", thrill_rating: 9, open: false)
          ride2 = mechanic1.rides.create!(name: "Toppling Goliath", thrill_rating: 6, open: true)
          ride3 = mechanic3.rides.create!(name: "The Viper", thrill_rating: 7, open: true)

          expect(Mechanic.order_rides_descending).to eq([ride1,ride2])
        end
      end
    end
  end
end
