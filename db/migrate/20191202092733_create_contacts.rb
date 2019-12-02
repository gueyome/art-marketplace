class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :address
      t.text :description
      t.decimal :latitude
      t.decimal :longitude
      t.string :phone

      t.timestamps
    end
  end
end
