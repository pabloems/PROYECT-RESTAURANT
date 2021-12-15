module ApplicationHelper

  include Pagy::Frontend

  def current_cart
    cart = Cart.find_by_id(session[:cart_id])
    return cart if cart
    Cart.new(user: current_user, active: true)
  end

end
