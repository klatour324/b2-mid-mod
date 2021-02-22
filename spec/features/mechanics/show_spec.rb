require "rails_helper"

RSpec.describe "Mechanic Show Page" do
  it "can see a mechanic's name, years of experience and all rides they're working on" do
    mechanic1 = Mechanic.create!(first_name: "Joey", last_name: "Smith", years_experience: 20)
    mechanic2 = Mechanic.create!(first_name: "Mark", last_name: "Doe", years_experience: 10)
    mechanic3 = Mechanic.create!(first_name: "Lexi", last_name: "Bea", years_experience: 15)

    ride1 = mechanic1.rides.create!(name: "Whirl & Hurl", thrill_rating: 9, open: false)
    ride2 = mechanic1.rides.create!(name: "Toppling Goliath", thrill_rating: 6, open: true)
    ride3 = mechanic3.rides.create!(name: "The Viper", thrill_rating: 7, open: true)

    visit "/mechanics/#{mechanic1.id}"

    within(".mechanic-#{mechanic1.id}") do
      expect(page).to have_content(mechanic1.first_name)
      expect(page).to have_content(mechanic1.last_name)
      expect(page).to have_content(mechanic1.years_experience)
      expect(page).to have_content(ride1.name)
      expect(page).to have_content(ride2.name)
      expect(page).to_not have_content(ride3.name)
    end
  end
end
