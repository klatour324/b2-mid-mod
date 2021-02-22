require "rails_helper"

RSpec.describe "Mechanic Index Page" do
  describe 'when I visit the mechanics index page' do
    it "can see a header saying all mechanics, a list of the mechanics and their attributes, and average years of experience across all mechanics" do
    mechanic1 = Mechanic.create!(first_name: "Joey", last_name: "Smith", years_experience: 20)
    mechanic2 = Mechanic.create!(first_name: "Mark", last_name: "Doe", years_experience: 10)
    mechanic3 = Mechanic.create!(first_name: "Lexi", last_name: "Bea", years_experience: 15)

      visit "/mechanics"

      expect(page).to have_content("All Mechanics")

      within(".mechanics") do
        expect(page).to have_content(mechanic1.first_name)
        expect(page).to have_content(mechanic1.last_name)
        expect(page).to have_content(mechanic2.first_name)
        expect(page).to have_content(mechanic2.last_name)
        expect(page).to have_content(mechanic3.first_name)
        expect(page).to have_content(mechanic3.last_name)
        expect(page).to have_content(mechanic1.years_experience)
        expect(page).to have_content(mechanic2.years_experience)
        expect(page).to have_content(mechanic3.years_experience)
      end

      within("section.years_experience-stats") do
        expect(page).to have_content("Average Years of Experience: 15")
      end
    end
  end
end
