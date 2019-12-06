class TestimonialsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :create_cart_for_current_user
  before_action :create_contact_for_current_user
  
  def index
  end

  def show
  end

  def new
  end

  def create
    flash[:success] = "Testimonial successfully created"
  end

  def edit
  end

  def update
    flash[:success] = "Testimonial successfully updated"
  end

  def destroy
    flash[:success] = "Testimonial successfully deleted"
  end

  

end
