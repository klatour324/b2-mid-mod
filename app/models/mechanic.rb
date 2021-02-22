class Mechanic < ApplicationRecord
  has_many :ride_mechanics
  has_many :rides, through: :ride_mechanics

  def self.average_years_of_experience
    select(:years_experience).average(:years_experience)
  end

  def order_rides_descending
    rides.order(:thrill_rating)
  end
end
