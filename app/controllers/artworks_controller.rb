class ArtworksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :create_cart_for_current_user
  layout "artist_application", :only => [:new, :index]

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
    @artwork = Artwork.new(user_id: current_user, category_id: Category.first.id)
    @categories = Category.all
  end

  def create
    puts params
    Artwork.create(user_id: current_user, name: params[:name], price: params[:price], stock: params[:stock], category_id: params[:category_id], creator: params[:creator], description: params[:description])
    flash[:success] = "Paiement réalisé avec succès, vous participez à l'évènement"
    redirect_to user_artworks_path(current_user.id)
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
