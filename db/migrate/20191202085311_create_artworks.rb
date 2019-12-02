class CreateArtworks < ActiveRecord::Migration[5.2]
  def change
    create_table :artworks do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.integer :stock, :default => 1
      t.boolean :creator, :default => false
      t.references :artist, index: true  
      t.timestamps
    end
  end
end
