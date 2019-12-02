class Artwork < ApplicationRecord
  belongs_to :artist, class_name: "User"
  belongs_to :category
  has_many :cart_details
  has_many :carts, through: :cart_details
  has_many :order_details
  has_many :orders, through: :order_details
end
