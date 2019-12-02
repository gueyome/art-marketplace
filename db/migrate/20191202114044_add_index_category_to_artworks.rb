class AddIndexCategoryToArtworks < ActiveRecord::Migration[5.2]
  def change
    add_reference :artworks, :category, foreign_key: true
  end
end
