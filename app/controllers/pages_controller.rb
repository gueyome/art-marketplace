class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :create_cart_for_current_user
  before_action :create_contact_for_current_user

  def index
    @artworks = Artwork.limit(8)
    @categories = Category.limit(5)
    # where creator is true
    @users = User.limit(5)
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
