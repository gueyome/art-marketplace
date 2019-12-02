class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
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
end
