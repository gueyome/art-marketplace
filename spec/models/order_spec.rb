require 'rails_helper'
require 'faker'

RSpec.describe Order, type: :model do

  before(:each) do 
    @user = User.create(username: "user1", first_name: "firstname1", last_name: "Lastname1", email: "email1@yopmail.com", password: "xaxaxa")
    @category = Category.create(name: Faker::Artist.name)
    @cart = Cart.create(user_id: @user.id)
    @artwork = Artwork.create(name: "Artwork", description: "lorem "*100, price: rand(100..1000), stock: 10, category_id: Category.last.id, user_id: User.last.id)
    @cart_detail = CartDetail.create(artwork_id: @artwork.id, cart_id: @cart.id)
    @order = Order.create(user_id: @user.id, date: Time.now)
    @order_detail = OrderDetail.create(artwork_id: @artwork.id, order_id: @order.id)
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@order).to be_a(Order)
      expect(@order).to be_valid
    end

    describe "#user_id" do
      it "should not be valid without a user_id" do
        bad_order = Order.create(date: Time.now)
        expect(bad_order).not_to be_valid
        # test très sympa qui permet de vérifier que la fameuse formule user.errors retourne bien un hash qui contient une erreur concernant le first_name. 
        expect(bad_order.errors.include?(:user_id)).to eq(true)
      end
    end

    describe "#date" do
      it "should not be valid without date" do
        bad_order = Order.create(user_id: User.last.id)
        expect(bad_order).not_to be_valid
        expect(bad_order.errors.include?(:date)).to eq(true)
      end
    end

  end

  context "associations" do

    describe "order_details" do
      it "should have_many order_details" do
        cart_detail = CartDetail.create(artwork_id: @artwork.id, cart_id: @cart.id)
        order_detail = OrderDetail.create(artwork_id: @artwork.id, order_id: @order.id)
        expect(@order.order_details.include?(order_detail)).to eq(true)
      end
    end

  end

  context "public instance methods" do
  end

end

