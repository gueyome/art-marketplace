class CartDetailsController < ApplicationController
  before_action :authenticate_user!
  before_action :create_cart_for_current_user
  before_action :create_contact_for_current_user
  before_action :is_user, only: [:update, :destroy]
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
    if @quantity_chosen <= @artwork.stock
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
      flash[:success] = "Added to the cart."
      redirect_to user_cart_path(@current_user.id, current_user.cart.id)
    else
      flash[:warning] = "Quantity too high."
      redirect_to user_cart_path(@current_user.id, current_user.cart.id)
    end
  end

  def edit
  end

  def update
    @line = CartDetail.find(params[:id])
    @new_quantity = params[:quantity].to_i
    @variation = @line.quantity - @new_quantity
    @line.artwork.update(stock: @line.artwork.stock + @variation)
    puts @line.update(quantity: @new_quantity)
    flash[:success] = "Quantity successfully modified"
    redirect_to user_cart_path(@current_user.id, current_user.cart.id)
  end

  def destroy
    @line = CartDetail.find(params[:id])
    @previous_quantity = @line.quantity
    @line.artwork.update(stock: @line.artwork.stock + @previous_quantity)
    if @line.destroy
      flash[:success] = "Artwork successfully removed from the cart"
      redirect_to user_cart_path(@current_user.id, current_user.cart.id)
    end
  end

  private

  def is_user
    @artwork = Artwork.find(params[:id])
    if current_user.id == @artwork.user_id
      return true
    end
  end

end
