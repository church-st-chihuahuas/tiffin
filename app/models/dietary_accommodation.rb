class DietaryAccommodation < ApplicationRecord
  validates :name,
            presence: true
end
