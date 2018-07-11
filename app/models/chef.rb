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

  accepts_nested_attributes_for :cuisines

  scope :for_clients, -> do
    joins(:cuisines).includes(:cuisines)
         .joins(:dietary_accommodations).includes(:dietary_accommodations)
         .joins(:certifications).includes(:certifications)
         .joins(:meals).includes(:meals)
  end

end