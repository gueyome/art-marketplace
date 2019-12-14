class Artwork < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :cart_details, dependent: :destroy
  has_many :carts, through: :cart_details
  has_many :order_details, dependent: :destroy
  has_many :orders, through: :order_details
  has_one_attached :avatar

  validates :name, 
    presence: true,
    length: { minimum: 3, message: ": must have more than 3 characters" }

  validates :description,
    presence: true,
    length: { minimum: 30, message: ": must have more than 30 characters" }

  validates :price, 
    presence: true,
    numericality: { minimum: 1, message: ": must cost minimum 1 dollar" }

  validates :category,
    presence: { message: ": please choose a category" }

  def self.search(search)
    if search
      
    else
      Artwork.all
    end
  end
end