class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter { @cart = find_or_create_cart_from_session }

  def not_authenticated
    flash[:message] = "Please login to view this content."
    redirect_to login_url
  end

private

  def find_or_create_cart_from_session
    cart = Cart.find_by_id(session[:cart_id])
    cart ||= Cart.create(:user => current_user)
    if session[:old_cart_id]
      cart.absorb(Cart.find_by_id(session[:old_cart_id]))
      session[:old_cart_id] = nil
    end
    session[:cart_id] = cart.id
    cart
  end

  def is_admin
    current_user && current_user.is_admin
  end
end