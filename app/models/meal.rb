class Meal < ApplicationRecord
  validates :short_name, :description,
            presence: true

  validates :active,
            inclusion: {
                in: [true, false],
                message: "can't be blank"
            }

  validates :price,
            presence: true,
            numericality: {greater_than_or_equal_to: 0}

  belongs_to :chef
  has_and_belongs_to_many :cuisines
  has_and_belongs_to_many :dietary_accommodations

end