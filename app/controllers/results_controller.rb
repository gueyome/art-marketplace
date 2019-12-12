class ResultsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :create_cart_for_current_user
  before_action :create_contact_for_current_user

  def index
    @search = params[:search]
    @artworks = Artwork.all
    if @search.blank?
      flash[:error] = "Empty search field"
      redirect_to root_path
    end
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
