class CartDetailsController < ApplicationController
  before_action :authenticate_user!
  before_action :create_cart_for_current_user
  before_action :create_contact_for_current_user
  before_action :current_line, only: [:update, :destroy]

  def index
  end

  def show
  end

  def new
  end

  def create
    @cart = current_user.cart
    @artwork = Artwork.find(params[:artwork_id])
    if params[:quantity].to_i <= @artwork.stock
      quantities_updator(@cart, @artwork)
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
    @new_quantity = params[:quantity].to_i
    @variation = @line.quantity - @new_quantity
    @line.artwork.update(stock: @line.artwork.stock + @variation)
    puts @line.update(quantity: @new_quantity)
    flash[:success] = "Quantity successfully updated"
    redirect_to user_cart_path(@current_user.id, current_user.cart.id)
  end

  def destroy
    @previous_quantity = @line.quantity
    @line.artwork.update(stock: @line.artwork.stock + @previous_quantity)
    if @line.destroy
      flash[:success] = "Artwork successfully removed from the cart"
      redirect_to user_cart_path(@current_user.id, current_user.cart.id)
    end
  end

  private
  def quantities_updator(the_cart, the_artwork)
    if the_cart.artworks.include?(the_artwork)
      @artwork_line = the_cart.cart_details.where(artwork_id: the_artwork.id).first
      @artwork_line.update(quantity: @artwork_line.quantity + params[:quantity].to_i)
      the_artwork.update(stock: the_artwork.stock - params[:quantity].to_i)
    else
      @cart_detail_line = CartDetail.new(cart_id: the_cart.id, artwork_id: the_artwork.id, quantity: params[:quantity].to_i)
      @cart_detail_line.save
      the_artwork.update(stock: the_artwork.stock - params[:quantity].to_i)
    end
  end 
  
  def current_line
    @line = CartDetail.find(params[:id])
  end
end
