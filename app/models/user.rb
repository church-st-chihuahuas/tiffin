class User < ApplicationRecord
  include Math

  validates :email,
            presence: true,
            format: {
                with: /\A[^@\s]+@[^@\s]+\z/,
                message: 'does not appear to be a valid email address'
            },
            uniqueness: {case_sensitive: false}

  validates :password,
            presence: true,
            confirmation: {case_sensitive: true}

  validates :role,
            presence: true

  enum role: {client: 'client', chef: 'chef'}

  validates :first_name, :last_name, :contact_phone,
            presence: true

  validates :street_address, :city, :state,
            presence: true

  validates :zip_code,
            presence: true,
            format: {
                with: /\d{5}(-\d{4})?/,
                message: 'Invalid ZIP Code.' #TODO 'is invalid'
            }

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

  geocoded_by :full_address # can also be an IP address
  after_validation :geocode # auto-fetch coordinates

  def distance_to(other_user)
    phi1 = self.latitude * Math::PI / 180
    phi2 = other_user.latitude.to_i * Math::PI / 180
    lambda1 = self.longitude * Math::PI / 180
    lambda2 = other_user.longitude.to_i * Math::PI / 180

    dphi = phi1 - phi2
    dlambda = lambda1 - lambda2
    arg = (Math.sin(dphi / 2) ** 2) +
        (Math.cos(phi1) * Math.cos(phi2)) * (Math.sin(dlambda / 2) ** 2)
    sqrt_arg = Math.sqrt(arg)
    2 * 3959 * Math.asin(sqrt_arg)

  end
end
