require 'rails_helper'

RSpec.describe PagesController, type: :controller do

  describe "GET index" do

    it "assigns @artworks" do
      @user = User.create(username: "The user", first_name: "The firstname", last_name: "The Lastname", email: "themail@yopmail.com", password: "xaxaxa")
    
      @category = Category.create(name: "The category")

      @artwork = Artwork.create(name: "Artworktest", description: "lorem "*100, price: 10, stock: 10, category_id: @category.id, user_id: @user.id , url_image: "https://cdn.pixabay.com/photo/2014/06/10/19/10/boy-366311_1280.jpg")

      # on va sur index
      get :index
  
      # @users doit être une array qui contient user
      expect(assigns(:artworks)).to eq([@artwork])
    end
  
    it "renders the index template" do
      @user = User.create(username: "The user", first_name: "The firstname", last_name: "The Lastname", email: "themail@yopmail.com", password: "xaxaxa")
    
      @category = Category.create(name: "The category")

      @artwork = Artwork.create(name: "Artworktest", description: "lorem "*100, price: 10, stock: 10, category_id: @category.id, user_id: @user.id , url_image: "https://cdn.pixabay.com/photo/2014/06/10/19/10/boy-366311_1280.jpg")

      # va sur index
      get :index
  
      # on doit rediriger vers index
      expect(response).to render_template("index")
    end
  end

end