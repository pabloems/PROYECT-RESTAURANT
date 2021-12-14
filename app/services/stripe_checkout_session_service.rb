class StripeCheckoutSessionService
  def call(event)

    order = Order.find_by(checkout_session_id: event.data.object.id)
    if order.update(status: 'Pagado')
      session[:cart_id] = nil
    end


  end
end