class CartDetailsController < ApplicationController
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
    @cart_detail_line = CartDetail.where(cart_id: params[:cart_id], artwork_id: params[:artwork_id])
    if params[:origin] == "add"
      if @cart_detail_line.empty?
        #creer une ligne
      else
        #changer la quantite
      end
    end

  end

  def destroy
  end
end
