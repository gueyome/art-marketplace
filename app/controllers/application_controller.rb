class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def create_cart_for_current_user
    if user_signed_in?
      if current_user.cart == nil
        @cart = Cart.create(user: current_user)
      end
    end
  end

  def create_contact_for_current_user
    if user_signed_in?
      if current_user.contact == nil
        @contact = Contact.create(user: current_user)
      end
    end
  end

end