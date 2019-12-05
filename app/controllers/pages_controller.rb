class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  
  def index
    @artworks = Artwork.all
    @categories = Category.all
    # where creator is true
    @users = User.all
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
