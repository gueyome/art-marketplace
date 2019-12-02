class User < ApplicationRecord
  has_one :cart, dependent: :destroy
  has_many :artworks, foreign_key: 'artist_id', class_name: "Artworks", dependent: :destroy
  has_many :orders, foreign_key: 'customer_id', class_name: "Orders", dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
