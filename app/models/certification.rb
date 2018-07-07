require 'uri'

class Certification < ApplicationRecord
  validates :name, :authority,
            presence: true

  validates :url,
            presence: true,
            format: {
                with: URI::regexp(%w(http https)),
                message: 'does not appear to be a valid URL'
            }

  has_and_belongs_to_many(:chef)

end
