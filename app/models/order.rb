class Order < ApplicationRecord
  belongs_to :customer, class_name: "User"
  has_many :order_details
  has_many :artworks, through: :order_details
end
