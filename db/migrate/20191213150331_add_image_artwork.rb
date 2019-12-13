class AddImageArtwork < ActiveRecord::Migration[5.2]
  def change
    add_column :artworks, :url_image , :string
  end
end
