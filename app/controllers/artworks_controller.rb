class ArtworksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :create_cart_for_current_user
  layout "artist_application", :only => [:new, :index, :edit]
  before_action :create_contact_for_current_user
  before_action :is_user, only: [:edit, :update, :destroy]
  
  def index
    @my_artworks = Artwork.where(user_id: current_user.id)
  end

  def show
    current_artwork
  end

  def new
    @artwork = Artwork.new(user_id: current_user, category_id: Category.first.id)
    @categories = Category.all
  end

  def create
    @artwork = Artwork.new(artwork_params.merge(user_id: current_user.id))
    if @artwork.save
      flash[:success] = "Artwork successfully created"
      redirect_to user_artworks_path(current_user.id)
    else
      flash[:error] = "Artwork has not been created"
      redirect_to new_user_artwork_path(current_user.id)
    end
  end

  def edit
    @categories = Category.all
  end

  def update
    @artwork.update(artwork_params.merge(user_id: current_user.id))
    flash[:success] = "Artwork successfully updated"
    redirect_to user_artworks_path(current_user.id)
  end

  def destroy
    @artwork.destroy
    redirect_to user_artworks_path(current_user.id)
    flash[:success] = "Artwork successfully deleted"
  end


  private
  def current_artwork
    @artwork = Artwork.find(params[:id])
  end

  def is_user
    current_artwork
    if current_user.id == @artwork.user_id
      return true
    end
  end

  def artwork_params
    params.permit(:name, :price, :stock, :category_id, :creator, :description)
  end
end