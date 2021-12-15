class StripeCheckoutSessionService
  def call(event)

    order = Order.find_by(checkout_session_id: event.data.object.id)
    if order.update(status: 'Pagado')
      current_cart.destroy
    end


  end
end