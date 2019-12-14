class CategoriesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :create_cart_for_current_user
  before_action :create_contact_for_current_user
  def index
  end

  def show
    @artworks = Artwork.where(category_id: params[:id])
    @category = Category.find(params[:id])
    @categories = Category.all
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
