class User < ApplicationRecord
  validates :email,
            presence: true,
            format: {
                with: /\A[^@\s]+@[^@\s]+\z/,
                message: 'does not appear to be a valid email address'
            },
            uniqueness: {
                case_sensitive: false
            }

  validates :password,
            presence: true
            # confirmation: true

  validates :password, confirmation: { case_sensitive: true }

  validates :role,
            presence: true

  enum role: {client: 'client', chef: 'chef'}

  validates :first_name, :last_name, :contact_phone,
            presence: true

  validates :street_address, :city, :state, :zip_code, :latitude, :longitude,
            presence: true

  has_one :chef

  def authenticate(password)
    password == self.password
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def full_address
    "#{self.street_address}, #{self.city}, #{self.state}, #{self.zip_code}"
  end

end
