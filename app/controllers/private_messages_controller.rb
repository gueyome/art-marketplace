class PrivateMessagesController < ApplicationController
  before_action :create_cart_for_current_user
  before_action :create_contact_for_current_user

  def index
  end

  def show
  end

  def new
  end

  def create
    flash[:success] = "Message successfully sent"
  end

  def edit
  end

  def update
    flash[:success] = "Message successfully updated"
  end

  def destroy
    flash[:success] = "Message successfully deleted"
  end

end
