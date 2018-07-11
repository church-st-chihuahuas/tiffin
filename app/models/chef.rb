class Chef < ApplicationRecord

  belongs_to :user

  validates :user_id,
            presence: true,
            uniqueness: true

  validates :business_name, :business_description,
            presence: true


  has_many :meals
  has_and_belongs_to_many :cuisines
  has_and_belongs_to_many :dietary_accommodations
  has_and_belongs_to_many :certifications

  scope :for_clients, -> do
    left_outer_joins(:cuisines).includes(:cuisines)
         .left_outer_joins(:dietary_accommodations).includes(:dietary_accommodations)
         .left_outer_joins(:certifications).includes(:certifications)
         .left_outer_joins(:meals).includes(:meals)
  end

end