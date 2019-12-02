class ForeignKeyTestimonial < ActiveRecord::Migration[5.2]
  def change
    add_index :testimonials, :artist_id
    add_index :testimonials, :customer_id
  end
end
