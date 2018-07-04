class User < ApplicationRecord
  validates :email,
            presence: true,
            format: {
                with: /\A[^@\s]+@[^@\s]+\z/,
                message: 'does not appear to be a valid email address',
            }
            # this is related to the test for email dups
            # , uniqueness: true

  validates :password,
            presence: true

  validates :role,
            presence: true


  enum role: [:client, :chef]

  validates :first_name,
            presence: true

  validates :last_name,
            presence: true

  validates :contact_phone,
            presence: true

  validates :street_address, :city, :state, :zip_code,
            presence: true

  def authenticate(password)
    password == self.password
  end

end
