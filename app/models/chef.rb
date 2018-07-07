class Chef < ApplicationRecord

  belongs_to :user

  validates :user_id,
            presence: true,
            uniqueness: true

  validates :business_name, :business_description,
            presence: true

  has_many :meal

end