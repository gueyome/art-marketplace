class Artwork < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :cart_details, dependent: :destroy
  has_many :carts, through: :cart_details
  has_many :order_details, dependent: :destroy
  has_many :orders, through: :order_details
  has_one_attached :avatar
  has_many :testimonials 

  validates :name, 
    presence: true,
    length: { minimum: 3 }
  validates :description,
    presence: true,
    length: { minimum: 30 }
  validates :price, 
    presence: true,
    numericality: { minimum: 1 }
  validates :category,
    presence: true

  def self.search(search)
    if search
      
    else
      Artwork.all
    end
  end
end
