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
  end
end
