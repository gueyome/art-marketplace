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
    @artwork = Artwork.find(params[:id])
  end

  def new
    @artwork = Artwork.new(user_id: current_user, category_id: Category.first.id)
    @categories = Category.all
  end

  def create
    Artwork.create(user_id: current_user.id, name: params[:name], price: params[:price], stock: params[:stock], category_id: params[:category_id], creator: params[:creator], description: params[:description])
    flash[:success] = "Artwork successfully created"
    redirect_to user_artworks_path(current_user.id)
  end

  def edit
    @artwork=Artwork.find(params[:id])
    @categories = Category.all
  end

  def update
    @artwork = Artwork.find(params[:id])
    @artwork.update(user_id: current_user.id, name: params[:name], price: params[:price], stock: params[:stock], category_id: params[:category_id], creator: params[:creator], description: params[:description])
    flash[:success] = "Artwork successfully updated"
    redirect_to user_artworks_path(current_user.id)
  end

  def destroy
    flash[:success] = "Artwork successfully deleted"
  end

  private

  def is_user
    @artwork = Artwork.find(params[:id])
    if current_user.id == @artwork.user_id
      return true
    end
  end

end
