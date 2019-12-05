class OrdersController < ApplicationController
  before_action :create_cart_for_current_user
  layout "no_navbar", :only => [:index]

  def index
    @orders=Order.where(user_id: params[:user_id])
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
  end

  def destroy
  end

end
