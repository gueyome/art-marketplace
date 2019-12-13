class UrlImageUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :url_image , :string
  end
end
