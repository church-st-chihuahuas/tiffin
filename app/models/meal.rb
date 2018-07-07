class Meal < ApplicationRecord
  validates :short_name, :description,
            presence: true

  belongs_to :chef
  has_many :cuisines
  has_many :dietary_accommodations

end