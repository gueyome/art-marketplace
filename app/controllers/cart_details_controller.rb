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
      flash[:success] = "Ajouté au panier."
      redirect_to root_path
    else
      flash[:warning] = "Quantité trop grande."
      redirect_to artwork_path(@artwork.id)
    end
  end

  def edit
  end

  def update
    #change the quantity
  end

  def destroy
    @cart_detail_line = CartDetail.find(params[:id])
    if @event.destroy
      flash[:success] = "L'événement a été supprimé."
      redirect_to action: 'index'
    end
  end
end
