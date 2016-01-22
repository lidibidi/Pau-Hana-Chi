class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  #simple coding by ip_address > http://www.rubygeocoder.com/ 
  geocoded_by :ip_address, :latitude => :latitude, :longitude => :longitude
  after_validation :geocode

end
