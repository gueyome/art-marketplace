class OrdersController < ApplicationController
  before_action :create_cart_for_current_user
  layout "no_header", :only => [:index]

  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def new
  end

  def destroy
  end

  def delete
  end
end
