class OrdersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :create_cart_for_current_user
  layout "artist_application", :only => [:index]
  before_action :create_contact_for_current_user
  
  def index
    @orders=Order.where(user_id: current_user.id)
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
