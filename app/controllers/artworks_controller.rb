class ArtworksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :create_cart_for_current_user
  layout "artist_application", :only => [:new, :index, :edit]
  before_action :create_contact_for_current_user

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
    @artwork = Artwork.new(user_id: current_user.id, name: params[:name], price: params[:price], stock: params[:stock], category_id: params[:category_id], creator: params[:creator], description: params[:description])
    if @artwork.save
      flash[:success] = "Artwork successfully created"
      redirect_to user_artworks_path(current_user.id)
    else
      flash[:error] = "Artwork has not been created"
      redirect_to new_user_artwork_path(current_user.id)
    end
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
    @artwork = Artwork.find(params[:id])
    @artwork.destroy
    redirect_to user_artworks_path(current_user.id)
    flash[:success] = "Artwork successfully deleted"
  end
end
