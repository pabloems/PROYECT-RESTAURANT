class StripeCheckoutSessionService
  def call(event)
    @order.user = current_user
    @order.cart = current_cart
    current_cart = Cart.find_by_id(session[:cart_id])
    order = Order.find_by(checkout_session_id: event.data.object.id)
    order.update(status: 'Pagado', cart: current_cart, user: current_user)
  end
end