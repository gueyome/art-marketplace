class CartsController < ApplicationController
  before_action :current_cart
  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
    @cart = current_user.cart

    if params["cart_detail_id"] != nil
      # delete an element from cart
      CartDetail.destroy(params["cart_detail_id"])
      flash[:success]="L'élement a bien été supprimé du panier"
    else
    # add an element to cart
      @item = Item.find(params[:index])
      @cart.items << @item
      flash[:success]="L'élement a bien été ajouté au panier"
  end

  def destroy
  end
end
