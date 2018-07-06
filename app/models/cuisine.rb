class Cuisine < ApplicationRecord
  validates :name,
            presence: true

end
