class Chef < ApplicationRecord

  belongs_to :user

  validates :user_id,
            presence: true,
            uniqueness: true

  validates :business_name, :business_description,
            presence: true


  has_many :meal
  has_and_belongs_to_many :cuisine
  has_and_belongs_to_many :dietary_accommodation
  has_and_belongs_to_many :certification

end