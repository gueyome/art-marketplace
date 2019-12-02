class Testimonial < ApplicationRecord
  belongs_to :artist, class_name: "User"
  belongs_to :customer, class_name: "User"
end
