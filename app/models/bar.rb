class Bar < ActiveRecord::Base
  has_many :specials

  accepts_nested_attributes_for :specials,
  :allow_destroy => true,
  :reject_if => :all_blank

  geocoded_by :address
  after_validation :geocode 
end
