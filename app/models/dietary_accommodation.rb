class DietaryAccommodation < ApplicationRecord
  validates :name,
            presence: true,
            uniqueness: true

  has_and_belongs_to_many(:meal)
  has_and_belongs_to_many(:chef)
end
