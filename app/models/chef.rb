class Chef < ApplicationRecord

  belongs_to :user

  validates :user_id,
            presence: true,
            uniqueness: true

  validates :business_name, :business_description,
            presence: true


  has_many :meals
  has_and_belongs_to_many :cuisines
  has_and_belongs_to_many :dietary_accommodation
  has_and_belongs_to_many :certification

  accepts_nested_attributes_for :cuisines

  scope :for_clients, -> do
    joins(:cuisines).includes(:cuisines)
         .joins(:dietary_accommodation).includes(:dietary_accommodation)
         .joins(:certification).includes(:certification)
         .left_outer_joins(:meals).includes(:meals)
  end

end