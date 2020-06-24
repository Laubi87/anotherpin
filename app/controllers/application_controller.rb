class ApplicationController < ActionController::Base

  before_action :current_cart
  helper_method :current_cart

  def current_cart
    # if the customer has just landed on the site, give them a brand new cart
    # if they have, keep it
    # check session[:cart_id]

    if session[:cart_id].present?
      @current_cart = Cart.find(session[:cart_id])
    else
      @current_cart = Cart.create
      session[:cart_id] = @current_cart.id
    end
  end
end
