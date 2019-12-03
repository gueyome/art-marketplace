class CartDetailsController < ApplicationController
  before_action :create_cart_for_current_user
  def index
  end

  def show
  end

  def new
  end

  def create
    @cart = current_user.cart
    @artwork = Artwork.find(params[:artwork_id])
    @quantity_chosen = params[:quantity].to_i
    if @cart.artworks.include?(@artwork)
        @artwork_line = @cart.cart_details.where(artwork_id: @artwork.id).first
        @artwork_line.update(quantity: @artwork_line.quantity + @quantity_chosen)
        @artwork.update(stock: @artwork.stock - @quantity_chosen)
    else
      @cart_detail_line = CartDetail.new
      @cart_detail_line.cart_id = @cart.id 
      @cart_detail_line.artwork_id = @artwork.id 
      @cart_detail_line.quantity = @quantity_chosen
      @cart_detail_line.save
      @artwork.update(stock: @artwork.stock - @quantity_chosen)
    end

    redirect_to root_path
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
