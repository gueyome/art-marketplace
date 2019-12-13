class User < ApplicationRecord
  has_one :cart, dependent: :destroy
  has_many :artworks, dependent: :destroy
  has_many :orders

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :carts
  has_many :orders
  has_many :testimonials
  has_many :private_messages
  has_one :contact
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  has_many :received_messages, foreign_key: 'receiver_id', class_name: "PrivateMessage"
  has_many :sent_testimonials, foreign_key: 'customer_id', class_name: "Testimonial"
  has_many :received_testimonials, foreign_key: 'artist_id', class_name: "Testimonial"

  has_one_attached :avatar

  validates :username, uniqueness: true
  validates :email, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 

  devise :omniauthable, :omniauth_providers => [:google_oauth2]
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.token = auth.credentials.token
      user.expires = auth.credentials.expires
      user.expires_at = auth.credentials.expires_at
      user.refresh_token = auth.credentials.refresh_token
    end
  end
end

