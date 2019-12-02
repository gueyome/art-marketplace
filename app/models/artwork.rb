class Artwork < ApplicationRecord
  belongs_to :artist, class_name: "User"
  belongs_to :category
end
