require 'rails_helper'

RSpec.describe Artwork, type: :model do

  before(:each) do 
    @user = User.create(username: "The user", first_name: "The firstname", last_name: "The Lastname", email: "themail@yopmail.com", password: "xaxaxa")
    
    @category = Category.create(name: "The category")

    @artwork = Artwork.create(name: "Artworktest", description: "lorem "*100, price: 10, stock: 10, category_id: @category.id, user_id: @user.id , url_image: "https://cdn.pixabay.com/photo/2014/06/10/19/10/boy-366311_1280.jpg")
  end

  context "validations" do

    it "is valid with valid attributes" do
      expect(@artwork).to be_a(Artwork)
      expect(@artwork).to be_valid
    end

    describe "#category" do
      it "should not be valid without category" do
        bad_artwork = Artwork.create(name: "the artwork")
        expect(bad_artwork).not_to be_valid
        expect(bad_artwork.errors.include?(:category)).to eq(true)
      end  
    end

  end

  context "associations" do

    describe "user" do
      it "should belongs_to user" do
        
        expect(@artwork.user).to eq(@user)
      end
    end

  end

end