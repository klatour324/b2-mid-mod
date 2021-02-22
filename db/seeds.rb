# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
RideMechanic.destroy_all
Ride.destroy_all
Mechanic.destroy_all

mechanic1 = Mechanic.create!(first_name: "Joey", last_name: "Smith", years_experience: 20)
mechanic2 = Mechanic.create!(first_name: "Mark", last_name: "Doe", years_experience: 10)
mechanic3 = Mechanic.create!(first_name: "Lexi", last_name: "Bea", years_experience: 15)

ride1 = mechanic1.rides.create!(name: "Whirl & Hurl", thrill_rating: 9, open: false)
ride2 = mechanic1.rides.create!(name: "Toppling Goliath", thrill_rating: 6, open: true)
ride3 = mechanic3.rides.create!(name: "The Viper", thrill_rating: 7, open: true)
