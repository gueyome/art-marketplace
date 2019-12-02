class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_details
  has_many :artworks, through: :cart_details
end
