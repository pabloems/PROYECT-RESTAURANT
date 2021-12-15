class StripeCheckoutSessionService
  def call(event)

    order = Order.find_by(checkout_session_id: event.data.object.id)
    order.update(status: 'Pagado', paid: true)
    @order.cart = current_cart
    current_cart = Cart.find_by_id(session[:cart_id])
    if @order.paid == true
      current_cart.destroy
    end

  end
end