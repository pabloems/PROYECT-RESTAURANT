class StripeCheckoutSessionService
  def call(event)

    order = Order.find_by(checkout_session_id: event.data.object.id)
    order.update(status: 'Pagado')
    @order.save
    current_cart.destroy
    session[:cart_id] = nil
  end
end