class CreateArtworks < ActiveRecord::Migration[5.2]
  def change
    create_table :artworks do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.integer :stock, :default => 1
      t.boolean :creator, :default => false
      t.timestamps
    end
  end
end
