class DietaryAccommodation < ApplicationRecord
  validates :name,
            presence: true,
            uniqueness: true
end
