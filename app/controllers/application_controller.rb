class ApplicationController < ActionController::Base
  def current_cart
    if user_signed_in?
      if current_user.cart == nil
        @cart = Cart.create(user: current_user)
      end
    end
  end
end
