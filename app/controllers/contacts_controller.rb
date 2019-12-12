class ContactsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :create_cart_for_current_user
  before_action :create_contact_for_current_user
  
  def index
  end

  def new
  end

  def show
  end

  def create
  end

  def edit
  end

  def update
    @contact = current_user.contact

    if params[:address].present?
      if @contact.update(address: params[:address], latitude: params[:latitude], longitude: params[:longitude])
        flash[:success] = "Contacts successfully updated"
        redirect_to root_path
      end
    else
      flash[:error] = "please enter an adress"
      redirect_to root_path
    end
  end

  def destroy
  end
end
