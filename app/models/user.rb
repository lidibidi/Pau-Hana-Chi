class User < ActiveRecord::Base

  before_save { self.email = email.downcase }
  validates :user_name, presence: true, length: {maximum: 50},
                      uniqueness: { case_sensitive: false }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,  length: {maximum: 255},
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
has_secure_password
validates :password, presence: true, length: { minimum: 3 }, allow_nil: true

# Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  #simple coding by ip_address > http://www.rubygeocoder.com/
  geocoded_by :ip_address, :latitude => :latitude, :longitude => :longitude
  after_validation :geocode

end
