class TestimonialsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :create_cart_for_current_user
  before_action :create_contact_for_current_user
  
  def index
  end

  def show
  end

  def new
    puts current_user
    
  end

  def create
    @artist = User.find(params[:user_id])
    @testimonial = Testimonial.new(artist_id: @artist.id, content: params[:content], customer_id: current_user.id)

    if @testimonial.save 
      flash[:success] = "Testimonial successfully created"
      redirect_to root_path
    else 
      flash[:error] = "Testimonial can't be created"
      redirect_to root_path
    end 

  end

  def edit
  end

  def update
  end

  def destroy
  end

  

end
