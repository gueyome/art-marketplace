class CreateTestimonials < ActiveRecord::Migration[5.2]
  def change
    create_table :testimonials do |t|
      t.integer :artist_id
      t.integer :customer_id
      t.text :content

      t.timestamps
    end
  end
end
