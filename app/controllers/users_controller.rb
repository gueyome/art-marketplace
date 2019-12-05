class UsersController < ApplicationController
  layout "no_header", :only => [:edit]
  def index
  end

  def show
    @user = User.find(params[:id])
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
