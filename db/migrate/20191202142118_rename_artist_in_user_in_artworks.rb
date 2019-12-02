class RenameArtistInUserInArtworks < ActiveRecord::Migration[5.2]
  def change
    rename_column :artworks, :artist_id, :user_id
  end
end
