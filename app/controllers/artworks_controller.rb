class ArtworksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :create_cart_for_current_user
  before_action :create_contact_for_current_user

  def index
    @artworks = Artwork.all
    @categories = Category.all
    # where creator is true
    @users = User.all
  end

  def show
    @artwork = Artwork.find(params[:id])
  end

  def new
  end

  def create
    flash[:success] = "Artwork successfully created"
  end

  def edit
  end

  def update
    flash[:success] = "Artwork successfully updated"
  end

  def destroy
    flash[:success] = "Artwork successfully deleted"
  end
end
