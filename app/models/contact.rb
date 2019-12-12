class Contact < ApplicationRecord
  belongs_to :user
  geocoded_by :address
  after_validation :geocode

  validates :phone, 
    presence: true,
    numericality: true,
    length: { :minimum => 10, :maximum => 15 }

end
