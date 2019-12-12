class AddPicToCateg < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :url_image , :string
  end
end
