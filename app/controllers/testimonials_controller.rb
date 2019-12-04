class TestimonialsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
  end

  def show
  end

  def edit
  end

  def create
  end

  def destroy
  end

  def update
  end

  def delete
  end
end
