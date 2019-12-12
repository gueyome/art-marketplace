class Artwork < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :cart_details
  has_many :carts, through: :cart_details
  has_many :order_details
  has_many :orders, through: :order_details
  has_one_attached :avatar

  has_many :testimonials 

  def self.search(search)
    if search
      
    else
      Artwork.all
    end
  end
end
